using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;
using myWebApp.Controllers;
using myWebApp.Models;
using myWebApp.Services;
using Microsoft.AspNetCore.Hosting;

namespace myWebApp.Services
{
   public class JsonFileDogService
    {
        public JsonFileDogService(IWebHostEnvironment webHostEnvironment)
        {
            WebHostEnvironment = webHostEnvironment;
        }

        public IWebHostEnvironment WebHostEnvironment { get; }

        private string JsonFileName
        {
            get { return Path.Combine(WebHostEnvironment.WebRootPath, "data", "dogs.json"); }
        }

        public IEnumerable<Dog> GetDogs()
        {
            using(var jsonFileReader = File.OpenText(JsonFileName))
            {
                return JsonSerializer.Deserialize<Dog[]>(jsonFileReader.ReadToEnd(),
                    new JsonSerializerOptions
                    {
                        PropertyNameCaseInsensitive = true
                    });
            }
        }

        //Edited to add Votes from Webpage 10th Feb 2020
        public void AddVote(string dogId, int vote)
        {
            var dogs = GetDogs();

            //LINQ
            var query = dogs.First(x => x.Id == dogId);

            if(query.Votes == null)
            {
                query.Votes = new int[] { vote };
            }
            else
            {
                var votes = query.Votes.ToList();
                votes.Add(vote);
                query.Votes = votes.ToArray();
            }

            using(var outputStream = File.OpenWrite(JsonFileName))
            {
                JsonSerializer.Serialize<IEnumerable<Dog>>(
                    new Utf8JsonWriter(outputStream, new JsonWriterOptions
                    {
                        SkipValidation = true,
                        Indented = true
                    }), 
                    dogs
                );
            }
        }


    }
}