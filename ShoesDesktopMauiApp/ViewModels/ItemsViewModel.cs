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
        private readonly IServiceProvider _serviceProvider;
        private bool _isBusy;
        public ICommand NavigateToAddItemCommand { get; }
        public ICommand NavigateToItemDetailsCommand { get; }
        public ObservableCollection<Item> Items { get; } = new ObservableCollection<Item>();

        public ItemsViewModel(IItemService itemService, IServiceProvider serviceProvider)
        {
            _itemService = itemService;
            _serviceProvider = serviceProvider;

            // Komendy
            LoadItemsCommand = new Command(async () => await LoadItemsAsync());
            AddItemCommand = new Command(async () => await AddItemAsync());
            RemoveItemCommand = new Command<Guid>(async (id) => await RemoveItemAsync(id));
            NavigateToItemDetailsCommand = new Command<Item>(async (selectedItem) => await NavigateToItemDetailsAsync(selectedItem));
            NavigateToAddItemCommand = new Command(async () => await NavigateToAddItemAsync());

            // Automatyczne załadowanie danych przy inicjalizacji
            _ = LoadItemsAsync();
        }
        private string _newItemName;
        public string NewItemName
        {
            get => _newItemName;
            set
            {
                _newItemName = value;
                OnPropertyChanged(); // Powiadamia widok o zmianie
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

        private async Task LoadItemsAsync()
        {
            if (IsBusy) return; // Prevent multiple loads

            IsBusy = true;
            Items.Clear();

            try
            {
                var items = await _itemService.GetItemsAsync(); 
                foreach (var item in items)
                {
                    Items.Add(item); 
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error loading items: " + ex.Message);
                await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
            }
            finally
            {
                IsBusy = false;
            }
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

                // Pokazanie komunikatu o sukcesie
                await Application.Current.MainPage.DisplayAlert("Success", "Item added successfully!", "OK");

                // Wyczyszczenie pól po dodaniu elementu
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
                await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
            }
        }
        
        private async Task NavigateToItemDetailsAsync(Item selectedItem)
        {
            if (selectedItem == null)
                return;

            // Nawigacja do ItemDetailsPage z przekazaniem ID
            await Application.Current.MainPage.Navigation.PushAsync(new ItemDetailsPage(
                new ItemDetailsViewModel(_itemService, selectedItem.Id)
            ));
        }
        private async Task NavigateToAddItemAsync()
        {
            var addItemPage = _serviceProvider.GetRequiredService<AddItemPage>();
            await Application.Current.MainPage.Navigation.PushAsync(addItemPage);
        }
    }
}