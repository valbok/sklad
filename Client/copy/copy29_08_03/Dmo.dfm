object DM: TDM
  OldCreateOrder = False
  Left = 33
  Top = 85
  Height = 468
  Width = 736
  object IBDatabase: TIBDatabase
    DatabaseName = ':i:\element\Sklad.gdb'
    Params.Strings = (
      'user_name=admin'
      'password=1')
    DefaultTransaction = IBTransaction
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = [tfConnect]
    BeforeConnect = IBDatabaseBeforeConnect
    Left = 224
    Top = 8
  end
  object IBTransaction: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase
    AutoStopAction = saNone
    Left = 296
    Top = 8
  end
  object qryWork: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 16
    Top = 8
  end
  object dsComponents: TDataSource
    DataSet = tblComponents
    Left = 320
    Top = 72
  end
  object dsqryWork: TDataSource
    DataSet = qryWork
    Left = 64
    Top = 8
  end
  object dsTypes: TDataSource
    DataSet = tblTypes
    Left = 320
    Top = 120
  end
  object dsInfo: TDataSource
    DataSet = tblInfo
    Left = 320
    Top = 216
  end
  object dsElements: TDataSource
    DataSet = tblElements
    Left = 320
    Top = 168
  end
  object tblComponents: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COMPONENT_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'COMPONENT_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$2'
        Fields = 'NAME'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'COMPONENTS'
    Left = 240
    Top = 72
    object tblComponentsCOMPONENT_ID: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 7
      FieldName = 'COMPONENT_ID'
      Required = True
      Visible = False
    end
    object tblComponentsNAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 50
      FieldName = 'NAME'
      Size = 200
    end
  end
  object tblTypes: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'TYPE_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'COMPONENT_ID'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY3'
        Fields = 'TYPE_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN4'
        Fields = 'COMPONENT_ID'
      end>
    StoreDefs = True
    TableName = 'TYPES'
    Left = 240
    Top = 120
    object tblTypesTYPE_ID: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 7
      FieldName = 'TYPE_ID'
      Required = True
      Visible = False
    end
    object tblTypesNAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 25
      FieldName = 'NAME'
      Size = 200
    end
    object tblTypesLUComponent_id: TStringField
      DisplayLabel = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1077#1077
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'LUComponent_Name'
      LookupDataSet = tblComponents
      LookupKeyFields = 'COMPONENT_ID'
      LookupResultField = 'NAME'
      KeyFields = 'COMPONENT_ID'
      Size = 200
      Lookup = True
    end
    object tblTypesCOMPONENT_ID: TIntegerField
      FieldName = 'COMPONENT_ID'
      Visible = False
    end
  end
  object tblElements: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ELEMENT_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'UNIT_IZMERENIE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TYPE_ID'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY5'
        Fields = 'ELEMENT_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN6'
        Fields = 'TYPE_ID'
      end>
    StoreDefs = True
    TableName = 'ELEMENTS'
    Left = 240
    Top = 168
    object tblElementsELEMENT_ID: TIntegerField
      FieldName = 'ELEMENT_ID'
      Required = True
    end
    object tblElementsNAME: TIBStringField
      FieldName = 'NAME'
      Size = 100
    end
    object tblElementsUNIT_IZMERENIE: TIBStringField
      FieldName = 'UNIT_IZMERENIE'
      Size = 10
    end
    object tblElementsTYPE_ID: TIntegerField
      FieldName = 'TYPE_ID'
    end
  end
  object tblInfo: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'INFO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NUM_P_P'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'THEDATE'
        DataType = ftDateTime
      end
      item
        Name = 'NUM_DOC'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COST_FOR_ONE'
        DataType = ftFloat
      end
      item
        Name = 'FROM_WHOM'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ARRIVAL'
        DataType = ftFloat
      end
      item
        Name = 'CHARGE'
        DataType = ftFloat
      end
      item
        Name = 'OSTATOK'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'ELEMENT_ID'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY7'
        Fields = 'INFO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN8'
        Fields = 'ELEMENT_ID'
      end>
    StoreDefs = True
    TableName = 'INFO'
    Left = 240
    Top = 216
    object tblInfoINFO_ID: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      DisplayWidth = 6
      FieldName = 'INFO_ID'
      Required = True
      Visible = False
    end
    object tblInfoNUM_P_P: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      DisplayWidth = 6
      FieldName = 'NUM_P_P'
      Required = True
    end
    object tblInfoTHEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 15
      FieldName = 'THEDATE'
    end
    object tblInfoNUM_DOC: TIBStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 10
      FieldName = 'NUM_DOC'
      Size = 12
    end
    object tblInfoFROM_WHOM: TIBStringField
      DisplayLabel = #1054#1090' '#1082#1086#1075#1086' '#1087#1086#1083#1091#1095#1077#1085#1086' ('#1082#1086#1084#1091' '#1074#1099#1076#1072#1085#1086')'
      DisplayWidth = 40
      FieldName = 'FROM_WHOM'
      Size = 100
    end
    object tblInfoCOST_FOR_ONE: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1079#1072' '#1077#1076#1080#1085#1080#1094#1091
      FieldName = 'COST_FOR_ONE'
    end
    object tblInfoELEMENT_ID: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'ELEMENT_ID'
      Visible = False
    end
    object tblInfoARRIVAL: TFloatField
      DisplayLabel = #1055#1088#1080#1093#1086#1076
      FieldName = 'ARRIVAL'
    end
    object tblInfoCHARGE: TFloatField
      DisplayLabel = #1056#1072#1089#1093#1086#1076
      FieldName = 'CHARGE'
    end
    object tblInfoOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldKind = fkInternalCalc
      FieldName = 'OSTATOK'
      ReadOnly = True
      Precision = 6
    end
  end
  object dsClientDSElem: TDataSource
    DataSet = ClientDSElem
    Left = 136
    Top = 144
  end
  object ClientDSElem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 136
    Top = 96
    object ClientDSElemNAME: TStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 20
      FieldName = 'NAME'
      Size = 100
    end
    object ClientDSElemUNIT_IZMERENIE: TStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      DisplayWidth = 6
      FieldName = 'UNIT_IZMERENIE'
      Size = 10
    end
    object ClientDSElemF_1: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1079#1072' '#1077#1076#1080#1085#1080#1094#1091
      DisplayWidth = 6
      FieldName = 'F_1'
    end
    object ClientDSElemOSTATOK: TFloatField
      DisplayLabel = #1042' '#1085#1072#1083#1080#1095#1080#1080
      DisplayWidth = 6
      FieldName = 'OSTATOK'
      Precision = 6
    end
    object ClientDSElemELEMENT_ID: TIntegerField
      FieldName = 'ELEMENT_ID'
      Required = True
      Visible = False
    end
    object ClientDSElemTYPE_ID: TIntegerField
      FieldName = 'TYPE_ID'
      Visible = False
    end
    object ClientDSElemLUType_name: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 35
      FieldKind = fkLookup
      FieldName = 'LUType_name'
      LookupDataSet = tblTypes
      LookupKeyFields = 'TYPE_ID'
      LookupResultField = 'NAME'
      KeyFields = 'TYPE_ID'
      Size = 200
      Lookup = True
    end
  end
  object DataSetProvider: TDataSetProvider
    DataSet = qryElements
    Constraints = True
    Left = 184
    Top = 96
  end
  object qryEdit: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select e.* ,i.ostatok,t.name,'
      '(select i.cost_for_one '
      'from info i'
      ' where  i.num_p_p = (select max(num_p_p) '
      '                                   from info'
      
        '                                 where  element_id=:pelement_id ' +
        'and cost_for_one <> 0 and not(cost_for_one is null) ) '
      'and element_id=:pelement_id)'
      ''
      ''
      
        'FROM types t right JOIN (elements e left join info i on e.elemen' +
        't_id=i.element_id) ON t.type_ID=e.type_ID'
      'where '
      '   (element_id=:pelement_id and '
      
        '         i.num_p_p = (select max(num_p_p) from info where       ' +
        '     element_id=e.element_id)) '
      'or'
      '   (e.element_id=:pelement_id and  i.num_p_p is null)')
    Left = 16
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pelement_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pelement_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pelement_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pelement_id'
        ParamType = ptUnknown
      end>
    object qryEditELEMENT_ID: TIntegerField
      FieldName = 'ELEMENT_ID'
      Origin = 'ELEMENTS.ELEMENT_ID'
      Required = True
    end
    object qryEditNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'ELEMENTS.NAME'
      Size = 100
    end
    object qryEditUNIT_IZMERENIE: TIBStringField
      FieldName = 'UNIT_IZMERENIE'
      Origin = 'ELEMENTS.UNIT_IZMERENIE'
      Size = 10
    end
    object qryEditTYPE_ID: TIntegerField
      FieldName = 'TYPE_ID'
      Origin = 'ELEMENTS.TYPE_ID'
    end
    object qryEditOSTATOK: TFloatField
      FieldName = 'OSTATOK'
      Origin = 'INFO.OSTATOK'
      Precision = 6
    end
    object qryEditNAME1: TIBStringField
      FieldName = 'NAME1'
      Origin = 'TYPES.NAME'
      Size = 200
    end
    object qryEditF_1: TFloatField
      FieldName = 'F_1'
    end
  end
  object dsQryEdit: TDataSource
    DataSet = qryEdit
    Left = 64
    Top = 56
  end
  object qryInfoForEdit: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from info'
      'where element_id=:pelement_id'
      'order by num_p_p')
    Left = 16
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pelement_id'
        ParamType = ptInput
      end>
    object qryInfoForEditINFO_ID: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 4
      FieldName = 'INFO_ID'
      Origin = 'INFO.INFO_ID'
      Required = True
      Visible = False
    end
    object qryInfoForEditNUM_P_P: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      DisplayWidth = 5
      FieldName = 'NUM_P_P'
      Origin = 'INFO.NUM_P_P'
      Required = True
    end
    object qryInfoForEditTHEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'THEDATE'
      Origin = 'INFO.THEDATE'
    end
    object qryInfoForEditNUM_DOC: TIBStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 8
      FieldName = 'NUM_DOC'
      Origin = 'INFO.NUM_DOC'
      Size = 30
    end
    object qryInfoForEditCOST_FOR_ONE: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1079#1072' '#1077#1076#1080#1085#1080#1094#1091
      DisplayWidth = 6
      FieldName = 'COST_FOR_ONE'
      Origin = 'INFO.COST_FOR_ONE'
    end
    object qryInfoForEditFROM_WHOM: TIBStringField
      DisplayLabel = #1054#1090' '#1082#1086#1075#1086' '#1087#1086#1083#1091#1095#1077#1085#1086
      DisplayWidth = 25
      FieldName = 'FROM_WHOM'
      Origin = 'INFO.FROM_WHOM'
      Size = 100
    end
    object qryInfoForEditARRIVAL: TFloatField
      DisplayLabel = #1055#1088#1080#1093#1086#1076
      DisplayWidth = 6
      FieldName = 'ARRIVAL'
      Origin = 'INFO.ARRIVAL'
    end
    object qryInfoForEditCHARGE: TFloatField
      DisplayLabel = #1056#1072#1089#1093#1086#1076
      DisplayWidth = 6
      FieldName = 'CHARGE'
      Origin = 'INFO.CHARGE'
    end
    object qryInfoForEditOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 6
      FieldKind = fkInternalCalc
      FieldName = 'OSTATOK'
      Origin = 'INFO.OSTATOK'
      ReadOnly = True
      Precision = 6
    end
    object qryInfoForEditELEMENT_ID: TIntegerField
      DisplayWidth = 4
      FieldName = 'ELEMENT_ID'
      Origin = 'INFO.ELEMENT_ID'
      Visible = False
    end
  end
  object dsQryInfo: TDataSource
    DataSet = qryInfoForEdit
    Left = 80
    Top = 104
  end
  object Monitor: TIBSQLMonitor
    OnSQL = MonitorSQL
    TraceFlags = [tfConnect]
    Left = 176
    Top = 24
  end
  object qryOstatki: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 16
    Top = 160
  end
  object dsQryOstatki: TDataSource
    DataSet = qryOstatki
    Left = 72
    Top = 160
  end
  object qryConsole: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 24
    Top = 288
  end
  object dsQryConsole: TDataSource
    DataSet = qryConsole
    Left = 96
    Top = 288
  end
  object qryFindComponents: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from components'
      'where name like :name'
      'order by name')
    Left = 32
    Top = 224
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
  object qryInfoOrderBy: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsElements
    SQL.Strings = (
      'select * from info '
      'where element_id =:element_id'
      'order by num_p_p')
    Left = 24
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ELEMENT_ID'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryInfoOrderByINFO_ID: TIntegerField
      FieldName = 'INFO_ID'
      Origin = 'INFO.INFO_ID'
      Required = True
      Visible = False
    end
    object qryInfoOrderByNUM_P_P: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'NUM_P_P'
      Origin = 'INFO.NUM_P_P'
      Required = True
    end
    object qryInfoOrderByTHEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'THEDATE'
      Origin = 'INFO.THEDATE'
    end
    object qryInfoOrderByNUM_DOC: TIBStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 10
      FieldName = 'NUM_DOC'
      Origin = 'INFO.NUM_DOC'
      Size = 30
    end
    object qryInfoOrderByCOST_FOR_ONE: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1079#1072' '#1077#1076#1080#1085#1080#1094#1091
      DisplayWidth = 6
      FieldName = 'COST_FOR_ONE'
      Origin = 'INFO.COST_FOR_ONE'
    end
    object qryInfoOrderByFROM_WHOM: TIBStringField
      DisplayLabel = #1054#1090' '#1082#1086#1075#1086' '#1087#1086#1083#1091#1095#1077#1085#1086' ('#1082#1086#1084#1091' '#1074#1099#1076#1072#1085#1086')'
      DisplayWidth = 35
      FieldName = 'FROM_WHOM'
      Origin = 'INFO.FROM_WHOM'
      Size = 100
    end
    object qryInfoOrderByARRIVAL: TFloatField
      DisplayLabel = #1055#1088#1080#1093#1086#1076
      DisplayWidth = 8
      FieldName = 'ARRIVAL'
      Origin = 'INFO.ARRIVAL'
    end
    object qryInfoOrderByCHARGE: TFloatField
      DisplayLabel = #1056#1072#1089#1093#1086#1076
      DisplayWidth = 8
      FieldName = 'CHARGE'
      Origin = 'INFO.CHARGE'
    end
    object qryInfoOrderByOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 8
      FieldName = 'OSTATOK'
      Origin = 'INFO.OSTATOK'
      Precision = 6
    end
    object qryInfoOrderByELEMENT_ID: TIntegerField
      FieldName = 'ELEMENT_ID'
      Origin = 'INFO.ELEMENT_ID'
      Visible = False
    end
  end
  object dsQryInfoOrder: TDataSource
    DataSet = qryInfoOrderBy
    Left = 104
    Top = 360
  end
  object qryElements: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select i.ostatok,'
      '(select i.cost_for_one '
      'from info i'
      'where i.num_p_p = (select max(num_p_p) from info i'
      
        '                                where cost_for_one <>0 and not(c' +
        'ost_for_one is null) and i.element_id=e.element_id)'
      'and i.element_id=e.element_id'
      ''
      '),'
      ''
      'e.*'
      'from types t inner join'
      
        '(elements e left join info i on e.element_id=i.element_id) on t.' +
        'type_id=e.type_id'
      
        'where (i.num_p_p = (select max(num_p_p) from info where element_' +
        'id=e.element_id)) '
      'or '
      '   (i.num_p_p is null)'
      'order by name')
    Left = 240
    Top = 272
  end
  object dsqryElements: TDataSource
    DataSet = qryElements
    Left = 320
    Top = 272
  end
  object qryAddSrez: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select i.cost_for_one '
      'from info i'
      'where i.num_p_p = (select max(num_p_p) from info'
      '               where '
      '           (i.cost_for_one <> 0  '
      'and'
      ' element_id=:pelement_id) '
      ''
      
        'or ( not( i.cost_for_one is null)      and (element_id=:pelement' +
        '_id))'
      'and (element_id=:pelement_id)'
      ')')
    Left = 224
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pelement_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pelement_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pelement_id'
        ParamType = ptUnknown
      end>
  end
  object dsQryAddSrez: TDataSource
    DataSet = qryAddSrez
    Left = 304
    Top = 344
  end
  object dsQryFindComponents: TDataSource
    DataSet = qryFindComponents
    Left = 144
    Top = 224
  end
  object dsQryFindTypes_by_nameT: TDataSource
    DataSet = qryFindTypes_by_nameT
    Left = 512
    Top = 104
  end
  object qryFindTypes_by_nameT: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * '
      'from types '
      'where name like :name')
    Left = 400
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end>
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
      LookupDataSet = tblComponents
      LookupKeyFields = 'COMPONENT_ID'
      LookupResultField = 'NAME'
      KeyFields = 'COMPONENT_ID'
      Size = 30
      Lookup = True
    end
  end
  object qryComponents: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from components'
      'order by name')
    Left = 168
    Top = 288
  end
  object qryFindTypes_by_nameC: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from types t'
      
        'where t.component_id = (select component_id from components c wh' +
        'ere c.name like :name)')
    Left = 408
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end>
    object qryFindTypes_by_nameCNAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 30
      FieldName = 'NAME'
      Origin = 'TYPES.NAME'
      Size = 200
    end
    object qryFindTypes_by_nameCCOMPONENT_ID: TIntegerField
      FieldName = 'COMPONENT_ID'
      Origin = 'TYPES.COMPONENT_ID'
      Visible = False
    end
    object qryFindTypes_by_nameCLUNameC: TStringField
      DisplayLabel = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1077#1077
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'LUNameC'
      LookupDataSet = tblComponents
      LookupKeyFields = 'COMPONENT_ID'
      LookupResultField = 'NAME'
      KeyFields = 'COMPONENT_ID'
      Size = 35
      Lookup = True
    end
  end
  object dsQryFindTypes_by_nameC: TDataSource
    DataSet = qryFindTypes_by_nameC
    Left = 416
    Top = 168
  end
  object qryFindElem_by_name: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select e.*,i.ostatok'
      'from elements e left join info i on e.element_id=i.element_id'
      'where ((name like :name)'
      'or (unit_izmerenie like :unit_izmerenie))'
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
    Left = 400
    Top = 296
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
        Name = 'presence'
        ParamType = ptUnknown
      end>
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
      LookupDataSet = tblTypes
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
  end
  object dsQryFindElem_by_name: TDataSource
    DataSet = qryFindElem_by_name
    Left = 400
    Top = 344
  end
  object qryFindElem_by_nameT: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from elements  e'
      
        'where e.type_id = (select type_id from types t where t.name like' +
        ' :name)')
    Left = 520
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end>
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
      LookupDataSet = tblTypes
      LookupKeyFields = 'TYPE_ID'
      LookupResultField = 'NAME'
      KeyFields = 'TYPE_ID'
      Size = 30
      Lookup = True
    end
  end
  object dsQryFindElem_by_nameT: TDataSource
    DataSet = qryFindElem_by_nameT
    Left = 512
    Top = 312
  end
  object qryFindInfo_by_date: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
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
    Left = 600
    Top = 184
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
    object qryFindInfo_by_dateLuEl: TStringField
      DisplayLabel = #1069#1083#1077#1084#1077#1085#1090
      FieldKind = fkLookup
      FieldName = 'LuEl'
      LookupDataSet = tblElements
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
    Left = 536
    Top = 160
  end
  object qryFindInfo_by_elem: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select i.* '
      'from info i '
      
        'where i.element_id = (select element_id from elements where name' +
        ' = :nameE)')
    Left = 648
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nameE'
        ParamType = ptUnknown
      end>
    object qryFindInfo_by_elemluem: TStringField
      DisplayLabel = #1069#1083#1077#1084#1077#1085#1090
      FieldKind = fkLookup
      FieldName = 'luem'
      LookupDataSet = tblElements
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
    Left = 648
    Top = 312
  end
  object Ost: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    AfterClose = OstAfterClose
    BufferChunks = 1000
    CachedUpdates = False
    StoreDefs = True
    TableName = 'OSTATKI'
    Left = 384
    Top = 8
    object OstID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object OstNUM_P_P: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      DisplayWidth = 6
      FieldName = 'NUM_P_P'
    end
    object OstNAME: TIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'NAME'
      Size = 200
    end
    object OstOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'OSTATOK'
      Precision = 6
    end
    object OstUNIT_IZMERENIE: TIBStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'UNIT_IZMERENIE'
    end
  end
  object dsOst: TDataSource
    DataSet = Ost
    Left = 432
    Top = 8
  end
  object qryCard: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select i.*,e.name, e.unit_izmerenie,'
      ''
      '(select t.name '
      ''
      
        'from types t inner join components c on c.component_id=t.compone' +
        'nt_id'
      ' where t.type_id=e.type_id) type_name,'
      ''
      '(select i.cost_for_one '
      'from info i'
      ' where  i.num_p_p = (select max(num_p_p) '
      '                                   from info'
      
        '                                 where  element_id=:pelement_id ' +
        'and cost_for_one <> 0 and not(cost_for_one is null) ) '
      'and element_id=:pelement_id) cost'
      ''
      'from info i inner join elements e  on i.element_id=e.element_id'
      'where e.element_id =:pelement_id'
      'order by num_p_p')
    Left = 496
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pelement_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pelement_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pelement_id'
        ParamType = ptUnknown
      end>
  end
  object tblCard: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'NUM_P_P'
        DataType = ftInteger
      end
      item
        Name = 'THEDATE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUM_DOC'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FROM_WHOM'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ARRIVAL'
        DataType = ftFloat
      end
      item
        Name = 'CHARGE'
        DataType = ftFloat
      end
      item
        Name = 'OSTATOK'
        DataType = ftFloat
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TYPE_NAME'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'COST_FOR_ONE'
        DataType = ftFloat
      end
      item
        Name = 'UNIT_IZMERENIE'
        DataType = ftString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'CARD'
    Left = 376
    Top = 64
    object tblCardNUM_P_P: TIntegerField
      FieldName = 'NUM_P_P'
    end
    object tblCardTHEDATE: TIBStringField
      FieldName = 'THEDATE'
    end
    object tblCardNUM_DOC: TIBStringField
      FieldName = 'NUM_DOC'
    end
    object tblCardFROM_WHOM: TIBStringField
      FieldName = 'FROM_WHOM'
    end
    object tblCardARRIVAL: TFloatField
      FieldName = 'ARRIVAL'
    end
    object tblCardCHARGE: TFloatField
      FieldName = 'CHARGE'
    end
    object tblCardOSTATOK: TFloatField
      FieldName = 'OSTATOK'
    end
    object tblCardNAME: TIBStringField
      FieldName = 'NAME'
    end
    object tblCardTYPE_NAME: TIBStringField
      FieldName = 'TYPE_NAME'
    end
    object tblCardCOST_FOR_ONE: TFloatField
      FieldName = 'COST_FOR_ONE'
    end
    object tblCardUNIT_IZMERENIE: TIBStringField
      FieldName = 'UNIT_IZMERENIE'
    end
  end
  object dsCard: TDataSource
    DataSet = tblCard
    Left = 424
    Top = 64
  end
  object qrytypes_by_comp: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from types_by_component(:comp_name)')
    Left = 600
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'comp_name'
        ParamType = ptUnknown
      end>
    object qrytypes_by_compID: TIntegerField
      FieldName = 'ID'
      Origin = 'TYPES_BY_COMPONENT.ID'
      Visible = False
    end
    object qrytypes_by_compTYPE_NAME: TIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 25
      FieldName = 'TYPE_NAME'
      Origin = 'TYPES_BY_COMPONENT.TYPE_NAME'
      Size = 100
    end
  end
  object dsQryType_by_comp: TDataSource
    DataSet = qrytypes_by_comp
    Left = 656
    Top = 16
  end
  object qryElem_by_type: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from elements_by_type(:type_name)')
    Left = 600
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'type_name'
        ParamType = ptUnknown
      end>
    object qryElem_by_typeID: TIntegerField
      FieldName = 'ID'
      Origin = 'ELEMENTS_BY_TYPE.ID'
      Visible = False
    end
    object qryElem_by_typeELEMENT_NAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 30
      FieldName = 'ELEMENT_NAME'
      Origin = 'ELEMENTS_BY_TYPE.ELEMENT_NAME'
      Size = 100
    end
    object qryElem_by_typeUNIT_IZMERN: TIBStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'UNIT_IZMERN'
      Origin = 'ELEMENTS_BY_TYPE.UNIT_IZMERN'
      Size = 10
    end
    object qryElem_by_typeCOST: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1079#1072' '#1077#1076#1080#1085#1080#1094#1091
      FieldName = 'COST'
      Origin = 'ELEMENTS_BY_TYPE.COST'
    end
  end
  object dsQyElem_by_type: TDataSource
    DataSet = qryElem_by_type
    Left = 656
    Top = 72
  end
  object dsQryInfo_by_elem: TDataSource
    DataSet = qryInfo_by_elem
    Left = 664
    Top = 128
  end
  object qryInfo_by_elem: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from info_by_element(:elem_name)')
    Left = 600
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'elem_name'
        ParamType = ptUnknown
      end>
    object qryInfo_by_elemID: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      DisplayWidth = 6
      FieldName = 'ID'
    end
    object qryInfo_by_elemTHEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'THEDATE'
      Origin = 'INFO_BY_ELEMENT.THEDATE'
    end
    object qryInfo_by_elemNUM_DOC: TIBStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 10
      FieldName = 'NUM_DOC'
      Origin = 'INFO_BY_ELEMENT.NUM_DOC'
      Size = 30
    end
    object qryInfo_by_elemCOST: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'COST'
      Origin = 'INFO_BY_ELEMENT.COST'
    end
    object qryInfo_by_elemFROM_WHOM: TIBStringField
      DisplayLabel = #1054#1090' '#1082#1086#1075#1086' '#1087#1086#1083#1091#1095#1077#1085#1086' ('#1082#1086#1084#1091' '#1074#1099#1076#1072#1085#1086')'
      DisplayWidth = 40
      FieldName = 'FROM_WHOM'
      Origin = 'INFO_BY_ELEMENT.FROM_WHOM'
      Size = 100
    end
    object qryInfo_by_elemARRIVAL: TFloatField
      DisplayLabel = #1055#1088#1080#1093#1086#1076
      FieldName = 'ARRIVAL'
      Origin = 'INFO_BY_ELEMENT.ARRIVAL'
    end
    object qryInfo_by_elemCHARGE: TFloatField
      DisplayLabel = #1056#1072#1089#1093#1086#1076
      FieldName = 'CHARGE'
      Origin = 'INFO_BY_ELEMENT.CHARGE'
    end
    object qryInfo_by_elemOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'OSTATOK'
      Origin = 'INFO_BY_ELEMENT.OSTATOK'
    end
  end
end
