using System.Text.Json.Serialization;
using WebApi.Helpers;
using WebApi.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the DI container
{
    var services = builder.Services;
    var env = builder.Environment;

    services.AddDbContext<DataContext>();
    services.AddCors(options =>
    {
        options.AddPolicy("AllowAll", builder =>
            builder.AllowAnyOrigin()
                   .AllowAnyMethod()
                   .AllowAnyHeader());
    });
    services.AddControllers().AddJsonOptions(x =>
    {
        // Serialize enums as strings in API responses (e.g., Role)
        x.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter());

        // Ignore omitted parameters on models to enable optional params (e.g., User update)
        x.JsonSerializerOptions.DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull;
    });
    services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

    // Configure DI for application services
    services.AddScoped<IUserService, UserService>();
}

var app = builder.Build();

// Configure the HTTP request pipeline
{
    // Use the CORS policy "AllowAll"
    app.UseCors("AllowAll");

    // Global error handler
    app.UseMiddleware<ErrorHandlerMiddleware>();

    app.MapControllers();
}

// Run the application without a hardcoded URL
app.Run();

