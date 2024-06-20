VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} frmRoomLossRT 
   Caption         =   "Room Loss (RT)"
   ClientHeight    =   4815
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   7260
   OleObjectBlob   =   "frmRoomLossRT.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "frmRoomLossRT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public V As Double

Private Sub btnHelp_Click()
GotoWikiPage ("Noise-Functions#rt-method")
End Sub

'Private Sub optClassic_Click()
'Me.cBoxRT.Enabled = False
'Me.lblReverbTime.Enabled = False
'Me.cBoxRoomType.Enabled = True
'Me.lblRoomAbsorption.Enabled = True
'End Sub

'Private Sub optRoomConstant_Click()
'Me.cBoxRT.Enabled = False
'Me.lblReverbTime.Enabled = False
'Me.cBoxRoomType.Enabled = False
'Me.lblRoomAbsorption.Enabled = False
'End Sub

'Private Sub optRT_Click()
'Me.cBoxRT.Enabled = True
'Me.lblReverbTime.Enabled = True
'Me.cBoxRoomType.Enabled = False
'Me.lblRoomAbsorption.Enabled = False
'End Sub

Private Sub cBoxRT_Change()
PreviewValues
End Sub

Private Sub UserForm_Activate()
btnOkPressed = False
    With Me
    .Left = Application.Left + (0.5 * Application.width) - (0.5 * .width)
    .Top = Application.Top + (0.5 * Application.Height) - (0.5 * .Height)
    End With
build_cBox
PreviewValues
End Sub


Private Sub btnCancel_Click()
btnOkPressed = False
Me.Hide
End Sub

Private Sub btnOK_Click()
btnOkPressed = True

'    If Me.optClassic.Value = True Then
'    roomLossType = "Classic" 'public variable
'    ElseIf Me.optRT.Value = True Then
'    roomLossType = "RT"
'    End If

PreviewValues
RoomType = Me.cBoxRT.text
roomL = CDbl(Me.txtL.Value)
roomW = CDbl(Me.txtW.Value)
roomH = CDbl(Me.txtH.Value)
Me.Hide
End Sub

Private Sub txtH_Change()
PreviewValues
End Sub

Private Sub txtL_Change()
PreviewValues
End Sub

Private Sub txtW_Change()
PreviewValues
End Sub

Sub build_cBox()
    
    If Me.cBoxRT.ListCount = 0 Then
    Me.cBoxRT.AddItem ("<0.2 sec")
    Me.cBoxRT.AddItem ("0.2 to 0.5 sec")
    Me.cBoxRT.AddItem ("0.5 to 1 sec")
    Me.cBoxRT.AddItem ("1 to 1.5 sec")
    Me.cBoxRT.AddItem ("1.5 to 2 sec")
    Me.cBoxRT.AddItem (">2 sec")
    End If
    
End Sub

Sub PrePopulateForm()
Me.txtL.text = roomL
Me.txtW.text = roomW
Me.txtH.text = roomH
Me.cBoxRT.text = RoomType
End Sub

Private Sub PreviewValues()

Dim V As Double
Dim L As Double
Dim W As Double
Dim H As Double
Dim S_total As Double
Dim alphaValues() As Variant

On Error GoTo errorCatch

'alphas
alphaValues = RoomAlphaRTcurves(Me.cBoxRT.Value)
Me.txt31.Value = alphaValues(0)
Me.txt63.Value = alphaValues(1)
Me.txt125.Value = alphaValues(2)
Me.txt250.Value = alphaValues(3)
Me.txt500.Value = alphaValues(4)
Me.txt1k.Value = alphaValues(5)
Me.txt2k.Value = alphaValues(6)
Me.txt4k.Value = alphaValues(7)
Me.txt8k.Value = alphaValues(8)

L = CDbl(Me.txtL.Value)
W = CDbl(Me.txtW.Value)
H = CDbl(Me.txtH.Value)
'volume
V = L * W * H
Me.txtV.Value = Round(V, 1)
'surface area
S_total = (L * W * 2) + (L * H * 2) + (W * H * 2)
Me.txtStotal = Round(S_total, 1)

'Room Loss
Me.txtSA31.Value = Round(RoomLossTypicalRT("31.5", L, W, H, Me.cBoxRT.Value), 1)
Me.txtSA63.Value = Round(RoomLossTypicalRT("63", L, W, H, Me.cBoxRT.Value), 1)
Me.txtSA125.Value = Round(RoomLossTypicalRT("125", L, W, H, Me.cBoxRT.Value), 1)
Me.txtSA250.Value = Round(RoomLossTypicalRT("250", L, W, H, Me.cBoxRT.Value), 1)
Me.txtSA500.Value = Round(RoomLossTypicalRT("500", L, W, H, Me.cBoxRT.Value), 1)
Me.txtSA1k.Value = Round(RoomLossTypicalRT("1k", L, W, H, Me.cBoxRT.Value), 1)
Me.txtSA2k.Value = Round(RoomLossTypicalRT("2k", L, W, H, Me.cBoxRT.Value), 1)
Me.txtSA4k.Value = Round(RoomLossTypicalRT("4k", L, W, H, Me.cBoxRT.Value), 1)
Me.txtSA8k.Value = Round(RoomLossTypicalRT("8k", L, W, H, Me.cBoxRT.Value), 1)

errorCatch:
End Sub
