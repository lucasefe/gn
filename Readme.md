# gn

## Description

gn is is the simplest file generator you could ever find. 

Say you want to generate always a typical README file, like this one, you should do the following:

* Create a folder named (for instance) readme on your current folder
* Inside of that folder, create a file named init.rb and fill it like this:

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

* Create a templates folder and the template itself.

    mkdir readme/templates
    touch readme/templates/readme

* Inside the readme template, put your typical Readme content. 
* To include dynamic data, just use {{variable}}, where variable is a public method on Plan::Readme. So writing {{name}} will produce CHANGEME.

* Run the generator like this: 

    gn readme

* Your existing editor will pop open, allowing you to change the content of the module. 
* Close the editor. 
* You'll end up having a file named readme in the current directory, with the changes you made on the init.rb file, but your original init.rb file will be intact. 
