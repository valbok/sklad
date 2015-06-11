object frmLink: TfrmLink
  Left = 206
  Top = 226
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1057#1089#1099#1083#1082#1080
  ClientHeight = 194
  ClientWidth = 408
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
    Width = 408
    Height = 194
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BorderWidth = 5
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 42
      Height = 13
      Caption = 'Cc'#1099#1083#1082#1072':'
    end
    object Label2: TLabel
      Left = 16
      Top = 40
      Width = 119
      Height = 13
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1089#1099#1083#1082#1077':'
    end
    object dbEdtLink: TDBEdit
      Left = 64
      Top = 16
      Width = 145
      Height = 19
      DataField = 'LINK'
      DataSource = DM.dsLinks
      TabOrder = 0
    end
    object dbMemLinkInfo: TDBMemo
      Left = 24
      Top = 56
      Width = 185
      Height = 89
      DataField = 'INFO'
      DataSource = DM.dsLinks
      TabOrder = 1
    end
    object DBLinkNavigator: TDBNavigator
      Left = 7
      Top = 162
      Width = 394
      Height = 25
      DataSource = DM.dsLinks
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alBottom
      Flat = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object btnClose: TBitBtn
      Left = 304
      Top = 16
      Width = 89
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 3
      OnClick = btnCloseClick
      NumGlyphs = 2
    end
  end
end
