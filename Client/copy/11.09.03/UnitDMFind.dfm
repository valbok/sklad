object DMFind: TDMFind
  OldCreateOrder = False
  Left = 129
  Top = 108
  Height = 454
  Width = 660
  object qryFindComponents: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from components'
      'where name like :name'
      'order by name')
    Left = 56
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end>
    object qryFindComponentsCOMPONENT_ID: TIntegerField
      FieldName = 'COMPONENT_ID'
      Origin = 'COMPONENTS.COMPONENT_ID'
      Required = True
      Visible = False
    end
    object qryFindComponentsNAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 45
      FieldName = 'NAME'
      Origin = 'COMPONENTS.NAME'
      Required = True
      Size = 200
    end
  end
  object dsQryFindComponents: TDataSource
    DataSet = qryFindComponents
    Left = 48
    Top = 72
  end
  object qryFindElem_by_name: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select e.*,i.ostatok'
      'from elements e left join info i on e.element_id=i.element_id'
      'where ((name like :name)'
      'or (unit_izmerenie like :unit_izmerenie)'
      'or (Info like :info))'
      ''
      'and'
      '( '
      
        '(i.num_p_p = (select max(num_p_p) from info where element_id=e.e' +
        'lement_id)) '
      'or '
      '   (i.num_p_p is null)'
      ''
      ') or i.ostatok=:presence'
      'order by name')
    Left = 48
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmerenie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'presence'
        ParamType = ptUnknown
      end>
    object qryFindElem_by_nameELEMENT_ID: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      DisplayWidth = 5
      FieldName = 'ELEMENT_ID'
      Origin = 'ELEMENTS.ELEMENT_ID'
      Required = True
    end
    object qryFindElem_by_nameNAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'ELEMENTS.NAME'
      Size = 100
    end
    object qryFindElem_by_nameUNIT_IZMERENIE: TIBStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      DisplayWidth = 6
      FieldName = 'UNIT_IZMERENIE'
      Origin = 'ELEMENTS.UNIT_IZMERENIE'
      Size = 10
    end
    object qryFindElem_by_nameTYPE_ID: TIntegerField
      FieldName = 'TYPE_ID'
      Origin = 'ELEMENTS.TYPE_ID'
      Visible = False
    end
    object qryFindElem_by_nameLUNT: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'LUNT'
      LookupDataSet = DM.tblTypes
      LookupKeyFields = 'TYPE_ID'
      LookupResultField = 'NAME'
      KeyFields = 'TYPE_ID'
      Size = 30
      Lookup = True
    end
    object qryFindElem_by_nameOSTATOK: TFloatField
      DisplayLabel = #1042' '#1085#1072#1083#1080#1095#1080#1080
      DisplayWidth = 6
      FieldName = 'OSTATOK'
      Origin = 'INFO.OSTATOK'
    end
    object qryFindElem_by_nameNUMER: TIBStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 10
      FieldName = 'NUMER'
      Origin = 'ELEMENTS.NUMER'
      Required = True
      Size = 35
    end
    object qryFindElem_by_nameINFO: TIBStringField
      DisplayLabel = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      DisplayWidth = 40
      FieldName = 'INFO'
      Origin = 'ELEMENTS.INFO'
      FixedChar = True
      Size = 32000
    end
  end
  object dsQryFindElem_by_name: TDataSource
    DataSet = qryFindElem_by_name
    Left = 40
    Top = 248
  end
  object qryFindElem_by_nameT: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from elements  e'
      
        'where e.type_id = (select type_id from types t where t.name like' +
        ' :name)')
    Left = 184
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end>
    object qryFindElem_by_nameTELEMENT_ID: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      DisplayWidth = 5
      FieldName = 'ELEMENT_ID'
      Origin = 'ELEMENTS.ELEMENT_ID'
      Required = True
    end
    object qryFindElem_by_nameTNAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'ELEMENTS.NAME'
      Size = 100
    end
    object qryFindElem_by_nameTUNIT_IZMERENIE: TIBStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      DisplayWidth = 6
      FieldName = 'UNIT_IZMERENIE'
      Origin = 'ELEMENTS.UNIT_IZMERENIE'
      Size = 10
    end
    object qryFindElem_by_nameTTYPE_ID: TIntegerField
      FieldName = 'TYPE_ID'
      Origin = 'ELEMENTS.TYPE_ID'
      Visible = False
    end
    object qryFindElem_by_nameTLUN: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'LUN'
      LookupKeyFields = 'TYPE_ID'
      LookupResultField = 'NAME'
      KeyFields = 'TYPE_ID'
      Size = 30
      Lookup = True
    end
    object qryFindElem_by_nameTNUMER: TIBStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 5
      FieldName = 'NUMER'
      Origin = 'ELEMENTS.NUMER'
      Required = True
      Size = 35
    end
    object qryFindElem_by_nameTINFO: TIBStringField
      DisplayLabel = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      DisplayWidth = 40
      FieldName = 'INFO'
      Origin = 'ELEMENTS.INFO'
      FixedChar = True
      Size = 32000
    end
  end
  object dsQryFindElem_by_nameT: TDataSource
    DataSet = qryFindElem_by_nameT
    Left = 176
    Top = 240
  end
  object qryFindInfo_by_elem: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select i.* '
      'from info i '
      
        'where i.element_id = (select element_id from elements where name' +
        ' = :nameE)')
    Left = 416
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nameE'
        ParamType = ptUnknown
      end>
    object qryFindInfo_by_elemINFO_ID: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 4
      FieldName = 'INFO_ID'
      Origin = 'INFO.INFO_ID'
      Required = True
    end
    object qryFindInfo_by_elemluem: TStringField
      DisplayLabel = #1069#1083#1077#1084#1077#1085#1090
      FieldKind = fkLookup
      FieldName = 'luem'
      LookupKeyFields = 'ELEMENT_ID'
      LookupResultField = 'NAME'
      KeyFields = 'ELEMENT_ID'
      Size = 25
      Lookup = True
    end
    object qryFindInfo_by_elemNUM_P_P: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      DisplayWidth = 6
      FieldName = 'NUM_P_P'
      Origin = 'INFO.NUM_P_P'
      Required = True
    end
    object qryFindInfo_by_elemTHEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 6
      FieldName = 'THEDATE'
      Origin = 'INFO.THEDATE'
    end
    object qryFindInfo_by_elemNUM_DOC: TIBStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 10
      FieldName = 'NUM_DOC'
      Origin = 'INFO.NUM_DOC'
      Size = 30
    end
    object qryFindInfo_by_elemCOST_FOR_ONE: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1079#1072' '#1077#1076#1080#1085#1080#1094#1091
      DisplayWidth = 6
      FieldName = 'COST_FOR_ONE'
      Origin = 'INFO.COST_FOR_ONE'
      Required = True
    end
    object qryFindInfo_by_elemFROM_WHOM: TIBStringField
      DisplayLabel = #1054#1090' '#1082#1086#1075#1086' '#1087#1086#1083#1091#1095#1077#1085#1086' ('#1082#1086#1084#1091' '#1074#1099#1076#1072#1085#1086')'
      DisplayWidth = 30
      FieldName = 'FROM_WHOM'
      Origin = 'INFO.FROM_WHOM'
      Size = 100
    end
    object qryFindInfo_by_elemARRIVAL: TFloatField
      DisplayLabel = #1055#1088#1080#1093#1086#1076
      DisplayWidth = 6
      FieldName = 'ARRIVAL'
      Origin = 'INFO.ARRIVAL'
    end
    object qryFindInfo_by_elemCHARGE: TFloatField
      DisplayLabel = #1056#1072#1089#1093#1086#1076
      DisplayWidth = 6
      FieldName = 'CHARGE'
      Origin = 'INFO.CHARGE'
    end
    object qryFindInfo_by_elemOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 6
      FieldName = 'OSTATOK'
      Origin = 'INFO.OSTATOK'
    end
    object qryFindInfo_by_elemELEMENT_ID: TIntegerField
      FieldName = 'ELEMENT_ID'
      Origin = 'INFO.ELEMENT_ID'
      Visible = False
    end
  end
  object dsQryFindInfoByElem: TDataSource
    DataSet = qryFindInfo_by_elem
    Left = 432
    Top = 248
  end
  object qryFindInfo_by_date: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from info i'
      'where ((i.thedate like :TheDate) or'
      '(i.num_doc like :num_doc) or'
      '(i.num_p_p=:num_p_p) or'
      '(i.from_whom like :from_whom) or'
      '(i.arrival=:arrival) or'
      '(i.charge =:charge) or'
      '(i.ostatok=:ostatok) or'
      '(i.cost_for_one =:cost_for_one))')
    Left = 304
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'thedate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_doc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_p_p'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'from_whom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'arrival'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'charge'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ostatok'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cost_for_one'
        ParamType = ptUnknown
      end>
    object qryFindInfo_by_dateINFO_ID: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 4
      FieldName = 'INFO_ID'
      Origin = 'INFO.INFO_ID'
      Required = True
    end
    object qryFindInfo_by_dateLuEl: TStringField
      DisplayLabel = #1069#1083#1077#1084#1077#1085#1090
      FieldKind = fkLookup
      FieldName = 'LuEl'
      LookupKeyFields = 'ELEMENT_ID'
      LookupResultField = 'NAME'
      KeyFields = 'ELEMENT_ID'
      Size = 35
      Lookup = True
    end
    object qryFindInfo_by_dateNUM_P_P: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      DisplayWidth = 5
      FieldName = 'NUM_P_P'
      Origin = 'INFO.NUM_P_P'
      Required = True
    end
    object qryFindInfo_by_dateTHEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 8
      FieldName = 'THEDATE'
      Origin = 'INFO.THEDATE'
    end
    object qryFindInfo_by_dateNUM_DOC: TIBStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 10
      FieldName = 'NUM_DOC'
      Origin = 'INFO.NUM_DOC'
      Size = 30
    end
    object qryFindInfo_by_dateCOST_FOR_ONE: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1079#1072' '#1077#1076#1080#1085#1080#1094#1091
      DisplayWidth = 8
      FieldName = 'COST_FOR_ONE'
      Origin = 'INFO.COST_FOR_ONE'
      Required = True
    end
    object qryFindInfo_by_dateFROM_WHOM: TIBStringField
      DisplayLabel = #1054#1090' '#1082#1086#1075#1086' '#1087#1086#1083#1091#1095#1077#1085#1086' ('#1082#1086#1084#1091' '#1074#1099#1076#1072#1085#1086')'
      DisplayWidth = 40
      FieldName = 'FROM_WHOM'
      Origin = 'INFO.FROM_WHOM'
      Size = 100
    end
    object qryFindInfo_by_dateARRIVAL: TFloatField
      DisplayLabel = #1055#1088#1080#1093#1086#1076
      DisplayWidth = 6
      FieldName = 'ARRIVAL'
      Origin = 'INFO.ARRIVAL'
    end
    object qryFindInfo_by_dateCHARGE: TFloatField
      DisplayLabel = #1056#1072#1089#1093#1086#1076
      DisplayWidth = 6
      FieldName = 'CHARGE'
      Origin = 'INFO.CHARGE'
    end
    object qryFindInfo_by_dateOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 6
      FieldName = 'OSTATOK'
      Origin = 'INFO.OSTATOK'
    end
    object qryFindInfo_by_dateELEMENT_ID: TIntegerField
      FieldName = 'ELEMENT_ID'
      Origin = 'INFO.ELEMENT_ID'
      Visible = False
    end
  end
  object dsQryFindInfo_by_date: TDataSource
    DataSet = qryFindInfo_by_date
    Left = 304
    Top = 248
  end
  object qryFindTypes_by_nameT: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * '
      'from types '
      'where name like :name')
    Left = 184
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end>
    object qryFindTypes_by_nameTTYPE_ID: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      DisplayWidth = 4
      FieldName = 'TYPE_ID'
      Origin = 'TYPES.TYPE_ID'
      Required = True
    end
    object qryFindTypes_by_nameTNAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 30
      FieldName = 'NAME'
      Origin = 'TYPES.NAME'
      Size = 200
    end
    object qryFindTypes_by_nameTCOMPONENT_ID: TIntegerField
      FieldName = 'COMPONENT_ID'
      Origin = 'TYPES.COMPONENT_ID'
      Visible = False
    end
    object qryFindTypes_by_nameTLUCName: TStringField
      DisplayLabel = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1077#1077
      FieldKind = fkLookup
      FieldName = 'LUCName'
      LookupKeyFields = 'COMPONENT_ID'
      LookupResultField = 'NAME'
      KeyFields = 'COMPONENT_ID'
      Size = 30
      Lookup = True
    end
  end
  object dsQryFindTypes_by_nameT: TDataSource
    DataSet = qryFindTypes_by_nameT
    Left = 176
    Top = 80
  end
  object qryFindTypes_by_nameC: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from types t'
      
        'where t.component_id = (select component_id from components c wh' +
        'ere c.name like :name)')
    Left = 320
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end>
    object qryFindTypes_by_nameCTYPE_ID: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      DisplayWidth = 4
      FieldName = 'TYPE_ID'
      Origin = 'TYPES.TYPE_ID'
      Required = True
    end
    object qryFindTypes_by_nameCCOMPONENT_ID: TIntegerField
      DisplayLabel = 'comp_id'
      DisplayWidth = 5
      FieldName = 'COMPONENT_ID'
      Origin = 'TYPES.COMPONENT_ID'
      Visible = False
    end
    object qryFindTypes_by_nameCNAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 30
      FieldName = 'NAME'
      Origin = 'TYPES.NAME'
      Size = 200
    end
    object qryFindTypes_by_nameCLUNameC: TStringField
      DisplayLabel = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1077#1077
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'LUNameC'
      LookupKeyFields = 'COMPONENT_ID'
      LookupResultField = 'NAME'
      KeyFields = 'COMPONENT_ID'
      Size = 35
      Lookup = True
    end
  end
  object dsQryFindTypes_by_nameC: TDataSource
    DataSet = qryFindTypes_by_nameC
    Left = 320
    Top = 80
  end
end
