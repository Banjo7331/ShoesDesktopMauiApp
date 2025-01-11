using System;
using System.Threading.Tasks;
using ShoesDesktopMauiApp.Models.Ratings;

namespace ShoesDesktopMauiApp.Services;

public interface IRatingService
{
    Task CreateRatingAsync(Guid itemId, CreateRatingRequest request);
    Task RemoveRatingAsync(Guid itemId);
    Task<GetRatingListResponse> GetRatingListAsync(Guid itemId);
}