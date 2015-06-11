object frmPass: TfrmPass
  Left = 218
  Top = 156
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1042#1093#1086#1076' '#1074' '#1089#1080#1089#1090#1077#1084#1091' Skald 0.92 IB'
  ClientHeight = 112
  ClientWidth = 256
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
    Width = 256
    Height = 112
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BorderWidth = 1
    TabOrder = 0
    object lblLogin: TLabel
      Left = 48
      Top = 16
      Width = 34
      Height = 13
      Caption = #1051#1086#1075#1080#1085':'
      Transparent = True
    end
    object lblPassword: TLabel
      Left = 48
      Top = 48
      Width = 41
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100':'
    end
    object cdLogin: TComboBox
      Left = 96
      Top = 16
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cdLogin'
    end
    object ePassword: TEdit
      Left = 96
      Top = 48
      Width = 145
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object btnEnter: TBitBtn
      Left = 96
      Top = 72
      Width = 73
      Height = 25
      Caption = '&'#1042#1093#1086#1076
      Default = True
      TabOrder = 2
    end
    object btnCancel: TBitBtn
      Left = 176
      Top = 72
      Width = 67
      Height = 25
      Caption = '&'#1054#1090#1084#1077#1085#1072
      TabOrder = 3
    end
  end
end
