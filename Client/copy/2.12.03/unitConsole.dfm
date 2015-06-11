object frmSQL: TfrmSQL
  Left = 202
  Top = 151
  Width = 544
  Height = 375
  Caption = 'SQL '#1050#1086#1085#1089#1086#1083#1100
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
    Width = 536
    Height = 348
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 6
      Top = 189
      Width = 524
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object PanelTop: TPanel
      Left = 6
      Top = 6
      Width = 524
      Height = 183
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelWidth = 2
      BorderWidth = 2
      BorderStyle = bsSingle
      TabOrder = 0
      object MemSql: TMemo
        Left = 4
        Top = 4
        Width = 512
        Height = 171
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object PanelClient: TPanel
      Left = 6
      Top = 225
      Width = 524
      Height = 117
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvLowered
      BevelWidth = 2
      BorderWidth = 2
      TabOrder = 2
      object GridQryWork: TDBGrid
        Left = 6
        Top = 6
        Width = 512
        Height = 105
        Align = alClient
        DataSource = DM.dsQryConsole
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object PanelTop2: TPanel
      Left = 6
      Top = 192
      Width = 524
      Height = 33
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object PanelTop2Left: TPanel
        Left = 2
        Top = 2
        Width = 318
        Height = 29
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object btnRunSql: TBitBtn
          Left = 6
          Top = 1
          Width = 251
          Height = 25
          Caption = 'Run SQL'
          Default = True
          TabOrder = 0
          OnClick = btnRunSqlClick
        end
      end
      object PanelTop2Right: TPanel
        Left = 320
        Top = 2
        Width = 202
        Height = 29
        Align = alRight
        BevelOuter = bvNone
        BevelWidth = 2
        TabOrder = 1
        object btnCloseForm: TBitBtn
          Left = 104
          Top = 2
          Width = 90
          Height = 24
          Caption = 'Close'
          TabOrder = 0
          OnClick = btnCloseFormClick
        end
        object btnClearMemo: TBitBtn
          Left = 0
          Top = 2
          Width = 81
          Height = 25
          Caption = 'Clear'
          TabOrder = 1
          OnClick = btnClearMemoClick
        end
      end
    end
  end
end
