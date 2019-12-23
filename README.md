# wc_iconMenu
A simple Webcomponent demo that provides a desktop icoon style menu of actions

You can build using the GeneroStudio project file or on Linux you can use the makefile ( which will use the GeneroStudio project file )

# Building
Set the Genero Environment then:
```
git clone git@github.com:neilm-fourjs/wc_iconMenu.git
cd wc_iconMenu/
make run
```

# Config
The menu is built from a simple json file
```
{
  "menu": [
    {
      "text": "Test",
      "image": "test.png",
      "action": "test"
    },
    {
      "text": "Exit",
      "image": "poweroff.png",
      "action": "exit"
    }
  ]
}
```
or can be built in 4gl before calling the init the function.
```
	CALL myMenu.addMenuItem( "Test1", "test.png", "test1")
	CALL myMenu.addMenuItem( "Close", "poweroff.png", "close")
```

To activate call the 'init' function then the 'ui' function in a loop, see main.4gl for an example.

# Screenshot

![ss1](https://github.com/neilm-fourjs/wc_iconMenu/raw/master/Screenshots/shot1.png "shot1")
