object DM: TDM
  OldCreateOrder = False
  Left = 26
  Top = 65523
  Height = 589
  Width = 745
  object IBDatabase: TIBDatabase
    DatabaseName = ':i:\element\Sklad.gdb'
    Params.Strings = (
      'user_name=admin'
      'password=1')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = [tfConnect]
    AfterConnect = IBDatabaseAfterConnect
    AfterDisconnect = IBDatabaseAfterDisconnect
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
  object qryConsole: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 24
    Top = 120
  end
  object dsQryConsole: TDataSource
    DataSet = qryConsole
    Left = 96
    Top = 288
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
    Left = 320
    Top = 376
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
    Left = 400
    Top = 376
  end
  object qryComponents: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from components'
      'order by name')
    Left = 560
    Top = 256
    object qryComponentsCOMPONENT_ID: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 5
      FieldName = 'COMPONENT_ID'
      Origin = 'COMPONENTS.COMPONENT_ID'
      Required = True
      Visible = False
    end
    object qryComponentsNAME: TIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 45
      FieldName = 'NAME'
      Origin = 'COMPONENTS.NAME'
      Required = True
      Size = 200
    end
    object qryComponentsUSER_NAME: TIBStringField
      DisplayLabel = 'User'
      DisplayWidth = 15
      FieldName = 'USER_NAME'
      Origin = 'COMPONENTS.USER_NAME'
      Size = 45
    end
  end
  object qryCard: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select i.*,e.name, e.unit_izmerenie,e.numer,'
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
    object qryCardINFO_ID: TIntegerField
      FieldName = 'INFO_ID'
      Origin = 'INFO.INFO_ID'
      Required = True
    end
    object qryCardNUM_P_P: TIntegerField
      FieldName = 'NUM_P_P'
      Origin = 'INFO.NUM_P_P'
      Required = True
    end
    object qryCardTHEDATE: TDateTimeField
      FieldName = 'THEDATE'
      Origin = 'INFO.THEDATE'
    end
    object qryCardNUM_DOC: TIBStringField
      FieldName = 'NUM_DOC'
      Origin = 'INFO.NUM_DOC'
      Size = 30
    end
    object qryCardCOST_FOR_ONE: TFloatField
      FieldName = 'COST_FOR_ONE'
      Origin = 'INFO.COST_FOR_ONE'
    end
    object qryCardFROM_WHOM: TIBStringField
      FieldName = 'FROM_WHOM'
      Origin = 'INFO.FROM_WHOM'
      Size = 100
    end
    object qryCardARRIVAL: TFloatField
      FieldName = 'ARRIVAL'
      Origin = 'INFO.ARRIVAL'
    end
    object qryCardCHARGE: TFloatField
      FieldName = 'CHARGE'
      Origin = 'INFO.CHARGE'
    end
    object qryCardOSTATOK: TFloatField
      FieldName = 'OSTATOK'
      Origin = 'INFO.OSTATOK'
    end
    object qryCardELEMENT_ID: TIntegerField
      FieldName = 'ELEMENT_ID'
      Origin = 'INFO.ELEMENT_ID'
    end
    object qryCardUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Origin = 'INFO.USER_NAME'
      Size = 45
    end
    object qryCardNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'ELEMENTS.NAME'
      Size = 500
    end
    object qryCardUNIT_IZMERENIE: TIBStringField
      FieldName = 'UNIT_IZMERENIE'
      Origin = 'ELEMENTS.UNIT_IZMERENIE'
      Size = 10
    end
    object qryCardNUMER: TIBStringField
      FieldName = 'NUMER'
      Origin = 'ELEMENTS.NUMER'
      Required = True
      Size = 35
    end
    object qryCardTYPE_NAME: TIBStringField
      FieldName = 'TYPE_NAME'
      Size = 200
    end
    object qryCardCOST: TFloatField
      FieldName = 'COST'
    end
  end
  object qrytypes_by_comp: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT t.*'
      'FROM types  t'
      'WHERE t.component_id=:comp_id')
    Left = 560
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'comp_id'
        ParamType = ptUnknown
      end>
    object qrytypes_by_compTYPE_ID: TIntegerField
      FieldName = 'TYPE_ID'
      Origin = 'TYPES.TYPE_ID'
      Required = True
      Visible = False
    end
    object qrytypes_by_compNAME: TIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 45
      FieldName = 'NAME'
      Origin = 'TYPES.NAME'
      Size = 200
    end
    object qrytypes_by_compCOMPONENT_ID: TIntegerField
      FieldName = 'COMPONENT_ID'
      Origin = 'TYPES.COMPONENT_ID'
      Visible = False
    end
    object qrytypes_by_compUSER_NAME: TIBStringField
      DisplayLabel = 'User'
      DisplayWidth = 15
      FieldName = 'USER_NAME'
      Origin = 'TYPES.USER_NAME'
      Size = 45
    end
  end
  object dsQryType_by_comp: TDataSource
    DataSet = qrytypes_by_comp
    Left = 632
    Top = 328
  end
  object qryElems_by_type: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select i.ostatok,'
      ''
      'e.*'
      'from '
      '(elements e left join info i on e.element_id=i.element_id) '
      'where '
      
        '((i.num_p_p = (select max(num_p_p) from info where element_id=e.' +
        'element_id)) '
      'or '
      '   (i.num_p_p is null))'
      'and e.type_id=:type_id'
      'order by name')
    Left = 560
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
    object qryElems_by_typeELEMENT_ID: TIntegerField
      FieldName = 'ELEMENT_ID'
      Origin = 'ELEMENTS.ELEMENT_ID'
      Required = True
      Visible = False
    end
    object qryElems_by_typeNAME: TIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 45
      FieldName = 'NAME'
      Origin = 'ELEMENTS.NAME'
      Size = 100
    end
    object qryElems_by_typeUNIT_IZMERENIE: TIBStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      DisplayWidth = 8
      FieldName = 'UNIT_IZMERENIE'
      Origin = 'ELEMENTS.UNIT_IZMERENIE'
      Size = 10
    end
    object qryElems_by_typeNUMER: TIBStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 10
      FieldName = 'NUMER'
      Origin = 'ELEMENTS.NUMER'
      Required = True
      Size = 35
    end
    object qryElems_by_typeOSTATOK: TFloatField
      DisplayLabel = #1042' '#1085#1072#1083#1080#1095#1080#1080
      DisplayWidth = 5
      FieldName = 'OSTATOK'
      Origin = 'INFO.OSTATOK'
    end
    object qryElems_by_typeTYPE_ID: TIntegerField
      FieldName = 'TYPE_ID'
      Origin = 'ELEMENTS.TYPE_ID'
      Visible = False
    end
    object qryElems_by_typeINFO: TIBStringField
      DisplayLabel = #1050#1088#1072#1090#1082#1072#1103' '#1080#1085#1092'-'#1103
      DisplayWidth = 45
      FieldName = 'INFO'
      Origin = 'ELEMENTS.INFO'
      FixedChar = True
      Size = 255
    end
    object qryElems_by_typeUSER_NAME: TIBStringField
      DisplayLabel = 'User'
      DisplayWidth = 15
      FieldName = 'USER_NAME'
      Origin = 'ELEMENTS.USER_NAME'
      Size = 45
    end
  end
  object dsQryElem_by_type: TDataSource
    DataSet = qryElems_by_type
    Left = 632
    Top = 384
  end
  object dsQryInfo_by_elem: TDataSource
    DataSet = qryInfo_by_elem
    Left = 632
    Top = 440
  end
  object qryInfo_by_elem: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT i.num_p_p,                i.thedate,'
      '               i.num_doc,'
      '               i.cost_for_one,'
      '               i.from_whom,'
      '               i.arrival,'
      '               i.charge,'
      '               i.ostatok,'
      '               i.info_id'
      'FROM  info i '
      'WHERE element_id=:element_id'
      'order by i.num_p_p')
    Left = 560
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'element_id'
        ParamType = ptUnknown
      end>
    object qryInfo_by_elemNUM_P_P: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      DisplayWidth = 6
      FieldName = 'NUM_P_P'
      Origin = 'INFO.NUM_P_P'
      Required = True
    end
    object qryInfo_by_elemTHEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'THEDATE'
      Origin = 'INFO.THEDATE'
    end
    object qryInfo_by_elemNUM_DOC: TIBStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 15
      FieldName = 'NUM_DOC'
      Origin = 'INFO.NUM_DOC'
      Size = 30
    end
    object qryInfo_by_elemFROM_WHOM: TIBStringField
      DisplayLabel = #1054#1090' '#1082#1086#1075#1086' '#1087#1086#1083#1091#1095#1077#1085#1086' ('#1082#1086#1084#1091' '#1074#1099#1076#1072#1085#1086')'
      DisplayWidth = 40
      FieldName = 'FROM_WHOM'
      Origin = 'INFO.FROM_WHOM'
      Size = 100
    end
    object qryInfo_by_elemCOST_FOR_ONE: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1079#1072' '#1077#1076#1080#1085#1080#1094#1091
      DisplayWidth = 5
      FieldName = 'COST_FOR_ONE'
      Origin = 'INFO.COST_FOR_ONE'
    end
    object qryInfo_by_elemARRIVAL: TFloatField
      DisplayLabel = #1055#1088#1080#1093#1086#1076
      DisplayWidth = 8
      FieldName = 'ARRIVAL'
      Origin = 'INFO.ARRIVAL'
    end
    object qryInfo_by_elemCHARGE: TFloatField
      DisplayLabel = #1056#1072#1089#1093#1086#1076
      DisplayWidth = 8
      FieldName = 'CHARGE'
      Origin = 'INFO.CHARGE'
    end
    object qryInfo_by_elemOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 8
      FieldName = 'OSTATOK'
      Origin = 'INFO.OSTATOK'
    end
    object qryInfo_by_elemINFO_ID: TIntegerField
      FieldName = 'INFO_ID'
      Origin = 'INFO.INFO_ID'
      Required = True
      Visible = False
    end
  end
  object cdsZakazi: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsProviderZakazi'
    Left = 432
    Top = 192
    object cdsZakaziZAKAZ_ID: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 5
      FieldName = 'ZAKAZ_ID'
      Required = True
      Visible = False
    end
    object cdsZakaziFROM_WHOM: TStringField
      DisplayLabel = #1054#1090' '#1082#1086#1075#1086
      DisplayWidth = 25
      FieldName = 'FROM_WHOM'
      Size = 100
    end
    object cdsZakaziFOR_WHAT: TStringField
      DisplayLabel = #1044#1083#1103' '#1082#1072#1082#1086#1081' '#1094#1077#1083#1080
      DisplayWidth = 25
      FieldName = 'FOR_WHAT'
      Size = 100
    end
    object cdsZakaziTHEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'THEDATE'
    end
    object cdsZakaziUSER_NAME: TStringField
      DisplayLabel = 'User'
      DisplayWidth = 15
      FieldName = 'USER_NAME'
      Size = 50
    end
  end
  object dsProviderZakazi: TDataSetProvider
    DataSet = qryAllZakazi
    Constraints = True
    Left = 512
    Top = 192
  end
  object dsCdsZAkazi: TDataSource
    DataSet = cdsZakazi
    Left = 360
    Top = 192
  end
  object tblRequests: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'REQUEST_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ZAKAZ_ID'
        DataType = ftInteger
      end
      item
        Name = 'ELEMENT_ID'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'COL'
        DataType = ftFloat
      end
      item
        Name = 'USER_NAME'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY18'
        Fields = 'REQUEST_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN19'
        Fields = 'ELEMENT_ID'
      end
      item
        Name = 'RDB$FOREIGN20'
        Fields = 'ZAKAZ_ID'
      end>
    IndexFieldNames = 'ZAKAZ_ID'
    MasterFields = 'ZAKAZ_ID'
    StoreDefs = True
    TableName = 'REQUESTS'
    Left = 296
    Top = 328
    object tblRequestsREQUEST_ID: TIntegerField
      DisplayLabel = #8470
      DisplayWidth = 5
      FieldName = 'REQUEST_ID'
      Required = True
    end
    object tblRequestsluElemName: TStringField
      DisplayLabel = #1048#1084#1103' '#1101#1083#1077#1084#1077#1085#1090#1072
      FieldKind = fkLookup
      FieldName = 'luElemName'
      LookupDataSet = qryAllElements
      LookupKeyFields = 'ELEMENT_ID'
      LookupResultField = 'NAME'
      KeyFields = 'ELEMENT_ID'
      Size = 25
      Lookup = True
    end
    object tblRequestsZAKAZ_ID: TIntegerField
      FieldName = 'ZAKAZ_ID'
      Visible = False
    end
    object tblRequestsELEMENT_ID: TIntegerField
      FieldName = 'ELEMENT_ID'
      Visible = False
    end
    object tblRequestsNAME: TIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077', '#1089#1086#1088#1090', '#1088#1072#1079#1084#1077#1088
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 50
    end
    object tblRequestsCOL: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'COL'
    end
    object tblRequestsUSER_NAME: TIBStringField
      DisplayLabel = 'USER'
      DisplayWidth = 10
      FieldName = 'USER_NAME'
      Size = 50
    end
  end
  object dsRequests: TDataSource
    DataSet = tblRequests
    Left = 360
    Top = 328
  end
  object qryZakazi_by_user: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from zakazi'
      'where user_name=:user'
      'order by zakaz_id')
    Left = 360
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end>
    object qryZakazi_by_userZAKAZ_ID: TIntegerField
      DisplayLabel = #8470
      DisplayWidth = 5
      FieldName = 'ZAKAZ_ID'
      Origin = 'ZAKAZI.ZAKAZ_ID'
      Required = True
      Visible = False
    end
    object qryZakazi_by_userFROM_WHOM: TIBStringField
      DisplayLabel = #1054#1090' '#1082#1086#1075#1086
      DisplayWidth = 25
      FieldName = 'FROM_WHOM'
      Origin = 'ZAKAZI.FROM_WHOM'
      Size = 100
    end
    object qryZakazi_by_userFOR_WHAT: TIBStringField
      DisplayLabel = #1044#1083#1103' '#1082#1072#1082#1086#1081' '#1094#1077#1083#1080
      DisplayWidth = 25
      FieldName = 'FOR_WHAT'
      Origin = 'ZAKAZI.FOR_WHAT'
      Size = 100
    end
    object qryZakazi_by_userTHEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'THEDATE'
      Origin = 'ZAKAZI.THEDATE'
    end
    object qryZakazi_by_userUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Origin = 'ZAKAZI.USER_NAME'
      Visible = False
      Size = 50
    end
  end
  object dsQryZakazi_by_user: TDataSource
    DataSet = qryZakazi_by_user
    Left = 448
    Top = 128
  end
  object qryWork: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 16
    Top = 8
  end
  object dsqryWork: TDataSource
    DataSet = qryWork
    Left = 56
    Top = 65520
  end
  object qryAllElements: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from elements'
      '')
    Left = 240
    Top = 336
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
      'and element_id=:element_id'
      'order by name')
    Left = 320
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'element_id'
        ParamType = ptUnknown
      end>
    object qryElementsELEMENT_ID: TIntegerField
      FieldName = 'ELEMENT_ID'
      Origin = 'ELEMENTS.ELEMENT_ID'
      Required = True
      Visible = False
    end
    object qryElementsNUMER: TIBStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 9
      FieldName = 'NUMER'
      Origin = 'ELEMENTS.NUMER'
      Required = True
      Size = 35
    end
    object qryElementsNAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 35
      FieldName = 'NAME'
      Origin = 'ELEMENTS.NAME'
      Size = 100
    end
    object qryElementsUNIT_IZMERENIE: TIBStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      DisplayWidth = 6
      FieldName = 'UNIT_IZMERENIE'
      Origin = 'ELEMENTS.UNIT_IZMERENIE'
      Size = 10
    end
    object qryElementsOSTATOK: TFloatField
      DisplayLabel = #1042' '#1085#1072#1083#1080#1095#1080#1080
      DisplayWidth = 6
      FieldName = 'OSTATOK'
      Origin = 'INFO.OSTATOK'
    end
    object qryElementsF_1: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1079#1072' '#1077#1076#1080#1085#1080#1094#1091
      DisplayWidth = 6
      FieldName = 'F_1'
    end
    object qryElementsTYPE_ID: TIntegerField
      FieldName = 'TYPE_ID'
      Origin = 'ELEMENTS.TYPE_ID'
      Visible = False
    end
    object qryElementsluTypeName: TStringField
      DisplayLabel = #1058#1080#1087
      FieldKind = fkLookup
      FieldName = 'luTypeName'
      LookupKeyFields = 'TYPE_ID'
      LookupResultField = 'NAME'
      KeyFields = 'TYPE_ID'
      Size = 25
      Lookup = True
    end
    object qryElementsINFO: TIBStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 45
      FieldName = 'INFO'
      Origin = 'ELEMENTS.INFO'
      FixedChar = True
      Size = 32000
    end
    object qryElementsUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Origin = 'ELEMENTS.USER_NAME'
      Visible = False
      Size = 45
    end
  end
  object dsqryElements: TDataSource
    DataSet = qryElements
    Left = 400
    Top = 424
  end
  object dsQryCardZakaz: TDataSource
    DataSet = qryCardZakaz
    Left = 80
    Top = 512
  end
  object qryCardZakaz: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select e.*, z.*,r.*,'
      '(select i.cost_for_one '
      'from info i'
      'where i.num_p_p = (select max(num_p_p) from info i'
      
        '                                where cost_for_one <>0 and not(c' +
        'ost_for_one is null) and i.element_id=e.element_id)'
      'and i.element_id=e.element_id'
      ''
      ')'
      'from'
      'zakazi z inner join (requests r inner join elements e '
      ' on r.element_id=e.element_id) on z.zakaz_id = r.zakaz_id'
      'where z.zakaz_id=:zakaz_id'
      'order by r.name')
    Left = 136
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'zakaz_id'
        ParamType = ptUnknown
      end>
  end
  object dsQryComponents: TDataSource
    DataSet = qryComponents
    Left = 632
    Top = 272
  end
  object qryUpdateElem: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update elements'
      'set name=:name,'
      '     unit_izmerenie=:unit_izmr,'
      '     numer=:numer,'
      '     info=:info,'
      '     type_id=:type_id'
      'where element_id =:element_id     ')
    Left = 16
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'element_id'
        ParamType = ptUnknown
      end>
  end
  object qryDelete_Element: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'execute procedure delete_element(:element_id)')
    Left = 96
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'element_id'
        ParamType = ptUnknown
      end>
  end
  object qryAddElem: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'execute procedure add_element(:elem_name,:Unit_izmr,:type_id,:nu' +
        'mer,:info,:user)')
    Left = 128
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'elem_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_izmr'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end>
  end
  object qryAddInfo: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'execute procedure add_info(:Edate,:Enum_doc,:EFrom_Whom,:cost,:A' +
        'rrival,:Charge,:elem_id,:user);')
    Left = 128
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Edate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enum_doc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EFrom_Whom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Arrival'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Charge'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'elem_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateInfo: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update info'
      'set thedate=:thedate,'
      '     num_doc=:num_doc,'
      '     from_whom=:from_whom,'
      '     cost_for_one=:cost_for_one'
      'where info_id =:info_id     ')
    Left = 16
    Top = 400
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
        Name = 'from_whom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cost_for_one'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'info_id'
        ParamType = ptUnknown
      end>
  end
  object qryAddLink: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'execute procedure add_link(:elem_id,:link,:LinkInfo,:user)')
    Left = 184
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'elem_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'link'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LinkInfo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end>
  end
  object qryDELete_info: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from info'
      'where info_id=:info_id')
    Left = 96
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'info_id'
        ParamType = ptUnknown
      end>
  end
  object qryLinks_by_elem: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from links'
      'where element_id=:element_id'
      'order by link')
    Left = 392
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'element_id'
        ParamType = ptUnknown
      end>
  end
  object dsQryLinks_by_elem: TDataSource
    DataSet = qryLinks_by_elem
    Left = 464
    Top = 288
  end
  object qryUpdateLink: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update links'
      'set info=:info,'
      '      link=:link'
      'where link_id=:link_id')
    Left = 16
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'info'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'link'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'link_id'
        ParamType = ptUnknown
      end>
  end
  object qryAddDetali: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'execute procedure add_detali(:elem_id,:type_name,:resistance,:do' +
        'pusk,:tks,:user)')
    Left = 184
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'elem_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'resistance'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopusk'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end>
  end
  object qryDetali_by_elem: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from detali'
      'where element_id=:element_id')
    Left = 376
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'element_id'
        ParamType = ptUnknown
      end>
  end
  object dsQryDetali_by_elem: TDataSource
    DataSet = qryDetali_by_elem
    Left = 440
    Top = 488
  end
  object qryUpdateDetali: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update detali'
      'set type_name=:type_name,'
      '     resistance=:resistance,'
      '     dopusk=:dopusk,'
      '     TKS=:TKS'
      'where detali_id =:detali_id')
    Left = 16
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'type_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'resistance'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dopusk'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TKS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'detali_id'
        ParamType = ptUnknown
      end>
  end
  object qryTypesMoveTo: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQryComponents
    SQL.Strings = (
      'select * from types'
      'where COMPONENT_ID=:COMPONENT_ID')
    Left = 520
    Top = 486
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'component_id'
        ParamType = ptUnknown
      end>
  end
  object dsQryTypeMoveTo: TDataSource
    DataSet = qryTypesMoveTo
    Left = 584
    Top = 496
  end
  object qryDElete_Type: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'execute procedure delete_type(:type_id)')
    Left = 104
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryDelete_Link: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from links'
      'where link_id=:link_id'
      'and user_name=:user_name')
    Left = 96
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'link_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user_name'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateType: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update types'
      'set name=:name,'
      '     component_id=:component_id'
      'where type_id =:type_id     ')
    Left = 16
    Top = 486
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'component_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryAddType: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'execute procedure add_type(:type_name,:comp_name,:user);')
    Left = 24
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'type_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'comp_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end>
  end
  object qryDelete_comp: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'execute procedure delete_component(:comp_name)')
    Left = 160
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'comp_name'
        ParamType = ptUnknown
      end>
  end
  object qryAddComp: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'execute procedure add_component(:comp_name,:user)')
    Left = 64
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'comp_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateComp: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update components'
      'set name=:name'
      'where   component_id=:component_id'
      '')
    Left = 168
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'component_id'
        ParamType = ptUnknown
      end>
  end
  object qryAddRequest: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'execute procedure ADD_request(:zakaz_id,:element_id,:name,:col,:' +
        'user)')
    Left = 16
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'zakaz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'element_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'col'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end>
  end
  object qryAddZakaz: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'execute procedure add_zakaz(:from_whom,:for_what,:thedate,:user)')
    Left = 32
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'from_whom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'for_what'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'thedate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user'
        ParamType = ptUnknown
      end>
  end
  object qryMaxZakaz_id: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select max(zakaz_id) from zakazi')
    Left = 32
    Top = 264
  end
  object qryUpdateZakaz: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update zakazi'
      'set from_whom=:from_whom,'
      '     for_what=:for_what,'
      '     thedate=:thedate'
      'where zakaz_id =:zakaz_id')
    Left = 160
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'from_whom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'for_what'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'thedate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'zakaz_id'
        ParamType = ptUnknown
      end>
  end
  object qryComponents_by_name: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * '
      'from components '
      'where name=:name '
      'order by name')
    Left = 104
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end>
  end
  object qryInsertIntoOstatki: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'insert into Ostatki (name,nowdate) values(:name,:nowdate)')
    Left = 104
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nowdate'
        ParamType = ptUnknown
      end>
  end
  object qryTypes_by_comp_id: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select name,type_id '
      'from types where component_id =:component_id '
      'order by name')
    Left = 216
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'component_id'
        ParamType = ptUnknown
      end>
  end
  object qryOstatki_by_type: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ostatki_by_type(:type_id)'
      'order by name')
    Left = 304
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryFuLLinsertIntoOstatki: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'insert into ostatki (num_p_p,name,ostatok,unit_izmerenie,nowdate' +
        ') '
      'values(:num_p_p,:name,:ostatok,:unit_izmr,:thedate)')
    Left = 224
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'num_p_p'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ostatok'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmr'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'thedate'
        ParamType = ptUnknown
      end>
  end
  object qryTypes_by_name: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select name,type_id from types '
      'where type_id =:type_id'
      'order by name')
    Left = 96
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
  object qryElemMax_num_p_p: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select e.name,e.unit_izmerenie,i.* '
      
        'from elements e inner join  info i on e.element_id=i.element_id ' +
        'where element_id=:element_id and num_p_p =(select max(num_p_p) f' +
        'rom info where element_id=e.element_id) '
      'order by name')
    Left = 96
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'element_id'
        ParamType = ptUnknown
      end>
  end
  object qryComponentsOstatki: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from components order by name')
    Left = 216
    Top = 128
  end
  object qryRequests_by_zakaz: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from requests'
      'where zakaz_id=:zakaz_id')
    Left = 560
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'zakaz_id'
        ParamType = ptUnknown
      end>
    object qryRequests_by_zakazREQUEST_ID: TIntegerField
      FieldName = 'REQUEST_ID'
      Origin = 'REQUESTS.REQUEST_ID'
      Required = True
      Visible = False
    end
    object qryRequests_by_zakazluElem_name: TStringField
      DisplayLabel = #1048#1084#1103' '#1101#1083#1077#1084#1077#1085#1090#1072
      FieldKind = fkLookup
      FieldName = 'luElem_name'
      LookupDataSet = qryAllElements
      LookupKeyFields = 'ELEMENT_ID'
      LookupResultField = 'NAME'
      KeyFields = 'ELEMENT_ID'
      Size = 25
      Lookup = True
    end
    object qryRequests_by_zakazZAKAZ_ID: TIntegerField
      FieldName = 'ZAKAZ_ID'
      Origin = 'REQUESTS.ZAKAZ_ID'
      Visible = False
    end
    object qryRequests_by_zakazELEMENT_ID: TIntegerField
      FieldName = 'ELEMENT_ID'
      Origin = 'REQUESTS.ELEMENT_ID'
      Visible = False
    end
    object qryRequests_by_zakazNAME: TIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077', '#1089#1086#1088#1090', '#1088#1072#1079#1084#1077#1088
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'REQUESTS.NAME'
      Size = 50
    end
    object qryRequests_by_zakazCOL: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      DisplayWidth = 5
      FieldName = 'COL'
      Origin = 'REQUESTS.COL'
    end
    object qryRequests_by_zakazUSER_NAME: TIBStringField
      DisplayLabel = 'User'
      DisplayWidth = 15
      FieldName = 'USER_NAME'
      Origin = 'REQUESTS.USER_NAME'
      Size = 50
    end
  end
  object dsQryRequests_by_zakaz: TDataSource
    DataSet = qryRequests_by_zakaz
    Left = 648
    Top = 112
  end
  object qryUpdateRequest: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update requests'
      'set name=:name,'
      '     col=:col,'
      '     element_id=:element_id'
      'where request_id =:request_id')
    Left = 248
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'col'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'element_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'request_id'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteZakaz: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'execute procedure delete_zakaz(:zakaz_id)')
    Left = 240
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'zakaz_id'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteRequest: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from requests'
      'where request_id=:request_id')
    Left = 248
    Top = 496
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'request_id'
        ParamType = ptUnknown
      end>
  end
  object qryAllZakazi: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from zakazi')
    Left = 592
    Top = 192
  end
  object qryTypes_by_comp_id_name: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from types '
      'where component_id  = :component_id and name=:name')
    Left = 288
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'component_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end>
  end
  object qrySrez_by_elem_id: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select srez_id,num_p_p,date_of_srez from srez where element_id=:' +
        'id_elem'
      ' and num_p_p = :num_p_p')
    Left = 560
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_elem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_p_p'
        ParamType = ptUnknown
      end>
  end
  object qryInsertIntoCard: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'insert into Card (num_p_p,thedate,num_doc,from_whom,arrival,char' +
        'ge,ostatok,name,type_name,cost_for_one,unit_izmerenie,numer)  va' +
        'lues(:num_p_p,:thedate,:num_doc,:from_whom,:arrival,:charge,:ost' +
        'atok,:nam,:type_name,:cost_for_one,:unit_izmerenie,:numer)')
    Left = 640
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'num_p_p'
        ParamType = ptUnknown
      end
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
        Name = 'nam'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cost_for_one'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unit_izmerenie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numer'
        ParamType = ptUnknown
      end>
  end
  object qryOstatok_By_elem_id: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ostatok from elements e inner join info i on e.element_id' +
        '=i.element_id'
      
        'where num_p_p=(select max(num_p_p) from info where element_id=:e' +
        'lement_id)'
      'and e.element_id=:element_id')
    Left = 304
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'element_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'element_id'
        ParamType = ptUnknown
      end>
  end
  object qryComp_name_by_type_id: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select c.name from components c inner join types t on c.componen' +
        't_id=t.component_id'
      'where type_id=:type_id')
    Left = 304
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'type_id'
        ParamType = ptUnknown
      end>
  end
end
