inherited FrmjmsxdataAdd: TFrmjmsxdataAdd
  Left = 358
  Top = 307
  Caption = #31934#29028#38144#21806#25968#25454#24405#20837
  ClientHeight = 202
  ClientWidth = 478
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Labelno: TLabel
    Left = 403
    Top = 272
  end
  object Label12: TLabel [1]
    Left = 24
    Top = 23
    Width = 68
    Height = 17
    AutoSize = False
    Caption = #38144#21806#26085#26399':'
  end
  object Label1: TLabel [2]
    Left = 24
    Top = 63
    Width = 68
    Height = 17
    AutoSize = False
    Caption = #23567#31080#31080#21495':'
  end
  object Label2: TLabel [3]
    Left = 24
    Top = 103
    Width = 68
    Height = 17
    AutoSize = False
    Caption = #36710'          '#21495':'
  end
  object Label3: TLabel [4]
    Left = 252
    Top = 23
    Width = 68
    Height = 17
    AutoSize = False
    Caption = #23458#25143#21517#31216':'
  end
  object Label4: TLabel [5]
    Left = 252
    Top = 63
    Width = 68
    Height = 17
    AutoSize = False
    Caption = #38144'          '#37327':'
  end
  object Label5: TLabel [6]
    Left = 420
    Top = 63
    Width = 29
    Height = 17
    AutoSize = False
    Caption = #21544
  end
  inherited Panel1: TPanel
    Top = 136
    Width = 478
    TabOrder = 5
    inherited BitBtn1: TBitBtn
      Left = 152
      OnClick = BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      Left = 240
    end
  end
  object Edtph: TEdit [8]
    Left = 97
    Top = 60
    Width = 111
    Height = 21
    TabOrder = 2
  end
  object Edttkno: TEdit [9]
    Left = 98
    Top = 100
    Width = 107
    Height = 21
    TabOrder = 4
  end
  object Edtwt: TEdit [10]
    Left = 328
    Top = 60
    Width = 81
    Height = 21
    TabOrder = 3
  end
  object DatePicker1: TDateTimePicker [11]
    Left = 98
    Top = 18
    Width = 111
    Height = 24
    CalAlignment = dtaLeft
    Date = 39727.9113899653
    Time = 39727.9113899653
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object ComboUser: TComboBox [12]
    Left = 328
    Top = 18
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
end
