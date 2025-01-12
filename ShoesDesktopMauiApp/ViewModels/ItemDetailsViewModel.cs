using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.Maui.Controls;
using ShoesDesktopMauiApp.Models.Ratings;
using ShoesDesktopMauiApp.Services;

namespace ShoesDesktopMauiApp.ViewModels;

public class ItemDetailsViewModel : BindableObject
{
    private readonly IItemService _itemService;
    private readonly IRatingService _ratingService;
    private Guid _itemId;
    public ObservableCollection<GetRatingListResponse.RatingItem> Ratings { get; } = new();

    private string _name;
    
    private string _currentUser;
    public string CurrentUser
    {
        get => _currentUser;
        set
        {
            _currentUser = value;
            OnPropertyChanged();
        }
    }
    public string Name
    {
        get => _name;
        set
        {
            _name = value;
            OnPropertyChanged();
        }
    }

    private string _description;
    public string Description
    {
        get => _description;
        set
        {
            _description = value;
            OnPropertyChanged();
        }
    }

    private string _createdByUserName;
    public string CreatedByUserName
    {
        get => _createdByUserName;
        set
        {
            _createdByUserName = value;
            OnPropertyChanged();
        }
    }

    private double _averageRating;
    public double AverageRating
    {
        get => _averageRating;
        set
        {
            _averageRating = value;
            OnPropertyChanged();
        }
    }
    private double _userRating = 1; 
    public double UserRating
    {
        get => _userRating;
        set
        {
            if (_userRating != value)
            {
                _userRating = value;
                OnPropertyChanged(); 
            }
        }
    }
    private bool _canRate = true;
    public bool CanRate
    {
        get => _canRate;
        set
        {
            _canRate = value;
            OnPropertyChanged();
        }
    }
    private bool _hasUserRated;
    public bool HasUserRated
    {
        get => _hasUserRated;
        set
        {
            _hasUserRated = value;
            OnPropertyChanged();
        }
    }
    public ICommand SubmitRatingCommand { get; }
    public ICommand RemoveRatingCommand { get; }
    

    public ItemDetailsViewModel(IItemService itemService, IRatingService ratingService, TokenService tokenService)
    {
        _itemService = itemService;
        _ratingService = ratingService;

        _ = InitializeCurrentUserAsync(tokenService);

        SubmitRatingCommand = new Command(async () => await SubmitRatingAsync());
        RemoveRatingCommand = new Command(async () => await RemoveRatingAsync());
    }
    
    public void Initialize(Guid itemId)
    {
        _itemId = itemId;
        _ = LoadItemDetailsAsync(itemId);
        _ = LoadRatingsAsync();
    }

    private async Task LoadItemDetailsAsync(Guid itemId)
    {
        try
        {
            var itemDetails = await _itemService.GetItemDetailsAsync(itemId);
            if (itemDetails != null)
            {
                Name = itemDetails.Name;
                Description = itemDetails.Description;
                CreatedByUserName = itemDetails.CreatedByUserName;
                AverageRating = itemDetails.AverageRating;
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error loading item details: {ex.Message}");
        }
    }
    
    private async Task LoadRatingsAsync()
    {
        try
        {
            var response = await _ratingService.GetRatingListAsync(_itemId);
            Ratings.Clear();

            foreach (var rating in response.Ratings)
            {
                Ratings.Add(rating);
            }
            HasUserRated = Ratings.Any(r => r.User == CurrentUser);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error loading ratings: {ex.Message}");
        }
    }
    
    private async Task SubmitRatingAsync()
    {
        if (UserRating < 1 || UserRating > 10) // Zakres od 1 do 10
        {
            await Application.Current.MainPage.DisplayAlert("Invalid Rating", "Please rate between 1 and 10.", "OK");
            return;
        }

        try
        {
            var ratingRequest = new CreateRatingRequest { Rate = (int)Math.Round(UserRating) };
            await _ratingService.CreateRatingAsync(_itemId, ratingRequest);

            await Application.Current.MainPage.DisplayAlert("Success", "Thank you for your rating!", "OK");
            
            _ = LoadItemDetailsAsync(_itemId);
            _ = LoadRatingsAsync();
        }
        catch (Exception ex)
        {
            if (ex.Message.Contains("You have already rated this item"))
            {
                await Application.Current.MainPage.DisplayAlert("Info", "You have already rated this item.", "OK");
            }
            else
            {
                await Application.Current.MainPage.DisplayAlert("Error", "An error occurred while submitting your rating. Please try again.", "OK");
            }
        }
    }
    private async Task RemoveRatingAsync()
    {
        try
        {
            await _ratingService.RemoveRatingAsync(_itemId);

            await Application.Current.MainPage.DisplayAlert("Success", "Your rating has been removed.", "OK");

            HasUserRated = false;
            CanRate = true;
            
            _ = LoadItemDetailsAsync(_itemId);
            _ = LoadRatingsAsync();
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error removing rating: {ex.Message}");
            await Application.Current.MainPage.DisplayAlert("Error", "An error occurred while removing your rating.", "OK");
        }
    }
    
    private async Task InitializeCurrentUserAsync(TokenService tokenService)
    {
        try
        {
            var token = await SecureStorage.GetAsync("auth_token");
            if (!string.IsNullOrEmpty(token))
            {
                CurrentUser = tokenService.GetUsernameFromToken(token);
                Console.WriteLine($"CurrentUser initialized: {CurrentUser}");
            }
            else
            {
                Console.WriteLine("No token found in SecureStorage.");
                CurrentUser = null;
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error initializing current user: {ex.Message}");
            CurrentUser = null;
        }
    }
}