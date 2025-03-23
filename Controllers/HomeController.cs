using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using MuSu.Models;

namespace MuSu.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Genre()
    {
        return View();
    }

    public IActionResult Artist()
    {
        return View();
    }

    public IActionResult Mood()
    {
        return View();
    }

    public IActionResult Recommendation()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
