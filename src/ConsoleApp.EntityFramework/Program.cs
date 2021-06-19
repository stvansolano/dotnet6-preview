using static System.Console;

using var myContext = new BloggingContext();
myContext.Database.EnsureCreated();

myContext.Blogs.Add(new Blog{ Url = "https://stvansolano.github.io/blog" });

await myContext.SaveChangesAsync();
WriteLine(myContext.Blogs.Count());