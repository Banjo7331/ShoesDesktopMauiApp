using System;
using Microsoft.Maui.Controls;
using ShoesDesktopMauiApp.ViewModels;
using ShoesDesktopMauiApp.Views;

namespace ShoesDesktopMauiApp.Views;

public partial class LoginPage : ContentPage
{
    public LoginPage(LoginViewModel viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
    }
}