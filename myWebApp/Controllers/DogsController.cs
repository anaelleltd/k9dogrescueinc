using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using myWebApp.Models;
using myWebApp.Services;
using Microsoft.AspNetCore.Hosting;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace myWebApp.Controllers
{
	[ApiController]
	[Route("[controller]")]

	public class DogsController : ControllerBase
	{
		public DogsController(JsonFileDogService dogService)
		{
			DogService = dogService;
		}

		public JsonFileDogService DogService { get; }

		[HttpGet]
		public IEnumerable<Dog> Get()
		{
			return DogService.GetDogs();
		}

		[HttpPatch]
		public ActionResult Patch([FromBody] VoteRequest request)
		{
			DogService.AddVote(request.DogId, request.Vote);
			return Ok();

		}

		public class VoteRequest
        {
            public string DogId { get; set; }
            public int Vote { get; set; }
        }

	}
}