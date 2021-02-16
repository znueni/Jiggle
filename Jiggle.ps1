$Assemblies = @('System.Core')
$Imports = 'System, System.XML, Microsoft.VisualBasic, System.Diagnostics, System.Runtime.InteropServices'
$Code = @"
	Private Declare Function SendInput Lib "user32.dll" (ByVal cInputs As Integer, ByRef pInputs As INPUT, ByVal cbSize As Integer) As Integer
	Public Structure INPUT
	  Public type As Integer
	  Public u As InputUnion
	End Structure
	Public Structure InputUnion
	   Public mi As MOUSEINPUT
	End Structure
	Public Structure MOUSEINPUT
	  Public dx As Integer
	  Public dy As Integer
	  Public mouseData As Integer
	  Public dwFlags As Integer
	  Public time As Integer
	  Public dwExtraInfo As IntPtr
	End Structure
	Private const MOUSEEVENTF_MOVE = &H0001

	Public Sub Move(x as Integer, y as Integer)
		Dim ip as new INPUT
		ip.u.mi.dx = x
		ip.u.mi.dy = y
		ip.u.mi.mouseData = 0
		ip.u.mi.dwFlags = MOUSEEVENTF_MOVE
		ip.u.mi.time = 0
		SendInput(1, ip, Marshal.SizeOf(ip))
	End Sub

	Public Sub MoveContinously(x as Integer, y as Integer, MilliSecondsPause as Integer)
		Do
			Console.WriteLine(Date.Now.ToString & " - Move x: " & x & ", y: " & y & " - Next at " & Date.Now.AddMilliseconds(MilliSecondsPause).ToShortTimeString())
			Move(x, y)
			Threading.Thread.Sleep(MilliSecondsPause)
		Loop
	End Sub
"@
$rndID = Get-Random
Add-Type -Language VisualBasic -TypeDefinition "Imports $Imports `n Public Class A$rndID`n $Code `nEnd Class" -ReferencedAssemblies $Assemblies -IgnoreWarnings
$X = New-Object -TypeName "A$rndID"

# Move the mouse 1 pixel to the right every 290 seconds (4 Min, 50 sec)
$x.MoveContinously(1, 0, 290000) 


