Attribute VB_Name = "ģ��2"
'ljffytax
'2017-09-18
'2017-10-08
'2017-10-17

Public ValCodeArr
Public Wi
Sub test()
    res = smartTrim()
End Sub
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
    With ThisWorkbook.Worksheets("�۽ɸ�������˰�����")
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
'�������Ƿ����Ҫ��
Sub Check()
    Dim res As Integer
    Dim c As Integer
    Dim dateq As String '������
    Dim y As String
    MAX_ROWS = 1000
    
    
    '������ṹ�Ƿ��ƻ�
    If (ThisWorkbook.Worksheets.Count <> 6) Then
        res = MsgBox("�벻Ҫ�����������Ľṹ����Ҫ��ӡ�ɾ������Ĺ���������֣�", vbCritical, "���ִ���")
        Exit Sub
    End If
    If (ThisWorkbook.Sheets(1).Name <> "�۽ɸ�������˰�����") Then
        res = MsgBox("�벻Ҫ�����������Ľṹ����Ҫ��ӡ�ɾ������Ĺ���������֣�", vbCritical, "���ִ���")
        Exit Sub
    End If
    If (ThisWorkbook.Sheets(2).Name <> "������������������֣�") Then
        res = MsgBox("�벻Ҫ�����������Ľṹ����Ҫ��ӡ�ɾ������Ĺ���������֣�", vbCritical, "���ִ���")
        Exit Sub
    End If
    If (ThisWorkbook.Sheets(3).Name <> "����������˰��Э�����֣�") Then
        res = MsgBox("�벻Ҫ�����������Ľṹ����Ҫ��ӡ�ɾ������Ĺ���������֣�", vbCritical, "���ִ���")
        Exit Sub
    End If
    If (ThisWorkbook.Sheets(4).Name <> "��ҵ������ϸ��") Then
        res = MsgBox("�벻Ҫ�����������Ľṹ����Ҫ��ӡ�ɾ������Ĺ���������֣�", vbCritical, "���ִ���")
        Exit Sub
    End If
    If (ThisWorkbook.Sheets(5).Name <> "Sheet4") Then
        res = MsgBox("�벻Ҫ�����������Ľṹ����Ҫ��ӡ�ɾ������Ĺ���������֣�", vbCritical, "���ִ���")
        Exit Sub
    End If
    If (ThisWorkbook.Sheets(6).Name <> "Sheet5") Then
        res = MsgBox("�벻Ҫ�����������Ľṹ����Ҫ��ӡ�ɾ������Ĺ���������֣�", vbCritical, "���ִ���")
        Exit Sub
    End If
    If (ThisWorkbook.Sheets(1).Cells(6, 32) <> "��ע") Then
        res = MsgBox("�벻Ҫ�Ա�������ӻ�ɾ���в�����", vbCritical, "���ִ���")
        Exit Sub
    End If
    
    '���������Ƿ���ȷ
    With ThisWorkbook.Worksheets("�۽ɸ�������˰�����")
        dateq = .Cells(11, 7)
        For c = 12 To MAX_ROWS
            If .Cells(c, 7) = "" Then
                Exit For
            End If
            If .Cells(c, 7) <> dateq Then
                res = MsgBox("ÿһ��ģ���ļ�ֻ����дһ���£���Ҫ������·ݵ���������һ��ģ���ڣ�", vbCritical, "���ִ���")
                Exit Sub
            End If
        Next
    End With
    
    '�����Ƿ���δ���������Ŀ�Ƿ���ȷ
    If (ThisWorkbook.Sheets(1).Cells(3, 4) = "") Then
        res = MsgBox("����д��˰��ʶ��ţ�", vbCritical, "���ִ���")
        Exit Sub
    End If
    If (ThisWorkbook.Sheets(1).Cells(3, 7) = "") Then
        res = MsgBox("����д��˰�����ƣ�", vbCritical, "���ִ���")
        Exit Sub
    End If
    If (ThisWorkbook.Sheets(1).Cells(3, 31) = "") Then
        res = MsgBox("����д������������", vbCritical, "���ִ���")
        Exit Sub
    End If
    If (ThisWorkbook.Sheets(1).Cells(11, 3) = "") Then
        res = MsgBox("����дҪ�걨Ա����������", vbCritical, "���ִ���")
        Exit Sub
    End If
    If (ThisWorkbook.Sheets(1).Cells(11, 5) = "") Then
        res = MsgBox("����дҪ�걨Ա����֤�����룬��д���ǵõ��(���֤У��)��", vbCritical, "���ִ���")
        Exit Sub
    End If
    If (ThisWorkbook.Sheets(1).Cells(11, 9) = "") Then
        res = MsgBox("�걨���û����д��������㣬����д0��", vbCritical, "���ִ���")
        Exit Sub
    End If
    If (ThisWorkbook.Sheets(1).Cells(11, 2) = "") Then
        res = MsgBox("��ѡ���Ƿ���ϸ�걨��һ��Ӧѡ(��)��", vbCritical, "���ִ���")
        Exit Sub
    End If
    With ThisWorkbook.Worksheets("�۽ɸ�������˰�����")
        For c = 11 To MAX_ROWS
            If .Cells(c, 2) = "" Then
                Exit For
            End If
            If .Cells(c, 2) <> "��" Then
                res = MsgBox("�Ƿ���ϸ�걨��һ��ѡ(��)�������������Լ�ѡ(��)��Ŀ�ģ�", vbCritical, "ע�⣡")
                Exit For
            End If
        Next
    End With
    
    With ThisWorkbook.Worksheets("�۽ɸ�������˰�����")
        If isGoodType(.Cells(11, 4), "sfzj") Then
            tmp = .Cells(11, 4)
        Else
            res = MsgBox("(���֤������)һ�У�Ӧ���������б���ѡ�񣬽�ֹ�Լ���д��", vbCritical, "����")
            Exit Sub
        End If
        For c = 12 To MAX_ROWS
            If .Cells(c, 4) = "" Then
                Exit For
            End If
            If .Cells(c, 4) <> tmp Then
                If isGoodType(.Cells(c, 4), "sfzj") Then
                    tmp = .Cells(c, 4)
                Else
                    res = MsgBox("(���֤������)һ�У�Ӧ���������б���ѡ�񣬽�ֹ�Լ���д��", vbCritical, "����")
                    Exit Sub
                End If
            End If
        Next
    End With
    
    With ThisWorkbook.Worksheets("�۽ɸ�������˰�����")
        If isGoodType(.Cells(11, 6), "sdxm") Then
            tmp = .Cells(11, 6)
        Else
            If .Cells(11, 6) = "----����н������----" Then
                res = MsgBox("(������Ŀ)һ�У�������걨����Ӧ��ѡ(��������н��)��", vbCritical, "����")
            ElseIf .Cells(11, 6) = "----�Ʋ�ת������----" Then
                res = MsgBox("(������Ŀ)һ�У�----�Ʋ�ת������----������ȷ��ƷĿ��", vbCritical, "����")
            ElseIf .Cells(11, 6) = "----�Ʋ���������----" Then
                res = MsgBox("(������Ŀ)һ�У�----�Ʋ���������----������ȷ��ƷĿ��", vbCritical, "����")
            Else
                res = MsgBox("(������Ŀ)һ�У�Ӧ���������б���ѡ�񣬽�ֹ�Լ���д��", vbCritical, "����")
            End If
            Exit Sub
        End If
        For c = 12 To MAX_ROWS
            If .Cells(c, 6) = "" Then
                Exit For
            End If
            If .Cells(c, 6) <> tmp Then
                If isGoodType(.Cells(c, 6), "sdxm") Then
                    tmp = .Cells(c, 6)
                Else
                    If .Cells(c, 6) = "----����н������----" Then
                        res = MsgBox("(������Ŀ)һ�У�����Ӧ��ѡ(��������н��)��", vbCritical, "����")
                    ElseIf .Cells(c, 6) = "----�Ʋ�ת������----" Then
                        res = MsgBox("(������Ŀ)һ�У�----�Ʋ�ת������----������ȷ��ƷĿ��", vbCritical, "����")
                    ElseIf .Cells(c, 6) = "----�Ʋ���������----" Then
                        res = MsgBox("(������Ŀ)һ�У�----�Ʋ���������----������ȷ��ƷĿ��", vbCritical, "����")
                    Else
                        res = MsgBox("(������Ŀ)һ�У�Ӧ���������б���ѡ�񣬽�ֹ�Լ���д��", vbCritical, "����")
                    End If
                    Exit Sub
                End If
            End If
        Next
    End With
    If Not smartTrim Then
        Exit Sub
    End If
    res = MsgBox("У����ɣ�û���ִ���,Good Luck��", vbOKOnly, "��ϲ��")
