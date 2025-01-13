using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ShoesDesktopMauiApp.Models;
using ShoesDesktopMauiApp.Models.Items.CreateItem;
using ShoesDesktopMauiApp.Models.Items.PagedItem;

namespace ShoesDesktopMauiApp.Services;

public interface IItemService
{
    Task<PagedItemResponse> GetItemsAsync(int pageNumber, int pageSize);
    Task<ItemDetails> GetItemDetailsAsync(Guid id);
    Task AddItemAsync(CreateItemRequest item);
    Task RemoveItemAsync(Guid id);
}