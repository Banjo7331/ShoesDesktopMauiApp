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

    public async Task<PagedItemResponse> GetItemsAsync(int pageNumber, int pageSize)
    {
        try
        {
            var response = await _httpClient.GetAsync($"api/item?pageNumber={pageNumber}&pageSize={pageSize}");
            response.EnsureSuccessStatusCode();

            var jsonResponse = await response.Content.ReadAsStringAsync();
            Console.WriteLine("Response JSON: " + jsonResponse);

            var pagedResponse = JsonSerializer.Deserialize<PagedItemResponse>(jsonResponse, new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            });

            return pagedResponse ?? new PagedItemResponse();
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
            throw; 
        }
    }

    public async Task RemoveItemAsync(Guid id)
    {
        try
        {
            var response = await _httpClient.DeleteAsync($"api/item/{id}");

            response.EnsureSuccessStatusCode(); 
        }
        catch (HttpRequestException ex) when (ex.StatusCode == System.Net.HttpStatusCode.Forbidden)
        {
            throw new Exception("You are not authorized to delete this item.");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error in RemoveItemAsync: {ex.Message}");
            throw; 
        }
    }
}
