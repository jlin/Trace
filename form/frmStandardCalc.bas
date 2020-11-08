VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} frmStandardCalc 
   Caption         =   "Field Sheets / Equipment Import / Standard Calc"
   ClientHeight    =   5430
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   12345
   OleObjectBlob   =   "frmStandardCalc.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "frmStandardCalc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub btnCancel_Click()
ImportSheetName = ""
Me.Hide
btnOkPressed = False
Unload Me
End Sub

Private Sub btnHelp_Click()
GotoWikiPage ("Standard-Calculations")
End Sub

Private Sub btnInsertIntoExisting_Click()
ImportSheetName = getSelectedOption
ImportAsTabs = True
Me.Hide
btnOkPressed = True
End Sub

Private Sub btnLoadStandardCalc_Click()
ImportSheetName = getSelectedOption
ImportAsTabs = False
Me.Hide
btnOkPressed = True
End Sub

Private Sub UserForm_Activate()
btnOkPressed = False
    With Me
    .Left = Application.Left + (0.5 * Application.Width) - (0.5 * .Width)
    .Top = Application.Top + (0.5 * Application.Height) - (0.5 * .Height)
    End With
End Sub

Function getSelectedOption()
Dim ctrl As MSForms.control
    For Each ctrl In Me.Controls
        If TypeName(ctrl) = "OptionButton" And ctrl.Value = True Then
        getSelectedOption = ctrl.Caption
        End If
    Next ctrl
End Function