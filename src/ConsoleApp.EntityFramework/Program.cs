using static System.Console;

using var myContext = new BloggingContext();
myContext.Database.EnsureDeleted();
myContext.Database.EnsureCreated();

var stvansolano = new Blog { Url = "https://stvansolano.github.io/blog"};
stvansolano.Posts.Add(new Post { Title = "Hello, World!", Content = "This is my first post!"});

myContext.Blogs.Add(stvansolano);

await myContext.SaveChangesAsync();

WriteLine($"Blogs: {myContext.Blogs.Count()}");
WriteLine($"Blog: {myContext.Blogs.First()?.Url} -> {myContext.Blogs.First().Posts.First()?.Content}");