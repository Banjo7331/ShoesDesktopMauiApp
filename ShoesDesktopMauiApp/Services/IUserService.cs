using System.Threading.Tasks;
using ShoesDesktopMauiApp.Models.User;
using ShoesDesktopMauiApp.Models.Users.LoginUser;

namespace ShoesDesktopMauiApp.Services;

public interface IUserService
{
    Task<LoginUserResponse> LoginAsync(LoginUserRequest request);
    Task<CreateUserResponse> RegisterAsync(CreateUserRequest request);
}