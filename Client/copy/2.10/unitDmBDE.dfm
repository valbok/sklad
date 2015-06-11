object dmBDE: TdmBDE
  OldCreateOrder = False
  Left = 217
  Top = 124
  Height = 397
  Width = 418
  object Database: TDatabase
    DatabaseName = 'Element'
    DriverName = 'STANDARD'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'PATH=bde'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 96
    Top = 24
  end
  object qryInsertIntoCard: TQuery
    DatabaseName = 'Element'
    SQL.Strings = (
      
        'insert into Card (num_p_p,thedate,num_doc,from_whom,arrival,char' +
        'ge,ostatok,name,type_name,cost_for_one,unit_izmerenie,numer)  va' +
        'lues(:num_p_p,:thedate,:num_doc,:from_whom,:arrival,:charge,:ost' +
        'atok,:nam,:type_name,:cost_for_one,:unit_izmerenie,:numer)')
    Left = 184
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
  object tblCard: TTable
    DatabaseName = 'Element'
    FieldDefs = <
      item
        Name = 'id'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'info_id'
        DataType = ftInteger
      end
      item
        Name = 'num_p_p'
        DataType = ftInteger
      end
      item
        Name = 'theDate'
        DataType = ftDateTime
      end
      item
        Name = 'num_doc'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'cost_for_one'
        DataType = ftFloat
      end
      item
        Name = 'from_whom'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'arrival'
        DataType = ftFloat
      end
      item
        Name = 'charge'
        DataType = ftFloat
      end
      item
        Name = 'ostatok'
        DataType = ftFloat
      end
      item
        Name = 'element_id'
        DataType = ftInteger
      end
      item
        Name = 'user_name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'unit_izmerenie'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'type_name'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'cost'
        DataType = ftFloat
      end
      item
        Name = 'numer'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'tblCardIndex1'
        Fields = 'id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'card'
    Left = 208
    Top = 112
  end
  object QrydeleteFromCard: TQuery
    DatabaseName = 'Element'
    SQL.Strings = (
      'delete from card')
    Left = 104
    Top = 72
  end
  object tblOst: TTable
    DatabaseName = 'Element'
    FieldDefs = <
      item
        Name = 'id'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'num_p_p'
        DataType = ftInteger
      end
      item
        Name = 'Elem_id'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'ostatok'
        DataType = ftFloat
      end
      item
        Name = 'unit_izmerenie'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'nowDate'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'tblOstIndex1'
        Fields = 'id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'ostatki'
    Left = 144
    Top = 160
    object tblOstid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object tblOstElem_id: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      DisplayWidth = 5
      FieldName = 'Elem_id'
    end
    object tblOstnum_p_p: TIntegerField
      DisplayLabel = #8470' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1079#1072#1087#1080#1089#1080' '#1074' '#1087#1088#1080#1093#1086#1076'/'#1088#1072#1089#1093#1086#1076
      DisplayWidth = 5
      FieldName = 'num_p_p'
      Visible = False
    end
    object tblOstname: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'name'
      Size = 150
    end
    object tblOstostatok: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 5
      FieldName = 'ostatok'
    end
    object tblOstunit_izmerenie: TStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'unit_izmerenie'
      Size = 50
    end
    object tblOstnowDate: TStringField
      FieldName = 'nowDate'
      Visible = False
      Size = 50
    end
  end
  object dsOst: TDataSource
    DataSet = tblOst
    Left = 216
    Top = 168
  end
  object qryInsertIntoOstatki: TQuery
    DatabaseName = 'Element'
    SQL.Strings = (
      'insert into Ostatki (name,nowdate) values(:name,:nowdate)')
    Left = 72
    Top = 160
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
  object qryFullInsertIntoOstatki: TQuery
    DatabaseName = 'Element'
    SQL.Strings = (
      
        'insert into ostatki (num_p_p,name,ostatok,unit_izmerenie,nowdate' +
        ',elem_id)'
      'values(:num_p_p,:name,:ostatok,:unit_izmr,:thedate,:elem_id)')
    Left = 80
    Top = 208
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
      end
      item
        DataType = ftUnknown
        Name = 'elem_id'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteAllOstatki: TQuery
    DatabaseName = 'Element'
    SQL.Strings = (
      'delete from ostatki')
    Left = 24
    Top = 104
  end
  object qryCount: TQuery
    DatabaseName = 'Element'
    SQL.Strings = (
      'select count(num_p_p)'
      'from ostatki')
    Left = 200
    Top = 248
  end
  object qrySum: TQuery
    DatabaseName = 'Element'
    SQL.Strings = (
      'select sum(ostatok)'
      'from ostatki'
      'where not(num_p_p is null)')
    Left = 264
    Top = 248
  end
  object IBTable1: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    StoreDefs = True
    TableName = 'CARD'
    Left = 288
    Top = 72
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
    DataSet = IBTable1
    Left = 336
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = Ost
    Left = 344
    Top = 16
  end
  object Ost: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    StoreDefs = True
    TableName = 'OSTATKI'
    Left = 296
    Top = 16
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
end
