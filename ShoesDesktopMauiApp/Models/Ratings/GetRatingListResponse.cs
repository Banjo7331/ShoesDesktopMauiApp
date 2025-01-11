namespace ShoesDesktopMauiApp.Models.Ratings;

public class GetRatingListResponse
{
    public record RatingItem(string User, int Rating);

    public List<RatingItem> Ratings { get; set; } = new();
    public bool HasNext { get; set; }
    public bool HasPrevious { get; set; }
}