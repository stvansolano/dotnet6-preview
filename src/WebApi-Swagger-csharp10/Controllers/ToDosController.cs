[ApiController]
[Route("/api/v1/[controller]")]
public class TodosController : Controller
{
    [HttpGet]
    public IActionResult Get() => base.Ok("Hello, Controller!");
}