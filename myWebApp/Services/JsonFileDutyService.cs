using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;
using myWebApp.Models;
using Microsoft.AspNetCore.Hosting;

//Edited namespace for Services 4th Feb 2020
namespace myWebApp.Services
{
   public class JsonFileDutyService
    {
        public JsonFileDutyService(IWebHostEnvironment webHostEnvironment)
        {
            WebHostEnvironment = webHostEnvironment;
        }

        public IWebHostEnvironment WebHostEnvironment { get; }

        private string JsonFileName
        {
            get { return Path.Combine(WebHostEnvironment.WebRootPath, "data", "duties.json"); }
        }

        public IEnumerable<Duty> GetDuties()
        {
            using(var jsonFileReader = File.OpenText(JsonFileName))
            {
                return JsonSerializer.Deserialize<Duty[]>(jsonFileReader.ReadToEnd(),
                    new JsonSerializerOptions
                    {
                        PropertyNameCaseInsensitive = true
                    });
            }
        }

        //Edited to add Ratings from Webpage 4th Feb 2020
        public void AddRating(string dutyId, int rating)
        {
            var duties = GetDuties();

            if(duties.First(x => x.Id == dutyId).Ratings == null)
            {
                duties.First(x => x.Id == dutyId).Ratings = new int[] { rating };
            }
            else
            {
                var ratings = duties.First(x => x.Id == dutyId).Ratings.ToList();
                ratings.Add(rating);
                duties.First(x => x.Id == dutyId).Ratings = ratings.ToArray();
            }

            using(var outputStream = File.OpenWrite(JsonFileName))
            {
                JsonSerializer.Serialize<IEnumerable<Duty>>(
                    new Utf8JsonWriter(outputStream, new JsonWriterOptions
                    {
                        SkipValidation = true,
                        Indented = true
                    }), 
                    duties
                );
            }
        }
    }
}