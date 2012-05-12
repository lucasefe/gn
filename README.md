# gn

## Description

gn is the simplest file/folder/structure/whatever generator you could
ever find.

## Usage

Say you want to generate always a typical `README` file, like this
one, you should do the following:

Create a folder `readme` on your current folder and add an `init.rb`
with the following content:

```ruby
module Plan
  module Readme

    def name
      "CHANGEME"
    end

    def destination
      "readme"
    end
  end
end
```

Create a `readme/templates` folder and add the template for your
README files:

```
mkdir readme/templates
touch readme/templates/readme.mote
```

For example, add the following to the template:

```markdown
# {{name}}

Copyright (c) 2012 Lucas Florio
```

Templates are rendered using [`mote`](http://soveran.github.com/mote),
the minimalist template engine. In `mote` variable interpolation is
done by using the `{{variable}}` syntax, as shown in the example
above. Variable names are extracted from the current context, in this
case the `Plan::Readme` module.

Then run the generator like this:

```
gn readme
```

Now your default `$EDITOR` will pop open with a copy of your `init.rb`
file, ready to be updated if necessary. **Note that your original
`init.rb` file won't be modified**.

Close your editor and done! Your `gn` generated `README` file will be
placed in your current directory.

## Other usages

You can use gn to generate different things. In our case, we design it
so we could generate basic crud/scaffolds for
[Cuba](http://soveran.github.com/cuba), but you could use it for
whatever you want.

See the folder named examples for some ideas.

## Installation

```
gem install gn
```

Given that `gn` is still in development process, you should add
`--pre` to your `gem install`.
