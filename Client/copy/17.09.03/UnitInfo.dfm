object frmInfo: TfrmInfo
  Left = 224
  Top = 132
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091' '#1057#1059'.'
  ClientHeight = 332
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 291
    Height = 332
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BevelWidth = 3
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 0
    object gbCard: TGroupBox
      Left = 13
      Top = 8
      Width = 260
      Height = 249
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1057#1059':'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 176
        Width = 40
        Height = 13
        Caption = #1055#1088#1080#1093#1086#1076':'
      end
      object Label5: TLabel
        Left = 16
        Top = 200
        Width = 39
        Height = 13
        Caption = #1056#1072#1089#1093#1086#1076':'
      end
      object Label6: TLabel
        Left = 16
        Top = 152
        Width = 88
        Height = 13
        Caption = #1062#1077#1085#1072' '#1079#1072' '#1077#1076#1080#1085#1080#1094#1091':'
      end
      object Label7: TLabel
        Left = 16
        Top = 112
        Width = 138
        Height = 13
        Caption = #1054#1090' '#1082#1086#1075#1086' '#1087#1086#1083#1091#1095#1077#1085#1086' ('#1074#1099#1076#1072#1085#1086'):'
      end
      object Label8: TLabel
        Left = 16
        Top = 88
        Width = 71
        Height = 13
        Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
      end
      object Label9: TLabel
        Left = 16
        Top = 224
        Width = 45
        Height = 13
        Caption = #1054#1089#1090#1072#1090#1086#1082':'
      end
      object Label10: TLabel
        Left = 16
        Top = 64
        Width = 29
        Height = 13
        Caption = #1044#1072#1090#1072':'
      end
      object Label11: TLabel
        Left = 16
        Top = 40
        Width = 34
        Height = 13
        Caption = #8470' '#1087'/'#1087':'
      end
      object Bevel: TBevel
        Left = 8
        Top = 16
        Width = 9
        Height = 201
        Shape = bsLeftLine
      end
      object lblElem: TLabel
        Left = 16
        Top = 16
        Width = 47
        Height = 13
        Caption = #1069#1083#1077#1084#1077#1085#1090':'
      end
      object dbedtArrival: TDBEdit
        Left = 128
        Top = 176
        Width = 121
        Height = 19
        DataField = 'ARRIVAL'
        DataSource = DM.dsInfo
        TabOrder = 0
      end
      object dbedtCharge: TDBEdit
        Left = 128
        Top = 200
        Width = 121
        Height = 19
        DataField = 'CHARGE'
        DataSource = DM.dsInfo
        TabOrder = 1
      end
      object dbedtNum_doc: TDBEdit
        Left = 128
        Top = 88
        Width = 121
        Height = 19
        DataField = 'NUM_DOC'
        DataSource = DM.dsInfo
        TabOrder = 2
      end
      object dbedtFrom_whom: TDBEdit
        Left = 16
        Top = 128
        Width = 233
        Height = 19
        DataField = 'FROM_WHOM'
        DataSource = DM.dsInfo
        TabOrder = 3
      end
      object dbedtCost_for_one: TDBEdit
        Left = 160
        Top = 152
        Width = 89
        Height = 19
        DataField = 'COST_FOR_ONE'
        DataSource = DM.dsInfo
        TabOrder = 4
      end
      object dbedtNum_p_p: TDBEdit
        Left = 200
        Top = 40
        Width = 49
        Height = 19
        Color = clGray
        DataField = 'NUM_P_P'
        DataSource = DM.dsInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object dbedtOstatok: TDBEdit
        Left = 128
        Top = 224
        Width = 121
        Height = 19
        Color = clGray
        DataField = 'OSTATOK'
        DataSource = DM.dsInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object dbedtThedate: TDBEdit
        Left = 168
        Top = 64
        Width = 81
        Height = 19
        DataField = 'THEDATE'
        DataSource = DM.dsInfo
        TabOrder = 7
      end
      object dbedtElem: TDBEdit
        Left = 80
        Top = 16
        Width = 169
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
        TabOrder = 8
      end
    end
    object pnlBottom: TPanel
      Left = 7
      Top = 292
      Width = 273
      Height = 29
      Align = alBottom
      BevelInner = bvLowered
      BevelWidth = 2
      BorderWidth = 1
      TabOrder = 1
      object DBLinkNavigator: TDBNavigator
        Left = 5
        Top = 5
        Width = 263
        Height = 19
        DataSource = DM.dsInfo
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Align = alBottom
        Flat = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
    object btnClose: TBitBtn
      Left = 200
      Top = 264
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 2
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
    object btnAddinCard: TBitBtn
      Left = 13
      Top = 264
      Width = 161
      Height = 25
      Caption = '&'#1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1082#1072#1088#1090#1086#1095#1082#1091' '#1057#1059
      TabOrder = 3
      OnClick = btnAddinCardClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B00000001000000000000000000000101
        0100020202000303030004040400050505000606060007070700080808000909
        09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
        1100121212001313130014141400151515001616160017171700181818001919
        19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
        2100222222002323230024242400252525002626260027272700282828002929
        29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
        3100323232003333330034343400353535003636360037373700383838003939
        39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
        4100424242004343430044444400454545004646460047474700484848004949
        49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
        5100525252005353530054545400555555005656560057575700585858005959
        59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
        6100626262006363630064646400656565006666660067676700686868006969
        69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
        7100727272007373730074747400757575007676760077777700787878007979
        79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
        8100828282008383830084848400858585008686860087878700888888008989
        89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
        9100929292009393930094949400959595009696960097979700989898009999
        99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
        A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
        A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
        B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
        B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
        C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
        C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
        D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
        D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
        E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
        E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
        F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
        F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FFFFFFFFFFFFFF0060A3
        A3B173B1732100FFFFFFFFFF0081A3DCDCDC9EDCDCBF7300FFFFFFFF30A3DCDC
        EAEAEADCDCDCBF2100FFFF0081CDEAF8F8F8F8F8EADCDC7300FFFF00A3F8F8F8
        F8F89DF8F8DCDCB100FFFF00A37CEAF8F8F843F8F8EA9E7300FFFF00A3F8F8F8
        F8F843F8F8EADCB100FFFF0081DBF8F8F8F843F8F8EADC7300FFFFFF30B1F8F8
        F8F843F8EADCCD2100FFFFFF0081B1F8F8F843DCDCCD7300FFFFFFFFFF2160A3
        B1B164B1732100FFFFFFFFFFFF218F0060606060008130FFFFFFFFFFFFFFFFFF
        FFBFA300FFFFFFFFFFFFFFFFFFFFFFFFFF4386FFFFFFFFFFFFFF}
    end
  end
end
