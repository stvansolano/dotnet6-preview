using MyConsole = MyCode.Functions;
var WriteLine = new Action<IEnumerable<int>>(MyConsole.WriteLine);

int[] numbers = new int[]{1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9, 10, 11, 12};
IEnumerable<int[]> numberChunks = numbers.Chunk(5); // {[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12]}

foreach (var result in numberChunks)
{
    WriteLine(result);          
}

WriteLine(numbers.Take(..3));          
WriteLine(numbers.DistinctBy(x => x % 3)); // {1, 2, 3}

Console.WriteLine("Hello World!");