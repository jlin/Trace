VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} frmLoadTemplate 
   Caption         =   "Insert Blank Calculation Sheet"
   ClientHeight    =   2580
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   7875
   OleObjectBlob   =   "frmLoadTemplate.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "frmLoadTemplate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub btnCancel_Click()
ImportSheetName = ""
Me.Hide
Unload Me
End Sub

Private Sub btnLoadTemplate_Click()
ImportSheetName = cBoxSelectTemplate.text
Me.Hide
Unload Me
End Sub

Private Sub cBoxSelectTemplate_Change()
tBoxDescription.text = Description(cBoxSelectTemplate.ListIndex + 1)
End Sub

Private Sub UserForm_Activate()
btnOkPressed = False
    With Me
    .Left = Application.Left + (0.5 * Application.width) - (0.5 * .width)
    .Top = Application.Top + (0.5 * Application.Height) - (0.5 * .Height)
    End With
'select first item
Me.cBoxSelectTemplate.ListIndex = 0
End Sub
