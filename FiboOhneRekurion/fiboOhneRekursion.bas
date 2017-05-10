'( No worries. This is a block comment ;D

   EndProject.bas

   Created at: 08.05.2017

   Display the numbers from Fibonacii on a dice.
   BEWARE! These Numbers are limited!

   The Program itself should work now fine. But there is a Risk, that the Soft-
   or Hardwarestack may not be suitable for this type of program. The Program
   itself has to make some recursive calls. These calls have to be left on the
   Stack. There is a possibility of "overgrowing the stack".

')



'Controller festlegen

$regfile = "attiny13.dat"

'Taktfrequenz festlegen

$crystal = 1200000

'Hardwarestuck festlegen

$hwstack = 18
$swstack = 8

'Declare Input & Output

Config Pinb.0 = Input
Config Portb.1 = Output
Config Portb.2 = Output
Config Portb.3 = Output
Config Portb.4 = Output

'Declare Sub-circuits

Declare Sub Eingabe
Declare Sub Aufruf
Declare Sub Eins
Declare Sub Zwei
Declare Sub Drei
Declare Sub Fuenf

'Namen für einzelne Nummern geben

''Zahl Eins
E Alias Portb.4
''Zahl Zwei
Z Alias Portb.3
'Zahl Vier
V Alias Portb.1

'Sub-circuit für die Eingabe mit Taster

Sub Eingabe
   Do
   'Anfrage an den taster
      If Pinb.0 = 1 Then Call Aufruf
      'entprellen
      Waitms 50
   Loop
End Sub

'sub-circuits für den Aufruf der fibbonacci funktion & einzelne Zahlen

Sub Aufruf
Dim A As Integer
   For A = 0 To 6 Step 1
     If A = 1 Or A = 2 Then
     Call Eins
     Elseif A = 3 Then
     Call Zwei
     Elseif A = 4 Then
     Call Fuenf
End IF
   Next
End Sub



Sub Eins
   Reset Z
   Set E
End Sub



Sub Zwei
   Reset E
   Set Z
End Sub



Sub Drei
   Set E
   Set Z
End Sub



Sub Fuenf
   Set E
   Set Z
   Set 4
End Sub

' Animation zum Uebergang Sub-circuit

'Sub Uebergang
'End Sub
