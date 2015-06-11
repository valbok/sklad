object frmInputValue: TfrmInputValue
  Left = 194
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
  ClientHeight = 68
  ClientWidth = 391
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
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 391
    Height = 68
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BevelWidth = 3
    BorderWidth = 1
    TabOrder = 0
    object Label1: TLabel
      Left = 152
      Top = 16
      Width = 51
      Height = 13
      Caption = #1047#1085#1072#1095#1077#1085#1080#1077':'
    end
    object btnEnter: TBitBtn
      Left = 304
      Top = 31
      Width = 75
      Height = 21
      Caption = #1042#1074#1077#1089#1090#1080
      Default = True
      TabOrder = 0
      OnClick = btnEnterClick
    end
    object rbText: TRadioButton
      Left = 16
      Top = 16
      Width = 129
      Height = 17
      Caption = #1058#1077#1082#1089#1090#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object rbNumber: TRadioButton
      Left = 16
      Top = 40
      Width = 129
      Height = 17
      Caption = #1063#1080#1089#1083#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1080#1077
      TabOrder = 2
    end
    object edtValue: TEdit
      Left = 152
      Top = 32
      Width = 145
      Height = 21
      TabOrder = 3
      OnKeyPress = edtValueKeyPress
    end
  end
end
