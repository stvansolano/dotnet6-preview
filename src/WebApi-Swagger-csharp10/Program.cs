var builder = WebApplication.CreateBuilder(args);

// ConfigureServices
builder.Services.AddControllers();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "My WebApi", Version = "v1" });
});
var app = builder.Build();

// Configure
if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}
app.UseSwagger();
app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Api v1"));

app.UseHttpsRedirection();
app.UseAuthorization();

app.MapGet("/", (Func<string>)(() => "Hello World!"));
app.MapControllers();

app.Run();

[ApiController]
[Route("/api/v1/[controller]")]
public class TodosController : Controller
{
    [HttpGet]
    public IActionResult Get() => base.Ok("Hello, Controller!");
}