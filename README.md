# Jiggle
A small, simple Powershell script to stop a PC from locking by moving the mouse every few minutes.

# Setup
1. Download the script (or copy & paste or email/message the text to you, depending if you have download restrictions) and save it as a simple text file (e.g. jiggle.ps1)
2. Run your Jiggle.ps1 Powershell script. You can do that either by simply opening it in the Powershell ISE or by running it with the Windows built-in Powershell.

If you run it, it moves the mouse to the right by 1 pixel every 290 seconds (that is 4 minutes and 50 seconds) until you close it. 


  
Maybe the best and easiest option to run the script, is to create a shortcut:
```
powershell.exe -ExecutionPolicy Unrestricted -NoLogo -NoExit -File "Jiggle.ps1" 
```
Run this in the directory where your Jiggle.ps1 file is (and replace the Jiggle.ps1 with the name of the scriptfile, if you named it differently).



# Adapt to your needs
Open the script and edit it as you want. In default, it moves the mouse to the right by 1 pixel every 290 seconds:
```
$x.MoveContinously(1, 0, 290000) 
```
* the first argument determines movement on the x axis (horizontal)
* the second argument allows you to move the mouse on the y axis (vertical)
* the third argument is the amount of seconds to wait between moving the mouse

**Note:**
In a lot of scenarios, it is not even neccessary to move the mouse. 
Try changing the x and y to 0: ``$x.MoveContinously(0, 0, 290000)``

This "theoretical" movement of the mouse by zero pixels is enough to fool for example the Windows Screensaver from starting.
Other application, e.g. Citrix cannot be fooled by this. For that, you need to move the mouse for at least 1 pixel.
