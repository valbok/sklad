object frmDetali: TfrmDetali
  Left = 191
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1077#1090#1072#1083#1080' '
  ClientHeight = 151
  ClientWidth = 469
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
    Width = 469
    Height = 151
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BevelWidth = 3
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 0
    object gbCharakter: TGroupBox
      Left = 8
      Top = 8
      Width = 449
      Height = 97
      Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072':'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Label8: TLabel
        Left = 8
        Top = 16
        Width = 22
        Height = 13
        Caption = #1058#1080#1087':'
      end
      object Label9: TLabel
        Left = 8
        Top = 40
        Width = 81
        Height = 13
        Caption = #1057#1086#1087#1088#1086#1090#1080#1074#1083#1077#1085#1080#1077':'
      end
      object Label10: TLabel
        Left = 192
        Top = 40
        Width = 16
        Height = 13
        Caption = #1054#1084
      end
      object Label11: TLabel
        Left = 224
        Top = 16
        Width = 41
        Height = 13
        Caption = #1044#1086#1087#1091#1089#1082':'
      end
      object Label12: TLabel
        Left = 344
        Top = 16
        Width = 8
        Height = 13
        Caption = '%'
      end
      object Label13: TLabel
        Left = 224
        Top = 40
        Width = 24
        Height = 13
        Caption = #1058#1050#1057':'
      end
      object Label1: TLabel
        Left = 8
        Top = 64
        Width = 47
        Height = 13
        Caption = #1069#1083#1077#1084#1077#1085#1090':'
      end
      object Label2: TLabel
        Left = 272
        Top = 64
        Width = 76
        Height = 13
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
      end
      object dbEdtType: TDBEdit
        Left = 40
        Top = 16
        Width = 177
        Height = 19
        DataField = 'TYPE_NAME'
        DataSource = DM.dsDetali
        TabOrder = 0
      end
      object dbedtResistance: TDBEdit
        Left = 104
        Top = 40
        Width = 81
        Height = 19
        DataField = 'RESISTANCE'
        DataSource = DM.dsDetali
        TabOrder = 1
      end
      object dbedtDopusk: TDBEdit
        Left = 272
        Top = 16
        Width = 65
        Height = 19
        DataField = 'DOPUSK'
        DataSource = DM.dsDetali
        TabOrder = 2
      end
      object dbedtTKS: TDBEdit
        Left = 272
        Top = 40
        Width = 65
        Height = 19
        DataField = 'TKS'
        DataSource = DM.dsDetali
        TabOrder = 3
      end
      object btnClose: TBitBtn
        Left = 352
        Top = 32
        Width = 89
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 4
        OnClick = btnCloseClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000
          0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF0000FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000FF
          0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF000000FFFFFFFF
          FFFFFFFFFFFFFFFF0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000FF0000FF0000FF000000FFFFFFFFFFFF0000000000FF0000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF00
          00000000000000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF00
          00FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF0000000000FF0000FF0000FF0000FF0000FF000000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FF0000FF0000FFFF
          FFFFFFFFFF0000FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000
          00FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF0000FF0000FF000000FFFFFFFFFFFFFFFFFF0000FF
          0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      end
      object dbedtUser: TDBEdit
        Left = 352
        Top = 64
        Width = 89
        Height = 19
        Color = clGray
        DataField = 'USER_NAME'
        DataSource = DM.dsDetali
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object edtElem_name: TEdit
        Left = 64
        Top = 64
        Width = 121
        Height = 19
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
    end
    object pnlBottom: TPanel
      Left = 7
      Top = 111
      Width = 451
      Height = 29
      Align = alBottom
      BevelInner = bvLowered
      BevelWidth = 2
      BorderWidth = 1
      TabOrder = 1
      object ElemNavigator: TDBNavigator
        Left = 5
        Top = 6
        Width = 441
        Height = 18
        DataSource = DM.dsDetali
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        Align = alBottom
        Flat = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
end
