using ShoesDesktopMauiApp.Models.Ratings;

namespace ShoesDesktopMauiApp.Services;

using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using ShoesDesktopMauiApp.Models;

public class RatingService : IRatingService
{
    private readonly HttpClient _httpClient;

    public RatingService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task CreateRatingAsync(Guid itemId, CreateRatingRequest request)
    {
        try
        {
            var response = await _httpClient.PostAsJsonAsync($"api/item/{itemId}/ratings", request);

            response.EnsureSuccessStatusCode();
        }
        catch (HttpRequestException ex) when (ex.StatusCode == System.Net.HttpStatusCode.BadRequest)
        {
            throw new Exception("You have already rated this item.");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error in CreateRatingAsync: {ex.Message}");
        }
    }

    public async Task RemoveRatingAsync(Guid itemId)
    {
        try
        {
            var response = await _httpClient.DeleteAsync($"api/item/{itemId}/ratings");
            response.EnsureSuccessStatusCode();
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error removing rating: {ex.Message}");
            throw;
        }
    }

    public async Task<GetRatingListResponse> GetRatingListAsync(Guid itemId)
    {
        try
        {
            var response = await _httpClient.GetAsync($"api/item/{itemId}/ratings");
            response.EnsureSuccessStatusCode();

            return await response.Content.ReadFromJsonAsync<GetRatingListResponse>();
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error fetching ratings: {ex.Message}");
            throw;
        }
    }
}
