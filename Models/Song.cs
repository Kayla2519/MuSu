public class Song {

    public int SongID { get; set; }    // Primary Key
    public required string SongTitle { get; set; }
    public required int Duration { get; set; }
    public required string ReleaseDate { get; set; }
    public int GenreID { get; set; }
    public int ArtistID { get; set; }
    public int MoodID { get; set; }
}