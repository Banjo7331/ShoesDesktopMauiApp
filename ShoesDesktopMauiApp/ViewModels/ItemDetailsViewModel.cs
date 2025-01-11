using System;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;
using ShoesDesktopMauiApp.Services;

namespace ShoesDesktopMauiApp.ViewModels;

public class ItemDetailsViewModel : BindableObject
{
    private readonly IItemService _itemService;

    private string _name;
    public string Name
    {
        get => _name;
        set
        {
            _name = value;
            OnPropertyChanged();
        }
    }

    private string _description;
    public string Description
    {
        get => _description;
        set
        {
            _description = value;
            OnPropertyChanged();
        }
    }

    private string _createdByUserName;
    public string CreatedByUserName
    {
        get => _createdByUserName;
        set
        {
            _createdByUserName = value;
            OnPropertyChanged();
        }
    }

    private double _averageRating;
    public double AverageRating
    {
        get => _averageRating;
        set
        {
            _averageRating = value;
            OnPropertyChanged();
        }
    }

    public ItemDetailsViewModel(IItemService itemService, Guid itemId)
    {
        _itemService = itemService;
        _ = LoadItemDetailsAsync(itemId);
    }

    private async Task LoadItemDetailsAsync(Guid itemId)
    {
        try
        {
            var itemDetails = await _itemService.GetItemDetailsAsync(itemId);
            if (itemDetails != null)
            {
                Name = itemDetails.Name;
                Description = itemDetails.Description;
                CreatedByUserName = itemDetails.CreatedByUserName;
                AverageRating = itemDetails.AverageRating;
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error loading item details: {ex.Message}");
        }
    }
}