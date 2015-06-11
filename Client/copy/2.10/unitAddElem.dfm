object frmAddElem: TfrmAddElem
  Left = 97
  Top = 118
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090
  ClientHeight = 260
  ClientWidth = 502
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
    Width = 502
    Height = 260
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BevelWidth = 3
    BorderWidth = 1
    TabOrder = 0
    object gbElem: TGroupBox
      Left = 7
      Top = 7
      Width = 488
      Height = 246
      Align = alClient
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090':'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Label2: TLabel
        Left = 248
        Top = 8
        Width = 86
        Height = 13
        Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072':'
      end
      object btnAddElem: TBitBtn
        Left = 8
        Top = 208
        Width = 89
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        Default = True
        TabOrder = 2
        OnClick = btnAddElemClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000004040409F9F9F404040000000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000404040A0A0A0C0
          C0C0BFBFBF808080808080404040000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          000000404040A0A0A0C0C0C0C0C0C0C0C0C0BFBFBF8080808080808080808080
          80404040000000FFFFFF000000404040A0A0A0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0BFBFBF8080808080808080808080808080808080802020209F9F9FC0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0BFBFBF8080808080808080808080
          808080808080804040407F7F7FCFCFCFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0BFBFBF808080808080808080808080808080808080404040202020CFCFCF
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0BFBFBF8080808080808080808080
          80808080808080404040FFFFFF7F7F7FCFCFCFC0C0C0C0C0C0C0C0C0C0C0C0DF
          DFDFEFEFEFAFAFAF808080808080808080808080808080000000FFFFFF202020
          CFCFCFC0C0C0CFCFCFEFEFEFDFDFDFCFCFCF6060609F9F9FDFDFDFCFCFCF8080
          80808080606060000000FFFFFFFFFFFF7F7F7FDFDFDFEFEFEFC0C0C060606030
          3030606060C0C0C0C0C0C0C0C0C0DFDFDF909090404040FFFFFFFFFFFFFFFFFF
          202020AFAFAFB0B0B0909090909090C0C0C0909090606060303030606060B0B0
          B0A0A0A0202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF202020707070B0B0B0C0
          C0C0303030606060B0B0B0707070202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF202020707070A0A0A0707070202020FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      end
      object gbElemNew: TGroupBox
        Left = 8
        Top = 16
        Width = 233
        Height = 185
        Caption = #1069#1083#1077#1084#1077#1085#1090':'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object lNameElem: TLabel
          Left = 8
          Top = 15
          Width = 25
          Height = 13
          Caption = #1048#1084#1103':'
          Transparent = True
        end
        object lUnitElem: TLabel
          Left = 8
          Top = 39
          Width = 105
          Height = 13
          Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103':'
          Transparent = True
        end
        object lNumer: TLabel
          Left = 8
          Top = 64
          Width = 37
          Height = 13
          Caption = #1053#1086#1084#1077#1088':'
        end
        object Label4: TLabel
          Left = 8
          Top = 96
          Width = 87
          Height = 13
          Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1077#1077':'
        end
        object Label3: TLabel
          Left = 8
          Top = 137
          Width = 22
          Height = 13
          Caption = #1058#1080#1087':'
          Transparent = True
        end
        object EName: TEdit
          Left = 40
          Top = 15
          Width = 185
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
        object EUnit: TEdit
          Left = 128
          Top = 39
          Width = 97
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
        end
        object Enumer: TEdit
          Left = 88
          Top = 64
          Width = 137
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
        end
        object edtCOmp_name: TEdit
          Left = 8
          Top = 112
          Width = 217
          Height = 19
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object edtType_name: TEdit
          Left = 40
          Top = 136
          Width = 185
          Height = 19
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
      end
      object MemInfo: TMemo
        Left = 249
        Top = 24
        Width = 228
        Height = 177
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        Left = 248
        Top = 176
        Width = 233
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' 20000 '#1079#1072#1087#1080#1089#1077#1081
        TabOrder = 3
        Visible = False
        OnClick = BitBtn1Click
      end
      object btnClose: TBitBtn
        Left = 407
        Top = 208
        Width = 75
        Height = 25
        Caption = '&'#1047#1072#1082#1088#1099#1090#1100
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
    end
  end
end
