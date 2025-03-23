using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MuSu.Migrations
{
    /// <inheritdoc />
    public partial class fix2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Users",
                table: "Users");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Songs",
                table: "Songs");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Recommendations",
                table: "Recommendations");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Moods",
                table: "Moods");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Genres",
                table: "Genres");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Artists",
                table: "Artists");

            migrationBuilder.RenameTable(
                name: "Users",
                newName: "users");

            migrationBuilder.RenameTable(
                name: "Songs",
                newName: "songs");

            migrationBuilder.RenameTable(
                name: "Recommendations",
                newName: "recommendations");

            migrationBuilder.RenameTable(
                name: "Moods",
                newName: "moods");

            migrationBuilder.RenameTable(
                name: "Genres",
                newName: "genres");

            migrationBuilder.RenameTable(
                name: "Artists",
                newName: "artists");

            migrationBuilder.RenameColumn(
                name: "Password",
                table: "users",
                newName: "password");

            migrationBuilder.RenameColumn(
                name: "Name",
                table: "users",
                newName: "name");

            migrationBuilder.RenameColumn(
                name: "Email",
                table: "users",
                newName: "email");

            migrationBuilder.RenameColumn(
                name: "PreferredGenre",
                table: "users",
                newName: "preferred_genre");

            migrationBuilder.RenameColumn(
                name: "UserID",
                table: "users",
                newName: "user_id");

            migrationBuilder.RenameColumn(
                name: "Duration",
                table: "songs",
                newName: "duration");

            migrationBuilder.RenameColumn(
                name: "SongTitle",
                table: "songs",
                newName: "title");

            migrationBuilder.RenameColumn(
                name: "ReleaseDate",
                table: "songs",
                newName: "release_date");

            migrationBuilder.RenameColumn(
                name: "MoodID",
                table: "songs",
                newName: "mood_id");

            migrationBuilder.RenameColumn(
                name: "GenreID",
                table: "songs",
                newName: "genre_id");

            migrationBuilder.RenameColumn(
                name: "ArtistID",
                table: "songs",
                newName: "artist_id");

            migrationBuilder.RenameColumn(
                name: "SongID",
                table: "songs",
                newName: "song_id");

            migrationBuilder.RenameColumn(
                name: "UserID",
                table: "recommendations",
                newName: "user_id");

            migrationBuilder.RenameColumn(
                name: "SongID",
                table: "recommendations",
                newName: "song_id");

            migrationBuilder.RenameColumn(
                name: "RecommendationID",
                table: "recommendations",
                newName: "recommendation_id");

            migrationBuilder.RenameColumn(
                name: "MoodName",
                table: "moods",
                newName: "name");

            migrationBuilder.RenameColumn(
                name: "MoodID",
                table: "moods",
                newName: "mood_id");

            migrationBuilder.RenameColumn(
                name: "GenreName",
                table: "genres",
                newName: "name");

            migrationBuilder.RenameColumn(
                name: "GenreID",
                table: "genres",
                newName: "genre_id");

            migrationBuilder.RenameColumn(
                name: "GenreID",
                table: "artists",
                newName: "genre_id");

            migrationBuilder.RenameColumn(
                name: "ArtistName",
                table: "artists",
                newName: "name");

            migrationBuilder.RenameColumn(
                name: "ArtistID",
                table: "artists",
                newName: "artist");

            migrationBuilder.AddPrimaryKey(
                name: "PK_users",
                table: "users",
                column: "user_id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_songs",
                table: "songs",
                column: "song_id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_recommendations",
                table: "recommendations",
                column: "recommendation_id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_moods",
                table: "moods",
                column: "mood_id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_genres",
                table: "genres",
                column: "genre_id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_artists",
                table: "artists",
                column: "artist");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_users",
                table: "users");

            migrationBuilder.DropPrimaryKey(
                name: "PK_songs",
                table: "songs");

            migrationBuilder.DropPrimaryKey(
                name: "PK_recommendations",
                table: "recommendations");

            migrationBuilder.DropPrimaryKey(
                name: "PK_moods",
                table: "moods");

            migrationBuilder.DropPrimaryKey(
                name: "PK_genres",
                table: "genres");

            migrationBuilder.DropPrimaryKey(
                name: "PK_artists",
                table: "artists");

            migrationBuilder.RenameTable(
                name: "users",
                newName: "Users");

            migrationBuilder.RenameTable(
                name: "songs",
                newName: "Songs");

            migrationBuilder.RenameTable(
                name: "recommendations",
                newName: "Recommendations");

            migrationBuilder.RenameTable(
                name: "moods",
                newName: "Moods");

            migrationBuilder.RenameTable(
                name: "genres",
                newName: "Genres");

            migrationBuilder.RenameTable(
                name: "artists",
                newName: "Artists");

            migrationBuilder.RenameColumn(
                name: "password",
                table: "Users",
                newName: "Password");

            migrationBuilder.RenameColumn(
                name: "name",
                table: "Users",
                newName: "Name");

            migrationBuilder.RenameColumn(
                name: "email",
                table: "Users",
                newName: "Email");

            migrationBuilder.RenameColumn(
                name: "preferred_genre",
                table: "Users",
                newName: "PreferredGenre");

            migrationBuilder.RenameColumn(
                name: "user_id",
                table: "Users",
                newName: "UserID");

            migrationBuilder.RenameColumn(
                name: "duration",
                table: "Songs",
                newName: "Duration");

            migrationBuilder.RenameColumn(
                name: "title",
                table: "Songs",
                newName: "SongTitle");

            migrationBuilder.RenameColumn(
                name: "release_date",
                table: "Songs",
                newName: "ReleaseDate");

            migrationBuilder.RenameColumn(
                name: "mood_id",
                table: "Songs",
                newName: "MoodID");

            migrationBuilder.RenameColumn(
                name: "genre_id",
                table: "Songs",
                newName: "GenreID");

            migrationBuilder.RenameColumn(
                name: "artist_id",
                table: "Songs",
                newName: "ArtistID");

            migrationBuilder.RenameColumn(
                name: "song_id",
                table: "Songs",
                newName: "SongID");

            migrationBuilder.RenameColumn(
                name: "user_id",
                table: "Recommendations",
                newName: "UserID");

            migrationBuilder.RenameColumn(
                name: "song_id",
                table: "Recommendations",
                newName: "SongID");

            migrationBuilder.RenameColumn(
                name: "recommendation_id",
                table: "Recommendations",
                newName: "RecommendationID");

            migrationBuilder.RenameColumn(
                name: "name",
                table: "Moods",
                newName: "MoodName");

            migrationBuilder.RenameColumn(
                name: "mood_id",
                table: "Moods",
                newName: "MoodID");

            migrationBuilder.RenameColumn(
                name: "name",
                table: "Genres",
                newName: "GenreName");

            migrationBuilder.RenameColumn(
                name: "genre_id",
                table: "Genres",
                newName: "GenreID");

            migrationBuilder.RenameColumn(
                name: "name",
                table: "Artists",
                newName: "ArtistName");

            migrationBuilder.RenameColumn(
                name: "genre_id",
                table: "Artists",
                newName: "GenreID");

            migrationBuilder.RenameColumn(
                name: "artist",
                table: "Artists",
                newName: "ArtistID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Users",
                table: "Users",
                column: "UserID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Songs",
                table: "Songs",
                column: "SongID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Recommendations",
                table: "Recommendations",
                column: "RecommendationID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Moods",
                table: "Moods",
                column: "MoodID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Genres",
                table: "Genres",
                column: "GenreID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Artists",
                table: "Artists",
                column: "ArtistID");
        }
    }
}
