object frmEditZakaz: TfrmEditZakaz
  Left = 192
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1082#1072#1079#1072
  ClientHeight = 240
  ClientWidth = 218
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
    Width = 218
    Height = 240
    Align = alClient
    BevelInner = bvRaised
    BevelWidth = 2
    TabOrder = 0
    object pnlunderMain: TPanel
      Left = 4
      Top = 4
      Width = 210
      Height = 232
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvLowered
      BevelWidth = 2
      BorderWidth = 1
      TabOrder = 0
      object pnlBottom: TPanel
        Left = 5
        Top = 5
        Width = 200
        Height = 222
        Align = alClient
        BevelInner = bvLowered
        BevelOuter = bvLowered
        BevelWidth = 2
        BorderWidth = 1
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 48
          Width = 84
          Height = 13
          Caption = #1044#1083#1103' '#1082#1072#1082#1086#1081' '#1094#1077#1083#1080':'
        end
        object Label3: TLabel
          Left = 8
          Top = 88
          Width = 29
          Height = 13
          Caption = #1044#1072#1090#1072':'
        end
        object Label2: TLabel
          Left = 8
          Top = 8
          Width = 42
          Height = 13
          Caption = #1054#1090' '#1082#1086#1075#1086':'
        end
        object Label4: TLabel
          Left = 8
          Top = 112
          Width = 31
          Height = 13
          Caption = #8470' '#1087'/'#1087
        end
        object Label5: TLabel
          Left = 8
          Top = 136
          Width = 25
          Height = 13
          Caption = 'User:'
        end
        object Panel1: TPanel
          Left = 5
          Top = 188
          Width = 190
          Height = 29
          Align = alBottom
          BevelInner = bvLowered
          BevelWidth = 2
          BorderWidth = 1
          TabOrder = 6
          object RequestsNavigator: TDBNavigator
            Left = 5
            Top = 6
            Width = 180
            Height = 18
            DataSource = DM.dsZakazi
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
            Align = alBottom
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
        object dbedtFor_what: TDBEdit
          Left = 8
          Top = 64
          Width = 185
          Height = 19
          Ctl3D = False
          DataField = 'FOR_WHAT'
          DataSource = DM.dsZakazi
          ParentCtl3D = False
          TabOrder = 1
        end
        object dbedtFrom_whom: TDBEdit
          Left = 8
          Top = 24
          Width = 185
          Height = 19
          Ctl3D = False
          DataField = 'FROM_WHOM'
          DataSource = DM.dsZakazi
          ParentCtl3D = False
          TabOrder = 0
        end
        object dbedtTheDate: TDBEdit
          Left = 88
          Top = 88
          Width = 105
          Height = 19
          Color = clWhite
          Ctl3D = False
          DataField = 'THEDATE'
          DataSource = DM.dsZakazi
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object btnClose: TBitBtn
          Left = 8
          Top = 162
          Width = 185
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
        object dbedtId: TDBEdit
          Left = 88
          Top = 112
          Width = 105
          Height = 19
          Color = clGray
          Ctl3D = False
          DataField = 'ZAKAZ_ID'
          DataSource = DM.dsZakazi
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
        object dbedtuser: TDBEdit
          Left = 40
          Top = 136
          Width = 153
          Height = 19
          Color = clGray
          Ctl3D = False
          DataField = 'USER_NAME'
          DataSource = DM.dsZakazi
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
      end
    end
  end
end
