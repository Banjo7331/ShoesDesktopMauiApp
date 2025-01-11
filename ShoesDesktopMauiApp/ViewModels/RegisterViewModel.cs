using System;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.Maui.Controls;
using ShoesDesktopMauiApp.Models.User;
using ShoesDesktopMauiApp.Services;

namespace ShoesDesktopMauiApp.ViewModels;

 public class RegisterViewModel : BindableObject
    {
        private readonly IUserService _userService;
        private string _username;
        private string _email;
        private string _password;
        private string _confirmPassword;
        private string _errorMessage;
        private bool _isErrorVisible;

        public RegisterViewModel(IUserService userService)
        {
            _userService = userService;
            RegisterCommand = new Command(async () => await RegisterAsync());
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

        public string Email
        {
            get => _email;
            set
            {
                _email = value;
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
        
        public string ConfirmPassword
        {
            get => _confirmPassword;
            set
            {
                _confirmPassword = value;
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

        public ICommand RegisterCommand { get; }

        private async Task RegisterAsync()
        {
            IsErrorVisible = false;

            try
            {
                var request = new CreateUserRequest
                {   
                    email = Email,
                    username = Username,
                    password = Password,
                    confirmPassword = ConfirmPassword
                };

                var response = await _userService.RegisterAsync(request);

                // Show success message
                await Application.Current.MainPage.DisplayAlert("Success", "Registration successful! Please log in.", "OK");

                // Navigate back to login page
                await Application.Current.MainPage.Navigation.PopAsync();
            }
            catch (Exception ex)
            {
                ErrorMessage = ex.Message;
                IsErrorVisible = true;
            }
        }
    }