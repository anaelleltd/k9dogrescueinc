using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using myWebApp.Controllers;
using myWebApp.Models;
using myWebApp.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace myWebApp.Pages
{
    public class PetsModel : PageModel
    {
        private readonly ILogger<DogsModel> _logger;

        public PetsModel(ILogger<DogsModel> logger,
            JsonFileDogService dogService)
        {
            _logger = logger;
            DogService = dogService;
        }

        public JsonFileDogService DogService { get; }
        public IEnumerable<Dog> Dogs { get; private set; }

        public void OnGet()
        {
            Dogs = DogService.GetDogs();
        }
    }
}