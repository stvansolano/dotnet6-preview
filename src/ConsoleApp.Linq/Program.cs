using MyConsole = My.Console;

MyConsole.WriteLine("Hello World! LINQ features");
MyConsole.NewLine();

MyConsole.WriteLine("Chunks");
MyConsole.NewLine();

int[] numbers = new int[]{1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9, 10, 11, 12};
int[][] chunks = numbers.Chunk(5).ToArray(); // {[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12]}

for (var position = 1; position < chunks.Count(); position++)
{
    MyConsole.WriteLine($"Chunk {position}", chunks[position - 1]);          
}

MyConsole.NewLine();
MyConsole.WriteLine("Take(..x)      ", numbers.Take(..3));
MyConsole.WriteLine("DistinctBy (%3)", numbers.DistinctBy(x => x % 3)); // {1, 2, 3}