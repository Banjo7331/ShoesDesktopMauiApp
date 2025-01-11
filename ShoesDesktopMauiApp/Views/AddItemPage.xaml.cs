using Microsoft.Maui.Controls;
using ShoesDesktopMauiApp.ViewModels;

namespace ShoesDesktopMauiApp.Views;

public partial class AddItemPage : ContentPage
{
    public AddItemPage(AddItemViewModel viewModel)
    {
        InitializeComponent();

        // Ustawienie BindingContext na ViewModel
        BindingContext = viewModel;
    }
}