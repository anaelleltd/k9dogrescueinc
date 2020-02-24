using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Collections;
using System.Globalization;
using System.Reflection;
using myWebApp.Components;
using myWebApp.Services;
using myWebApp.Models;
using System.Text.Json;
using System.Text.Json.Serialization;


namespace myWebApp.Models
{
    public class Duty
    {


        [Display(Name = "Volunteers duties")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd-MM-yyyy}")]
        public string Id { get; set; }
        [JsonPropertyName("pic")]
        public string Photo { get; set; }
        public string Task { get; set; }
        public string Set { get; set; }
        public string Due { get; set; }

        public string Dog { get; set; }

        [JsonPropertyName("img")]
        public string Image { get; set; }
        public string Volunteer { get; set; }
        public int[] Ratings { get; set; }

        public override string ToString() => JsonSerializer.Serialize<Duty>(this);

 
    }

}