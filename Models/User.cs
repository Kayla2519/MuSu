public class User {

    public int UserID { get; set; }    // Primary Key
    public required string Name { get; set; }
    public required string Email { get; set; }
    public required string Password { get; set; }
    public required int PreferredGenre { get; set; }
}
