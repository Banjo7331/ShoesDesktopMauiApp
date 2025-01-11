using System;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.Maui.Controls;
using ShoesDesktopMauiApp.Models.Ratings;
using ShoesDesktopMauiApp.Services;

namespace ShoesDesktopMauiApp.ViewModels;

public class RatingsViewModel : BindableObject
{
    private readonly IRatingService _ratingService;
    private readonly Guid _itemId;

    public ObservableCollection<GetRatingListResponse.RatingItem> Ratings { get; } = new();
    public ICommand LoadRatingsCommand { get; }
    public ICommand NavigateToAddRatingCommand { get; }

    public RatingsViewModel(IRatingService ratingService, Guid itemId)
    {
        _ratingService = ratingService;
        _itemId = itemId;

        LoadRatingsCommand = new Command(async () => await LoadRatingsAsync());
        NavigateToAddRatingCommand = new Command(async () => await NavigateToAddRatingAsync());
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
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error loading ratings: {ex.Message}");
        }
    }

    private async Task NavigateToAddRatingAsync()
    {
        await Application.Current.MainPage.Navigation.PushAsync(new AddRatingPage(
            new AddRatingViewModel(_ratingService, _itemId)
        ));
    }
}