End Sub
Function smartTrim() As Boolean
'���ݡ������������Զ��޼����Զ�ȥ�������ж������

    Dim iLastRow As Long
    Dim xmRow As Long '�����е����һ��
    Dim x As Long
    Dim rg As String
    For i = 2 To 9
        x = ActiveSheet.Cells(65536, i).End(xlUp).Row
        If i = 3 Then
            xmRow = x
        End If
        If x > iLastRow And i <> 8 Then '��8���й�ʽ
            iLastRow = x
        End If
    Next
    For i = 11 To xmRow
        If (LTrim(ActiveSheet.Cells(i, 3)) = "") Then
            res = MsgBox("����(����)���пո�û���֣�����ã�", vbCritical, "����")
            smartTrim = False
            Exit Function
        End If
    Next
    If iLastRow - xmRow > 0 Then
        res = MsgBox("���ֶ�����У�ϵͳ��Ϊ���Զ��޼���", vbOKOnly, "��ʾ��")
        rg = "B" & CStr(xmRow + 1) & ":G" & CStr(iLastRow)
        ThisWorkbook.Sheets(1).Range(rg).ClearContents
        rg = "I" & CStr(xmRow + 1) & ":I" & CStr(iLastRow)
        ThisWorkbook.Sheets(1).Range(rg).ClearContents
    End If
    smartTrim = True
