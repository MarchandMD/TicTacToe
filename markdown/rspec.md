Ok, so this is the guidance I wish I had the first time I did this.

If you're will to do a little bit of reading, I'll spell out as much of this clusterf\*ck as I can; at least for me. It may be helpful for someone else, or it may just be good for me. I don't really know. I guess I'll find out. Not sure if anyone else will ever see this.

### Objective

begin using RSpec when building a module or gem or other program

### Givens

This is in the context of building a `Module` in Ruby.

So how far back do I have to go? Maybe take my cues from the article/tutorial.

I want to add some tests to my program so I can test the different classes I'm going to be writing. And I've already written one class in the program...the `Cell` class. The point is, I now want to start using RSpec so I can test the code I'm writing. The first direciton from the tutorial is:

> Add RSpec to the gemspec file and run `bundle install` on the command line

So, this first directive is a little strange. I mean, in the file structureI do have a `tictactoe.gemspec` file. And that file has a bunch of stuff on it. But I have no idea what any of the informaiton in the file is.

so then my desire is to take it step by step and really rip this stuff apart, so I know what it is, and what it's doing.

Becuase why not?

```ruby
require_relative 'lib/tictactoe/version'
```

so, I know that when running a `Ruby` file that I can tell the interpreter (at least I think it's called an interpreter...maybe it's called an engine)...I cna tell the engine/interpreter...to look at other files and execute those files as well. So that's what this `require_relative` is doing. and it's pointing to `lib/tictactoe/version`. So this begs the question: what is this pointing to?

Well, I know that `lib/tictactoe/version` is a file path... that's one of the nuances of `Ruby` and this `require_relative` thing...I don't necessarily need to add the extension of the file. I don't know what that is, I just know that that is the way it is.

So with that knowledge, I know that there is this file: `version.rb` and it's in the `lib` dir and then in the `tictactoe/` directory. And it's in the same place as the `cell.rb` file, which is were I wrote the source code for the `Cell` class. I don't know if that's significant..but that's what this `require_relative` is doing, and that's where it's going and that's what it's grabbing.

The contents of the `lib/tictactoe/version` is so inconsequential to me right now...so then I can keep going.

The next line of the `tictactoe.gemspec` file is:

```ruby
Gem::Specification.new do |spec|
```

And I vaguely recognize this as something basic...like `Gem` is some type of thing that preceeds `Specification` and that `Specification` is like a method of `Gem`, or maybe somehow a child of `Gem` object. Anyway, what is being created in this `tictactoe.gemspec` file appears to be a new `Specification` instance. So it appears that this file is creating either one instance of a `Specification` or it's creating multiple specifications.

so...any way...somehow this .gemspec file is being called somewhere, somehow, and then this `Specificaiton` is being called. It's then taking some piece of infomraiton and it's passing it to a block. and the block is sizeable. And I don't really know what al it is...but a lot of it looks like it's identifying informaiton.

It's amazing that the people answr questions about this stuff have no idea that the things they're saying are not understandable to meer humans. It's wild.

So, I see that what ever the information that's being passed into this instance of `Specification` as `|spec|` have a number of instance methods that are being called and/or defined. For example:

```ruby
spec.name          = "tictactoe"
spec.version       = Tictactoe::VERSION
spec.authors       = ["Michael Marchand"]
spec.email         = ["michaeldavidmarchand@gmail.com"]

spec.summary       = %q{does tic tac toe}
spec.description   = %q{just hacking things together}
#spec.homepage      = "TODO: Put your gem's website or public repo URL here."
spec.license       = "MIT"
spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
```

And these are just some of them.

Now here's what I had to do.

I had to turn some of these lines into comments, so they weren't fucking things up. But that's for later.

The real thing that I had to do now was add this line into the block for the `Specification`:

```ruby
spec.add_development_dependency "rspec"
```

So really, the only thing that I think this line does is specifically identify `RSpec` as the testing software for the gem. But I'm not certain. I mean, working with RSpec is a little strange to begin with. I don't necessasrily know exactly how it works. I just know that it's supposed to help. And i know at this point in this tutorial i'm writing, that it's necessary to add `spec.add_development_dependence "rspec` in the `tictactoe.gemspec` file.

