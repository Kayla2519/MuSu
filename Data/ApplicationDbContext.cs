using Microsoft.EntityFrameworkCore;

namespace MuSu.Data 
{
    public class ApplicationDbContext : DbContext 
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) {}

        public DbSet<Genre> Genres { get; set; }
        public DbSet<Artist> Artists { get; set; }
        public DbSet<Mood> Moods { get; set; }
        public DbSet<Recommendation> Recommendations { get; set; }
        public DbSet<Song> Songs { get; set; }
        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Genres
            modelBuilder.Entity<Genre>()
                .ToTable("genres") 
                .Property(g => g.GenreID)
                .HasColumnName("genre_id"); 
        
            modelBuilder.Entity<Genre>()
                .Property(g => g.GenreName)
                .HasColumnName("name");  

            // Artists
            modelBuilder.Entity<Artist>()
                .ToTable("artists") 
                .Property(a => a.ArtistID)
                .HasColumnName("artist_id"); 
        
            modelBuilder.Entity<Artist>()
                .Property(a => a.ArtistName)
                .HasColumnName("name");  
            
            modelBuilder.Entity<Artist>()
                .Property(a => a.GenreID)
                .HasColumnName("genre_id");  
            
            modelBuilder.Entity<Artist>()
                .Property(a => a.Moods)
                .HasColumnName("moods");  
            
            // Moods
            modelBuilder.Entity<Mood>()
                .ToTable("moods") 
                .Property(m => m.MoodID)
                .HasColumnName("mood_id"); 
        
            modelBuilder.Entity<Mood>()
                .Property(m => m.MoodName)
                .HasColumnName("name");  

            modelBuilder.Entity<Mood>()
                .Property(m => m.Songs)
                .HasColumnName("songs");  

            // Recommendations
            modelBuilder.Entity<Recommendation>()
                .ToTable("recommendations") 
                .Property(r => r.RecommendationID)
                .HasColumnName("recommendation_id"); 
        
            modelBuilder.Entity<Recommendation>()
                .Property(r => r.UserID)
                .HasColumnName("user_id");  
            
            modelBuilder.Entity<Recommendation>()
                .Property(r => r.SongID)
                .HasColumnName("song_id");  

            // Songs
            modelBuilder.Entity<Song>()
                .ToTable("songs") 
                .Property(s => s.SongID)
                .HasColumnName("song_id"); 
        
            modelBuilder.Entity<Song>()
                .Property(s => s.SongTitle)
                .HasColumnName("title");  
            
            modelBuilder.Entity<Song>()
                .Property(s => s.Duration)
                .HasColumnName("duration");  
            
            modelBuilder.Entity<Song>()
                .Property(s => s.ReleaseDate)
                .HasColumnName("release_date");  
            
            modelBuilder.Entity<Song>()
                .Property(s => s.GenreID)
                .HasColumnName("genre_id");  

            modelBuilder.Entity<Song>()
                .Property(s => s.ArtistID)
                .HasColumnName("artist_id");  
            
            modelBuilder.Entity<Song>()
                .Property(s => s.MoodID)
                .HasColumnName("mood_id");  
            
            // Users
            modelBuilder.Entity<User>()
                .ToTable("users") 
                .Property(u => u.UserID)
                .HasColumnName("user_id"); 
        
            modelBuilder.Entity<User>()
                .Property(u => u.Name)
                .HasColumnName("name");  
            
            modelBuilder.Entity<User>()
                .Property(u => u.Email)
                .HasColumnName("email");  
            
            modelBuilder.Entity<User>()
                .Property(u => u.Password)
                .HasColumnName("password");  
            
            modelBuilder.Entity<User>()
                .Property(u => u.PreferredGenre)
                .HasColumnName("preferred_genre");  
        }
    }
}