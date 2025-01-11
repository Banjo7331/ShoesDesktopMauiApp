namespace ShoesDesktopMauiApp.Models;

public class Rating
{
    public Guid Id { get; set; }
    public int Value { get; set; }
    public string Comment { get; set; }
    public string UserName { get; set; }
}