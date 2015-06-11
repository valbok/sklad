object frmAdd: TfrmAdd
  Left = 145
  Top = 78
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
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 434
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 539
      Height = 432
      ActivePage = TabSheet3
      Align = alClient
      TabIndex = 2
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1077
        OnShow = TabSheet1Show
        object PanelComponentBottom: TPanel
          Left = 0
          Top = 368
          Width = 531
          Height = 36
          Align = alBottom
          BevelInner = bvLowered
          BorderWidth = 3
          BorderStyle = bsSingle
          Color = clSilver
          TabOrder = 0
          object NavigatorComponents: TDBNavigator
            Left = 5
            Top = 9
            Width = 517
            Height = 18
            DataSource = DM.dsComponents
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
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
            TabOrder = 0
          end
        end
        object PanelComponent: TPanel
          Left = 0
          Top = 0
          Width = 531
          Height = 368
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
            Height = 356
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
        OnShow = TabSheet2Show
        object PanelType: TPanel
          Left = 0
          Top = 0
          Width = 531
          Height = 368
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
            Height = 356
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
          Top = 368
          Width = 531
          Height = 36
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
            Height = 4
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
            Height = 13
            Align = alRight
          end
          object Label3: TLabel
            Left = 514
            Top = 5
            Width = 5
            Height = 4
            Align = alRight
            AutoSize = False
            Transparent = True
          end
          object NavigatorTypes: TDBNavigator
            Left = 5
            Top = 9
            Width = 517
            Height = 18
            DataSource = DM.dsTypes
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
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
            TabOrder = 0
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #1069#1083#1077#1084#1077#1085#1090#1099
        ImageIndex = 2
        OnShow = TabSheet3Show
        object panelElem: TPanel
          Left = 0
          Top = 0
          Width = 531
          Height = 248
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
            Height = 236
            Align = alClient
            DataSource = DM.dsElements
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
        end
        object PanelElemBottom: TPanel
          Left = 0
          Top = 248
          Width = 531
          Height = 156
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
            Height = 119
            Align = alRight
            AutoSize = False
          end
          object Label6: TLabel
            Left = 5
            Top = 5
            Width = 5
            Height = 119
            Align = alLeft
            AutoSize = False
          end
          object Label8: TLabel
            Left = 5
            Top = 124
            Width = 517
            Height = 5
            Align = alBottom
            AutoSize = False
          end
          object GbAddElem: TGroupBox
            Left = 10
            Top = 5
            Width = 507
            Height = 119
            Align = alClient
            Caption = #1069#1083#1077#1084#1077#1085#1090':'
            Color = clSilver
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            object Label4: TLabel
              Left = 79
              Top = 8
              Width = 112
              Height = 13
              Caption = #1050#1088#1072#1090#1082#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label7: TLabel
              Left = 295
              Top = 9
              Width = 200
              Height = 13
              Caption = #1057#1089#1099#1083#1082#1080' '#1085#1072' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1080#1089#1090#1086#1095#1085#1080#1082#1080':'
            end
            object dbmemInfo: TDBMemo
              Left = 8
              Top = 24
              Width = 281
              Height = 89
              DataField = 'INFO'
              DataSource = DM.dsElements
              ScrollBars = ssVertical
              TabOrder = 0
              WantTabs = True
            end
            object lbLinks: TDBLookupListBox
              Left = 296
              Top = 24
              Width = 201
              Height = 80
              KeyField = 'LINK_ID'
              ListField = 'LINK'
              ListSource = DM.dsLinks
              PopupMenu = pmLinks
              TabOrder = 1
              OnClick = lbLinksClick
              OnDblClick = lbLinksDblClick
            end
            object memLinkInfo: TDBMemo
              Left = 328
              Top = 48
              Width = 145
              Height = 33
              DataField = 'INFO'
              DataSource = DM.dsQryLinkInfo_by_link
              TabOrder = 2
              Visible = False
            end
          end
          object NavigatorElements: TDBNavigator
            Left = 5
            Top = 129
            Width = 517
            Height = 18
            DataSource = DM.dsElements
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
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
        OnShow = TabSheet4Show
        object panelInfo: TPanel
          Left = 0
          Top = 0
          Width = 531
          Height = 304
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
            Height = 292
            Align = alClient
            DataSource = DM.dsQryInfoOrder
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
        end
        object PanelInfoBottom: TPanel
          Left = 0
          Top = 304
          Width = 531
          Height = 100
          Align = alBottom
          BevelInner = bvLowered
          BorderWidth = 3
          BorderStyle = bsSingle
          Color = clSilver
          TabOrder = 1
          object gbElem: TGroupBox
            Left = 8
            Top = 8
            Width = 193
            Height = 81
            Caption = #1069#1083#1077#1084#1077#1085#1090':'
            TabOrder = 1
            object rbName: TRadioButton
              Left = 8
              Top = 40
              Width = 113
              Height = 17
              Caption = #1048#1084#1103' '#1101#1083#1077#1084#1077#1085#1090#1072
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = rbNameClick
            end
            object rbNUMER: TRadioButton
              Left = 8
              Top = 56
              Width = 113
              Height = 17
              Caption = #1053#1086#1084#1077#1088' '#1101#1083#1077#1084#1077#1085#1090#1072
              TabOrder = 1
              OnClick = rbNUMERClick
            end
          end
          object cbElem: TDBLookupComboBox
            Left = 16
            Top = 24
            Width = 177
            Height = 19
            Ctl3D = False
            KeyField = 'ELEMENT_ID'
            ListField = 'NAME'
            ListSource = DM.dsElements
            ParentCtl3D = False
            TabOrder = 0
          end
          object btnImportCard: TBitBtn
            Left = 208
            Top = 16
            Width = 145
            Height = 25
            Caption = #1048#1084#1087#1086#1088#1090' '#1082#1072#1088#1090#1086#1095#1082#1080' '#1074' Word'
            TabOrder = 2
            OnClick = btnImportCardClick
          end
          object checkBoxElem: TCheckBox
            Left = 208
            Top = 72
            Width = 137
            Height = 17
            Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1082' '#1101#1083#1077#1084#1077#1085#1090#1091
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = checkBoxElemClick
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
    object N1: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      object btnShowaddForm: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFF000000000000400000400000400000400000000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20000060000020600060200080
          0000800000800000800000600000200000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          4020208000008000000080002060008000008000008000008000008000008000
          00200000FFFFFFFFFFFFFFFFFF60404080000080000080000000800000800020
          6000800000800000800000800000800000206000002000FFFFFF202020802020
          8000009F0000800000009F0000BF000080004040008000008000008000006020
          000080000060000000004040408000008000009F00007F2000009F0000BF0000
          BF000080009F00008000008000004040000080000080000000008040409F0000
          9F0000BF00005F400000DF0000BF0000BF00009F006020009F00004040004040
          000080000080000040009F40409F0000BF00003F7F0060BF6030EF3000BF007F
          4000DF0000BF00003F7F0000BF00009F000080000080000040009F4040DF0000
          3F7F0060BF607F40006F70306F7030FF0000FF0000BF000000BF0000BF0000BF
          00009F00008000004000BF4040BF200060BF607F4000FF0000BF2000FF0000FF
          0000FF0000DF000040400000BF0000BF00009F000080002020004040403F7F00
          00FF0000BF0000BF007F4000FF0000FF0000FF0000DF0000BF00006020004040
          008000008000000000000020006FCF6F6FEF6F3FFF3F00FF0000DF003F7F00FF
          0000DF0000DF0000BF00007F200030AF30602000006000000000FFFFFF3F7F3F
          7FFF7F7FFF7F00BF0060DF6030AF30DF0000DF0000BF00009F00007F200000BF
          00008000002000FFFFFFFFFFFFFFFFFF3F7F3F7FFF7F7F40007F40009F20007F
          40003F7F009F20009F0000800000309030004000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3F7F3F9F4020FF0000BF000050703060DF602060008000008020204040
          20FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040808080FF000040
          4000008000404000808080404040FFFFFFFFFFFFFFFFFFFFFFFF}
        Caption = #1060#1086#1088#1084#1072' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1077#1081
        ShortCut = 16449
        OnClick = btnShowaddFormClick
      end
      object btnShowFindForm: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0404
          04040404FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF800000FFFF00FF0000040404FFFFFFFFFFFF040404
          040404040404040404040404040404040404040404040404800000FFFF00FF00
          00FF0000040404FFFFFF00999966CCCC66CCCC66CCCC66CCCC66CCCC66CCCC66
          CCCC009999800000FFFF00FF0000FF0000009999040404FFFFFF009999CCFFFF
          99CCFF99FFFF99CCFF99FFFF99CCFF99CCFF800000FFFF00FF0000FF000099CC
          FF66CCCC040404FFFFFF009999CCFFFF99FFFF99CCFF86868604040404040486
          8686C0C0C0FF0000FF000099CCFF99CCFF66CCCC040404FFFFFF009999CCFFFF
          99CCFF868686C0C0C0FFFF00C0C0C004040486868600808099CCFF99FFFF99CC
          FF66CCCC040404FFFFFF009999CCFFFF868686FFFFFFFFFF00C0C0C0FFFF00C0
          C0C004040499CCFF99FFFF99CCFF99FFFF66CCCC040404FFFFFF009999CCFFFF
          868686FFFF00FFFFFFFFFF00C0C0C0FFFF0004040499CCFF99CCFF99FFFF99CC
          FF66CCCC040404FFFFFF009999CCFFFF868686FFFFFFFFFF00FFFFFFFFFF00C0
          C0C004040499CCFF99FFFF99CCFF99FFFF66CCCC040404FFFFFF009999CCFFFF
          99CCFF868686FFFFFFFFFF00FFFFFF04040486868699FFFF99FFFF99FFFF99CC
          FF66CCCC040404FFFFFF009999CCFFFFCCFFFF99CCFF86868686868604040486
          8686CCFFFFCCFFFFCCFFFFCCFFFF99FFFF66CCCC040404FFFFFF00999966CCCC
          66CCCC66CCCC66CCCC66CCCC66CCCC66CCCC0099990099990099990099990099
          99009999FFFFFFFFFFFFFFFFFF009999F1F1F1CCFFFFCCFFFF99FFFF99FFFF00
          9999040404FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          009999009999009999009999009999040404FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Caption = #1055#1086#1080#1089#1082
        ShortCut = 16454
        OnClick = btnShowFindFormClick
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
    InFile = 'reports\card.rtf'
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
  object pmLinks: TPopupMenu
    Left = 352
    Top = 176
    object Open1: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1103#1090#1100
      OnClick = Open1Click
    end
  end
end