A good place to look for additional informaiton would be on `Rubygems.org` about building a gem from scratch. I mean, that's maybe the next thing I could do. Because it might help or be a good reference for when I move onto the next thing, which will be looking at that NHL API app, and learning if there's ways for me to work with that.

So, for now, this tutorial, it this iteration, i'm able to keep moving forward. BEcauase there's a lot of stuff that I need to look at to keep moving forward.

# 2. Mapping file requirements within the Gem

So the next thing that needs to happen is creating some connections between the files/folders in the Gem.

Specifically, i'll be adding a `require_relative` to `/lib/tictactoe.rb`.

First, what are the default contents of the `/lib/tictactoe.rb` file? Because I certainly didn't add anything there....

```ruby
require_relative "tictactoe/version"

module Tictactoe
class Error < StandardError; end
# Your code goes here...
end
```

That's it. That's all that's in the file. It appears to be some kind of placeholder. I think the amount of actual code that I write on this page is minimal. And truthfully all I do for most of the gem...and I think most Gem conventions....use this file as a way to gather and organize all the other files/modules/classes for the Gem.

Yeah. At least that's what I can tell from looking at one other Gem. Ok, now I've looked at two files.

I mean, the `/lib/tictactoe.rb` file can be a hub/a central location for traffic, or it can include code. IT's probably best practie to not use it for code, but it's not a given that it's only used for that.

Ok, so enough said about that. Since I now know what is possible to be there, what is the next thing to add to this file?

The next thing that's being added is:

```ruby
require_relative "./tictactoe/cell.rb"
```

So then what I'm doing is i'm adding the class. 

by adding  `require_relative` and then a file path, what I'm doing is I'm adding the actual code. But, since Ruby is object-oriented, the individual classes are put into their own files. So this is a way to sort of pull the code into one place. So essentailly what I've done is I've written the `Cell` class in it's own file...and now I'm pulling that code into the module. 

Ok. I could go on. But I want to review `require_relative` and file paths....

Alright, the easiest answer I found is: `require_relative` will load the file that can be found at the path following `require_relative`. 

Somehting that will help to understand this is knowing that the path is RELATIVE to which ever file contains the `require_relative` command. there's also `require`...which is a little more flexible in terms of where it's pulling from, but requires a little more precision. 

One thing that I was able to do with the tutorial is remove the `./` from the file, because it's unnecessary. The reason it's unnecessary is because it's a file path...THAT'S RELATIVE TO THE CURRENT FILE. In this example, `require_relative` is in the `/lib/tictactoe.rb` file. Since I'm in the `/lib/tictactoe.rb` file, and I need to require the `cell.rb` file, which lives in `lib/`, then I can say that `tictactoe.rb` and `cell.rb` share a parent directory: `/lib`. Since they share a parent, I don't necessarily need to say `./`. It's redundant with `require_relative`. Ok. That makes perfect sense. Keep going. 

# adding RSpec
the tutorial says to add a spec folder, but it's already added; it's a part of the original build. 

The tutorial also says to create a `spec/spec_helper.rb` file. That too is already part of the original build. 

It's a good thing too, becaues there's a lot of stuff in there that I know nothing about. So I don't really need to do anything there to add RSpec. 

## Updating the `spec_helper.rb` file
Ok, so since there's already a `spec_helper.rb` file, I need to connect RSpec to the code I'm writing. 

I'm writing code for a Module; specifically, i'm writing the `Module Tictactoe`. 

And I just got done saying that the Module is built in seperate files, but is centrally pulled together in the `lib/tictactoe.rb` file, by using those `require_relative` files. 

Essentially what this tutorial is also teaching me is how to connect htings, and how to organize a directory. It's very straightforward and very easy to understand, when you know what you're doing. 

So updating the `spec_helper.rb` file requires using a `require_relative` command itself. And I just said i need to pull in the `Module Tictactoe` and I can do that by grabbing the `lib/tictactoe.rb` file, so do that now. 

