object frmAddDetali: TfrmAddDetali
  Left = 207
  Top = 122
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1077#1093'. '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
  ClientHeight = 359
  ClientWidth = 215
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
    Width = 215
    Height = 359
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BevelWidth = 3
    BorderWidth = 1
    BorderStyle = bsSingle
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object gbElem: TGroupBox
      Left = 8
      Top = 8
      Width = 193
      Height = 153
      Caption = #1069#1083#1077#1084#1077#1085#1090':'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 87
        Height = 13
        Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1077#1077':'
      end
      object lTypeElem: TLabel
        Left = 8
        Top = 57
        Width = 22
        Height = 13
        Caption = #1058#1080#1087':'
        Transparent = True
      end
      object Label4: TLabel
        Left = 8
        Top = 74
        Width = 47
        Height = 13
        Caption = #1069#1083#1077#1084#1077#1085#1090':'
      end
      object cbElem: TDBLookupComboBox
        Left = 8
        Top = 88
        Width = 177
        Height = 19
        KeyField = 'ELEMENT_ID'
        ListField = 'NAME;'
        ListSource = DM.dsElements
        TabOrder = 2
      end
      object rbName: TRadioButton
        Left = 8
        Top = 112
        Width = 113
        Height = 17
        Caption = #1048#1084#1103' '#1101#1083#1077#1084#1077#1085#1090#1072
        Checked = True
        TabOrder = 3
        TabStop = True
        OnClick = rbNameClick
      end
      object rbNUMER: TRadioButton
        Left = 8
        Top = 128
        Width = 113
        Height = 17
        Caption = #1053#1086#1084#1077#1088' '#1101#1083#1077#1084#1077#1085#1090#1072
        TabOrder = 4
        OnClick = rbNUMERClick
      end
      object CBElem_type_name: TDBLookupComboBox
        Left = 36
        Top = 54
        Width = 149
        Height = 19
        Ctl3D = False
        KeyField = 'TYPE_ID'
        ListField = 'NAME'
        ListSource = DM.dsTyp
        ParentCtl3D = False
        TabOrder = 1
      end
      object cbComp: TDBLookupComboBox
        Left = 8
        Top = 32
        Width = 177
        Height = 19
        KeyField = 'COMPONENT_ID'
        ListField = 'NAME'
        ListSource = DM.dsComp
        TabOrder = 0
      end
    end
    object gbCharacter: TGroupBox
      Left = 8
      Top = 168
      Width = 193
      Height = 145
      Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072':'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object lblEdtType_name: TLabeledEdit
        Left = 8
        Top = 32
        Width = 177
        Height = 19
        EditLabel.Width = 22
        EditLabel.Height = 13
        EditLabel.Caption = #1058#1080#1087':'
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 0
      end
      object lblEdtResistance: TLabeledEdit
        Left = 8
        Top = 72
        Width = 113
        Height = 19
        EditLabel.Width = 106
        EditLabel.Height = 13
        EditLabel.Caption = #1057#1086#1087#1088#1072#1090#1080#1074#1083#1077#1085#1080#1077' ('#1054#1084'):'
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 1
      end
      object lbledtDopusk: TLabeledEdit
        Left = 8
        Top = 112
        Width = 105
        Height = 19
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = #1044#1086#1087#1091#1089#1082' (%):'
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 2
      end
      object lbledtTKS: TLabeledEdit
        Left = 126
        Top = 112
        Width = 60
        Height = 19
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = #1058#1050#1057':'
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 3
      end
    end
    object btnAdd: TBitBtn
      Left = 8
      Top = 320
      Width = 97
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = btnAddClick
    end
    object btnClose: TBitBtn
      Left = 128
      Top = 320
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 3
      OnClick = btnCloseClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000
        0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000FF
        0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF000000FFFFFFFF
        FFFFFFFFFFFFFFFF0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF0000FF0000FF0000FF000000FFFFFFFFFFFF0000000000FF0000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF00
        00000000000000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF00
        00FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF0000000000FF0000FF0000FF0000FF0000FF000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FF0000FF0000FFFF
        FFFFFFFFFF0000FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000
        00FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF0000FF0000FF000000FFFFFFFFFFFFFFFFFF0000FF
        0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
end