End Function

Function isGoodType(s As String, t As String) As Boolean
    'Dim sfzjlx As String '���֤������
    'Dim sdxmlx As String '������Ŀ����

    sfzjlx = Array( _
    "201|�������֤", _
    "210|�۰ľ��������ڵ�ͨ��֤", _
    "208|�������", _
    "213|̨�����������½ͨ��֤", _
    "219|��������Ծ������֤", _
    "227|�й�����", _
    "202|����֤", _
    "203|�侯����֤", _
    "204|ʿ��֤", _
    "216|�⽻��֤", _
    "220|̨�����֤", _
    "221|�����ر������������Ծ������֤", _
    "233|��������þ������֤����������þ���֤��" _
    )

    sdxmlx = Array( _
    "    ��������н��", _
    "    �⼮��Ա��������н��", _
    "    ȫ��һ���Խ�������", _
    "���񱨳�����", _
    "��Ϣ����Ϣ����������", _
    "    �⼮��Ա���½���", _
    "    ����һ���Բ�����", _
    "    ����Ͷ���ͬһ���Բ�����", _
    "    ���˹�Ʊ��Ȩ��Ȩ����", _
    "    ��ǰ����һ���Բ���", _
    "    ��ҵ���", _
    "    �����Ʋ�ת������", _
    "    ��Ȩת������", _
    "    ���˷���ת������", _
    "    ��Ʊת������", _
    "    �Ʋ��������ü�����������������", _
    "    ���˷��ݳ�������", _
    "    �����Ʋ���������", _
    "�������", _
    "����Ȩʹ�÷�����", _
    "żȻ����", _
    "��������" _
    )
    
    If t = "sfzj" Then
        For i = 0 To 12
            If s = sfzjlx(i) Then
                isGoodType = True
                Exit Function
            End If
        Next
    ElseIf t = "sdxm" Then
        For i = 0 To 21
            If s = sdxmlx(i) Then
                isGoodType = True
                Exit Function
            End If
        Next
    End If
    isGoodType = False
End Function


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
