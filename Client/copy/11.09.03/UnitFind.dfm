object frmFind: TfrmFind
  Left = 240
  Top = 119
  Width = 401
  Height = 375
  Caption = #1053#1072#1081#1090#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 348
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    TabOrder = 0
    object PanelTop: TPanel
      Left = 6
      Top = 6
      Width = 377
      Height = 147
      Align = alTop
      BevelInner = bvLowered
      BevelWidth = 2
      BorderStyle = bsSingle
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 4
        Top = 4
        Width = 365
        Height = 135
        ActivePage = TabSheet1
        Align = alClient
        TabIndex = 0
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = #1054#1073#1097#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1080#1089#1082#1072
          OnEnter = TabSheet1Enter
          object Label1: TLabel
            Left = 0
            Top = 8
            Width = 51
            Height = 13
            Caption = #1047#1085#1072#1095#1077#1085#1080#1077':'
          end
          object Label2: TLabel
            Left = 0
            Top = 32
            Width = 53
            Height = 13
            Caption = #1043#1076#1077' '#1080#1097#1077#1084':'
          end
          object Label3: TLabel
            Left = 0
            Top = 56
            Width = 86
            Height = 13
            Caption = #1055#1086' '#1082#1072#1082#1086#1084#1091' '#1087#1086#1083#1102':'
          end
          object Bevel1: TBevel
            Left = 249
            Top = 7
            Width = 97
            Height = 42
            Shape = bsFrame
            Style = bsRaised
          end
          object Label5: TLabel
            Left = 256
            Top = 21
            Width = 81
            Height = 33
            Alignment = taCenter
            AutoSize = False
            Caption = #1055#1086#1080#1089#1082' '#1089' '#1091#1095#1105#1090#1086#1084' '#1088#1077#1075#1080#1089#1090#1088#1072'!'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
          end
          object Label4: TLabel
            Left = 271
            Top = 8
            Width = 51
            Height = 13
            Caption = #1042#1085#1080#1084#1072#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object EditZnachenie: TEdit
            Left = 56
            Top = 8
            Width = 185
            Height = 21
            Hint = 
              #1047#1085#1072#1082' '#1087#1088#1086#1094#1077#1085#1090#1086#1074' <%> - '#1086#1079#1085#1072#1095#1072#1077#1090' '#1083#1102#1073#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1080#1084#1074#1086#1083#1086#1074' ('#1085#1072#1087#1088#1080#1084#1077 +
              #1088': '#1044#1080#1086'%). '#1047#1085#1072#1082' '#1087#1086#1076#1095#1105#1088#1082#1080#1074#1072#1085#1080#1103' <_> -'#1086#1079#1085#1072#1095#1072#1077#1090' '#1086#1076#1080#1085' '#1089#1080#1084#1074#1086#1083' ('#1085#1072#1087#1088'. '#1044'_' +
              #1086#1076#1099') '
            Ctl3D = True
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object CBTableName: TComboBox
            Left = 56
            Top = 32
            Width = 185
            Height = 21
            Style = csDropDownList
            Ctl3D = False
            ItemHeight = 13
            ParentCtl3D = False
            TabOrder = 1
            OnChange = CBTableNameChange
            Items.Strings = (
              #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1077
              #1058#1080#1087#1099
              #1069#1083#1077#1084#1077#1085#1090#1099
              #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086#1073' '#1101#1083#1077#1084#1077#1085#1090#1077)
          end
          object CBFieldName: TComboBox
            Left = 96
            Top = 56
            Width = 145
            Height = 21
            BevelInner = bvLowered
            Style = csDropDownList
            Ctl3D = False
            ItemHeight = 13
            ParentCtl3D = False
            TabOrder = 2
            OnChange = CBFieldNameChange
          end
          object btnFind: TBitBtn
            Left = 160
            Top = 80
            Width = 81
            Height = 25
            Caption = #1053#1072#1095#1072#1090#1100
            Default = True
            TabOrder = 3
            OnClick = btnFindClick
          end
          object btnClose: TBitBtn
            Left = 256
            Top = 80
            Width = 81
            Height = 25
            Caption = #1047#1072#1082#1088#1099#1090#1100
            TabOrder = 4
            OnClick = btnCloseClick
          end
        end
        object TabSheet2: TTabSheet
          Caption = #1063#1072#1089#1090#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
          ImageIndex = 1
          OnEnter = TabSheet2Enter
          object Label6: TLabel
            Left = 0
            Top = 8
            Width = 197
            Height = 13
            Caption = #1055#1088#1086#1089#1084#1086#1090#1088'  '#1090#1080#1087#1086#1074' '#1087#1086' '#1080#1084#1077#1085#1080' '#1082#1086#1084#1087'-'#1097#1077#1075#1086':'
          end
          object Label7: TLabel
            Left = 0
            Top = 32
            Width = 182
            Height = 13
            Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1076#1072#1085#1085#1086#1075#1086' '#1090#1080#1087#1072':'
          end
          object Label8: TLabel
            Left = 0
            Top = 56
            Width = 188
            Height = 13
            Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086#1073' '#1101#1083#1077#1084#1077#1085#1090#1077':'
          end
          object CBtypes_by_comp: TDBLookupComboBox
            Left = 200
            Top = 8
            Width = 153
            Height = 21
            KeyField = 'NAME'
            ListField = 'NAME'
            ListSource = DM.dsComponents
            TabOrder = 0
            OnClick = CBtypes_by_compClick
          end
          object CBElements_by_type: TDBLookupComboBox
            Left = 200
            Top = 32
            Width = 153
            Height = 21
            KeyField = 'NAME'
            ListField = 'NAME'
            ListSource = DM.dsTypes
            TabOrder = 1
            OnClick = CBElements_by_typeClick
          end
          object CBInfo_By_element: TDBLookupComboBox
            Left = 200
            Top = 56
            Width = 153
            Height = 21
            KeyField = 'NAME'
            ListField = 'NAME'
            ListSource = DM.dsElements
            TabOrder = 2
            OnClick = CBInfo_By_elementClick
          end
          object btnOpenConnect: TBitBtn
            Left = 200
            Top = 80
            Width = 153
            Height = 25
            Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1077
            TabOrder = 3
            OnClick = btnOpenConnectClick
          end
        end
      end
    end
    object gridFind: TDBGrid
      Left = 6
      Top = 153
      Width = 377
      Height = 185
      Align = alClient
      Ctl3D = False
      DataSource = DM.dsQryConsole
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = gridFindDblClick
    end
  end
end
