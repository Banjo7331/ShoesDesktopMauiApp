using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Maui.Controls;
using ShoesDesktopMauiApp.Models;
using ShoesDesktopMauiApp.Models.Items.CreateItem;
using ShoesDesktopMauiApp.Services;
using ShoesDesktopMauiApp.Views;


namespace ShoesDesktopMauiApp.ViewModels
{
    public class ItemsViewModel : BindableObject
    {
        private readonly IItemService _itemService;
        private readonly IRatingService _ratingService;
        private readonly IServiceProvider _serviceProvider;
        private bool _isBusy;
        private int _pageNumber = 1;
        private const int PageSize = 7;
        public string CurrentUser { get; private set; }
        public ICommand NavigateToAddItemCommand { get; }
        public ICommand NavigateToItemDetailsCommand { get; }
        public ObservableCollection<Item> Items { get; set; } = new ObservableCollection<Item>();

        public ICommand LoadNextPageCommand { get; }
        public ICommand LoadPreviousPageCommand { get; }

        public ItemsViewModel(IItemService itemService,IRatingService ratingService,TokenService tokenService,IServiceProvider serviceProvider)
        {
            _itemService = itemService;
            _serviceProvider = serviceProvider;
            _ratingService = ratingService;

            var token = SecureStorage.GetAsync("auth_token").Result;
            if (!string.IsNullOrEmpty(token))
            {
                CurrentUser = tokenService.GetUsernameFromToken(token);
            }
            
            LoadItemsCommand = new Command(async () => await LoadPageAsync(1));
            AddItemCommand = new Command(async () => await AddItemAsync());
            LoadNextPageCommand = new Command(async () => await LoadNextPageAsync());
            LoadPreviousPageCommand = new Command(async () => await LoadPreviousPageAsync());
            RemoveItemCommand = new Command<Guid>(async (id) => await RemoveItemAsync(id));
            NavigateToItemDetailsCommand = new Command<Item>(async (selectedItem) => await NavigateToItemDetailsAsync(selectedItem));
            NavigateToAddItemCommand = new Command(async () => await NavigateToAddItemAsync());

            _ = LoadPageAsync(1);
        }
        private bool _isNextPageAvailable;
        public bool IsNextPageAvailable
        {
            get => _isNextPageAvailable;
            set
            {
                if (_isNextPageAvailable != value)
                {
                    _isNextPageAvailable = value;
                    OnPropertyChanged(nameof(IsNextPageAvailable));
                }
            }
        }

        private bool _isPreviousPageAvailable;
        public bool IsPreviousPageAvailable
        {
            get => _isPreviousPageAvailable;
            set
            {
                if (_isPreviousPageAvailable != value)
                {
                    _isPreviousPageAvailable = value;
                    OnPropertyChanged(nameof(IsPreviousPageAvailable));
                }
            }
        }
        
        private string _newItemName;
        public string NewItemName
        {
            get => _newItemName;
            set
            {
                _newItemName = value;
                OnPropertyChanged(); 
            }
        }

        private string _newItemDescription;
        public string NewItemDescription
        {
            get => _newItemDescription;
            set
            {
                _newItemDescription = value;
                OnPropertyChanged();
            }
        }
        public ICommand LoadItemsCommand { get; }
        public ICommand AddItemCommand { get; }
        public ICommand RemoveItemCommand { get; }
        
        public bool IsBusy
        {
            get => _isBusy;
            set
            {
                _isBusy = value;
                OnPropertyChanged();
            }
        }

        public async Task LoadPageAsync(int pageNumber)
        {
            if (IsBusy) return;

            IsBusy = true;

            try
            {
                var response = await _itemService.GetItemsAsync(pageNumber, PageSize);
                Items.Clear();

                foreach (var item in response.Items)
                {
                    Items.Add(item);
                }

                _pageNumber = pageNumber;
                IsNextPageAvailable = response.HasNext;
                IsPreviousPageAvailable = _pageNumber > 1;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error loading page: " + ex.Message);
                await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
            }
            finally
            {
                IsBusy = false;
            }
        }

        public async Task LoadNextPageAsync()
        {
            await LoadPageAsync(_pageNumber + 1);
        }

        public async Task LoadPreviousPageAsync()
        {
            if (_pageNumber > 1)
                await LoadPageAsync(_pageNumber - 1);
        }

        private async Task AddItemAsync()
        {
            try
            {
                var request = new CreateItemRequest
                {
                    name = NewItemName,
                    description = NewItemDescription
                };

                await _itemService.AddItemAsync(request);

                await Application.Current.MainPage.DisplayAlert("Success", "Item added successfully!", "OK");

                NewItemName = string.Empty;
                NewItemDescription = string.Empty;
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
            }
        }

        private async Task RemoveItemAsync(Guid id)
        {
            try
            {
                await _itemService.RemoveItemAsync(id);

                var itemToRemove = Items.FirstOrDefault(i => i.Id == id);
                if (itemToRemove != null)
                {
                    Items.Remove(itemToRemove);
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("You are not authorized"))
                {
                    await Application.Current.MainPage.DisplayAlert("Unauthorized", ex.Message, "OK");
                }
                else
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "An error occurred while removing the item. Please try again.", "OK");
                }
            }
        }
        
        private async Task NavigateToItemDetailsAsync(Item selectedItem)
        {
            if (selectedItem == null)
                return;

            var viewModel = _serviceProvider.GetRequiredService<ItemDetailsViewModel>();

            viewModel.Initialize(selectedItem.Id);

            await Application.Current.MainPage.Navigation.PushAsync(new ItemDetailsPage(viewModel));
        }
        private async Task NavigateToAddItemAsync()
        {
            var addItemPage = _serviceProvider.GetRequiredService<AddItemPage>();
            await Application.Current.MainPage.Navigation.PushAsync(addItemPage);
        }
    }
}