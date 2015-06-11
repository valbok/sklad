object frmFindRecords: TfrmFindRecords
  Left = 192
  Top = 127
  Width = 367
  Height = 276
  Caption = #1055#1086#1080#1089#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 359
    Height = 249
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvSpace
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 13
      Caption = #1047#1085#1072#1095#1077#1085#1080#1077':'
    end
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 53
      Height = 13
      Caption = #1043#1076#1077' '#1080#1097#1077#1084':'
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 86
      Height = 13
      Caption = #1055#1086' '#1082#1072#1082#1086#1084#1091' '#1087#1086#1083#1102':'
    end
    object EditZnachenie: TEdit
      Left = 64
      Top = 8
      Width = 185
      Height = 21
      Hint = 
        #1047#1085#1072#1082' '#1087#1088#1086#1094#1077#1085#1090#1086#1074' <%> - '#1086#1079#1085#1072#1095#1072#1077#1090' '#1083#1102#1073#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1080#1084#1074#1086#1083#1086#1074' ('#1085#1072#1087#1088#1080#1084#1077 +
        #1088': '#1044#1080#1086'%). '#1047#1085#1072#1082' '#1087#1086#1076#1095#1105#1088#1082#1080#1074#1072#1085#1080#1103' <_> -'#1086#1079#1085#1072#1095#1072#1077#1090' '#1086#1076#1080#1085' '#1089#1080#1084#1074#1086#1083' ('#1085#1072#1087#1088'. '#1044'_' +
        #1086#1076#1099') '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object CBTableName: TComboBox
      Left = 64
      Top = 32
      Width = 185
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = CBTableNameChange
      Items.Strings = (
        #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1077
        #1058#1080#1087#1099
        #1069#1083#1077#1084#1077#1085#1090#1099
        #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086#1073' '#1101#1083#1077#1084#1077#1085#1090#1077)
    end
    object CBFieldName: TComboBox
      Left = 104
      Top = 56
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = CBFieldNameChange
    end
    object btnFind: TBitBtn
      Left = 168
      Top = 80
      Width = 81
      Height = 25
      Caption = #1053#1072#1095#1072#1090#1100
      Default = True
      TabOrder = 3
    end
    object btnClose: TBitBtn
      Left = 264
      Top = 80
      Width = 81
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 4
    end
  end
end
