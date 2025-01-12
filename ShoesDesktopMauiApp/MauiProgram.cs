using System;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Maui.Controls.Hosting;
using Microsoft.Maui.Hosting;
using ShoesDesktopMauiApp.Security;
using ShoesDesktopMauiApp.Services;
using ShoesDesktopMauiApp.ViewModels;
using ShoesDesktopMauiApp.Views;

namespace ShoesDesktopMauiApp;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
            });
        builder.Services.AddTransient<DynamicAuthorizationHandler>();
        builder.Services.AddSingleton<TokenService>();
        
        builder.Services.AddTransient<ItemsViewModel>();
        builder.Services.AddTransient<ItemsPage>();
        
        builder.Services.AddTransient<ItemDetailsViewModel>();
        builder.Services.AddTransient<ItemDetailsPage>();
        
        builder.Services.AddTransient<AddItemViewModel>();
        builder.Services.AddTransient<AddItemPage>();
        
        builder.Services.AddTransient<LoginViewModel>();
        builder.Services.AddTransient<LoginPage>();
        
        builder.Services.AddTransient<RegisterViewModel>();
        builder.Services.AddTransient<RegistrationPage>();
        
        builder.Services.AddSingleton<IUserService, UserService>();
        builder.Services.AddSingleton<IItemService, ItemService>();
        builder.Services.AddSingleton<IRatingService, RatingService>();
        
        builder.Services.AddHttpClient<IUserService, UserService>(client =>
        {
            client.BaseAddress = new Uri("http://localhost:5247");
        });
        builder.Services.AddHttpClient<IItemService, ItemService>(client =>
        {
            client.BaseAddress = new Uri("http://localhost:5247");
        }).AddHttpMessageHandler<DynamicAuthorizationHandler>();
        builder.Services.AddHttpClient<IRatingService, RatingService>(client =>
        {
            client.BaseAddress = new Uri("http://localhost:5247");
        }).AddHttpMessageHandler<DynamicAuthorizationHandler>();
        

#if DEBUG
        builder.Logging.AddDebug();
#endif

        return builder.Build();
    }
}