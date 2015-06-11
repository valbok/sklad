object frmAddRequests: TfrmAddRequests
  Left = 192
  Top = 115
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1079#1072#1082#1072#1079
  ClientHeight = 198
  ClientWidth = 190
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
    Width = 190
    Height = 198
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BorderWidth = 3
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 64
      Width = 152
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077', '#1089#1086#1088#1090', '#1088#1072#1079#1084#1077#1088':'
    end
    object Label2: TLabel
      Left = 12
      Top = 104
      Width = 62
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
    end
    object Label3: TLabel
      Left = 12
      Top = 16
      Width = 53
      Height = 13
      Caption = #8470' '#1079#1072#1082#1072#1079#1072':'
    end
    object Bevel1: TBevel
      Left = 8
      Top = 16
      Width = 20
      Height = 105
      Shape = bsLeftLine
    end
    object Label4: TLabel
      Left = 12
      Top = 40
      Width = 66
      Height = 13
      Caption = #8470' '#1101#1083#1077#1084#1077#1085#1090#1072':'
    end
    object eName: TEdit
      Left = 12
      Top = 80
      Width = 165
      Height = 21
      TabOrder = 1
    end
    object eCol: TEdit
      Left = 88
      Top = 104
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object eZakaz_id: TEdit
      Left = 72
      Top = 16
      Width = 105
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object btnClose: TBitBtn
      Left = 104
      Top = 160
      Width = 75
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
    object btnAddRequests: TBitBtn
      Left = 8
      Top = 160
      Width = 78
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Default = True
      TabOrder = 2
      OnClick = btnAddRequestsClick
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
    object btnShowZakaz: TBitBtn
      Left = 8
      Top = 128
      Width = 169
      Height = 25
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1079#1072#1082#1072#1079
      TabOrder = 3
      OnClick = btnShowZakazClick
    end
    object EElement_id: TEdit
      Left = 88
      Top = 40
      Width = 89
      Height = 21
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
end
