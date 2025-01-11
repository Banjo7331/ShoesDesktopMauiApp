using System;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.Maui.Controls;
using ShoesDesktopMauiApp.Models.Items.CreateItem;
using ShoesDesktopMauiApp.Services;
using ShoesDesktopMauiApp.Views;

namespace ShoesDesktopMauiApp.ViewModels
{
    public class AddItemViewModel : BindableObject
    {
        private readonly IItemService _itemService;

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

        public ICommand AddItemCommand { get; }
        public ICommand CancelCommand { get; }

        public AddItemViewModel(IItemService itemService)
        {
            _itemService = itemService;
            AddItemCommand = new Command(async () => await AddItemAsync());
            CancelCommand = new Command(async () => await CancelAsync());
        }

        private async Task AddItemAsync()
        {
            if (string.IsNullOrWhiteSpace(NewItemName) || string.IsNullOrWhiteSpace(NewItemDescription))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Please fill in all fields.", "OK");
                return;
            }

            var newItemRequest = new CreateItemRequest
            {
                name = NewItemName,
                description = NewItemDescription
            };

            try
            {
                await _itemService.AddItemAsync(newItemRequest);

                // Powrót do widoku listy
                await Application.Current.MainPage.Navigation.PopAsync();

                // Wywołanie LoadItemsCommand w ItemsViewModel
                var itemsPage = Application.Current.MainPage.Navigation.NavigationStack
                    .OfType<ItemsPage>().FirstOrDefault();
                if (itemsPage != null && itemsPage.BindingContext is ItemsViewModel itemsViewModel)
                {
                    itemsViewModel.LoadItemsCommand.Execute(null);
                }
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
            }
        }

        private async Task CancelAsync()
        {
            // Wróć do poprzedniej strony bez dodawania
            await Application.Current.MainPage.Navigation.PopAsync();
        }
    }
}