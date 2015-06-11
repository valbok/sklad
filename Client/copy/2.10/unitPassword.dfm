object frmEnterPass: TfrmEnterPass
  Left = 221
  Top = 163
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 116
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 296
    Height = 116
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BorderWidth = 2
    BorderStyle = bsSingle
    TabOrder = 0
    object pnlunderMain: TPanel
      Left = 4
      Top = 4
      Width = 284
      Height = 104
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 2
      TabOrder = 0
      object Label1: TLabel
        Left = 24
        Top = 16
        Width = 99
        Height = 13
        Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
      end
      object Label2: TLabel
        Left = 24
        Top = 40
        Width = 41
        Height = 13
        Caption = #1055#1072#1088#1086#1083#1100':'
      end
      object Bevel1: TBevel
        Left = 16
        Top = 16
        Width = 9
        Height = 41
        Shape = bsLeftLine
      end
      object Bevel2: TBevel
        Left = 8
        Top = 8
        Width = 269
        Height = 57
        Style = bsRaised
      end
      object cbLogin: TComboBox
        Left = 128
        Top = 16
        Width = 145
        Height = 21
        BevelKind = bkFlat
        BevelOuter = bvRaised
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
      end
      object edtPass: TEdit
        Left = 128
        Top = 40
        Width = 145
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        PasswordChar = '*'
        TabOrder = 1
      end
      object btnEnter: TBitBtn
        Left = 8
        Top = 72
        Width = 177
        Height = 25
        Caption = '&'#1042#1086#1081#1090#1080
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnEnterClick
      end
      object btnCancel: TBitBtn
        Left = 200
        Top = 72
        Width = 73
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 3
        OnClick = btnCancelClick
      end
    end
  end
end
