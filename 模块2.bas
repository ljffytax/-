Attribute VB_Name = "ģ��2"
'ljffytax
'2017-09-18,2017-10-08,2017-10-17,2017-10-19,2018-01-22

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
    If (ThisWorkbook.Worksheets.count <> 6) Then
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
    If (ThisWorkbook.Sheets(1).Cells(6, 33) <> "��ע") Then
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
        For c = 11 To ActiveSheet.Cells(65536, 4).End(xlUp).Row '��������Ϊ��׼
            If .Cells(c, 2) = "" Then
                .Cells(c, 2) = "��"
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

Function autoWidth()
    Dim i As Integer
    Dim n As Integer
    
    Range("A11:AG5000").Font.Name = "����"
    Range("A11:AG5000").Font.Size = 9
    With Sheets(1)
        '�Է������п��Ӳ�������ϴ���
        '9��������ַ�Լ1.521���һ����
        '�������������ʾʱ��ӡ������һ������ȫ��ʾ���������������Ѿ��ʵ�������һЩ
        .Cells(11, 1).ColumnWidth = 1.521
        .Cells(11, 2).ColumnWidth = 1.521
        .Cells(11, 3).ColumnWidth = 1.521 * 4
        .Cells(11, 4).ColumnWidth = 1.521 * 8
        .Cells(11, 5).ColumnWidth = 1.521 * 10
        .Cells(11, 6).ColumnWidth = 1.521 * 10
        .Cells(11, 7).ColumnWidth = 1.521 * 6
        .Cells(11, 8).ColumnWidth = 1.521 * 6
        .Cells(11, 25).ColumnWidth = 1.521 * 9
        .Cells(11, 26).ColumnWidth = 1.521 * 5
        .Cells(11, 28).ColumnWidth = 1.521 * 2
        .Cells(11, 33).ColumnWidth = 1.521 * 2
        For i = 1 To 33
            If IsNumeric(.Cells(10, i).Value) Then
                .Cells(10, i).ColumnWidth = FormatLenth(.Cells(10, i).Value) * 0.88 + 0.7 '�ӿ�һ����λ����������ʾ
            End If
        Next i
    End With
End Function

'��ȡ��ʽ�������ֵĳ��� �� 12345.1 ��ʽ���� 12,345.10 �ĳ���
Function FormatLenth(num As Double) As Integer
    Dim num_arr
    Dim n As Integer
    Dim count As Integer
    
    num_arr = Split(CStr(num), ".")
    count = (UBound(num_arr) - LBound(num_arr) + 1)
    n = Len(CStr(num_arr(0)))
    If n Mod 3 = 0 Then
        n = n + Int(n / 3) - 1
    Else
        n = n + Int(n / 3)
    End If
    FormatLenth = n + 3
End Function

Sub Print2A4Size()
    Dim lastRow As Integer
    Dim printArea As String
    Dim res As String
    
    lastRow = ActiveSheet.Cells(65536, 3).End(xlUp).Row
    If lastRow < 11 Then
        res = MsgBox("û����Ч�������޷���ӡ��", vbOKOnly)
        Exit Sub
    End If
    res = autoWidth()
    printArea = "A1:AG" + CStr(lastRow)
    ActiveSheet.PageSetup.printArea = printArea
    With ActiveSheet.PageSetup
        .LeftMargin = Application.InchesToPoints(0.354) '���ñ߾�Ϊ0.354Ӣ�� sad..
        .RightMargin = Application.InchesToPoints(0.354)
        .TopMargin = Application.InchesToPoints(0.393)
        .BottomMargin = Application.InchesToPoints(0.393)
        '.HeaderMargin = Application.InchesToPoints(0)
        '.FooterMargin = Application.InchesToPoints(0)
        .PrintHeadings = False
        .PrintGridlines = False
        '.PrintComments = xlPrintNoComments
        .PrintQuality = 600
        .CenterHorizontally = False
        .CenterVertically = False
        '.Orientation = xlLandscape
        '.Draft = False
        .PaperSize = xlPaperA4
        .FirstPageNumber = xlAutomatic
        .Order = xlDownThenOver
        .BlackAndWhite = False
        '.Zoom = False
        .FitToPagesWide = 1
        .FitToPagesTall = False
        .PrintErrors = xlPrintErrorsDisplayed
    End With
    ActiveWindow.SelectedSheets.PrintPreview
End Sub

Sub Resize()
    With Sheets(1)
        .Range("A:A").ColumnWidth = 6
        .Range("B:AG").ColumnWidth = 14
    End With
End Sub
