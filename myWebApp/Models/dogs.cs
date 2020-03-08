using System.Text.Json;
using System.Text.Json.Serialization;

namespace myWebApp.Models
{
    public class Dog
    {
        public string Id { get; set; }
        public string Name { get; set; }

        [JsonPropertyName("photo")]
        public string Picture { get; set; }
        public string DOB { get; set; }
        public string Sex { get; set; }
        public string Breed { get; set; }
        public string Size { get; set; }
        public string Checks { get; set; }
        public string Adoption { get; set; }
        public string Description { get; set; }
        public string Kennel { get; set; }
        public int[] Votes { get; set; }

        public override string ToString() => JsonSerializer.Serialize<Dog>(this);
 
    }
}