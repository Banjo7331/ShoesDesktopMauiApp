using Microsoft.Maui.Controls;
using ShoesDesktopMauiApp.Models;
using ShoesDesktopMauiApp.ViewModels;

namespace ShoesDesktopMauiApp.Views;

public partial class RatingsPage : ContentPage
{
    public RatingsPage(RatingsViewModel viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
    }
}