object frmBetween: TfrmBetween
  Left = 194
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1052#1077#1078#1076#1091
  ClientHeight = 89
  ClientWidth = 322
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
    Width = 322
    Height = 89
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 3
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 16
      Width = 6
      Height = 13
      Caption = #1080
    end
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 34
      Height = 13
      Caption = #1052#1077#1078#1076#1091
    end
    object edtOt: TEdit
      Left = 56
      Top = 16
      Width = 49
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtDo: TEdit
      Left = 128
      Top = 16
      Width = 49
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object rbText: TRadioButton
      Left = 184
      Top = 8
      Width = 129
      Height = 17
      Caption = #1058#1077#1082#1089#1090#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
      TabOrder = 2
    end
    object rbNumber: TRadioButton
      Left = 184
      Top = 24
      Width = 129
      Height = 17
      Caption = #1063#1080#1089#1083#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1080#1077
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object btnClose: TBitBtn
      Left = 224
      Top = 48
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 4
      OnClick = btnCloseClick
    end
    object btnSelect: TBitBtn
      Left = 56
      Top = 48
      Width = 121
      Height = 25
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100
      Default = True
      TabOrder = 5
      OnClick = btnSelectClick
    end
  end
end
