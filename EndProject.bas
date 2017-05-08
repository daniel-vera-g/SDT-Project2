'Controller festlegen

$regfile = "attiny13.dat"

'Taktfrequenz festlegen

$crystal = 1200000

'Hardwarestuck festlegen

$hwstack = 2

'Declare Input & Output

Config Pinb.0 = Input
Config Portb.1 = Output
Config Portb.2 = Output
Config Portb.3 = Output
Config Portb.4 = Output

'Declare Sub-circuits

Declare Sub Eingabe
Declare Sub Aufruf
Declare Sub Fibo
Declare Sub Eins
Declare Sub Zwei
Declare Sub Drei
Declare Sub Fuenf
Declare Function Fibo(byval A As Integer) As Integer

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

'Fibo Function mit den Parametern A --> fibonacci Zahl zu berechnen

Function Fibo(byval A As Integer) As Integer
   If A = 1 Or A = 2 Then
   Return 1
   Else Then
   Return Fibo(a -2) + Fibo(a -1)
   End If
End Function



Sub Eins
Do
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

Rem Animation zum Übergang Sub-circuit

'Sub Uebergang
'End Sub






