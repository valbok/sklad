object frmDetali: TfrmDetali
  Left = 191
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1077#1090#1072#1083#1080' '
  ClientHeight = 120
  ClientWidth = 512
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
    Width = 512
    Height = 120
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
      Width = 489
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
        Left = 16
        Top = 40
        Width = 81
        Height = 13
        Caption = #1057#1086#1087#1088#1072#1090#1080#1074#1083#1077#1085#1080#1077':'
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
        Left = 192
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
      object btnAddCharacter: TBitBtn
        Left = 376
        Top = 8
        Width = 107
        Height = 25
        Caption = #1044'&'#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 4
        OnClick = btnAddCharacterClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000505050202020000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000060
          6060C0C0C0A0A0A0808080606060202020000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF000000606060C0C0C0C0C0C0C0C0C0BFBFBF9090908080808080
          80606060202020FFFFFFFFFFFFFFFFFF000000606060C0C0C0C0C0C0C0C0C0DF
          DFDFDFDFDF505050707070A0A0A0909090808080404040FFFFFFFFFFFF404040
          DFDFDF00BF00C0C0C0DFDFDFDFDFDF606060606060A0A0A06060604040409090
          90A0A0A0505050FFFFFFFFFFFF404040DFDFDFDFDFDFDFDFDF606060606060B0
          B0B0907070A0A0A0808080404040606060606060202020FFFFFFFFFFFF404040
          DFDFDF606060606060B0B0B09070709F20209F0000A0A0A08080804040406060
          60000000FFFFFFFFFFFFFFFFFFFFFFFF707070A0A0A09070709F2020DF0000FF
          0000BF0000A0A0A0808080404040808080606060000000FFFFFFFFFFFFFFFFFF
          BFBFBF606060DF0000FF7F00FF3F00FF0000BF0000A0A0A08080804040408080
          80808080000000FFFFFFFFFFFFFFFFFFBFBFBF606060FF3F00BFBF7FFF7F00FF
          0000BF0000A0A0A0808080404040808080808080000000FFFFFFFFFFFFFFFFFF
          BFBFBF606060FF3F00FF7F00FF0000BF3F00804040A0A0A08080804040408080
          80808080000000FFFFFFFFFFFFFFFFFFBFBFBF606060FF0000BF0000804040A0
          A0A0DFDFDFB0B0B0909090404040808080808080000000FFFFFFFFFFFFFFFFFF
          BFBFBF606060804040A0A0A0DFDFDFDFDFDFC0C0C0C0C0C0B0B0B0808080B0B0
          B0909090000000FFFFFFFFFFFFFFFFFFBFBFBFDFDFDFDFDFDFDFDFDFC0C0C0C0
          C0C0B0B0B0A0A0A0B0B0B0B0B0B0707070202020FFFFFFFFFFFFFFFFFFFFFFFF
          202020707070B0B0B0C0C0C0B0B0B0707070404040404040404040202020FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040808080404040FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      end
      object btnClose: TBitBtn
        Left = 376
        Top = 40
        Width = 105
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 5
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
        Left = 272
        Top = 64
        Width = 97
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
        TabOrder = 6
      end
      object dbedtElem_Name: TDBEdit
        Left = 64
        Top = 64
        Width = 121
        Height = 19
        Color = clGray
        DataField = 'NAME'
        DataSource = DM.dsElements
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
    end
  end
end
