using System.IdentityModel.Tokens.Jwt;
using System.Linq;

namespace ShoesDesktopMauiApp.Services;

public class TokenService
{
    public string GetUsernameFromToken(string token)
    {
        var handler = new JwtSecurityTokenHandler();
        var jwtToken = handler.ReadJwtToken(token);

        return jwtToken.Claims.FirstOrDefault(c => c.Type == "unique_name")?.Value;
    }
}