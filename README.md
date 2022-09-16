# Broadcast render example

This is an app to test how "broadcast render" from turbo_rails can be used to broadcast multiple turbo_streams and update more than one thing on the page, like when you need to:

* Add a new element, clean the form and update a counter
* Or remove the element and also update the counter

Like in this video: https://www.loom.com/share/b4cf7e331ca9489781e211e3cd484564

## Where to broadcast?

Although the last code uses a Tweet::Broadcast module I don't want to propose that this is the way to do it. It is just there because is the last thing that I have tested.

For this use case you can broadcast from:

* The controller
* The model
* An included module

... and maybe there are other ways.

If you want a recommendation, I would propose to start on the controller and just move the broadcast to the model if is needed. And then move the broadcast to a module/concern when you think that you need to clean the model/record.