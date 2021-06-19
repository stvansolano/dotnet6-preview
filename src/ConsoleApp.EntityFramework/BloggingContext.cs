
public class BloggingContext : DbContext
{
    public DbSet<Blog> Blogs { get; set; }
    public DbSet<Post> Posts { get; set; }

    // The following configures EF to create a Sqlite database file as `C:\blogging.db`.
    // For Mac or Linux, change this to `/tmp/blogging.db` or any other absolute path.
    protected override void OnConfiguring(DbContextOptionsBuilder options)
        => options.UseSqlite(@"Data Source=/tmp/blogging.db");

    protected override void OnModelCreating(ModelBuilder modelBuilder) =>
            modelBuilder.Entity<Blog>()
                .ToTable("Blogs")
                .Property(b => b.Url)
                .IsRequired();
}

public class Blog
{
    public int BlogId { get; set; }
    public string Url { get; set; }

    public List<Post> Posts { get; } = new List<Post>();
}

public class Post
{
    public int PostId { get; set; }
    public string Title { get; set; }
    public string Content { get; set; }

    public int BlogId { get; set; }
    public Blog Blog { get; set; }
}