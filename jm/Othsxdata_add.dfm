inherited FrmOthsxdataAdd: TFrmOthsxdataAdd
  Left = 216
  Top = 177
  Caption = #20013#29028'/'#27877#29028'/'#30712#30707#38144#21806#25968#25454#22686#21152
  ClientHeight = 211
  ClientWidth = 569
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
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
    Top = 103
    Width = 68
    Height = 17
    AutoSize = False
    Caption = #38144'          '#37327':'
  end
  object Label5: TLabel [6]
    Left = 420
    Top = 103
    Width = 29
    Height = 17
    AutoSize = False
    Caption = #21544
  end
  object Label6: TLabel [7]
    Left = 252
    Top = 63
    Width = 68
    Height = 17
    AutoSize = False
    Caption = #38144#21806#20135#21697':'
  end
  inherited Panel1: TPanel
    Top = 145
    Width = 569
    TabOrder = 6
    inherited BitBtn1: TBitBtn
      Left = 160
      OnClick = BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      Left = 248
    end
  end
  object Edtph: TEdit [9]
    Left = 97
    Top = 60
    Width = 111
    Height = 21
    TabOrder = 2
  end
  object Edttkno: TEdit [10]
    Left = 98
    Top = 100
    Width = 107
    Height = 21
    TabOrder = 4
  end
  object Edtwt: TEdit [11]
    Left = 328
    Top = 100
    Width = 81
    Height = 21
    TabOrder = 5
    OnKeyPress = EdtwtKeyPress
  end
  object DatePicker1: TDateTimePicker [12]
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
  object ComboUser: TComboBox [13]
    Left = 328
    Top = 18
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object ComboName: TComboBox [14]
    Left = 328
    Top = 58
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      #20013#29028
      #27877#29028
      #30712#30707)
  end
end
