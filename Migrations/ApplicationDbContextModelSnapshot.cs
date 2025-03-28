﻿// <auto-generated />
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using MuSu.Data;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace MuSu.Migrations
{
    [DbContext(typeof(ApplicationDbContext))]
    partial class ApplicationDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "9.0.3")
                .HasAnnotation("Relational:MaxIdentifierLength", 63);

            NpgsqlModelBuilderExtensions.UseIdentityByDefaultColumns(modelBuilder);

            modelBuilder.Entity("Artist", b =>
                {
                    b.Property<int>("ArtistID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer")
                        .HasColumnName("artist");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("ArtistID"));

                    b.Property<string>("ArtistName")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("name");

                    b.Property<int>("GenreID")
                        .HasColumnType("integer")
                        .HasColumnName("genre_id");

                    b.HasKey("ArtistID");

                    b.ToTable("artists", (string)null);
                });

            modelBuilder.Entity("Genre", b =>
                {
                    b.Property<int>("GenreID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer")
                        .HasColumnName("genre_id");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("GenreID"));

                    b.Property<string>("GenreName")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("name");

                    b.HasKey("GenreID");

                    b.ToTable("genres", (string)null);
                });

            modelBuilder.Entity("Mood", b =>
                {
                    b.Property<int>("MoodID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer")
                        .HasColumnName("mood_id");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("MoodID"));

                    b.Property<string>("MoodName")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("name");

                    b.HasKey("MoodID");

                    b.ToTable("moods", (string)null);
                });

            modelBuilder.Entity("Recommendation", b =>
                {
                    b.Property<int>("RecommendationID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer")
                        .HasColumnName("recommendation_id");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("RecommendationID"));

                    b.Property<int>("SongID")
                        .HasColumnType("integer")
                        .HasColumnName("song_id");

                    b.Property<int>("UserID")
                        .HasColumnType("integer")
                        .HasColumnName("user_id");

                    b.HasKey("RecommendationID");

                    b.ToTable("recommendations", (string)null);
                });

            modelBuilder.Entity("Song", b =>
                {
                    b.Property<int>("SongID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer")
                        .HasColumnName("song_id");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("SongID"));

                    b.Property<int>("ArtistID")
                        .HasColumnType("integer")
                        .HasColumnName("artist_id");

                    b.Property<int>("Duration")
                        .HasColumnType("integer")
                        .HasColumnName("duration");

                    b.Property<int>("GenreID")
                        .HasColumnType("integer")
                        .HasColumnName("genre_id");

                    b.Property<int>("MoodID")
                        .HasColumnType("integer")
                        .HasColumnName("mood_id");

                    b.Property<string>("ReleaseDate")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("release_date");

                    b.Property<string>("SongTitle")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("title");

                    b.HasKey("SongID");

                    b.ToTable("songs", (string)null);
                });

            modelBuilder.Entity("User", b =>
                {
                    b.Property<int>("UserID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer")
                        .HasColumnName("user_id");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("UserID"));

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("email");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("name");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("password");

                    b.Property<int>("PreferredGenre")
                        .HasColumnType("integer")
                        .HasColumnName("preferred_genre");

                    b.HasKey("UserID");

                    b.ToTable("users", (string)null);
                });
#pragma warning restore 612, 618
        }
    }
}
