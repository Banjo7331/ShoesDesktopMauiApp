using Microsoft.Maui.Controls;
using ShoesDesktopMauiApp.Models;
using ShoesDesktopMauiApp.ViewModels;

namespace ShoesDesktopMauiApp.Views;

public partial class ItemsPage : ContentPage
{
    public ItemsPage(ItemsViewModel viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
    }
    
    private void OnItemTapped(object sender, ItemTappedEventArgs e)
    {
        if (BindingContext is ItemsViewModel viewModel && e.Item is Item selectedItem)
        {
            viewModel.NavigateToItemDetailsCommand.Execute(selectedItem);
        }

        // Resetuj zaznaczenie elementu
        ((ListView)sender).SelectedItem = null;
    }
}