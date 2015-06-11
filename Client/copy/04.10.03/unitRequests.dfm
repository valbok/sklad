object frmRequests: TfrmRequests
  Left = 189
  Top = 155
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1079#1072#1082#1072#1079#1072
  ClientHeight = 231
  ClientWidth = 219
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
    Width = 219
    Height = 231
    Align = alClient
    BevelInner = bvRaised
    BevelWidth = 2
    TabOrder = 0
    object pnlunderMain: TPanel
      Left = 4
      Top = 4
      Width = 211
      Height = 223
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvLowered
      BevelWidth = 2
      BorderWidth = 1
      TabOrder = 0
      object pnlBottom: TPanel
        Left = 5
        Top = 5
        Width = 201
        Height = 213
        Align = alClient
        BevelInner = bvLowered
        BevelOuter = bvLowered
        BevelWidth = 2
        BorderWidth = 1
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 8
          Width = 146
          Height = 13
          Caption = #1053#1072#1080#1084#1077#1086#1074#1072#1085#1080#1077', '#1089#1086#1088#1090', '#1088#1072#1079#1084#1077#1088':'
        end
        object Label2: TLabel
          Left = 10
          Top = 48
          Width = 62
          Height = 13
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
        end
        object Label3: TLabel
          Left = 10
          Top = 64
          Width = 77
          Height = 13
          Caption = #1048#1084#1103' '#1101#1083#1077#1084#1077#1085#1090#1072':'
        end
        object Label4: TLabel
          Left = 18
          Top = 104
          Width = 31
          Height = 13
          Caption = #8470' '#1087'/'#1087
        end
        object Label5: TLabel
          Left = 18
          Top = 128
          Width = 67
          Height = 13
          Caption = 'ID '#1069#1083#1077#1084#1077#1085#1090#1072':'
        end
        object Panel1: TPanel
          Left = 5
          Top = 179
          Width = 191
          Height = 29
          Align = alBottom
          BevelInner = bvLowered
          BevelWidth = 2
          BorderWidth = 1
          TabOrder = 0
          object RequestsNavigator: TDBNavigator
            Left = 5
            Top = 6
            Width = 181
            Height = 18
            DataSource = DM.dsRequests
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
            Align = alBottom
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
        object dbedtName: TDBEdit
          Left = 10
          Top = 24
          Width = 177
          Height = 19
          Ctl3D = False
          DataField = 'NAME'
          DataSource = DM.dsRequests
          ParentCtl3D = False
          TabOrder = 1
        end
        object dbedtCol: TDBEdit
          Left = 98
          Top = 48
          Width = 89
          Height = 19
          Ctl3D = False
          DataField = 'COL'
          DataSource = DM.dsRequests
          ParentCtl3D = False
          TabOrder = 2
        end
        object dbedtId: TDBEdit
          Left = 122
          Top = 104
          Width = 65
          Height = 19
          Color = clGray
          Ctl3D = False
          DataField = 'REQUEST_ID'
          DataSource = DM.dsRequests
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbedtElem_name: TDBEdit
          Left = 10
          Top = 80
          Width = 177
          Height = 19
          Color = clGray
          Ctl3D = False
          DataField = 'luElemName'
          DataSource = DM.dsRequests
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object btnClose: TBitBtn
          Left = 10
          Top = 154
          Width = 181
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
        object dbedtElem_id: TDBEdit
          Left = 106
          Top = 128
          Width = 81
          Height = 19
          Ctl3D = False
          DataField = 'ELEMENT_ID'
          DataSource = DM.dsRequests
          ParentCtl3D = False
          TabOrder = 6
        end
      end
    end
  end
end
