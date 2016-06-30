inherited FrmPducTkwtAdd: TFrmPducTkwtAdd
  Left = 306
  Top = 58
  Caption = #20135#21697#21517#31216#21450#21333#20301#21544#25968#32500#25252
  ClientHeight = 220
  ClientWidth = 397
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Labelno: TLabel
    Top = 85
  end
  object Label6: TLabel [1]
    Left = 31
    Top = 34
    Width = 66
    Height = 17
    AutoSize = False
    Caption = #20135#21697#21517#31216':'
  end
  object Label12: TLabel [2]
    Left = 32
    Top = 79
    Width = 52
    Height = 17
    AutoSize = False
    Caption = #21333'        '#20301':'
  end
  object Label1: TLabel [3]
    Left = 56
    Top = 117
    Width = 3
    Height = 13
    Visible = False
  end
  object Label2: TLabel [4]
    Left = 32
    Top = 111
    Width = 52
    Height = 17
    AutoSize = False
    Caption = #21333'  '#20301'  '#20540':'
  end
  object Label3: TLabel [5]
    Left = 252
    Top = 84
    Width = 3
    Height = 13
    Visible = False
  end
  object Label4: TLabel [6]
    Left = 228
    Top = 78
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #36716#25442#21333#20301':'
  end
  object Label5: TLabel [7]
    Left = 252
    Top = 116
    Width = 3
    Height = 13
    Visible = False
  end
  object Label7: TLabel [8]
    Left = 221
    Top = 110
    Width = 78
    Height = 17
    AutoSize = False
    Caption = #36716#25442#21333#20301#20540':'
  end
  object Label8: TLabel [9]
    Left = 164
    Top = 93
    Width = 57
    Height = 17
    AutoSize = False
    Caption = #65309#65309#65309#12299
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 154
    Width = 397
    TabOrder = 5
    inherited BitBtn1: TBitBtn
      Left = 112
      OnClick = BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      Left = 200
    end
  end
  object Edtname: TEdit [11]
    Left = 92
    Top = 29
    Width = 267
    Height = 21
    TabOrder = 0
  end
  object Edtunit: TEdit [12]
    Left = 92
    Top = 76
    Width = 65
    Height = 21
    TabOrder = 1
  end
  object Edtunitv: TEdit [13]
    Left = 92
    Top = 108
    Width = 65
    Height = 21
    TabOrder = 2
  end
  object Edtunit1: TEdit [14]
    Left = 294
    Top = 75
    Width = 65
    Height = 21
    TabOrder = 3
  end
  object Edtunitv1: TEdit [15]
    Left = 294
    Top = 107
    Width = 65
    Height = 21
    TabOrder = 4
  end
  inherited ADOQuery1: TADOQuery
    Left = 344
  end
  inherited ADOQtmp: TADOQuery
    Left = 424
  end
end
