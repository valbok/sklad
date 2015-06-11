object frmAddComp: TfrmAddComp
  Left = 194
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1077#1077
  ClientHeight = 71
  ClientWidth = 390
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
    Width = 390
    Height = 71
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BevelWidth = 3
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 0
    object gbComp: TGroupBox
      Left = 7
      Top = 7
      Width = 372
      Height = 53
      Align = alClient
      Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1077#1077':'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object lNameComponent: TLabel
        Left = 10
        Top = 22
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
      object editComponentName: TEdit
        Left = 40
        Top = 20
        Width = 225
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object btnAddComponent: TBitBtn
        Left = 270
        Top = 19
        Width = 91
        Height = 22
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        Default = True
        TabOrder = 1
        OnClick = btnAddComponentClick
      end
    end
  end
end
