object Dm3: TDm3
  OldCreateOrder = False
  Left = 192
  Top = 119
  Height = 327
  Width = 386
  object dsQryOstatki: TDataSource
    DataSet = qryOstatki
    Left = 72
    Top = 160
  end
  object qryOstatki: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 16
    Top = 160
  end
  object dsQryInfo: TDataSource
    DataSet = qryInfoForEdit
    Left = 80
    Top = 104
  end
  object qryInfoForEdit: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
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
  object dsqryLinkInfo_by_elem: TDataSource
    DataSet = qryLinkInfo_by_elem
    Left = 168
    Top = 96
  end
  object qryLinkInfo_by_elem: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQryEdit
    SQL.Strings = (
      'select * from links '
      'where element_id=:element_id')
    Left = 152
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'element_id'
        ParamType = ptUnknown
      end>
  end
  object dsQryEdit: TDataSource
    DataSet = qryEdit
    Left = 64
    Top = 56
  end
  object qryEdit: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
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
    object qryEditNUMER: TIBStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 15
      FieldName = 'NUMER'
      Origin = 'ELEMENTS.NUMER'
      Required = True
      Size = 35
    end
    object qryEditINFO: TIBStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 50
      FieldName = 'INFO'
      Origin = 'ELEMENTS.INFO'
      FixedChar = True
      Size = 32000
    end
    object qryEditUSER_NAME: TIBStringField
      FieldName = 'USER_NAME'
      Origin = 'ELEMENTS.USER_NAME'
      Visible = False
      Size = 45
    end
  end
  object qryInfoOrderBy: TIBQuery
    Database = DM.IBDatabase
    Transaction = DM.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
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
      DisplayWidth = 5
      FieldName = 'NUM_P_P'
      Origin = 'INFO.NUM_P_P'
      Required = True
    end
    object qryInfoOrderByTHEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 8
      FieldName = 'THEDATE'
      Origin = 'INFO.THEDATE'
    end
    object qryInfoOrderByNUM_DOC: TIBStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 6
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
      DisplayWidth = 5
      FieldName = 'ARRIVAL'
      Origin = 'INFO.ARRIVAL'
    end
    object qryInfoOrderByCHARGE: TFloatField
      DisplayLabel = #1056#1072#1089#1093#1086#1076
      DisplayWidth = 5
      FieldName = 'CHARGE'
      Origin = 'INFO.CHARGE'
    end
    object qryInfoOrderByOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 5
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
  object tblComponents: TIBTable
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
  object dsComponents: TDataSource
    DataSet = tblComponents
    Left = 320
    Top = 72
  end
  object tblTypes: TIBTable
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
  object dsTypes: TDataSource
    DataSet = tblTypes
    Left = 320
    Top = 120
  end
  object tblElements: TIBTable
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
  object dsElements: TDataSource
    DataSet = tblElements
    Left = 320
    Top = 168
  end
  object tblInfo: TIBTable
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
  object dsInfo: TDataSource
    DataSet = tblInfo
    Left = 320
    Top = 216
  end
  object tblZakazi: TIBTable
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
  object tblLinks: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'ELEMENT_ID'
    MasterFields = 'ELEMENT_ID'
    MasterSource = dsElements
    TableName = 'LINKS'
    Left = 600
    Top = 216
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
    Left = 656
    Top = 216
  end
  object dsDetali: TDataSource
    DataSet = tblDetali
    Left = 656
    Top = 176
  end
  object tblDetali: TIBTable
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
    Left = 600
    Top = 176
  end
  object tblType2: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'COMPONENT_ID'
    MasterFields = 'COMPONENT_ID'
    MasterSource = dsComponents
    TableName = 'TYPES'
    Left = 600
    Top = 128
  end
  object dsType2: TDataSource
    DataSet = tblType2
    Left = 656
    Top = 128
  end
  object dsTyp: TDataSource
    DataSet = tblTyp
    Left = 656
    Top = 72
  end
  object tblTyp: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'COMPONENT_ID'
    MasterFields = 'COMPONENT_ID'
    MasterSource = dsComp
    TableName = 'TYPES'
    Left = 600
    Top = 72
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
  object tblComp: TIBTable
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
    Left = 600
    Top = 16
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
  object dsComp: TDataSource
    DataSet = tblComp
    Left = 656
    Top = 16
  end
  object cdsTyp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsProviderTyp'
    Left = 400
    Top = 272
  end
  object dsProviderTyp: TDataSetProvider
    Constraints = True
    Left = 464
    Top = 288
  end
  object dsCdsTyp: TDataSource
    DataSet = cdsTyp
    Left = 480
    Top = 240
  end
  object cdsComp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsProviderComp'
    Left = 408
    Top = 144
  end
  object dsProviderComp: TDataSetProvider
    Constraints = True
    Left = 472
    Top = 144
  end
  object dsCdsComp: TDataSource
    DataSet = cdsComp
    Left = 488
    Top = 96
  end
end
