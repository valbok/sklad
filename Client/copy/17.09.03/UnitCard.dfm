object frmCard: TfrmCard
  Left = 104
  Top = 129
  Width = 588
  Height = 363
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1089#1082#1083#1072#1076#1089#1082#1086#1075#1086' '#1091#1095#1105#1090#1072' ('#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103')'
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
    Width = 580
    Height = 336
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BevelWidth = 3
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 0
    object gbElem: TGroupBox
      Left = 7
      Top = 7
      Width = 562
      Height = 90
      Align = alTop
      Caption = #1069#1083#1077#1084#1077#1085#1090':'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 87
        Height = 13
        Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1077#1077':'
      end
      object lTypeElem: TLabel
        Left = 72
        Top = 41
        Width = 22
        Height = 13
        Caption = #1058#1080#1087':'
        Transparent = True
      end
      object Label4: TLabel
        Left = 47
        Top = 62
        Width = 47
        Height = 13
        Caption = #1069#1083#1077#1084#1077#1085#1090':'
      end
      object cbElem: TDBLookupComboBox
        Left = 104
        Top = 60
        Width = 177
        Height = 19
        KeyField = 'ELEMENT_ID'
        ListField = 'NAME;'
        ListSource = DM.dsElements
        TabOrder = 0
      end
      object rbName: TRadioButton
        Left = 288
        Top = 48
        Width = 113
        Height = 17
        Caption = #1048#1084#1103' '#1101#1083#1077#1084#1077#1085#1090#1072
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = rbNameClick
      end
      object rbNUMER: TRadioButton
        Left = 288
        Top = 64
        Width = 113
        Height = 17
        Caption = #1053#1086#1084#1077#1088' '#1101#1083#1077#1084#1077#1085#1090#1072
        TabOrder = 2
        OnClick = rbNUMERClick
      end
      object CBElem_type_name: TDBLookupComboBox
        Left = 104
        Top = 38
        Width = 177
        Height = 19
        Ctl3D = False
        KeyField = 'TYPE_ID'
        ListField = 'NAME'
        ListSource = DM.dsTyp
        ParentCtl3D = False
        TabOrder = 3
      end
      object cbComp: TDBLookupComboBox
        Left = 104
        Top = 16
        Width = 177
        Height = 19
        KeyField = 'COMPONENT_ID'
        ListField = 'NAME'
        ListSource = DM.dsComp
        TabOrder = 4
      end
      object btnClose: TBitBtn
        Left = 464
        Top = 16
        Width = 89
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
      object btnGetInfo: TBitBtn
        Left = 288
        Top = 16
        Width = 169
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' &'#1082#1072#1088#1090#1086#1095#1082#1091' '#1057#1059
        TabOrder = 6
        OnClick = btnGetInfoClick
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
      object btnImportCard: TBitBtn
        Left = 408
        Top = 56
        Width = 145
        Height = 25
        Caption = #1048#1084#1087#1086#1088#1090' '#1082#1072#1088#1090#1086#1095#1082#1080' '#1074' Word'
        TabOrder = 7
        OnClick = btnImportCardClick
      end
    end
    object gridInfo: TDBGrid
      Left = 7
      Top = 97
      Width = 562
      Height = 199
      Align = alClient
      DataSource = DM.dsInfo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = gridInfoDblClick
    end
    object pnlBottom: TPanel
      Left = 7
      Top = 296
      Width = 562
      Height = 29
      Align = alBottom
      BevelInner = bvLowered
      BevelWidth = 2
      BorderWidth = 1
      TabOrder = 2
      object InfoNavigator: TDBNavigator
        Left = 5
        Top = 6
        Width = 552
        Height = 18
        DataSource = DM.dsInfo
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Align = alBottom
        Flat = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
end
