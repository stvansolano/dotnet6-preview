using MyConsole = MyCode.Functions;
var WriteLine = new Action<IEnumerable<int>>(MyConsole.WriteLine);

using var myContext = new BloggingContext();

Console.WriteLine(myContext.Blogs.Count());