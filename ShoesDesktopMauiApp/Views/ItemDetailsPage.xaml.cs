using System;
using Microsoft.Maui.Controls;
using ShoesDesktopMauiApp.ViewModels;

namespace ShoesDesktopMauiApp.Views;

public partial class ItemDetailsPage : ContentPage
{
    public ItemDetailsPage(ItemDetailsViewModel viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
    }
    
}