object frmFindToManeger: TfrmFindToManeger
  Left = 223
  Top = 168
  AutoSize = True
  BorderStyle = bsNone
  ClientHeight = 23
  ClientWidth = 201
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 23
    BevelInner = bvLowered
    BevelOuter = bvSpace
    BevelWidth = 2
    BorderWidth = 1
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 5
      Width = 34
      Height = 13
      Caption = #1053#1072#1081#1090#1080':'
    end
    object eValue: TEdit
      Left = 43
      Top = 1
      Width = 155
      Height = 21
      TabOrder = 0
      OnKeyPress = eValueKeyPress
    end
  end
end
