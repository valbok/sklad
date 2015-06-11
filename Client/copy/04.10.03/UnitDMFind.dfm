object DMFind: TDMFind
  OldCreateOrder = False
  Left = 108
  Top = 50
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
    object qryFindComponentsUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Origin = 'COMPONENTS.USER_NAME'
      Visible = False
      Size = 45
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
    object qryFindElem_by_nameUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Origin = 'ELEMENTS.USER_NAME'
      Visible = False
      Size = 45
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
    Left = 136
    Top = 152
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
      LookupDataSet = DM.tblTypes
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
    object qryFindElem_by_nameTUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Origin = 'ELEMENTS.USER_NAME'
      Visible = False
      Size = 45
    end
  end
  object dsQryFindElem_by_nameT: TDataSource
    DataSet = qryFindElem_by_nameT
    Left = 128
    Top = 224
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
    Left = 296
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
      LookupDataSet = DM.qryElements
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
    object qryFindInfo_by_elemUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Origin = 'INFO.USER_NAME'
      Visible = False
      Size = 45
    end
  end
  object dsQryFindInfoByElem: TDataSource
    DataSet = qryFindInfo_by_elem
    Left = 288
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
    Left = 216
    Top = 200
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
      LookupDataSet = DM.qryElements
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
    object qryFindInfo_by_dateUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Origin = 'INFO.USER_NAME'
      Visible = False
      Size = 45
    end
  end
  object dsQryFindInfo_by_date: TDataSource
    DataSet = qryFindInfo_by_date
    Left = 216
    Top = 280
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
    Left = 136
    Top = 40
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
      LookupDataSet = DM.qryComponents
      LookupKeyFields = 'COMPONENT_ID'
      LookupResultField = 'NAME'
      KeyFields = 'COMPONENT_ID'
      Size = 30
      Lookup = True
    end
    object qryFindTypes_by_nameTUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Origin = 'TYPES.USER_NAME'
      Visible = False
      Size = 45
    end
  end
  object dsQryFindTypes_by_nameT: TDataSource
    DataSet = qryFindTypes_by_nameT
    Left = 128
    Top = 96
  end
  object qryFindTypes_by_nameC: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from types t'
      
        'where t.component_id = (select component_id from components c wh' +
        'ere c.name = :name)')
    Left = 232
    Top = 16
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
      LookupDataSet = DM.qryComponents
      LookupKeyFields = 'COMPONENT_ID'
      LookupResultField = 'NAME'
      KeyFields = 'COMPONENT_ID'
      Size = 35
      Lookup = True
    end
    object qryFindTypes_by_nameCUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Origin = 'TYPES.USER_NAME'
      Visible = False
      Size = 45
    end
  end
  object dsQryFindTypes_by_nameC: TDataSource
    DataSet = qryFindTypes_by_nameC
    Left = 232
    Top = 72
  end
  object qryFind_Elem: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 10000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'#9
      #9#9#9'e.element_id,'
      #9#9#9'e.name, '
      #9#9#9'e.unit_izmerenie,'
      #9#9#9'e.numer,'
      #9#9#9'e.type_id,'
      #9#9#9'e.info,'
      #9#9#9'e.user_name,'
      #9#9#9'i.ostatok,'
      #9#9#9'd.resistance,'
      #9#9#9'd.dopusk,'
      #9#9#9'd.tks,'
      '                                                d.type_name'
      'FROM '#9
      #9'(info i right join '
      #9'(elements e left join detali d on e.element_id=d.element_id)'
      #9#9'on i.element_id=e.element_id) '
      #9'where '
      #9'    ( '
      
        '     '#9'   i.num_p_p = (select max(num_p_p) from info where       ' +
        '     '
      #9#9#9'element_id=e.element_id)'
      #9') '
      #9#9'or'
      #9#9'   (i.num_p_p is null)'#9#9)
    Left = 392
    Top = 72
    object qryFind_ElemELEMENT_ID: TIntegerField
      DisplayLabel = #1069#1083#1077#1084#1077#1085#1090'_ID'
      DisplayWidth = 5
      FieldName = 'ELEMENT_ID'
      Origin = 'ELEMENTS.ELEMENT_ID'
    end
    object qryFind_ElemNAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 40
      FieldName = 'NAME'
      Origin = 'ELEMENTS.NAME'
      Size = 100
    end
    object qryFind_ElemUNIT_IZMERENIE: TIBStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      DisplayWidth = 5
      FieldName = 'UNIT_IZMERENIE'
      Origin = 'ELEMENTS.UNIT_IZMERENIE'
      Size = 10
    end
    object qryFind_ElemNUMER: TIBStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 10
      FieldName = 'NUMER'
      Origin = 'ELEMENTS.NUMER'
      Size = 35
    end
    object qryFind_ElemTYPE_ID: TIntegerField
      DisplayLabel = #1058#1080#1087'_ID'
      DisplayWidth = 5
      FieldName = 'TYPE_ID'
      Origin = 'ELEMENTS.TYPE_ID'
    end
    object qryFind_ElemINFO: TIBStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 40
      FieldName = 'INFO'
      Origin = 'ELEMENTS.INFO'
      FixedChar = True
      Size = 255
    end
    object qryFind_ElemUSER_NAME: TIBStringField
      DisplayLabel = 'USER'
      DisplayWidth = 20
      FieldName = 'USER_NAME'
      Origin = 'ELEMENTS.USER_NAME'
      Size = 45
    end
    object qryFind_ElemOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 5
      FieldName = 'OSTATOK'
      Origin = 'INFO.OSTATOK'
    end
    object qryFind_ElemRESISTANCE: TFloatField
      DisplayLabel = #1057#1086#1087#1088#1086#1090#1080#1074#1083#1077#1085#1080#1077
      DisplayWidth = 5
      FieldName = 'RESISTANCE'
      Origin = 'DETALI.RESISTANCE'
    end
    object qryFind_ElemDOPUSK: TFloatField
      DisplayLabel = #1044#1086#1087#1091#1089#1082
      DisplayWidth = 5
      FieldName = 'DOPUSK'
      Origin = 'DETALI.DOPUSK'
    end
    object qryFind_ElemTKS: TIBStringField
      DisplayLabel = #1058#1050#1057
      FieldName = 'TKS'
      Origin = 'DETALI.TKS'
      FixedChar = True
      Size = 2
    end
    object qryFind_ElemTYPE_NAME: TIBStringField
      DisplayLabel = #1048#1084#1103' '#1090#1080#1087#1072' ('#1076#1077#1090#1072#1083#1080')'
      FieldName = 'TYPE_NAME'
      Origin = 'DETALI.TYPE_NAME'
      Size = 100
    end
  end
  object dsQryFind_elem: TDataSource
    DataSet = qryFind_Elem
    Left = 472
    Top = 72
  end
  object qryElems_by_component: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from elems_by_component(:pcomponent_name)')
    Left = 424
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pcomponent_name'
        ParamType = ptUnknown
      end>
  end
  object dsQryElems_by_component: TDataSource
    DataSet = qryElems_by_component
    Left = 488
    Top = 200
  end
  object dsQryElems_by_type: TDataSource
    DataSet = qryElems_by_type
    Left = 488
    Top = 296
  end
  object qryElems_by_type: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from qryElems_by_component')
    Left = 408
    Top = 264
  end
  object cdsFind_Elem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsProvaiderQryFind_elem'
    Left = 344
    Top = 16
    object cdsFind_ElemELEMENT_ID: TIntegerField
      DisplayLabel = #1069#1083#1077#1084#1077#1085#1090'_ID'
      DisplayWidth = 5
      FieldName = 'ELEMENT_ID'
    end
    object cdsFind_ElemNAME: TStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 45
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
      DisplayWidth = 10
      FieldName = 'NUMER'
      Size = 35
    end
    object cdsFind_ElemTYPE_ID: TIntegerField
      DisplayLabel = #1058#1080#1087'_ID'
      DisplayWidth = 5
      FieldName = 'TYPE_ID'
    end
    object cdsFind_ElemINFO: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 25
      FieldName = 'INFO'
      FixedChar = True
      Size = 255
    end
    object cdsFind_ElemUSER_NAME: TStringField
      DisplayLabel = 'USER'
      DisplayWidth = 15
      FieldName = 'USER_NAME'
      Size = 45
    end
    object cdsFind_ElemOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 5
      FieldName = 'OSTATOK'
    end
    object cdsFind_ElemRESISTANCE: TFloatField
      DisplayLabel = #1057#1086#1087#1088#1086#1090#1080#1074#1083#1077#1085#1080#1077
      FieldName = 'RESISTANCE'
    end
    object cdsFind_ElemDOPUSK: TFloatField
      DisplayLabel = #1044#1086#1087#1091#1089#1082
      DisplayWidth = 5
      FieldName = 'DOPUSK'
    end
    object cdsFind_ElemTKS: TStringField
      DisplayLabel = #1058#1050#1057
      FieldName = 'TKS'
      FixedChar = True
      Size = 2
    end
    object cdsFind_ElemTYPE_NAME: TStringField
      DisplayLabel = #1048#1084#1103' '#1090#1080#1087#1072' ('#1076#1077#1090#1072#1083#1080')'
      DisplayWidth = 20
      FieldName = 'TYPE_NAME'
      Size = 100
    end
  end
  object dsProvaiderQryFind_elem: TDataSetProvider
    DataSet = qryFind_Elem
    Constraints = True
    Left = 488
    Top = 24
  end
  object dsCdsFind_Elem: TDataSource
    DataSet = cdsFind_Elem
    Left = 408
    Top = 8
  end
end
