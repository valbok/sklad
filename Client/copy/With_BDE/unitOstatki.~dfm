object frmOstatki: TfrmOstatki
  Left = 209
  Top = 122
  Width = 544
  Height = 375
  Caption = #1054#1089#1090#1072#1090#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 347
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderWidth = 5
    TabOrder = 0
    object PanelBottom: TPanel
      Left = 9
      Top = 285
      Width = 518
      Height = 53
      Align = alBottom
      BevelInner = bvLowered
      BevelWidth = 2
      BorderWidth = 1
      BorderStyle = bsSingle
      TabOrder = 0
      object btnGetOstatki: TBitBtn
        Left = 8
        Top = 12
        Width = 225
        Height = 25
        BiDiMode = bdLeftToRight
        Caption = #1042#1099#1074#1077#1089#1090#1080' '#1086#1089#1090#1072#1090#1082#1080
        Default = True
        ParentBiDiMode = False
        TabOrder = 0
        OnClick = btnGetOstatkiClick
      end
      object PanelBotmRight: TPanel
        Left = 324
        Top = 5
        Width = 185
        Height = 39
        Align = alRight
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 1
        object btnClose: TBitBtn
          Left = 72
          Top = 7
          Width = 105
          Height = 26
          Caption = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
          TabOrder = 0
          OnClick = btnCloseClick
        end
      end
      object btnImpWord: TBitBtn
        Left = 256
        Top = 12
        Width = 95
        Height = 25
        Caption = #1048#1084#1087#1086#1088#1090' '#1074' Word'
        TabOrder = 2
        OnClick = btnImpWordClick
      end
    end
    object grid: TDBGrid
      Left = 9
      Top = 9
      Width = 518
      Height = 276
      Align = alClient
      DataSource = DM.dsOst
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object EkRTF: TEkRTF
    InFile = 'ost.rtf'
    OutFile = 'outfile.doc'
    TrueValue = 'True'
    FalseValue = 'False'
    Charset = DEFAULT_CHARSET
    Lang = 0
    Options = [eoGraphicsBinary, eoDotAsColon]
    DisableControls = True
    Left = 256
    Top = 72
  end
end
