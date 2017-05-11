'( No worries. This is a block comment ;D

   Endproject.bas

   Created At : 08.05.2017

   Display The Numbers From Fibonacii On A Dice.
   Beware! These Numbers Are Limited!

   The Program Itself Should Work Now Fine. But There Is A Risk , That The Soft -
   or Hardwarestack may not be suitable for this type of program. The Program
   Itself Has To Make Some Recursive Calls. These Calls Have To Be Left On The
   Stack. There Is A Possibility Of "overgrowing the stack".

')



'Controller festlegen

$regfile = "attiny13.dat"

'Taktfrequenz festlegen

$crystal = 1200000

'Hardwarestuck festlegen

$hwstack = 10
$swstack = 18

'Declare Input & Output

Config Pinb.0 = Input
Config Portb.1 = Output
Config Portb.2 = Output
Config Portb.3 = Output
Config Portb.4 = Output

'Declare Sub-circuits

Declare Sub Eingabe
Declare Sub Clearled
Declare Sub Aufruf
Declare Sub Eins
Declare Sub Zwei
Declare Sub Drei
Declare Sub Fuenf
Declare Function Fibo(byval A As Byte) As Byte

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
      If Pinb.0 = 1 Then
         Call Aufruf
         Waitms 50
      End If
      'entprellen

   Loop
End Sub

'sub-circuits für den Aufruf der fibbonacci funktion & einzelne Zahlen

Sub Aufruf
Dim A As Byte
Dim T As Byte
   For A = 1 To 3 Step 1

     T = Fibo(a)
     Waitms 1500
     Call Clearled
     Waitms 500

     If T = 1 Then
        Call Eins
     Elseif T = 2 Then
        Call Zwei
     Elseif T = 3 Then
        Call Drei
     Elseif T = 5 Then
        Call Fuenf
     End If
   Next
End Sub

'Fibo Function mit den Parametern A --> fibonacci Zahl zu berechnen

Function Fibo(byval A As Byte) As Byte
   Local Sum As Byte
   Dim Sum1 As Byte

   If A < 3 Then
      Fibo = 1
   Else
      Sum = A - 2
      Sum1 = A - 1
      Sum = Fibo(sum)
      Sum1 = Fibo(sum1)
      Sum1 = Sum + Sum1
      Fibo = Sum1
   End If
End Function



Sub Clearled
   Portb.1 = 0
   Portb.2 = 0
   Portb.3 = 0
   Portb.4 = 0
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
   Set V
End Sub

' Animation zum Uebergang Sub-circuit

'Sub Uebergang
'End Sub