var builder = WebApplication.CreateBuilder(args);

// ConfigureServices
builder.Services.AddDbContext<TodoDb>(opt => opt.UseInMemoryDatabase("ToDos"));  
builder.Services.AddDatabaseDeveloperPageExceptionFilter();
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
app.MapGet("/api/todos", async (TodoDb db) => await db.Todos.ToListAsync());

app.Run();

class Todo
{
    public int Id { get; set; }
    [Required] public string Title { get; set; }
    public bool IsComplete { get; set; }
}

class TodoDb : DbContext
{
    public TodoDb(DbContextOptions<TodoDb> options)
        : base(options) { }

    public DbSet<Todo> Todos { get; set; }
}