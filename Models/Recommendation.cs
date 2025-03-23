public class Recommendation {

    public int RecommendationID { get; set; }    // Primary Key
    public required int UserID { get; set; }
    public required int SongID { get; set; }
}
