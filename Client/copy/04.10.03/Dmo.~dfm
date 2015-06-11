object DM: TDM
  OldCreateOrder = False
  Left = 18
  Top = 37
  Height = 501
  Width = 745
  object IBDatabase: TIBDatabase
    Connected = True
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
    Active = True
    DefaultDatabase = IBDatabase
    AutoStopAction = saNone
    Left = 296
    Top = 8
  end
  object dsComponents: TDataSource
    DataSet = tblComponents
    Left = 320
    Top = 72
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
        DataType = ftString
        Size = 200
      end
      item
        Name = 'USER_NAME'
        DataType = ftString
        Size = 45
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
    object tblComponentsUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Visible = False
      Size = 45
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
      end
      item
        Name = 'USER_NAME'
        DataType = ftString
        Size = 45
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
    object tblTypesUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Visible = False
      Size = 45
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
        Name = 'NUMER'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'TYPE_ID'
        DataType = ftInteger
      end
      item
        Name = 'INFO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'USER_NAME'
        DataType = ftString
        Size = 45
      end>
    IndexDefs = <
      item
        Name = 'RDB$5'
        Fields = 'NUMER'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY6'
        Fields = 'ELEMENT_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN7'
        Fields = 'TYPE_ID'
      end>
    IndexFieldNames = 'TYPE_ID'
    MasterFields = 'TYPE_ID'
    MasterSource = dsTyp
    StoreDefs = True
    TableName = 'ELEMENTS'
    Left = 240
    Top = 168
    object tblElementsELEMENT_ID: TIntegerField
      FieldName = 'ELEMENT_ID'
      Required = True
      Visible = False
    end
    object tblElementsNAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 25
      FieldName = 'NAME'
      Size = 100
    end
    object tblElementsUNIT_IZMERENIE: TIBStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      DisplayWidth = 6
      FieldName = 'UNIT_IZMERENIE'
      Size = 10
    end
    object tblElementsLuTypeName: TStringField
      DisplayLabel = #1058#1080#1087
      FieldKind = fkLookup
      FieldName = 'LuTypeName'
      LookupDataSet = tblTypes
      LookupKeyFields = 'TYPE_ID'
      LookupResultField = 'NAME'
      KeyFields = 'TYPE_ID'
      Size = 25
      Lookup = True
    end
    object tblElementsTYPE_ID: TIntegerField
      FieldName = 'TYPE_ID'
      Visible = False
    end
    object tblElementsNUMER: TIBStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 8
      FieldName = 'NUMER'
      Size = 35
    end
    object tblElementsINFO: TIBStringField
      DisplayLabel = #1050#1088#1072#1090#1082#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      DisplayWidth = 40
      FieldName = 'INFO'
      Visible = False
      Size = 32000
    end
    object tblElementsUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Visible = False
      Size = 45
    end
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
    Left = 176
    Top = 368
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
    Left = 248
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
    Left = 400
    Top = 360
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
    object OstNowDate: TStringField
      FieldName = 'NowDate'
      Visible = False
      Size = 15
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
  end
  object tblCard: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
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
    object tblCardnumer: TStringField
      FieldName = 'numer'
      Size = 25
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
    Left = 584
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
    Top = 32
  end
  object qryElem_by_type: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from elements_by_type(:type_name)')
    Left = 584
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
    Top = 88
  end
  object dsQryInfo_by_elem: TDataSource
    DataSet = qryInfo_by_elem
    Left = 656
    Top = 144
  end
  object qryInfo_by_elem: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from info_by_element(:elem_name)')
    Left = 584
    Top = 128
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
  object tblLinks: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'ELEMENT_ID'
    MasterFields = 'ELEMENT_ID'
    MasterSource = dsElements
    TableName = 'LINKS'
    Left = 536
    Top = 392
    object tblLinksLINK_ID: TIntegerField
      FieldName = 'LINK_ID'
      Required = True
    end
    object tblLinksLINK: TIBStringField
      FieldName = 'LINK'
      Size = 200
    end
    object tblLinksINFO: TIBStringField
      FieldName = 'INFO'
      Size = 200
    end
    object tblLinksELEMENT_ID: TIntegerField
      FieldName = 'ELEMENT_ID'
    end
    object tblLinksUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Size = 45
    end
  end
  object dsLinks: TDataSource
    DataSet = tblLinks
    Left = 592
    Top = 392
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
        DataType = ftFloat
      end
      item
        Name = 'ELEMENT_ID'
        DataType = ftInteger
      end
      item
        Name = 'USER_NAME'
        DataType = ftString
        Size = 45
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY10'
        Fields = 'INFO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN11'
        Fields = 'ELEMENT_ID'
      end>
    IndexFieldNames = 'ELEMENT_ID'
    MasterFields = 'ELEMENT_ID'
    MasterSource = dsElements
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
  object tblComp: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    OnCalcFields = tblCompCalcFields
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
        DataType = ftString
        Size = 200
      end
      item
        Name = 'USER_NAME'
        DataType = ftString
        Size = 45
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
    Left = 536
    Top = 192
    object tblCompCOMPONENT_ID: TIntegerField
      FieldName = 'COMPONENT_ID'
      Required = True
      Visible = False
    end
    object tblCompNAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 40
      FieldName = 'NAME'
      Size = 200
    end
    object tblCompUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Visible = False
      Size = 45
    end
  end
  object tblTyp: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'COMPONENT_ID'
    MasterFields = 'COMPONENT_ID'
    MasterSource = dsComp
    TableName = 'TYPES'
    Left = 536
    Top = 248
    object tblTypTYPE_ID: TIntegerField
      FieldName = 'TYPE_ID'
      Required = True
      Visible = False
    end
    object tblTypNAME: TIBStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 40
      FieldName = 'NAME'
      Size = 200
    end
    object tblTypCOMPONENT_ID: TIntegerField
      FieldName = 'COMPONENT_ID'
      Visible = False
    end
    object tblTypUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Visible = False
      Size = 45
    end
    object tblTypLuCompName: TStringField
      FieldKind = fkLookup
      FieldName = 'LuCompName'
      LookupDataSet = tblComponents
      LookupKeyFields = 'COMPONENT_ID'
      LookupResultField = 'NAME'
      KeyFields = 'COMPONENT_ID'
      Visible = False
      Size = 45
      Lookup = True
    end
  end
  object dsComp: TDataSource
    DataSet = tblComp
    Left = 592
    Top = 192
  end
  object dsTyp: TDataSource
    DataSet = tblTyp
    Left = 592
    Top = 248
  end
  object tblType2: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'COMPONENT_ID'
    MasterFields = 'COMPONENT_ID'
    MasterSource = dsComponents
    TableName = 'TYPES'
    Left = 536
    Top = 304
  end
  object dsType2: TDataSource
    DataSet = tblType2
    Left = 592
    Top = 304
  end
  object tblDetali: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'DETALI_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ELEMENT_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TYPE_NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'RESISTANCE'
        DataType = ftFloat
      end
      item
        Name = 'DOPUSK'
        DataType = ftFloat
      end
      item
        Name = 'TKS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'USER_NAME'
        DataType = ftString
        Size = 45
      end>
    IndexDefs = <
      item
        Name = 'RDB$8'
        Fields = 'ELEMENT_ID'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY9'
        Fields = 'DETALI_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN10'
        Fields = 'ELEMENT_ID'
      end>
    IndexFieldNames = 'ELEMENT_ID'
    MasterFields = 'ELEMENT_ID'
    MasterSource = dsElements
    StoreDefs = True
    TableName = 'DETALI'
    Left = 536
    Top = 352
  end
  object dsDetali: TDataSource
    DataSet = tblDetali
    Left = 592
    Top = 352
  end
  object cdsComp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsProviderComp'
    Left = 408
    Top = 144
  end
  object dsProviderComp: TDataSetProvider
    DataSet = tblComp
    Constraints = True
    Left = 472
    Top = 144
  end
  object dsCdsComp: TDataSource
    DataSet = cdsComp
    Left = 488
    Top = 96
  end
  object cdsTyp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsProviderTyp'
    Left = 400
    Top = 272
  end
  object dsProviderTyp: TDataSetProvider
    DataSet = tblTyp
    Constraints = True
    Left = 464
    Top = 288
  end
  object dsCdsTyp: TDataSource
    DataSet = cdsTyp
    Left = 480
    Top = 240
  end
  object tblZakazi: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ZAKAZ_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FROM_WHOM'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FOR_WHAT'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'THEDATE'
        DataType = ftDateTime
      end
      item
        Name = 'USER_NAME'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY17'
        Fields = 'ZAKAZ_ID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'ZAKAZI'
    Left = 240
    Top = 272
  end
  object dsZakazi: TDataSource
    DataSet = tblZakazi
    Left = 320
    Top = 272
  end
  object cdsZakazi: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsProviderZakazi'
    Left = 128
    Top = 208
    object cdsZakaziZAKAZ_ID: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 5
      FieldName = 'ZAKAZ_ID'
      Required = True
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
      DisplayLabel = 'USER'
      DisplayWidth = 15
      FieldName = 'USER_NAME'
      Size = 50
    end
  end
  object dsProviderZakazi: TDataSetProvider
    DataSet = tblZakazi
    Constraints = True
    Left = 56
    Top = 216
  end
  object dsCdsZAkazi: TDataSource
    DataSet = cdsZakazi
    Left = 184
    Top = 240
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
    MasterSource = dsZakazi
    StoreDefs = True
    TableName = 'REQUESTS'
    Left = 240
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
    Left = 320
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
    Left = 24
    Top = 152
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
    Left = 88
    Top = 168
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
    Left = 64
    Top = 8
  end
  object qryAllElements: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from elements')
    Left = 248
    Top = 416
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
      LookupDataSet = tblTyp
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
    Left = 96
    Top = 88
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
    Left = 32
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'zakaz_id'
        ParamType = ptUnknown
      end>
  end
end
