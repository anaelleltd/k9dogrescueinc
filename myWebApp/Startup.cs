using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;
using myWebApp.Components;
using myWebApp.Models;
using myWebApp.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
//using Microsoft.Extensions.Hosting;


namespace myWebApp
{
    public class Startup
    {
        
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //Added for JSON and API 4th FEB 2020
            services.AddRazorPages();
            services.AddServerSideBlazor();
            services.AddHttpClient();
            services.AddControllers();
            services.AddTransient<JsonFileDutyService>();
            services.AddTransient<JsonFileDogService>();
            //Added for Volunteers API 13th Feb 2020

        
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
            }

            //Added for RAZOR 4th Feb 2020
            app.UseHttpsRedirection();
            app.UseDefaultFiles();
            app.UseStaticFiles();
            app.UseCookiePolicy();
            //app.UseMvc();

            //Added for RAZOR 4th Feb 2020
            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapRazorPages();
                endpoints.MapControllers();
                endpoints.MapBlazorHub();

                //Basic API information for duties
                //endpoints.MapGet("/duties", (context) => 
                // {
                //     var duties = app.ApplicationServices.GetService<JsonFileDutyService>().GetDuties();
                //     var json = JsonSerializer.Serialize<IEnumerable<Duty>>(duties);
                //     return context.Response.WriteAsync(json);
                // });

                //Basic API information for Dogs added 10th February 2020
                //endpoints.MapGet("/dogs", (context) => 
                // {
                //     var dogs = app.ApplicationServices.GetService<JsonFileDogService>().GetDogs();
                //     var json = JsonSerializer.Serialize<IEnumerable<Dog>>(dogs);
                //     return context.Response.WriteAsync(json);
                // });
            });
        }
    }
}
