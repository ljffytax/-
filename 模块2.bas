Attribute VB_Name = "ģ��2"
'ljffytax
'2017-09-18

Public ValCodeArr
Public Wi

Sub Sfzhmxy()
    Dim res As Integer
    Dim dlg As String
    Dim sfzh As String
    Dim err As Integer
    Dim sfzhcd As Integer '���֤�ų���
    MAX_ROWS = 1000
    Dim dlg1 As String
    'Dim ValCodeArr As Integer
    ValCodeArr = Array("1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2")
    Wi = Array("7", "9", "10", "5", "8", "4", "2", "1", "6", "3", "7", "9", "10", "5", "8", "4", "2")
    err = 0
    With ThisWorkbook.Worksheets("�۽ɸ�������˰�����") '.Range("D11:E" & MAX_ROWS)
        For c = 11 To MAX_ROWS
            sfzh = .Cells(c, 5)
            If sfzh = "" Then
                Exit For
            End If
            If .Cells(c, 4) = "201|�������֤" Then
            'У�����֤��
                If xysfzh(sfzh) Then
                    err = 0 + err
                Else
                    err = 1 + err
                    dlg1 = dlg1 & c & ";"
                End If
            End If
        Next
    End With
    If err = 0 Then
        res = MsgBox("У����ɣ�û�д���!", vbOKOnly)
    Else
        dlg = "����" & err & "������!��" & dlg1 & "��"
        res = MsgBox(dlg, vbOKOnly)
    End If
        
End Sub

Function getArray(s As String)
    Dim tmpArray(17) As Integer
    Dim ts As String
    
    ts = Left(s, 17)
    If IsNumeric(ts) Then
        For i = 1 To 17
            tmpArray(i) = Mid(s, i, 1)
        Next
    Else
        tmpArray(1) = 0
    End If
    getArray = tmpArray
End Function

Function xysfzh(sfz As String) As Boolean
    Dim cd As Integer '���֤�ų���
    Dim xyw As String 'У��λ
    Dim sfzhArray() As Integer
    Dim TotalmulAiWi As Integer
    
    cd = Len(sfz)
    If cd = 15 And IsNumeric(sfz) Then
        xysfzh = True '���֤�Ŷ�
    Else
        If cd = 18 Then
           sfzhArray = getArray(sfz)
           If sfzhArray(1) = 0 Then
               xysfzh = False '���֤�Ŵ�
           Else
               TotalmulAiWi = 0
               For i = 1 To 17
                   TotalmulAiWi = sfzhArray(i) * Wi(i - 1) + TotalmulAiWi
               Next
               xyw = ValCodeArr(TotalmulAiWi Mod 11)
               If xyw = Right(sfz, 1) Then
                   xysfzh = True '���֤�Ŷ�
               Else
                   xysfzh = False '���֤�Ŵ�
               End If
           End If
        Else
           xysfzh = False '���֤�Ŵ�
        End If
    End If
End Function
