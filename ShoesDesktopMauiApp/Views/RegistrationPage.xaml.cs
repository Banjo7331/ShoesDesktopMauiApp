

using Microsoft.Maui.Controls;
using ShoesDesktopMauiApp.ViewModels;

namespace ShoesDesktopMauiApp.Views;

public partial class RegistrationPage : ContentPage
{
    public RegistrationPage(RegisterViewModel viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
    }

}