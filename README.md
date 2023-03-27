# Stupid Static Site Generator

This is the world's dumbest static site generator. It's designed to meet my immediate needs, and no other, and its basically a short bash script that wraps Pandoc. I wrote it this way because I dabbled in other Static Site Generators and found them too complex for my own needs.

## Prerequisites
You need Pandoc installed, and it's been tested with version `pandoc 3.1.1`. You need `find` and `sed`. 

## Usage
## Getting Started
Clone this repo. That's your starting point. If you use `scripts/clean_history.sh`, it will remove all the existing commits from this repository, and give you a 100% clean starting point, with no history behind it. That step is optional, but recommended.
### Your Own Pages
Add your pages into the `pages` folder. They can be markdown, *or* HTML. NB: HTML gets no processing or templating applied. You can build your folder structure as you see fit. Write your links as relative links that link the specific Markdown files: i.e.:

```markdown
This is my page. 

[This links to a page at the same level](otherpage.md). 

[This links to a subdirectory](somesubdir/anotherpage.md). 

[This links up a level](../parentPage.md)
```

### Front Matter
All your HTML pages need YAML front matter for Pandoc to correctly process them. Currently, the only required variable is the `title` field. Feel free to read up on [Pandoc's templates](https://pandoc.org/MANUAL.html#templates) and extend `default.html` however you like. Each variable you use in your default template is another variable you can use in the front matter. Proper usage and design of these variables is left as an exercise to the reader. It's pandoc's problem, honestly.

### Customizing the Layout
Currently, `templates/default.html` is the template used to control the HTML output. Modify that template to create the look and feel for the page you want. Currently, it does basically *nothing* but provide a bare minimum layout.

### Other Assets, like Images?
Put them anywhere under the `pages` folder. I don't care. For convenience, I've added an `assets` folder, which is ideally where you might drop any CSS, JavaScript, or possibly images. If it's in the `pages` folder, though, it'll be accessible anywhere in your pages.

### Deploying
Run `scripts/build.sh`. Put the contents of the `output` directory on a web server. 

# Why is this so dumb?
Because web development is too hard, too complicated, and involves too many moving parts. I want a simple way to manage a site. I want it to be as stupid as I am. I don't want loads of features. I want to take some simple documents, and render them as HTML, and have a simple way to upload those. There is no magic, beyond calling out to Pandoc. Pandoc is incredibly complicated, and I don't fully know all of the things it can do. It doesn't matter, though, because Pandoc is the only piece of magic in this tool, and Pandoc has great documentation. If you understand Pandoc, you understand how to use this tool. If you don't understand Pandoc, well, you can still basically get a simple site up and running, with minimal HTML.

TL;DR: It's dumb because I'm dumb.

## Future Work
Eventually, I'll come up with a way for you to specify which templates you want to use. Eventually it'll support partials. For right now, it's the dumbest, simplest static site generator you can have. I don't forsee this having many more features than that.