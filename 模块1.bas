Attribute VB_Name = "ģ��1"
'����Դ,lianjie,��������
'���ڣ�2016-08-30,2017-07-13,2018-01-12,2018-01-22
'��Ȩ���У����𴫲������޸�

'�������ÿ۳��ֵ
Function FdfykceFz(sdxm As String, sdqjq As Date, sdqjz As Date, sre As Double, mssd As Double, hj As Double) As Double
    sdxm = VBA.LTrim(sdxm)
    If sdxm = "��������н��" Then
        If sdqjq >= #1/9/1980# And sdqjz <= #2/29/2008# And sdqjq <= sdqjz Then
            FdfykceFz = 1600
        ElseIf sdqjq >= #1/3/2008# And sdqjz <= #8/31/2011# And sdqjq <= sdqjz Then
            FdfykceFz = 2000
        ElseIf sdqjq >= #1/9/2011# And sdqjz <= #12/31/2050# And sdqjq <= sdqjz Then
            FdfykceFz = 3500
        End If
        ElseIf sdxm = "�⼮��Ա��������н��" Then
            If sdqjq >= #1/9/1980# And sdqjz <= #12/31/2005# And sdqjq <= sdqjz Then
                FdfykceFz = 4000
            ElseIf sdqjq >= #1/1/2006# And sdqjz <= #12/31/2050# And sdqjq <= sdqjz Then
                FdfykceFz = 4800
            Else
                FdfykceFz = 0
            End If
        ElseIf sdxm = "���񱨳�����" Or sdxm = "�������" Or sdxm = "����Ȩʹ�÷�����" Or sdxm = "�����Ʋ���������" Or sdxm = "���˷��ݳ�������" Then
            If (sre - mssd - hj) <= 4000 Then
                FdfykceFz = 800
            Else
                FdfykceFz = (sre - mssd - hj) * 0.2
            End If
    Else
        FdfykceFz = 0
    End If

End Function

'˰�ʸ�ֵ
Function SlFz(sdxm As String, sdqjq As Date, sdqjz As Date, ynssde As Double) As String
    sdxm = VBA.LTrim(sdxm)
    Dim ysJe As Double
    If sdxm = "��������н��" Or sdxm = "�⼮��Ա��������н��" Or sdxm = "ȫ��һ���Խ�������" Or sdxm = "�⼮��Ա���½���" Then
        If sdxm = "ȫ��һ���Խ�������" Or sdxm = "�⼮��Ա���½���" Then
            ysJe = ynssde / 12
        Else
            ysJe = ynssde
        End If
        
        If sdqjq >= #1/1/1980# And sdqjz <= #8/31/2011# Then
            If ysJe >= 0 And ysJe <= 500 Then
                SlFz = "0.05(0.00)"
            ElseIf ysJe > 500 And ysJe <= 2000 Then
                SlFz = "0.10(25.00)"
            ElseIf ysJe > 2000 And ysJe <= 5000 Then
                SlFz = "0.15(125.00)"
            ElseIf ysJe > 5000 And ysJe <= 20000 Then
                SlFz = "0.20(375.00)"
            ElseIf ysJe > 20000 And ysJe <= 40000 Then
                SlFz = "0.25(1,375.00)"
            ElseIf ysJe > 40000 And ysJe <= 60000 Then
                SlFz = "0.30(3,375.00)"
            ElseIf ysJe > 60000 And ysJe <= 80000 Then
                SlFz = "0.35(6,375.00)"
            ElseIf ysJe > 80000 And ysJe <= 100000 Then
                SlFz = "0.40(10,375.00)"
            ElseIf ysJe > 100000 Then
                SlFz = "0.45(15,375.00)"
            End If
        ElseIf sdqjq >= #9/1/2011# And sdqjz <= #12/31/2055# Then
            If ysJe >= 0 And ysJe <= 1500 Then
                SlFz = "0.03(0.00)"
            ElseIf ysJe > 1500 And ysJe <= 4500 Then
                SlFz = "0.10(105.00)"
            ElseIf ysJe > 4500 And ysJe <= 9000 Then
                SlFz = "0.20(555.00)"
            ElseIf ysJe > 9000 And ysJe <= 35000 Then
                SlFz = "0.25(1,005.00)"
            ElseIf ysJe > 35000 And ysJe <= 55000 Then
                SlFz = "0.30(2,755.00)"
            ElseIf ysJe > 55000 And ysJe <= 80000 Then
                SlFz = "0.35(5,505.00)"
            ElseIf ysJe > 80000 Then
                SlFz = "0.45(13,505.00)"
            End If
        End If
    ElseIf sdxm = "���񱨳�����" Then
        If ynssde >= 0 And ynssde <= 20000 Then
            SlFz = "0.20(0.00)"
        ElseIf ynssde > 20000 And ynssde <= 50000 Then
            SlFz = "0.30(2,000.00)"
        ElseIf ynssde > 50000 Then
            SlFz = "0.40(7,000.00)"
        End If
    ElseIf sdxm = "�������" Then
        SlFz = "0.20(�������)"
    ElseIf sdxm = "����Ȩʹ�÷�����" Then
        SlFz = "0.20(����Ȩʹ�÷�����)"
    ElseIf sdxm = "��Ϣ����Ϣ����������" And ynssde >= 0 Then
        SlFz = "0.20(������Ϣ����Ϣ����������)"
    ElseIf sdxm = "�����Ʋ�ת������" And ynssde >= 0 Then
        SlFz = "0.20(����ת������)"
    ElseIf sdxm = "���˷��ݳ�������" And ynssde >= 0 Then
        SlFz = "0.10(���˷��ݳ�������)"
    ElseIf sdxm = "żȻ����" And ynssde >= 0 Then
        SlFz = "0.20(żȻ����)"
    ElseIf sdxm = "��������" And ynssde >= 0 Then
        SlFz = "0.20(��������)"
    ElseIf sdxm = "���˷���ת������" And ynssde >= 0 Then
        SlFz = "0.20(����ת������)"
    ElseIf sdxm = "�����Ʋ���������" Then
        SlFz = "0.20(�����Ʋ���������)"
    ElseIf sdxm = "��Ȩת������" Or sdxm = "��Ʊת������" Or sdxm = "�Ʋ��������ü�����������������" Then
        SlFz = ""
    Else
        SlFz = ""
    End If
End Function


'�����ڼ�����ֵ
Function SdqjzFz(sdqjq As Date) As Date
    SdqjzFz = CDate(Year(sdqjq) & "-" & Month(sdqjq) & "-" & Day(DateSerial(Year(sdqjq), Month(sdqjq) + 1, 0)))
End Function



