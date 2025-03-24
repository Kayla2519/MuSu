using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using MuSu.Models;
using MuSu.Data;
using Newtonsoft.Json;
using Microsoft.EntityFrameworkCore;

namespace MuSu.Controllers;

public class HomeController : Controller
{
    private readonly ApplicationDbContext _context;
    private readonly ILogger<HomeController> _logger;

    public HomeController(ApplicationDbContext context, ILogger<HomeController> logger)
    {
        _context = context;
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Genre()
    {
        var genres = _context.Genres.ToList();
        return View(genres);
    }

    [HttpPost]
    public IActionResult SelectGenres(List<int> selectedGenres)
    {
        if (selectedGenres == null || !selectedGenres.Any())
        {
            return BadRequest("Please select at least one genre.");
        }

        HttpContext.Session.SetString("SelectedGenres", JsonConvert.SerializeObject(selectedGenres));

        return RedirectToAction("Artist");
    }

    public IActionResult Artist()
    {
        var selectedGenresString = HttpContext.Session.GetString("SelectedGenres");

        if (string.IsNullOrEmpty(selectedGenresString))
        {
            return RedirectToAction("Genre");
        }

        var selectedGenres = JsonConvert.DeserializeObject<List<int>>(selectedGenresString);

        Console.WriteLine("Selected Genres: " + string.Join(", ", selectedGenres));

        var artists = _context.Artists
            .Where(a => selectedGenres.Contains(a.GenreID)) 
            .ToList();

        return View(artists);
    }

    [HttpPost]
    public IActionResult SelectArtists(List<int> selectedArtists)
    {
        if (selectedArtists == null || !selectedArtists.Any())
        {
            return BadRequest("Please select at least one artist.");
        }

        HttpContext.Session.SetString("SelectedArtists", JsonConvert.SerializeObject(selectedArtists));

        return RedirectToAction("Mood");
    }

    public IActionResult Mood()
    {
        var selectedArtistsString = HttpContext.Session.GetString("SelectedArtists");

        if (string.IsNullOrEmpty(selectedArtistsString))
        {
            return RedirectToAction("Artist");
        }

        var selectedArtists = JsonConvert.DeserializeObject<List<int>>(selectedArtistsString);

        Console.WriteLine("Selected Artists: " + string.Join(", ", selectedArtists));

        var artists = _context.Artists
            .Where(a => selectedArtists.Contains(a.ArtistID))
            .ToList();

        var artistMoods = artists.Select(a => a.Moods)
            .SelectMany(m => m.Split(','))
            .Distinct()
            .ToList();
        
        var moods = _context.Moods
            .Where(m => artistMoods.Contains(m.MoodID.ToString()))
            .ToList();

        return View(moods);
    }

    [HttpPost]
    public IActionResult SelectMoods(List<int> selectedMoods)
    {
        if (selectedMoods == null || !selectedMoods.Any())
        {
            return BadRequest("Please select at least one mood.");
        }

        HttpContext.Session.SetString("SelectedMoods", JsonConvert.SerializeObject(selectedMoods));

        return RedirectToAction("Recommendation");
    }

    public IActionResult Recommendation()
    {
        var selectedMoodsString = HttpContext.Session.GetString("SelectedMoods");

        if (string.IsNullOrEmpty(selectedMoodsString))
        {
            return RedirectToAction("Mood");
        }

        var selectedMoods = JsonConvert.DeserializeObject<List<int>>(selectedMoodsString);

        Console.WriteLine("Selected Moods: " + string.Join(", ", selectedMoods));

        var selectedArtistsString = HttpContext.Session.GetString("SelectedArtists");
        var selectedArtists = string.IsNullOrEmpty(selectedArtistsString)
            ? new List<int>()
            : JsonConvert.DeserializeObject<List<int>>(selectedArtistsString);
        
        Console.WriteLine("Selected Artists: " + string.Join(", ", selectedArtists));

        var moods = _context.Moods
            .Where(m => selectedMoods.Contains(m.MoodID))
            .ToList();

        var moodSongIds = moods
            .SelectMany(m => m.Songs.Split(',') 
            .Select(s => int.TryParse(s, out int songId) ? songId : (int?)null) 
            .Where(id => id.HasValue) 
            .Select(id => id.Value)) 
            .Distinct()
            .ToList();

        
        var songs = _context.Songs
            .Where(s => moodSongIds.Contains(s.SongID) && selectedArtists.Contains(s.ArtistID))
            .Include(s => s.Artist) 
            .ToList();

        return View(songs);
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
