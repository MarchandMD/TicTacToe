# possible open source contributions to tic tac toe project

* update the test for the player class `#initializiation` test to specify for an error (or at least suggest documentation for future users to reference)
* update the image of what the `bundle gem install tic_tac_toe` will generate
* suggest commenting out certain metadata/TODO items in the `tic_tac_toe.gemspec` file
* remove the step to add a `spec_helper` file in the `spec` directory;  it's already present in the file structure
* corrcect the `require` command in the entire project to `require_relative` to follow convention
* update, or suggest updating the syntax for the `Cell` class test in RSpec; `describe` is now `RSpec.describe`. 
* need to add the `Board` class to the "manifest" file in the `/lib` directory
* first time I did the tutorial...I needed to be guided a little more about what the `#fetch` method was doing...specifically the parameters. 
* I also needed help with default values on parameters
* I also needed some guidance with what `#default_grid` was actually doing; perhaps suggesting to use IRB here....
* Yeah, so...the way that the `Board` is instantiated was very confusing. 
* the RSpec test for `#have` is no longer used. Update the tutorial to either be exact, or direct the person to the documentation. 
* the `#value` method is sort of loaded here. and it seems to be a pretty high level method; it's actually a little obscure, in terms of the new students ability to process what it's actually doing behind the scenes. Safe to say though, from it's name it's somehow setting it's value. The fact that I'm able to call `#value` on an object I created just earlier in this tutorial is pretty surprising to a noob. 
* using a Struct
* need to update the tutorial to no longer use `#stub` because stub isn't defined anymore. Maybe just direct them to RelishApp

