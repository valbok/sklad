object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 192
  Top = 119
  Height = 292
  Width = 401
  object dsPComponents: TDataSetProvider
    DataSet = DM.qryComponents
    Constraints = True
    Left = 128
    Top = 16
  end
  object cdsComponents: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsPComponents'
    Left = 32
    Top = 16
  end
  object DataSource1: TDataSource
    Left = 32
    Top = 112
  end
  object DataSource2: TDataSource
    Left = 128
    Top = 112
  end
  object CDSqrytypes_by_comp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsPqrytypes_by_comp'
    Left = 32
    Top = 64
  end
  object dsPqrytypes_by_comp: TDataSetProvider
    DataSet = DM.qrytypes_by_comp
    Constraints = True
    Left = 128
    Top = 64
  end
end
