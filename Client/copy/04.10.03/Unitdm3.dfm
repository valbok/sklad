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
    Left = 152
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
    Left = 144
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
end
