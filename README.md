# Welcome to .NET 6 preview! (CodeBox by @stvansolano)

[Twitter: @stvansolano](https://twitter.com/stvansolano)

## Do you like it? Give a Star! :star:

If you like or are using this project to learn or start your own solution, please give it a star. I appreciate it!

A ready-to-use, multi-purpose dev environment.

[![Try in PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/stvansolano/codebox-dotnet/main/docker-compose.yml)

## Hot to Use (.NET 6 Preview)

1) Go to https://github.com/stvansolano/dotnet6-preview and hit the "Use this template"
2) Give it a name
3) Start using it from GitHub Codespaces (Code -> Open With Codespaces) 

Alternatively, you can run it from VS Code from your machine! (Screenshot below)

<img width="846" alt="Run it from VS Code from your machine" src="https://user-images.githubusercontent.com/3009519/122646676-9caf0e00-d0dd-11eb-983d-146c0fdbf215.png">

## Running some samples

1) Make sure `dotnet` tooling is part of your $PATH

> export DOTNET_ROOT=$HOME/dotnet \
    && export PATH=$PATH:$HOME/dotnet
    
2) Browse the src/WebApi or create a new Web API from CLI

> dotnet new web -o src/WebApi

or
> cd src/WebApi

3) Then run it 
> dotnet watch

## Links

I included several links to the previews, Microsoft posts and of course useful links [here](https://github.com/stvansolano/dotnet6-preview/blob/main/posts/links.md).
