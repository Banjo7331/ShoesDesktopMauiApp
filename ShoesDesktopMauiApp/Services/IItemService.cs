using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ShoesDesktopMauiApp.Models;
using ShoesDesktopMauiApp.Models.Items.CreateItem;

namespace ShoesDesktopMauiApp.Services;

public interface IItemService
{
    Task<List<Item>> GetItemsAsync();
    Task<ItemDetails> GetItemDetailsAsync(Guid id);
    Task AddItemAsync(CreateItemRequest item);
    Task RemoveItemAsync(Guid id);
}