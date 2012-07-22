# gn

## Description

gn is the simplest file/folder/structure/whatever generator you could
ever find.

## Usage

Say you want to generate always a typical `README` file, like this
one, you should do the following:

Create a folder `~/.gn/readme` and add a `plan.rb` file with the
following content:

```ruby
module Plan
  class README
    def name
      "CHANGEME"
    end

    def author
      "Your Name"
    end

    def destination
      "README"
    end
  end
end
```

The only mandatory method is `destination`. Everything else is
optional and is based on how the template is designed.

Create a `~/.gn/readme/plan` folder and add the template for your
README file:

```
mkdir ~/.gn/readme/plan
touch ~/.gn/readme/plan/readme.mote
```

For example, add the following to the template:

```markdown
# {{name}}

Copyright (c) 2012 {{author}}
```

Templates are rendered using [`mote`](http://soveran.github.com/mote),
the minimalist template engine. In `mote`, variable interpolation is
done by using the `{{variable}}` syntax, as shown in the example
above. Variable names are extracted from the current context, in this
case an instance of `Plan::README`.

Then run the generator like this:

```
gn readme
```

Now your default `$EDITOR` will pop open with a copy of your `plan.rb`
file, ready to be updated if necessary. Note that the original
`plan.rb` file won't be modified.

Close your editor and you are done! Your `gn` generated `README` file
will be placed in your current directory.

## Other usages

You can use gn to generate different things. In our case, we
designed it so we could generate basic crud/scaffolds for
[Cuba](http://soveran.github.com/cuba), but you can use it for
anything you want.

See the folder named examples for some ideas.

## Installation

```
gem install gn
```

Given that `gn` is still in development process, you should add
`--pre` to your `gem install`.
