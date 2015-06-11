object dmFindElem: TdmFindElem
  OldCreateOrder = False
  Left = 69
  Top = 110
  Height = 451
  Width = 678
  object cdsFind_Elem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsProvaiderQryFind_elem'
    Left = 270
    Top = 56
    object cdsFind_ElemELEMENT_ID: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 5
      FieldName = 'ELEMENT_ID'
      Required = True
    end
    object cdsFind_ElemNAME: TStringField
      DisplayLabel = #1048#1084#1103' '#1101#1083#1077#1084#1077#1085#1090#1072
      DisplayWidth = 25
      FieldName = 'NAME'
      Size = 100
    end
    object cdsFind_ElemUNIT_IZMERENIE: TStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      DisplayWidth = 5
      FieldName = 'UNIT_IZMERENIE'
      Size = 10
    end
    object cdsFind_ElemNUMER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 8
      FieldName = 'NUMER'
      Required = True
      Size = 35
    end
    object cdsFind_ElemTYPE_ID: TIntegerField
      DisplayLabel = #8470' '#1090#1080#1087#1072
      DisplayWidth = 5
      FieldName = 'TYPE_ID'
    end
    object cdsFind_ElemINFO: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 40
      FieldName = 'INFO'
      FixedChar = True
      Size = 255
    end
    object cdsFind_ElemUSER_NAME: TStringField
      DisplayLabel = 'User'
      DisplayWidth = 15
      FieldName = 'USER_NAME'
      Size = 45
    end
  end
  object dsCdsFind_Elem: TDataSource
    DataSet = cdsFind_Elem
    Left = 262
    Top = 112
  end
  object dsProvaiderQryFind_elem: TDataSetProvider
    DataSet = qryEWoCT_name
    Constraints = True
    Left = 262
  end
  object dsQryFind_elem: TDataSource
    DataSet = qryFE_withComp
    Left = 6
    Top = 80
  end
  object qryFE_withComp: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 10000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      #9'   '#9'e.element_id, '
      #9#9'e.name, '
      #9#9'e.unit_izmerenie, '
      #9#9'e.numer, '
      #9#9'e.type_id, '
      #9#9'e.info, '
      #9#9'e.user_name, '
      #9#9'd.resistance, '
      #9#9'd.dopusk, '
      #9#9'd.tks, '
      '                                d.type_name '
      'FROM'
      
        'types t inner join (elements e left join  detali d on e.element_' +
        'id=d.element_id)'
      ' on e.type_id=t.type_id'
      ''
      'where      '
      '('
      '(name like :name1  or name like :name2 or name like :name3)'
      'or'
      '(info like :info1 or info like :info2 or info like :info3)'
      'or'
      '(numer like :numer1 or numer like :numer2 or numer like :numer3)'
      'or'
      
        '(unit_izmerenie like :unit_izmr1 or unit_izmerenie like :unit_iz' +
        'mr2 or unit_izmerenie like :unit_izmr3)'
      'or'
      '(d.dopusk =:dopuskR or d.dopusk<:dopuskM or d.dopusk> :dopuskB)'
      'or'
      
        '(d.type_name like :type_name1 or d.type_name like :type_name2 or' +
        ' d.type_name like :type_name3)'
      'or'
      '(d.tks like :tks1 or d.tks like :tks2 or d.tks like :tks3)'
      'or'
      '(d.Resistance =:RR or  d.Resistance < :RM or d.Resistance > :RB)'
      ')'
      'and'
      '(t.component_id=:comp_id)')
    Left = 6
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'comp_id'
        ParamType = ptUnknown
      end>
    object qryFE_withCompELEMENT_ID: TIntegerField
      DisplayLabel = #1069#1083#1077#1084#1077#1085#1090'_ID'
      DisplayWidth = 5
      FieldName = 'ELEMENT_ID'
      Origin = 'ELEMENTS.ELEMENT_ID'
    end
    object qryFE_withCompNAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 40
      FieldName = 'NAME'
      Origin = 'ELEMENTS.NAME'
      Size = 100
    end
    object qryFE_withCompUNIT_IZMERENIE: TIBStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      DisplayWidth = 5
      FieldName = 'UNIT_IZMERENIE'
      Origin = 'ELEMENTS.UNIT_IZMERENIE'
      Size = 10
    end
    object qryFE_withCompNUMER: TIBStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 10
      FieldName = 'NUMER'
      Origin = 'ELEMENTS.NUMER'
      Size = 35
    end
    object qryFE_withCompTYPE_ID: TIntegerField
      DisplayLabel = #1058#1080#1087'_ID'
      DisplayWidth = 5
      FieldName = 'TYPE_ID'
      Origin = 'ELEMENTS.TYPE_ID'
    end
    object qryFE_withCompINFO: TIBStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 40
      FieldName = 'INFO'
      Origin = 'ELEMENTS.INFO'
      FixedChar = True
      Size = 255
    end
    object qryFE_withCompUSER_NAME: TIBStringField
      DisplayLabel = 'USER'
      DisplayWidth = 20
      FieldName = 'USER_NAME'
      Origin = 'ELEMENTS.USER_NAME'
      Size = 45
    end
    object qryFE_withCompRESISTANCE: TFloatField
      DisplayLabel = #1057#1086#1087#1088#1086#1090#1080#1074#1083#1077#1085#1080#1077
      DisplayWidth = 5
      FieldName = 'RESISTANCE'
      Origin = 'DETALI.RESISTANCE'
    end
    object qryFE_withCompDOPUSK: TFloatField
      DisplayLabel = #1044#1086#1087#1091#1089#1082
      DisplayWidth = 5
      FieldName = 'DOPUSK'
      Origin = 'DETALI.DOPUSK'
    end
    object qryFE_withCompTKS: TIBStringField
      DisplayLabel = #1058#1050#1057
      FieldName = 'TKS'
      Origin = 'DETALI.TKS'
      FixedChar = True
      Size = 2
    end
    object qryFE_withCompTYPE_NAME: TIBStringField
      DisplayLabel = #1048#1084#1103' '#1090#1080#1087#1072' ('#1076#1077#1090#1072#1083#1080')'
      FieldName = 'TYPE_NAME'
      Origin = 'DETALI.TYPE_NAME'
      Size = 100
    end
  end
  object qryFE_withoutComp: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      #9'   '#9'e.element_id, '
      #9#9'e.name, '
      #9#9'e.unit_izmerenie, '
      #9#9'e.numer, '
      #9#9'e.type_id, '
      #9#9'e.info, '
      #9#9'e.user_name, '
      #9#9'd.resistance, '
      #9#9'd.dopusk, '
      #9#9'd.tks, '
      '                                d.type_name '
      'FROM'
      
        'types t inner join (elements e left join  detali d on e.element_' +
        'id=d.element_id)'
      ' on e.type_id=t.type_id'
      ''
      'where      '
      '('
      '(name like :name1  or name like :name2 or name like :name3)'
      'or'
      '(info like :info1 or info like :info2 or info like :info3)'
      'or'
      '(numer like :numer1 or numer like :numer2 or numer like :numer3)'
      'or'
      
        '(unit_izmerenie like :unit_izmr1 or unit_izmerenie like :unit_iz' +
        'mr2 or unit_izmerenie like :unit_izmr3)'
      'or'
      '(d.dopusk =:dopuskR or d.dopusk<:dopuskM or d.dopusk> :dopuskB)'
      'or'
      
        '(d.type_name like :type_name1 or d.type_name like :type_name2 or' +
        ' d.type_name like :type_name3)'
      'or'
      '(d.tks like :tks1 or d.tks like :tks2 or d.tks like :tks3)'
      'or'
      '(d.Resistance =:RR or  d.Resistance < :RM or d.Resistance > :RB)'
      ')'
      '')
    Left = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RB'
        ParamType = ptUnknown
      end>
  end
  object dsQryFE_withoutComp: TDataSource
    DataSet = qryFE_withoutComp
    Left = 96
    Top = 56
  end
  object dsQryFe_withType_id: TDataSource
    DataSet = qryFE_withType_id
    Left = 176
    Top = 72
  end
  object qryFE_withType_id: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      #9'   '#9'e.element_id, '
      #9#9'e.name, '
      #9#9'e.unit_izmerenie, '
      #9#9'e.numer, '
      #9#9'e.type_id, '
      #9#9'e.info, '
      #9#9'e.user_name, '
      #9#9'd.resistance, '
      #9#9'd.dopusk, '
      #9#9'd.tks, '
      '                                d.type_name '
      'FROM'
      
        'types t inner join (elements e left join  detali d on e.element_' +
        'id=d.element_id)'
      ' on e.type_id=t.type_id'
      ''
      'where      '
      '('
      '(name like :name1  or name like :name2 or name like :name3)'
      'or'
      '(info like :info1 or info like :info2 or info like :info3)'
      'or'
      '(numer like :numer1 or numer like :numer2 or numer like :numer3)'
      'or'
      
        '(unit_izmerenie like :unit_izmr1 or unit_izmerenie like :unit_iz' +
        'mr2 or unit_izmerenie like :unit_izmr3)'
      'or'
      '(d.dopusk =:dopuskR or d.dopusk<:dopuskM or d.dopusk> :dopuskB)'
      'or'
      
        '(d.type_name like :type_name1 or d.type_name like :type_name2 or' +
        ' d.type_name like :type_name3)'
      'or'
      '(d.tks like :tks1 or d.tks like :tks2 or d.tks like :tks3)'
      'or'
      '(d.Resistance =:RR or  d.Resistance < :RM or d.Resistance > :RB)'
      ')'
      'and'
      '(t.type_id=:type_id)')
    Left = 168
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWoCT_name: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *'
      'FROM'
      'elements'
      'where      '
      '('
      '(name like :name1  or name like :name2 or name like :name3)'
      ')')
    Left = 24
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name3'
        ParamType = ptUnknown
      end>
  end
  object qryEWoCT_numer: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *'
      'FROM'
      'elements'
      'where      '
      '('
      '(numer like :numer1 or numer like :numer2 or numer like :numer3)'
      ')')
    Left = 168
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numer1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer3'
        ParamType = ptUnknown
      end>
  end
  object qryEWOCT_info: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *'
      'FROM'
      'elements'
      'where      '
      '('
      '(info like :info1 or info like :info2 or info like :info3)'
      ')')
    Left = 96
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'info1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info3'
        ParamType = ptUnknown
      end>
  end
  object qryEWoCT_unit_izmr: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *'
      'FROM'
      'elements'
      'where      '
      '('
      
        '(unit_izmerenie like :unit_izmr1 or unit_izmerenie like :unit_iz' +
        'mr2 or unit_izmerenie like :unit_izmr3)'
      ')')
    Left = 256
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'unit_izmr1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr3'
        ParamType = ptUnknown
      end>
  end
  object qryEWT_name: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *'
      'FROM elements e'
      'where      '
      '('
      
        '(e.name like :name1  or e.name like :name2 or e.name like :name3' +
        ')'
      ')'
      'and type_id=:type_id')
    Left = 24
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWT_info: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *'
      'FROM'
      'elements'
      'where      '
      '('
      '(info like :info1 or info like :info2 or info like :info3)'
      ')'
      'and type_id=:type_id')
    Left = 96
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'info1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWT_numer: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *'
      'FROM elements'
      'where      '
      '('
      '(numer like :numer1 or numer like :numer2 or numer like :numer3)'
      ')'
      'and type_id=:type_id')
    Left = 168
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numer1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWT_unit_izmr: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *'
      'FROM elements'
      'where      '
      '('
      
        '(unit_izmerenie like :unit_izmr1 or unit_izmerenie like :unit_iz' +
        'mr2 or unit_izmerenie like :unit_izmr3)'
      ')'
      'and type_id=:type_id')
    Left = 256
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'unit_izmr1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWC_name: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT e.*'
      'FROM'
      'elements e inner join types t on e.type_id=t.type_id'
      'where      '
      '('
      
        '(e.name like :name1  or e.name like :name2 or e.name like :name3' +
        ')'
      ')'
      'and t.component_id=:comp_id')
    Left = 24
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'comp_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWC_info: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT e.*'
      'FROM'
      'elements e inner join types t on e.type_id=t.type_id'
      'where      '
      '('
      '(info like :info1 or info like :info2 or info like :info3)'
      ')'
      'and t.component_id=:comp_id')
    Left = 96
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'info1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'comp_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWC_numer: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT e.*'
      'FROM'
      'elements e inner join types t on e.type_id=t.type_id'
      'where      '
      '('
      '(numer like :numer1 or numer like :numer2 or numer like :numer3)'
      ')'
      'and t.component_id=:comp_id')
    Left = 168
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numer1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'comp_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWC_unit_izmr: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT e.*'
      'FROM'
      'elements e inner join types t on e.type_id=t.type_id'
      'where      '
      '('
      
        '(unit_izmerenie like :unit_izmr1 or unit_izmerenie like :unit_iz' +
        'mr2 or unit_izmerenie like :unit_izmr3)'
      ')'
      'and t.component_id=:comp_id')
    Left = 256
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'unit_izmr1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'comp_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWoCT_dopusk: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '#9'e.*,'
      #9'd.resistance, '
      #9'd.dopusk, '
      #9'd.tks, '
      '                d.type_name '
      'FROM'
      'elements e left join detali d on e.element_id=d.element_id'
      'where      '
      '(d.dopusk =:dopuskR or d.dopusk<:dopuskM or d.dopusk> :dopuskB)')
    Left = 352
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dopuskR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskB'
        ParamType = ptUnknown
      end>
  end
  object qryEWoCT_type_name: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '#9'e.*,'
      #9'd.resistance, '
      #9'd.dopusk, '
      #9'd.tks, '
      '                d.type_name '
      'FROM'
      'elements e left join detali d on e.element_id=d.element_id'
      'where      '
      
        '(d.type_name like :type_name1 or d.type_name like :type_name2 or' +
        ' d.type_name like :type_name3)')
    Left = 448
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'type_name1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name3'
        ParamType = ptUnknown
      end>
  end
  object qryEWoCT_TKS: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '#9'e.*,'
      #9'd.resistance, '
      #9'd.dopusk, '
      #9'd.tks, '
      '                d.type_name '
      'FROM'
      'elements e left join detali d on e.element_id=d.element_id'
      'where      '
      '(d.tks like :tks1 or d.tks like :tks2 or d.tks like :tks3)')
    Left = 536
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tks1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks3'
        ParamType = ptUnknown
      end>
  end
  object qryEWoCT_R: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '#9'e.*,'
      #9'd.resistance, '
      #9'd.dopusk, '
      #9'd.tks, '
      '                d.type_name '
      'FROM'
      'elements e left join detali d on e.element_id=d.element_id'
      'where      '
      '(d.Resistance =:RR or  d.Resistance < :RM or d.Resistance > :RB)')
    Left = 608
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'RR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RB'
        ParamType = ptUnknown
      end>
  end
  object qryEWT_dopusk: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '#9'e.*,'
      #9'd.resistance, '
      #9'd.dopusk, '
      #9'd.tks, '
      '                d.type_name '
      'FROM'
      'elements e left join detali d on e.element_id=d.element_id'
      'where      '
      '('
      '(d.dopusk =:dopuskR or d.dopusk<:dopuskM or d.dopusk> :dopuskB)'
      ') '
      'and e.type_id=:type_id')
    Left = 352
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dopuskR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWT_type_name: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '#9'e.*,'
      #9'd.resistance, '
      #9'd.dopusk, '
      #9'd.tks, '
      '                d.type_name '
      'FROM'
      'elements e left join detali d on e.element_id=d.element_id'
      'where      '
      '('
      
        '(d.type_name like :type_name1 or d.type_name like :type_name2 or' +
        ' d.type_name like :type_name3)'
      ') '
      'and e.type_id=:type_id')
    Left = 448
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'type_name1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWT_TKS: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '#9'e.*,'
      #9'd.resistance, '
      #9'd.dopusk, '
      #9'd.tks, '
      '                d.type_name '
      'FROM'
      'elements e left join detali d on e.element_id=d.element_id'
      'where      '
      '('
      '(d.tks like :tks1 or d.tks like :tks2 or d.tks like :tks3)'
      ') '
      'and e.type_id=:type_id')
    Left = 536
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tks1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWT_R: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '#9'e.*,'
      #9'd.resistance, '
      #9'd.dopusk, '
      #9'd.tks, '
      '                d.type_name '
      'FROM'
      'elements e left join detali d on e.element_id=d.element_id'
      'where      '
      '('
      '(d.Resistance =:RR or  d.Resistance < :RM or d.Resistance > :RB)'
      ') '
      'and e.type_id=:type_id')
    Left = 608
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'RR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWC_dopusk: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      #9'   '#9'e.element_id, '
      #9#9'e.name, '
      #9#9'e.unit_izmerenie, '
      #9#9'e.numer, '
      #9#9'e.type_id, '
      #9#9'e.info, '
      #9#9'e.user_name, '
      #9#9'd.resistance, '
      #9#9'd.dopusk, '
      #9#9'd.tks, '
      '                                d.type_name '
      'FROM'
      
        'types t inner join (elements e left join  detali d on e.element_' +
        'id=d.element_id)'
      ' on e.type_id=t.type_id'
      'where      '
      '(d.dopusk =:dopuskR or d.dopusk<:dopuskM or d.dopusk> :dopuskB)'
      'and'
      '(t.component_id=:comp_id)')
    Left = 352
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dopuskR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'comp_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWC_type_name: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      #9'   '#9'e.element_id, '
      #9#9'e.name, '
      #9#9'e.unit_izmerenie, '
      #9#9'e.numer, '
      #9#9'e.type_id, '
      #9#9'e.info, '
      #9#9'e.user_name, '
      #9#9'd.resistance, '
      #9#9'd.dopusk, '
      #9#9'd.tks, '
      '                                d.type_name '
      'FROM'
      
        'types t inner join (elements e left join  detali d on e.element_' +
        'id=d.element_id)'
      ' on e.type_id=t.type_id'
      ''
      'where      '
      '('
      
        '(d.type_name like :type_name1 or d.type_name like :type_name2 or' +
        ' d.type_name like :type_name3)'
      ')'
      'and'
      '(t.component_id=:comp_id)')
    Left = 448
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'type_name1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'comp_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWC_TKS: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      #9'   '#9'e.element_id, '
      #9#9'e.name, '
      #9#9'e.unit_izmerenie, '
      #9#9'e.numer, '
      #9#9'e.type_id, '
      #9#9'e.info, '
      #9#9'e.user_name, '
      #9#9'd.resistance, '
      #9#9'd.dopusk, '
      #9#9'd.tks, '
      '                                d.type_name '
      'FROM'
      
        'types t inner join (elements e left join  detali d on e.element_' +
        'id=d.element_id)'
      ' on e.type_id=t.type_id'
      ''
      'where      '
      '('
      '(d.tks like :tks1 or d.tks like :tks2 or d.tks like :tks3)'
      ')'
      'and'
      '(t.component_id=:comp_id)')
    Left = 536
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tks1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'comp_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWC_R: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      #9'   '#9'e.element_id, '
      #9#9'e.name, '
      #9#9'e.unit_izmerenie, '
      #9#9'e.numer, '
      #9#9'e.type_id, '
      #9#9'e.info, '
      #9#9'e.user_name, '
      #9#9'd.resistance, '
      #9#9'd.dopusk, '
      #9#9'd.tks, '
      '                                d.type_name '
      'FROM'
      
        'types t inner join (elements e left join  detali d on e.element_' +
        'id=d.element_id)'
      ' on e.type_id=t.type_id'
      ''
      'where      '
      '('
      '(d.Resistance =:RR or  d.Resistance < :RM or d.Resistance > :RB)'
      ')'
      'and'
      '(t.component_id=:comp_id)')
    Left = 608
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'RR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'comp_id'
        ParamType = ptUnknown
      end>
  end
  object dsPoviderFEWD: TDataSetProvider
    DataSet = qryEWoCT_dopusk
    Constraints = True
    Left = 472
    Top = 8
  end
  object cdsFind_elemWD: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsPoviderFEWD'
    Left = 472
    Top = 64
    object cdsFind_elemWDELEMENT_ID: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 5
      FieldName = 'ELEMENT_ID'
      Required = True
    end
    object cdsFind_elemWDNAME: TStringField
      DisplayLabel = #1048#1084#1103' '#1101#1083#1077#1084#1077#1085#1090#1072
      DisplayWidth = 25
      FieldName = 'NAME'
      Size = 100
    end
    object cdsFind_elemWDUNIT_IZMERENIE: TStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      FieldName = 'UNIT_IZMERENIE'
      Size = 10
    end
    object cdsFind_elemWDNUMER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 8
      FieldName = 'NUMER'
      Required = True
      Size = 35
    end
    object cdsFind_elemWDTYPE_ID: TIntegerField
      DisplayLabel = #8470' '#1090#1080#1087#1072
      DisplayWidth = 5
      FieldName = 'TYPE_ID'
    end
    object cdsFind_elemWDINFO: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
      DisplayWidth = 40
      FieldName = 'INFO'
      FixedChar = True
      Size = 255
    end
    object cdsFind_elemWDUSER_NAME: TStringField
      DisplayLabel = 'USER '#1101#1083#1077#1084#1077#1085#1090
      DisplayWidth = 15
      FieldName = 'USER_NAME'
      Size = 45
    end
    object cdsFind_elemWDRESISTANCE: TFloatField
      DisplayLabel = #1057#1086#1087#1088#1086#1090#1080#1074#1083#1077#1085#1080#1077'/'#1025#1084#1082#1086#1089#1090#1100'/'#1048#1085#1076#1091#1082#1090#1080#1074#1085#1086#1089#1090#1100'('#1054#1084'/'#1087#1060'/'#1085#1043#1085')'
      DisplayWidth = 5
      FieldName = 'RESISTANCE'
    end
    object cdsFind_elemWDDOPUSK: TFloatField
      DisplayLabel = #1044#1086#1087#1091#1089#1082
      DisplayWidth = 5
      FieldName = 'DOPUSK'
    end
    object cdsFind_elemWDTKS: TStringField
      DisplayLabel = #1058#1050#1057'/'#1058#1050#1045'/'#1058#1050#1048
      DisplayWidth = 1
      FieldName = 'TKS'
      FixedChar = True
      Size = 1
    end
    object cdsFind_elemWDTYPE_NAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1082#1086#1088#1087#1091#1089#1072
      DisplayWidth = 20
      FieldName = 'TYPE_NAME'
      Size = 100
    end
  end
  object dsCdsFind_elemWD: TDataSource
    DataSet = cdsFind_elemWD
    Left = 472
    Top = 112
  end
  object qryEWoCT_dopuskBW: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '#9'e.*,'
      #9'd.resistance, '
      #9'd.dopusk, '
      #9'd.tks, '
      '                d.type_name '
      'FROM'
      'elements e left join detali d on e.element_id=d.element_id'
      'where      '
      '(d.dopusk between  :dopuskOt and :dopuskDo)')
    Left = 352
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dopuskOt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskDo'
        ParamType = ptUnknown
      end>
  end
  object qryEWoCT_RBW: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '#9'e.*,'
      #9'd.resistance, '
      #9'd.dopusk, '
      #9'd.tks, '
      '                d.type_name '
      'FROM'
      'elements e left join detali d on e.element_id=d.element_id'
      'where      '
      '(d.Resistance between :ROt and :RDo)'
      '')
    Left = 608
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ROt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RDo'
        ParamType = ptUnknown
      end>
  end
  object qryEWT_dopuskBW: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '#9'e.*,'
      #9'd.resistance, '
      #9'd.dopusk, '
      #9'd.tks, '
      '                d.type_name '
      'FROM'
      'elements e left join detali d on e.element_id=d.element_id'
      'where      '
      '('
      'd.dopusk between :dopuskOt and :dopuskDo'
      ') '
      'and e.type_id=:type_id')
    Left = 352
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dopuskOt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskDo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWC_dopuskBW: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      #9'   '#9'e.element_id, '
      #9#9'e.name, '
      #9#9'e.unit_izmerenie, '
      #9#9'e.numer, '
      #9#9'e.type_id, '
      #9#9'e.info, '
      #9#9'e.user_name, '
      #9#9'd.resistance, '
      #9#9'd.dopusk, '
      #9#9'd.tks, '
      '                                d.type_name '
      'FROM'
      
        'types t inner join (elements e left join  detali d on e.element_' +
        'id=d.element_id)'
      ' on e.type_id=t.type_id'
      'where      '
      '('
      'd.dopusk between :dopuskOt and :dopuskDo'
      ')'
      'and'
      '(t.component_id=:comp_id)')
    Left = 352
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dopuskOt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopuskDo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'comp_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWT_RBW: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '#9'e.*,'
      #9'd.resistance, '
      #9'd.dopusk, '
      #9'd.tks, '
      '                d.type_name '
      'FROM'
      'elements e left join detali d on e.element_id=d.element_id'
      'where      '
      '('
      'd.Resistance between :ROt and :RDo'
      ') '
      'and e.type_id=:type_id')
    Left = 608
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ROt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RDo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryEWC_RBW: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      #9'   '#9'e.element_id, '
      #9#9'e.name, '
      #9#9'e.unit_izmerenie, '
      #9#9'e.numer, '
      #9#9'e.type_id, '
      #9#9'e.info, '
      #9#9'e.user_name, '
      #9#9'd.resistance, '
      #9#9'd.dopusk, '
      #9#9'd.tks, '
      '                                d.type_name '
      'FROM'
      
        'types t inner join (elements e left join  detali d on e.element_' +
        'id=d.element_id)'
      ' on e.type_id=t.type_id'
      ''
      'where      '
      '('
      'd.Resistance between :ROt and :RDo'
      ')'
      'and'
      '(t.component_id=:comp_id)')
    Left = 608
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ROt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RDo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'comp_id'
        ParamType = ptUnknown
      end>
  end
end
