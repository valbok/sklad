object frmAddRecords: TfrmAddRecords
  Left = 187
  Top = 132
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1060#1086#1088#1084#1072' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1077#1081
  ClientHeight = 358
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 358
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 0
    object PageControlMain: TPageControl
      Left = 4
      Top = 4
      Width = 504
      Height = 346
      ActivePage = TabInfo
      Align = alClient
      TabIndex = 3
      TabOrder = 0
      object tabComponents: TTabSheet
        Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1077
        object pnlComponents: TPanel
          Left = 0
          Top = 0
          Width = 496
          Height = 318
          Align = alClient
          BevelInner = bvSpace
          BevelOuter = bvLowered
          BorderWidth = 1
          TabOrder = 0
          object lNameComponent: TLabel
            Left = 50
            Top = 70
            Width = 25
            Height = 13
            Caption = #1048#1084#1103':'
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object editComponentName: TEdit
            Left = 80
            Top = 68
            Width = 225
            Height = 19
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
          end
          object btnAddComponent: TBitBtn
            Left = 310
            Top = 67
            Width = 91
            Height = 22
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            Default = True
            TabOrder = 1
            OnClick = btnAddComponentClick
          end
        end
      end
      object TabTypes: TTabSheet
        Caption = #1058#1080#1087#1099
        ImageIndex = 1
        OnShow = TabTypesShow
        object pnlTypes: TPanel
          Left = 0
          Top = 0
          Width = 496
          Height = 318
          Align = alClient
          BevelInner = bvSpace
          BevelOuter = bvLowered
          BorderWidth = 1
          TabOrder = 0
          OnClick = pnlTypesClick
          object Label12: TLabel
            Left = 90
            Top = 61
            Width = 25
            Height = 13
            Caption = #1048#1084#1103':'
          end
          object Label11: TLabel
            Left = 90
            Top = 88
            Width = 87
            Height = 13
            Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1077#1077':'
          end
          object edtTypeName: TEdit
            Left = 122
            Top = 58
            Width = 159
            Height = 19
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
          end
          object CBType_Comp: TDBLookupComboBox
            Left = 184
            Top = 85
            Width = 196
            Height = 19
            Ctl3D = False
            KeyField = 'NAME'
            ListField = 'NAME'
            ListSource = DM.dsComponents
            ParentCtl3D = False
            TabOrder = 1
            OnClick = CBType_CompClick
          end
          object btnAddType: TBitBtn
            Left = 285
            Top = 58
            Width = 94
            Height = 22
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            Default = True
            TabOrder = 2
            OnClick = btnAddTypeClick
          end
        end
      end
      object TabElements: TTabSheet
        Caption = #1069#1083#1077#1084#1077#1085#1090#1099
        ImageIndex = 2
        OnShow = TabElementsShow
        object pnlElements: TPanel
          Left = 0
          Top = 0
          Width = 496
          Height = 318
          Align = alClient
          BevelInner = bvSpace
          BevelOuter = bvLowered
          BorderWidth = 1
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object Label2: TLabel
            Left = 232
            Top = 8
            Width = 86
            Height = 13
            Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072':'
          end
          object btnAddElem: TBitBtn
            Left = 8
            Top = 136
            Width = 89
            Height = 25
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            Default = True
            TabOrder = 2
            OnClick = btnAddElemClick
          end
          object MemInfo: TMemo
            Left = 232
            Top = 24
            Width = 249
            Height = 105
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object gbElemNew: TGroupBox
            Left = 8
            Top = 8
            Width = 217
            Height = 121
            Caption = #1069#1083#1077#1084#1077#1085#1090':'
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
            object lNameElem: TLabel
              Left = 8
              Top = 15
              Width = 25
              Height = 13
              Caption = #1048#1084#1103':'
              Transparent = True
            end
            object lUnitElem: TLabel
              Left = 8
              Top = 39
              Width = 105
              Height = 13
              Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103':'
              Transparent = True
            end
            object lNumer: TLabel
              Left = 8
              Top = 64
              Width = 37
              Height = 13
              Caption = #1053#1086#1084#1077#1088':'
            end
            object lTypeElem: TLabel
              Left = 8
              Top = 91
              Width = 22
              Height = 13
              Caption = #1058#1080#1087':'
              Transparent = True
            end
            object EName: TEdit
              Left = 40
              Top = 15
              Width = 169
              Height = 19
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
            end
            object EUnit: TEdit
              Left = 128
              Top = 39
              Width = 81
              Height = 19
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
            end
            object Enumer: TEdit
              Left = 88
              Top = 64
              Width = 121
              Height = 19
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 2
            end
            object CBElem_type_name: TDBLookupComboBox
              Left = 45
              Top = 91
              Width = 165
              Height = 19
              Ctl3D = False
              KeyField = 'TYPE_ID'
              ListField = 'NAME'
              ListSource = DM.dsTypes
              ParentCtl3D = False
              TabOrder = 3
              OnClick = CBElem_type_nameClick
            end
          end
        end
      end
      object TabInfo: TTabSheet
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086#1073' '#1101#1083#1077#1084#1077#1085#1090#1077
        ImageIndex = 3
        OnShow = TabInfoShow
        object pnlInfo: TPanel
          Left = 0
          Top = 0
          Width = 496
          Height = 318
          Align = alClient
          BevelInner = bvSpace
          BevelOuter = bvLowered
          BorderWidth = 1
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          OnClick = pnlInfoClick
          object lFrom_Whom: TLabel
            Left = 208
            Top = 10
            Width = 166
            Height = 13
            Caption = #1054#1090' '#1082#1086#1075#1086' '#1087#1086#1083#1091#1095#1077#1085#1086' ('#1082#1086#1084#1091' '#1074#1099#1076#1072#1085#1086'):'
          end
          object lDate: TLabel
            Left = 208
            Top = 50
            Width = 29
            Height = 13
            Caption = #1044#1072#1090#1072':'
          end
          object lNum_doc: TLabel
            Left = 208
            Top = 74
            Width = 71
            Height = 13
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
          end
          object sbSrez: TSpeedButton
            Left = 216
            Top = 96
            Width = 145
            Height = 25
            Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1088#1077#1079' '#1086#1089#1090#1072#1090#1082#1072
            Flat = True
            OnClick = sbSrezClick
          end
          object gbArrivalCharge: TGroupBox
            Left = 8
            Top = 90
            Width = 193
            Height = 95
            Caption = #1055#1088#1080#1093#1086#1076'/'#1088#1072#1089#1093#1086#1076
            TabOrder = 1
            object lArrival: TLabel
              Left = 8
              Top = 18
              Width = 40
              Height = 13
              Caption = #1055#1088#1080#1093#1086#1076':'
              Transparent = True
            end
            object lCharge: TLabel
              Left = 8
              Top = 42
              Width = 39
              Height = 13
              Caption = #1056#1072#1089#1093#1086#1076':'
              Transparent = True
            end
            object Label7: TLabel
              Left = 9
              Top = 66
              Width = 88
              Height = 13
              Caption = #1062#1077#1085#1072' '#1079#1072' '#1077#1076#1080#1085#1080#1094#1091':'
            end
            object ECharge: TEdit
              Left = 56
              Top = 42
              Width = 129
              Height = 19
              TabOrder = 1
              Text = '0'
              OnExit = EChargeExit
            end
            object EArrival: TEdit
              Left = 56
              Top = 18
              Width = 129
              Height = 19
              TabOrder = 0
              Text = '0'
              OnExit = EArrivalExit
            end
            object ECost_For_One: TEdit
              Left = 104
              Top = 66
              Width = 81
              Height = 19
              TabOrder = 2
              Text = '0'
              OnExit = ECost_For_OneExit
            end
          end
          object EFrom_Whom: TEdit
            Left = 208
            Top = 26
            Width = 249
            Height = 19
            TabOrder = 2
          end
          object EDate: TEdit
            Left = 240
            Top = 50
            Width = 121
            Height = 19
            TabOrder = 3
            OnExit = EDateExit
          end
          object ENum_doc: TEdit
            Left = 280
            Top = 74
            Width = 81
            Height = 19
            TabOrder = 4
          end
          object btnAddInfo: TBitBtn
            Left = 378
            Top = 47
            Width = 78
            Height = 25
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            Default = True
            TabOrder = 5
            OnClick = btnAddInfoClick
          end
          object gbElem: TGroupBox
            Left = 8
            Top = 8
            Width = 193
            Height = 81
            Caption = #1069#1083#1077#1084#1077#1085#1090':'
            TabOrder = 0
            object cbElem: TDBLookupComboBox
              Left = 8
              Top = 16
              Width = 177
              Height = 19
              KeyField = 'ELEMENT_ID'
              ListField = 'NAME;'
              ListSource = DM.dsElements
              TabOrder = 0
              OnClick = cbElemClick
            end
            object rbName: TRadioButton
              Left = 8
              Top = 40
              Width = 113
              Height = 17
              Caption = #1048#1084#1103' '#1101#1083#1077#1084#1077#1085#1090#1072
              Checked = True
              TabOrder = 1
              TabStop = True
              OnClick = rbNameClick
            end
            object rbNUMER: TRadioButton
              Left = 8
              Top = 56
              Width = 113
              Height = 17
              Caption = #1053#1086#1084#1077#1088' '#1101#1083#1077#1084#1077#1085#1090#1072
              TabOrder = 2
              OnClick = rbNUMERClick
            end
          end
          object GroupBox1: TGroupBox
            Left = 8
            Top = 192
            Width = 249
            Height = 121
            Caption = #1057#1089#1099#1083#1082#1072':'
            TabOrder = 6
            object Label1: TLabel
              Left = 8
              Top = 40
              Width = 84
              Height = 13
              Caption = #1048#1085#1092'-'#1103' '#1086' '#1089#1089#1099#1083#1082#1077':'
            end
            object btnAddLink: TBitBtn
              Left = 148
              Top = 16
              Width = 99
              Height = 20
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1089#1099#1083#1082#1091
              Default = True
              TabOrder = 2
              OnClick = btnAddLinkClick
            end
            object ELink: TEdit
              Left = 8
              Top = 17
              Width = 137
              Height = 19
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
            end
            object memLinkInfo: TMemo
              Left = 8
              Top = 56
              Width = 233
              Height = 57
              ScrollBars = ssVertical
              TabOrder = 1
            end
          end
        end
      end
    end
    object btnClose: TBitBtn
      Left = 432
      Top = 5
      Width = 75
      Height = 20
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
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
