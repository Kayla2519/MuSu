public class Song {

    public int SongID { get; set; }    // Primary Key
    public required string SongTitle { get; set; }
    public required TimeSpan Duration { get; set; }
    public required DateTime ReleaseDate { get; set; }
    public Artist Artist { get; set; }
    public int GenreID { get; set; }
    public int ArtistID { get; set; }
    public int MoodID { get; set; }
}