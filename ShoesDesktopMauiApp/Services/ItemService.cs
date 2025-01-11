using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text.Json;
using System.Threading.Tasks;
using ShoesDesktopMauiApp.Models;
using ShoesDesktopMauiApp.Models.Items.CreateItem;
using ShoesDesktopMauiApp.Models.Items.PagedItem;

namespace ShoesDesktopMauiApp.Services;

public class ItemService : IItemService
{
    private readonly HttpClient _httpClient;

    public ItemService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<List<Item>> GetItemsAsync()
    {
        try
        {
            var response = await _httpClient.GetAsync("api/item");
            response.EnsureSuccessStatusCode();

            // Deserializacja odpowiedzi jako PagedItemResponse
            var jsonResponse = await response.Content.ReadAsStringAsync();
            Console.WriteLine("Response JSON: " + jsonResponse); // Debug

            var pagedResponse = JsonSerializer.Deserialize<PagedItemResponse>(jsonResponse, new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true // Ignorowanie wielkości liter w nazwach pól
            });

            // Zwrócenie listy elementów
            return pagedResponse?.Items ?? new List<Item>();
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error fetching items: " + ex.Message);
            throw;
        }
    }

    public async Task<ItemDetails> GetItemDetailsAsync(Guid id)
    {
        try
        {
            var response = await _httpClient.GetAsync($"api/item/{id}");
            response.EnsureSuccessStatusCode();

            // Deserializacja odpowiedzi JSON do modelu ItemDetails
            return await response.Content.ReadFromJsonAsync<ItemDetails>();
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error fetching item details: {ex.Message}");
            throw;
        }
    }

    public async Task AddItemAsync(CreateItemRequest newItemRequest)
    {
        try
        {
            var response = await _httpClient.PostAsJsonAsync("api/item", newItemRequest);
            response.EnsureSuccessStatusCode();
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error while adding item: " + ex.Message);
            throw; // Re-throw the exception for handling in ViewModel
        }
    }

    public async Task RemoveItemAsync(Guid id)
    {
        var response = await _httpClient.DeleteAsync($"api/item/{id}");
        response.EnsureSuccessStatusCode();
    }
}
