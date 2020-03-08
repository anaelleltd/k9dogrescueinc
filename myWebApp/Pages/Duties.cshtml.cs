using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using myWebApp.Models;
using myWebApp.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace myWebApp.Pages
{
    public class DutiesModel : PageModel
    {
        private readonly ILogger<DutiesModel> _logger;

        public DutiesModel(ILogger<DutiesModel> logger,
            JsonFileDutyService dutyService)
        {
            _logger = logger;
            DutyService = dutyService;
        }

        public JsonFileDutyService DutyService { get; }
        public IEnumerable<Duty> Duties { get; private set; }

        public void OnGet()
        {
            Duties = DutyService.GetDuties();
        }
    }
}