(ok so this is strange: I don't know how...but the tutorial says onething...but my code says something else. LOL. like, I did it wrong and I didn't even catch it, but it's still working; lol. So i'm going to update the `spec_helper.rb` to be something else.)

Something interesting I found: I might not necessasrily need to update the `spec_helper.rb` file with the `require_relative` command. I think onthe original build there's already a `require` command built in that's pulling in the module. because as I mentioned earlier, `require`  isn't relative to the current working directory and isntead searches the entire load path. So as long as there is some file named `tictactoe.rb` somewhere in the project it will load it, but it's not necessary. 

But this is part of a larger discussion: when to use `require_relative` and when to use `require`. Both work, but it looks like `require` should be reserved for external gems/files and `require_relative` should be used for internal stuff. So alright that makes sense. 

Next thing I want to do is see if that `require` in `spec_helper.rb` was actually there by defualt. 

Ok, so yeah, when the gem is created the `spec_helper.rb` automatically connects to require the module. That only makes sense. So maybe that's the convention, since it's part of the build. But whatever, i'm learning. IT's fine. 

waht's next? 

So I just updated the `spec_helper.rb` so that RSpec now knows where to look for the code that'll execute the tests for the `Tictactoe::Cell` method. ok. next. 

## create a file to write tests in
There's a `/spec` dircectory. let's add a spec file to test what's in `cell.rb`. 

create `cell_spec.rb` in `/spec`

Simple enough. 

Now that I have a `_spec.rb` file I'm almost ready to write tests. But before I do that I need to use the `spec_helper.rb` in the `_spec.rb` file. So this is probably going to be true for any future `_spec.rb` file I write. Use the `spec_helper.rb`. 

so what exactly is `spec_helper.rb` doing? 

Well, for starters, it's helping to pull in the necessasry source code to test. And it's also configiruing RSpec in some way to be able to run tests. 

So this `spec_helper.rb` is really the file that's running the tests. But it's me that's writing the tests. So I need to b able to write in RSpec. and build with Rspec. 

ok, so let's ssee if I can do this without the tutorial. 

I need to add the `spec_helper.rb` to the `cell_spec.rb` file. 

Ok, got that. 

And again, this tutorial is a little whack, but I made some chagnes to it. 

# Add the skeleton of the testing framework
Ok, so now...the files are setup to work together. I need to write tests!

In `cell_spec.rb` i'm going to write the tests for the `Cell` class, using RSpec. 

Here's how I set it up: 

```ruby
module Tictactoe
  RSpec.describe Cell do
    #my tests will go here
  end
```
So yeah. That's the way this is.

Really I could begin to make changes to this. Start to do it. Why not? 

Ok, I forked the project, and then I started making changes to it. ...maybe the first thing I should have done was create a different branch? Yeah, that would have been the best thing to do. I can still undo things and then change it back. That might be the best thing to do. 

Ok, so. yeah. NOw that's two projects I want to tackle on my own. Damn. Ok, get through this one and keep going. 

So now i'm set up to add tests. 

But I want to keep going through the tutorial. As opposed to keep going as slow as I'm going now. I mean, what am I doing now? I'm walking throught things very slowly. This is how I learn best. 

I'll come back to this when I need to. I feel comfortable right now. 

# Writing code
Ok, so this is kind of the actual process of writing code. Like, I'm literally going to write some code in Ruby, and the hope is that the code is written correctly to be able to do something. 

I have a `Cell` class, and I've tested it, so that works fine. 

Next thing is to add a `Player` class. 

in addition to just being able to write code, I need to be able to place the code on the correct file, in the correct folder...and then I need to make sure the rest of the Gem and testing software knows about the code I wrte, so I can write tests and use it!

## create a new file for a new class
I'm creating the `Player` class. 

I'll use my experience building the `Cell` class to dictate where I should create the `Player` class. 

I'm going to add a file in `lib/tictactoe` and i'm going to call it `player.rb`



