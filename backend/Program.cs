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
        // Define a CORS policy to allow requests from any origin
        options.AddPolicy("AllowAll", policy =>
            policy.AllowAnyOrigin()
                  .AllowAnyMethod()
                  .AllowAnyHeader());
    });
    services.AddControllers().AddJsonOptions(x =>
    {
        // Serialize enums as strings in API responses
        x.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter());

        // Ignore null values in JSON responses
        x.JsonSerializerOptions.DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull;
    });
    services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

    // Register application services for dependency injection
    services.AddScoped<IUserService, UserService>();
}

var app = builder.Build();

// Configure the HTTP request pipeline
{
    // Use the "AllowAll" CORS policy
    app.UseCors("AllowAll");

    // Use a global error handler
    app.UseMiddleware<ErrorHandlerMiddleware>();

    // Map controller endpoints
    app.MapControllers();
}

// Configure the app to listen on all network interfaces
app.Run("http://0.0.0.0:9080");

