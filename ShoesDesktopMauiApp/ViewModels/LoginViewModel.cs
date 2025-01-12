using System;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;
using ShoesDesktopMauiApp.Models.Users.LoginUser;
using ShoesDesktopMauiApp.Services;
using ShoesDesktopMauiApp.Views;

namespace ShoesDesktopMauiApp.ViewModels;

 public class LoginViewModel : BindableObject
    {
        private readonly IUserService _userService;
        private readonly IServiceProvider _serviceProvider;

        private string _username = string.Empty;
        private string _password = string.Empty;
        private string _errorMessage = string.Empty;
        private bool _isErrorVisible;

        public LoginViewModel(IUserService userService, IServiceProvider serviceProvider)
        {
            _userService = userService;
            _serviceProvider = serviceProvider;

            LoginCommand = new Command(async () => await LoginAsync());
            NavigateToRegisterCommand = new Command(async () => await NavigateToRegisterAsync());
        }

        public string Username
        {
            get => _username;
            set
            {
                _username = value;
                OnPropertyChanged();
            }
        }

        public string Password
        {
            get => _password;
            set
            {
                _password = value;
                OnPropertyChanged();
            }
        }

        public string ErrorMessage
        {
            get => _errorMessage;
            set
            {
                _errorMessage = value;
                OnPropertyChanged();
            }
        }

        public bool IsErrorVisible
        {
            get => _isErrorVisible;
            set
            {
                _isErrorVisible = value;
                OnPropertyChanged();
            }
        }

        public ICommand LoginCommand { get; }
        public ICommand NavigateToRegisterCommand { get; }

        private async Task LoginAsync()
        {
            IsErrorVisible = false;

            try
            {
                var request = new LoginUserRequest
                {
                    username = Username,
                    password = Password
                };

                var response = await _userService.LoginAsync(request);

                await SecureStorage.SetAsync("auth_token", response.token);

                var itemsPage = _serviceProvider.GetRequiredService<ItemsPage>();
                Application.Current.MainPage = new NavigationPage(itemsPage);
                await Application.Current.MainPage.DisplayAlert("Success", "Login successful!", "OK");
            }
            catch (Exception ex)
            {
                ErrorMessage = ex.Message;
                IsErrorVisible = true;
            }
        }

        private async Task NavigateToRegisterAsync()
        {
            var registrationPage = _serviceProvider.GetRequiredService<RegistrationPage>();
            await Application.Current.MainPage.Navigation.PushAsync(registrationPage);
        }
    }