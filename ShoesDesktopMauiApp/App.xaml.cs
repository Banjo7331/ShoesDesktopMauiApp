using System;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Maui.Controls;
using ShoesDesktopMauiApp.Views;

namespace ShoesDesktopMauiApp;

public partial class App : Application
{
    public App(IServiceProvider serviceProvider)
    {
        InitializeComponent();

        var loginPage = serviceProvider.GetRequiredService<LoginPage>();
        MainPage = new NavigationPage(loginPage);
    }
}