# Jiggle
A small, simple Powershell [script](Jiggle.ps1) to stop a PC from locking by moving the mouse every 4 Minutes and 50 seconds by 1 pixel.

This avoids automatic forced locking by inactivity.

And since it is just a plain text file with a Powershell script, it runs using the Windows supplied Powershell. No executable, no dependencies.

# Setup
1. Download the script [Jiggle.ps1](Jiggle.ps1) (or copy & paste or email/message the text to you, depending if you have download restrictions) and save it as a simple text file (e.g. jiggle.ps1)
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


# Run without a visible window
If you start the script, it opens a window. If you dont want that, you can run the following command:
```
powershell "$s=(New-Object System.Diagnostics.ProcessStartInfo);$s.Arguments='-ExecutionPolicy Unrestricted -NoExit -File <PATH TO YOUR JIGGLE SCRIPT WITHOUT BLANKS>';$s.FileName='powershell.exe';$s.WindowStyle=[System.Diagnostics.ProcessWindowStyle]::Hidden; [System.Diagnostics.Process]::Start($s)"
```
(Just replace the ``<PATH TO YOUR JIGGLE SCRIPT WITHOUT BLANKS>`` with the path to your Jiggle.ps1 script, but make sure there are no blanks in the path.)
This little trick is actually a mini powershell script within the command line, that uses the DotNet Process API to start your script and set the window of your script to being invisible. 
You can check, that is it running in the Task Manager (Details view, show the 'Command line' columns and see powershell processes).


# Autorun
See [Autostart_Jiggle.ps1](Autostart_Jiggle.ps1)



