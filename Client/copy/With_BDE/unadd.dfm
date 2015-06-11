object frmAdd: TfrmAdd
  Left = 135
  Top = 102
  Width = 549
  Height = 481
  Caption = #1060#1086#1088#1084#1072' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1041#1044
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 433
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 539
      Height = 431
      ActivePage = TabSheet4
      Align = alClient
      TabIndex = 3
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1077
        object PanelComponentBottom: TPanel
          Left = 0
          Top = 336
          Width = 531
          Height = 67
          Align = alBottom
          BevelInner = bvLowered
          BorderWidth = 3
          BorderStyle = bsSingle
          Color = clSilver
          TabOrder = 0
          object lNameComponent: TLabel
            Left = 10
            Top = 14
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
          object btnAddComponent: TBitBtn
            Left = 270
            Top = 11
            Width = 91
            Height = 22
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            Default = True
            TabOrder = 1
            OnClick = btnAddComponentClick
          end
          object editComponentName: TEdit
            Left = 40
            Top = 12
            Width = 225
            Height = 21
            TabOrder = 0
          end
          object btnFindComponent: TBitBtn
            Left = 374
            Top = 11
            Width = 77
            Height = 22
            Caption = #1055#1086#1080#1089#1082
            TabOrder = 2
            OnClick = btnFindComponentClick
          end
          object NavigatorComponents: TDBNavigator
            Left = 5
            Top = 40
            Width = 517
            Height = 18
            DataSource = DM.dsComponents
            VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
            Align = alBottom
            Flat = True
            Ctl3D = True
            Hints.Strings = (
              #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
              #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1079#1080#1087#1080#1089#1080
              #1054#1090#1084#1077#1085#1072
              #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
        end
        object PanelComponent: TPanel
          Left = 0
          Top = 0
          Width = 531
          Height = 336
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BevelWidth = 2
          BorderWidth = 2
          TabOrder = 1
          object GridComponent: TDBGrid
            Left = 6
            Top = 6
            Width = 519
            Height = 324
            Align = alClient
            DataSource = DM.dsComponents
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = GridComponentTitleClick
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1058#1080#1087#1099
        ImageIndex = 1
        object PanelType: TPanel
          Left = 0
          Top = 0
          Width = 531
          Height = 296
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BevelWidth = 2
          BorderWidth = 2
          TabOrder = 0
          object GridTypes: TDBGrid
            Left = 6
            Top = 6
            Width = 519
            Height = 284
            Align = alClient
            DataSource = DM.dsTypes
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = GridTypesTitleClick
          end
        end
        object PanelTypesBottom: TPanel
          Left = 0
          Top = 296
          Width = 531
          Height = 107
          Align = alBottom
          BevelInner = bvLowered
          BorderWidth = 3
          BorderStyle = bsSingle
          Color = clSilver
          TabOrder = 1
          object Label1: TLabel
            Left = 5
            Top = 5
            Width = 5
            Height = 75
            Align = alLeft
            AutoSize = False
            Color = clGray
            ParentColor = False
            Transparent = True
          end
          object Label2: TLabel
            Left = 519
            Top = 5
            Width = 3
            Height = 75
            Align = alRight
          end
          object Label3: TLabel
            Left = 514
            Top = 5
            Width = 5
            Height = 75
            Align = alRight
            AutoSize = False
            Transparent = True
          end
          object gbAddType: TGroupBox
            Left = 10
            Top = 5
            Width = 504
            Height = 75
            Align = alClient
            Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1090#1080#1087#1072
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 0
            object Label11: TLabel
              Left = 10
              Top = 48
              Width = 87
              Height = 13
              Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1077#1077':'
            end
            object Label12: TLabel
              Left = 10
              Top = 21
              Width = 25
              Height = 13
              Caption = #1048#1084#1103':'
            end
            object edtTypeName: TEdit
              Left = 42
              Top = 18
              Width = 159
              Height = 21
              TabOrder = 0
            end
            object btnAddType: TBitBtn
              Left = 205
              Top = 18
              Width = 94
              Height = 22
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              Default = True
              TabOrder = 2
              OnClick = btnAddTypeClick
            end
            object btnFindType: TBitBtn
              Left = 304
              Top = 18
              Width = 129
              Height = 22
              Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1087#1086#1083#1102' "'#1048#1084#1103'"'
              TabOrder = 3
              OnClick = btnFindTypeClick
            end
            object CBType_Comp: TDBLookupComboBox
              Left = 104
              Top = 45
              Width = 196
              Height = 21
              KeyField = 'NAME'
              ListField = 'NAME'
              ListSource = DM.dsComponents
              TabOrder = 1
            end
          end
          object NavigatorTypes: TDBNavigator
            Left = 5
            Top = 80
            Width = 517
            Height = 18
            DataSource = DM.dsTypes
            VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
            Align = alBottom
            Flat = True
            Hints.Strings = (
              #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
              #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1079#1080#1087#1080#1089#1080
              #1054#1090#1084#1077#1085#1072
              #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #1069#1083#1077#1084#1077#1085#1090#1099
        ImageIndex = 2
        object panelElem: TPanel
          Left = 0
          Top = 0
          Width = 531
          Height = 252
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BevelWidth = 2
          BorderWidth = 2
          TabOrder = 0
          object DBGridElements: TDBGrid
            Left = 6
            Top = 6
            Width = 519
            Height = 240
            Align = alClient
            DataSource = DM.dsClientDSElem
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = DBGridElementsTitleClick
          end
        end
        object PanelElemBottom: TPanel
          Left = 0
          Top = 252
          Width = 531
          Height = 151
          Align = alBottom
          BevelInner = bvLowered
          BorderWidth = 3
          BorderStyle = bsSingle
          Color = clSilver
          TabOrder = 1
          object Label5: TLabel
            Left = 517
            Top = 5
            Width = 5
            Height = 114
            Align = alRight
            AutoSize = False
          end
          object Label6: TLabel
            Left = 5
            Top = 5
            Width = 5
            Height = 114
            Align = alLeft
            AutoSize = False
          end
          object Label8: TLabel
            Left = 5
            Top = 119
            Width = 517
            Height = 5
            Align = alBottom
            AutoSize = False
          end
          object GbAddElem: TGroupBox
            Left = 10
            Top = 5
            Width = 507
            Height = 114
            Align = alClient
            Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1101#1083#1077#1084#1077#1085#1090#1072':'
            TabOrder = 0
            object lNameElem: TLabel
              Left = 11
              Top = 15
              Width = 25
              Height = 13
              Caption = #1048#1084#1103':'
              Transparent = True
            end
            object lTypeElem: TLabel
              Left = 208
              Top = 15
              Width = 22
              Height = 13
              Caption = #1058#1080#1087':'
              Transparent = True
            end
            object lUnitElem: TLabel
              Left = 11
              Top = 39
              Width = 105
              Height = 13
              Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103':'
              Transparent = True
            end
            object EName: TEdit
              Left = 43
              Top = 15
              Width = 158
              Height = 21
              TabOrder = 0
            end
            object EUnit: TEdit
              Left = 120
              Top = 39
              Width = 81
              Height = 21
              TabOrder = 1
            end
            object btnAddElem: TBitBtn
              Left = 238
              Top = 38
              Width = 88
              Height = 25
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              Default = True
              TabOrder = 3
              OnClick = btnAddElemClick
            end
            object GroupBox1: TGroupBox
              Left = 5
              Top = 63
              Width = 265
              Height = 46
              Caption = #1055#1086#1080#1089#1082' '#1087#1086
              TabOrder = 4
              object cbFindField: TComboBox
                Left = 6
                Top = 18
                Width = 161
                Height = 21
                Style = csDropDownList
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ItemHeight = 13
                ParentFont = False
                TabOrder = 0
                Items.Strings = (
                  #1048#1084#1103
                  #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103)
              end
              object btnFindElem: TBitBtn
                Left = 176
                Top = 14
                Width = 79
                Height = 25
                Caption = #1055#1086#1080#1089#1082
                Default = True
                TabOrder = 1
                OnClick = btnFindElemClick
              end
            end
            object CBElem_type_name: TDBLookupComboBox
              Left = 237
              Top = 15
              Width = 169
              Height = 21
              KeyField = 'TYPE_ID'
              ListField = 'NAME'
              ListSource = DM.dsTypes
              TabOrder = 2
            end
          end
          object NavigatorElements: TDBNavigator
            Left = 5
            Top = 124
            Width = 517
            Height = 18
            DataSource = DM.dsClientDSElem
            VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
            Align = alBottom
            Flat = True
            Hints.Strings = (
              #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
              #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1079#1080#1087#1080#1089#1080
              #1054#1090#1084#1077#1085#1072
              #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = #1048#1092#1086#1088#1084#1072#1094#1080#1103
        ImageIndex = 3
        object panelInfo: TPanel
          Left = 0
          Top = 0
          Width = 531
          Height = 232
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BevelWidth = 2
          BorderWidth = 2
          TabOrder = 0
          object DBGridInfo: TDBGrid
            Left = 6
            Top = 6
            Width = 519
            Height = 220
            Align = alClient
            DataSource = DM.dsQryInfoOrder
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = DBGridInfoTitleClick
          end
        end
        object PanelInfoBottom: TPanel
          Left = 0
          Top = 232
          Width = 531
          Height = 171
          Align = alBottom
          BevelInner = bvLowered
          BorderWidth = 3
          BorderStyle = bsSingle
          Color = clSilver
          TabOrder = 1
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
          object lFrom_Whom: TLabel
            Left = 208
            Top = 10
            Width = 166
            Height = 13
            Caption = #1054#1090' '#1082#1086#1075#1086' '#1087#1086#1083#1091#1095#1077#1085#1086' ('#1082#1086#1084#1091' '#1074#1099#1076#1072#1085#1086'):'
          end
          object sbSrez: TSpeedButton
            Left = 216
            Top = 128
            Width = 145
            Height = 22
            Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1088#1077#1079' '#1086#1089#1090#1072#1090#1082#1072
            Flat = True
            OnClick = sbSrezClick
          end
          object ENum_doc: TEdit
            Left = 280
            Top = 74
            Width = 81
            Height = 21
            TabOrder = 5
          end
          object EDate: TEdit
            Left = 240
            Top = 50
            Width = 121
            Height = 21
            TabOrder = 4
            OnExit = EDateExit
          end
          object EFrom_Whom: TEdit
            Left = 208
            Top = 26
            Width = 303
            Height = 21
            TabOrder = 3
          end
          object btnAddInfo: TBitBtn
            Left = 282
            Top = 99
            Width = 78
            Height = 25
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            Default = True
            TabOrder = 6
            OnClick = btnAddInfoClick
          end
          object gbElem: TGroupBox
            Left = 8
            Top = 8
            Width = 193
            Height = 49
            Caption = #1069#1083#1077#1084#1077#1085#1090':'
            TabOrder = 1
          end
          object gbArrivalCharge: TGroupBox
            Left = 8
            Top = 58
            Width = 193
            Height = 95
            Caption = #1055#1088#1080#1093#1086#1076'/'#1088#1072#1089#1093#1086#1076
            TabOrder = 2
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
              Height = 21
              TabOrder = 1
              Text = '0'
              OnExit = EChargeExit
            end
            object EArrival: TEdit
              Left = 56
              Top = 18
              Width = 129
              Height = 21
              TabOrder = 0
              Text = '0'
              OnExit = EArrivalExit
            end
            object ECost_For_One: TEdit
              Left = 104
              Top = 66
              Width = 81
              Height = 21
              TabOrder = 2
              Text = '0'
              OnExit = ECost_For_OneExit
            end
          end
          object gbFind: TGroupBox
            Left = 363
            Top = 48
            Width = 150
            Height = 73
            Caption = #1055#1086#1080#1089#1082' '#1087#1086
            TabOrder = 7
            object cbFindFieldInfo: TComboBox
              Left = 8
              Top = 16
              Width = 137
              Height = 21
              Style = csDropDownList
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 0
              Items.Strings = (
                #1055#1088#1080#1093#1086#1076
                #1056#1072#1089#1093#1086#1076
                #1062#1077#1085#1072
                #1054#1090' '#1082#1086#1075#1086' '#1087#1086#1083#1091#1095#1077#1085#1086
                #1044#1072#1090#1072
                #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072)
            end
            object btnFindInfo: TBitBtn
              Left = 9
              Top = 41
              Width = 136
              Height = 24
              Caption = #1055#1086#1080#1089#1082
              TabOrder = 1
              OnClick = btnFindInfoClick
            end
          end
          object cbElem: TDBLookupComboBox
            Left = 16
            Top = 24
            Width = 177
            Height = 21
            KeyField = 'ELEMENT_ID'
            ListField = 'NAME'
            ListSource = DM.dsElements
            TabOrder = 0
          end
          object btnImportCard: TBitBtn
            Left = 368
            Top = 128
            Width = 145
            Height = 25
            Caption = #1048#1084#1087#1086#1088#1090' '#1082#1072#1088#1090#1086#1095#1082#1080' '#1074' Word'
            TabOrder = 8
            OnClick = btnImportCardClick
          end
        end
      end
    end
    object btnClose: TBitBtn
      Left = 427
      Top = 2
      Width = 113
      Height = 20
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
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
  object MainMenu: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 464
    Top = 128
    object btnAllConnect: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
        7F99B27F99B2C6C6C6E5E5E57377776E6E6E6E6E6E566264566264566264585E
        5F5A5A5A676767FFFFFF41414141414126BFFF2672B22C2C2C6B6B6BD9DDDD3F
        A526CCCCCCCCCCCCC3C3C3999FA0818585999999666666676767CCCCCCCCCCCC
        7FCCFF3E7197747474B2B2B2EDEDEDE2E2E2D1D9D9D1D9D9D6DADAC2D0D1B3C8
        CAB7C0C0666666414141FFFFFFFFFFFFFFFFFF7D7D7D8D8D8DD8D8D841414141
        4141414141414141414141414141414141606060727272414141C6C6C68D8D8D
        8D8D8D4D4D4D545454939393DEEBEBD6E7E7D1D9D9D4D9D9D0D4D4C4CECFB3C8
        CA7581836060604F4F4FC0C4C49FB99F9CA990B4BABB9EAAAC999999ECF0F06C
        530C7979267979266C6C266C6C269EA68D94A1A3515151FFFFFFC8C8C8B2D8A5
        A5BFA5C9C9C9C6C6C6A0A6A7ECF0F0795F0C9292268C8C1986860C737319A3A7
        8DACACAC515151FFFFFF979797AFAFAFAFAFAFABABABA8A8A89B9F9FEAF1F27F
        6619CCCC26A5A5338C8C1979790C9EA68DACACAC515151FFFFFFA2A6A6798181
        767A7A7474746E6E6E838383E7EFEF795F0CA5A5339292268C8C1979790CA3A7
        8DACACAC515151FFFFFFC8C8C8BABAADB7738DB7738DB7738DA88693ECF0F0A3
        8D74A38D74A38D74A38D74A38D74BFBAAEACACAC515151FFFFFFC8C8C89E8D73
        CC3333CC3333CC3333BF4C4CD2D2D2DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCB9B9B9525252FFFFFFC8C8C89E8D73D8590CE57219CC3F26CC3333B23F4CB2
        B6B6949494939393CCCCCCCCCCCCCCCCCCCCCCCCE5E5E5FFFFFFC8C8C8A38D74
        E57219FDA471CC4C19CC3333B21933CBD3D38F8F8F8D8D8DFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC8C8C89E8D73993F0C994C009933199933198C2619CB
        D3D38F8F8F8D8D8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C8C8F1F1F1
        ECF0F0ECF0F0ECF0F0ECF0F0ECF0F0DBDBDB8F8F8F8D8D8DFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFCCCCCCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0A3A3A3909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1086'&'#1077#1076#1080#1085#1077#1085#1080#1077
      OnClick = btnAllConnectClick
    end
    object N2: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103
      object N4: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20202060606080
          8080808080808080202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF202020606060808080808080808080808080808080808080202020FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF20202060606080808080808060606040404040
          4040404040404040606060808080202020FFFFFFFFFFFFFFFFFF202020808080
          8080806060605050507070708080808080808080808080806060606060608080
          80202020FFFFFFFFFFFF808080606060404040808080C0C0C0B0B0B080808080
          8080808080808080808080606060606060808080202020FFFFFF202020606060
          B0B0B0B0B0B0C0C0C0B0B0B09090908080808080808080808080808080806060
          60606060808080202020404040808080B0B0B0B0B0B090909080808080808080
          8080606060606060808080808080808080606060606060808080202020808080
          80808080808080808080808060606020205F7F7F7F7F7F7F6060608080808080
          80808080606060202020FFFFFF2020208080808080806060605F2020BF00007F
          003F3F3F7FBFBFBFFFFFFF9F9F9F808080808080808080404040FFFFFFFFFFFF
          20202080808080808020205F7F3F3FBFBFBFEFEFEFDFDFDFDFDFDFEFEFEF9F9F
          9F808080606060202020FFFFFFFFFFFFFFFFFF202020808080808080BFBFBFDF
          DFDFDFDFDFDFDFDFEFEFEFDFDFDF7F7F7F202020000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF202020808080808080B0B0B0AFAFEF9F9FDF7F7F7F2020200000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20202080808080
          8080707070202020000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF202020202020000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Caption = '&'#1047#1072#1092#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100
        OnClick = N4Click
      end
      object N3: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF007F00003F00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF000000000000007F0000BF0000FF00007F000000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003F0000FF0000FF0000
          FF0000FF0000FF0000FF0000BF00003F00000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00BF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000BF
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003F0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF00003F00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          00FF0000FF0000FF0000FF00003F00FFFFFF007F0000BF00003F00FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF0000FF00003F00FFFFFFFF
          FFFF003F00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F00
          00FF0000FF0000FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF007F0000FF0000FF0000FF00000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          00FF0000FF0000FF00003F00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF0000FF0000FF00003F0000
          0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          003F0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00BF0000FF0000FF0000FF0000
          FF0000FF0000FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF003F0000FF0000FF0000FF0000FF0000FF00000000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          FF0000FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        OnClick = N3Click
      end
    end
    object Ajhvf1: TMenuItem
      Caption = '&'#1060#1086#1088#1084#1072
      object N5: TMenuItem
        Bitmap.Data = {
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
        Caption = #1047#1072#1082#1088#1099#1090#1100
        OnClick = N5Click
      end
    end
  end
  object EkRTFCard: TEkRTF
    InFile = 'card.rtf'
    OutFile = 'outfile.doc'
    TrueValue = 'True'
    FalseValue = 'False'
    Charset = DEFAULT_CHARSET
    Lang = 0
    Options = [eoGraphicsBinary, eoDotAsColon]
    DisableControls = True
    Left = 296
    Top = 104
  end
end
