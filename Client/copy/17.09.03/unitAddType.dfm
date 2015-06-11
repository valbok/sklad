object frmAddType: TfrmAddType
  Left = 192
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1099#1074#1080#1090#1100' '#1090#1080#1087
  ClientHeight = 82
  ClientWidth = 317
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
    Width = 317
    Height = 82
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BevelWidth = 3
    BorderWidth = 1
    TabOrder = 0
    object gbType: TGroupBox
      Left = 7
      Top = 7
      Width = 303
      Height = 68
      Align = alClient
      Caption = #1058#1080#1087':'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Label11: TLabel
        Left = 10
        Top = 45
        Width = 87
        Height = 13
        Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1077#1077':'
      end
      object Label12: TLabel
        Left = 10
        Top = 21
        Width = 25
        Height = 13
        Caption = #1048#1084#1103':'
      end
      object CBType_Comp: TDBLookupComboBox
        Left = 107
        Top = 42
        Width = 190
        Height = 19
        Ctl3D = False
        KeyField = 'NAME'
        ListField = 'NAME'
        ListSource = DM.dsComponents
        ParentCtl3D = False
        TabOrder = 0
      end
      object btnAddType: TBitBtn
        Left = 201
        Top = 18
        Width = 94
        Height = 22
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        Default = True
        TabOrder = 1
        OnClick = btnAddTypeClick
      end
      object edtTypeName: TEdit
        Left = 42
        Top = 18
        Width = 151
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
      end
    end
  end
end
