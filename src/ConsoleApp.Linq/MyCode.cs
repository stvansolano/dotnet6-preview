namespace My
{
    public static class Console
    {
        public static void WriteLine(string text, object value) => 
            System.Console.WriteLine(text, value);

        public static void WriteLine(IEnumerable<int> numbers) => 
            WriteLine(text: "",
                numbers: numbers
            );

        public static void WriteLine(string text, IEnumerable<int> numbers = null) 
            => System.Console.WriteLine($"{text}" +
                (numbers == null ? "" : $" => {string.Join(',', numbers)}"));

        public static void NewLine() => WriteLine(System.Environment.NewLine);
    }
}