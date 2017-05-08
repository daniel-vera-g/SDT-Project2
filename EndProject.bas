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



REM Controller festlegen

$regfile = "attiny13.dat"

REM Taktfrequenz festlegen

$crystal = 1200000

REM Hardwarestuck festlegen

$hwstack = 18
$swstack = 8

REM Declare Input & Output

Config Pinb.0 = Input
Config Portb.1 = Output
Config Portb.2 = Output
Config Portb.3 = Output
Config Portb.4 = Output

REM Declare Sub-circuits

Declare Sub Eingabe
Declare Sub Aufruf
Declare Sub Eins
Declare Sub Zwei
Declare Sub Drei
Declare Sub Fuenf
Declare Function Fibo(byval A As Integer) As Integer

REM Namen für einzelne Nummern geben

REM 'Zahl Eins
E Alias Portb.4
REM 'Zahl Zwei
Z Alias Portb.3
REM Zahl Vier
V Alias Portb.1

REM Sub-circuit für die Eingabe mit Taster

Sub Eingabe
   Do
   REM Anfrage an den taster
      If Pinb.0 = 1 Then Call Aufruf
      REM entprellen
      Waitms 50
   Loop
End Sub

REM sub-circuits für den Aufruf der fibbonacci funktion & einzelne Zahlen

Sub Aufruf
Dim A As Integer
Dim T As Integer
   For A = 0 To 6 Step 1
     T = Fibo(a)
     If T = 1 Then
        Call Eins
     Elseif T = 2 Then
        Call Zwei
     Elseif T = 3 Then
        Call Drei
     Elseif T = 3 Then
        Call Drei
     Elseif T = 5 Then
        Call Fuenf
     End If
   Next
End Sub

REM Fibo Function mit den Parametern A --> fibonacci Zahl zu berechnen

Function Fibo(byval A As Integer) As Integer
   Local Sum As Integer
   Dim Sum1 As Integer

   If A < 3 Then
      Fibo = 1
   Else
      Sum = A - 2
      Sum1 = A - 1
      Sum = Fibo(sum)
      Sum1 = Fibo(sum1)
      Sum1 = Sum + Sum1
   End If
End Function



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

                                          Rem Animation zum Uebergang Sub-circuit

                                                 

