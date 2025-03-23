using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using MuSu.Models;
using MuSu.Data;
using Newtonsoft.Json;

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
        var moods = _context.Moods.ToList();
        return View(moods);
    }

    public IActionResult Recommendation()
    {
        var recommendations = _context.Recommendations.ToList();
        return View(recommendations);
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
