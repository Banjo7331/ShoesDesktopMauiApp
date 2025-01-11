using ShoesDesktopMauiApp.Models.User;
using ShoesDesktopMauiApp.Models.Users.LoginUser;


using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace ShoesDesktopMauiApp.Services
{
    public class UserService : IUserService
    {
        private readonly HttpClient _httpClient;

        public UserService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<LoginUserResponse> LoginAsync(LoginUserRequest request)
        {
            var jsonContent = new StringContent(
                JsonSerializer.Serialize(request),
                Encoding.UTF8,
                "application/json");

            var response = await _httpClient.PostAsync("api/user/login", jsonContent);

            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();
                return JsonSerializer.Deserialize<LoginUserResponse>(content);
            }
            else
            {
                throw new HttpRequestException($"Login failed with status code {response.StatusCode}");
            }
        }

        public async Task<CreateUserResponse> RegisterAsync(CreateUserRequest request)
        {
            var jsonContent = new StringContent(
                JsonSerializer.Serialize(request),
                Encoding.UTF8,
                "application/json");

            var response = await _httpClient.PostAsync("api/user/register", jsonContent);

            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();
                return JsonSerializer.Deserialize<CreateUserResponse>(content);
            }
            else
            {
                throw new HttpRequestException($"Registration failed with status code {response.StatusCode}");
            }
        }
    }
}
