object frmAbout: TfrmAbout
  Left = 214
  Top = 187
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' "'#1057#1082#1083#1072#1076'"'
  ClientHeight = 186
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 186
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BevelWidth = 3
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 0
    object pnlMain2: TPanel
      Left = 7
      Top = 7
      Width = 429
      Height = 168
      Align = alClient
      BevelInner = bvLowered
      BevelWidth = 3
      BorderStyle = bsSingle
      TabOrder = 0
      OnClick = pnlMain2Click
      object Bevel1: TBevel
        Left = 8
        Top = 92
        Width = 409
        Height = 61
        Shape = bsFrame
        Style = bsRaised
      end
      object Label1: TLabel
        Left = 128
        Top = 136
        Width = 155
        Height = 13
        Caption = #1057#1050#1058#1041' '#1069#1083#1077#1084#1077#1085#1090' '#1054#1076#1077#1089#1089#1072' '#169'2003 '
      end
      object Label3: TLabel
        Left = 184
        Top = 112
        Width = 31
        Height = 13
        Caption = 'E-mail:'
      end
      object Label2: TLabel
        Left = 184
        Top = 96
        Width = 225
        Height = 13
        Caption = #1056#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082': '#1044#1086#1088#1086#1097#1091#1082' '#1042#1072#1083#1077#1085#1090#1080#1085' '#1057#1077#1088#1075#1077#1077#1074#1080#1095
      end
      object Bevel2: TBevel
        Left = 110
        Top = 133
        Width = 201
        Height = 19
        Shape = bsFrame
      end
      object Image1: TImage
        Left = 285
        Top = 134
        Width = 16
        Height = 16
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          000010000000010018000000000000030000120B0000120B0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF202020606060808080808080808080202020FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF202020606060808080808080808080808080808080
          808080202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2020206060608080808080
          80606060404040404040404040404040606060808080202020FFFFFFFFFFFFFF
          FFFF202020808080808080606060505050707070808080808080808080808080
          606060606060808080202020FFFFFFFFFFFF808080606060404040808080C0C0
          C0B0B0B0808080808080808080808080808080606060606060808080202020FF
          FFFF202020606060B0B0B0B0B0B0C0C0C0B0B0B0909090808080808080808080
          808080808080606060606060808080202020404040808080B0B0B0B0B0B09090
          9080808080808080808060606060606080808080808080808060606060606080
          808020202080808080808080808080808080808060606020205F7F7F7F7F7F7F
          606060808080808080808080606060202020FFFFFF2020208080808080806060
          605F2020BF00007F003F3F3F7FBFBFBFFFFFFF9F9F9F80808080808080808040
          4040FFFFFFFFFFFF20202080808080808020205F7F3F3FBFBFBFEFEFEFDFDFDF
          DFDFDFEFEFEF9F9F9F808080606060202020FFFFFFFFFFFFFFFFFF2020208080
          80808080BFBFBFDFDFDFDFDFDFDFDFDFEFEFEFDFDFDF7F7F7F202020000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF202020808080808080B0B0B0AFAFEF9F9FDF
          7F7F7F202020000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF202020808080808080707070202020000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF202020202020000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
        Transparent = True
      end
      object lblVEr: TLabel
        Left = 16
        Top = 96
        Width = 16
        Height = 13
        Caption = 'Ver'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object memInfo: TMemo
        Left = 8
        Top = 8
        Width = 409
        Height = 81
        BorderStyle = bsNone
        Color = 15000804
        Ctl3D = False
        Lines.Strings = (
          #1055#1054' '#1057#1082#1083#1072#1076' '
          
            #1055#1088#1077#1076#1085#1072#1079#1085#1072#1095#1077#1085#1072' '#1076#1083#1103' '#1074#1077#1076#1077#1085#1080#1103' '#1089#1082#1083#1072#1076#1089#1082#1086#1075#1086' '#1091#1095#1105#1090#1072'. '#1054#1073#1077#1089#1087#1077#1095#1080#1074#1072#1077#1090' '#1092#1086#1088#1084#1080#1088#1086 +
            #1074#1072#1085#1080#1077', '
          
            #1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077', '#1093#1088#1072#1085#1077#1085#1080#1077' '#1080' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093' '#1086' '#1085#1072#1083#1080#1095#1080#1080' '#1085 +
            #1072' '#1089#1082#1083#1072#1076#1077' '
          #1084#1072#1090#1077#1088#1080#1072#1083#1086#1074' '#1080' '#1082#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1093'.')
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        OnDblClick = memInfoDblClick
      end
      object eMyEmail: TEdit
        Left = 256
        Top = 112
        Width = 121
        Height = 19
        BorderStyle = bsNone
        Color = clBtnFace
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = 'valkov@yandex.ru'
      end
    end
  end
end
