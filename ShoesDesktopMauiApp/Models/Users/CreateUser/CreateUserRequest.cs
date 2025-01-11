namespace ShoesDesktopMauiApp.Models.User;

public class CreateUserRequest
{
    public string email { get; set; }
    public string username { get; set; }
    public string password { get; set; }
    public string confirmPassword { get; set; }
}