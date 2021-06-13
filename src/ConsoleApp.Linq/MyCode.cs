namespace MyCode
{
    public static class Functions
    {
        public static void WriteLine(IEnumerable<int> numbers) => 
            System.Console.WriteLine(
                string.Join(',', numbers)
            );
    }
}