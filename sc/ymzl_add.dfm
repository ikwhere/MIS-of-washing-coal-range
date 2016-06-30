inherited FrmYmzlAdd: TFrmYmzlAdd
  Left = 147
  Top = 376
  Caption = #21407#29028#36136#37327#25968#25454#24405#20837
  ClientHeight = 312
  ClientWidth = 564
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Labelno: TLabel
    Left = 203
    Top = 368
  end
  object Label4: TLabel [1]
    Left = 48
    Top = 27
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #29028#30719#21517#31216':'
  end
  object Label3: TLabel [2]
    Left = 48
    Top = 75
    Width = 57
    Height = 17
    AutoSize = False
    Caption = #22238#25910#29575':'
  end
  object Label6: TLabel [3]
    Left = 216
    Top = 73
    Width = 41
    Height = 17
    AutoSize = False
    Caption = #28784#20221':'
  end
  object Label10: TLabel [4]
    Left = 48
    Top = 117
    Width = 49
    Height = 17
    AutoSize = False
    Caption = #29305'    '#24449':'
  end
  object Label12: TLabel [5]
    Left = 203
    Top = 116
    Width = 49
    Height = 17
    AutoSize = False
    Caption = #25381#21457#20221':'
  end
  object Label14: TLabel [6]
    Left = 282
    Top = 26
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #24405#20837#26085#26399':'
  end
  object Label1: TLabel [7]
    Left = 368
    Top = 73
    Width = 49
    Height = 17
    AutoSize = False
    Caption = #30827#20221':'
  end
  object Label2: TLabel [8]
    Left = 347
    Top = 116
    Width = 62
    Height = 17
    AutoSize = False
    Caption = #31896#25509#25351#25968':'
  end
  object Label5: TLabel [9]
    Left = 48
    Top = 162
    Width = 49
    Height = 17
    AutoSize = False
    Caption = #22791'    '#27880':'
  end
  inherited Panel1: TPanel
    Top = 246
    Width = 564
    TabOrder = 9
    inherited BitBtn1: TBitBtn
      Left = 184
      OnClick = BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      Left = 272
    end
  end
  object Edtback: TEdit [11]
    Left = 104
    Top = 70
    Width = 65
    Height = 21
    TabOrder = 2
    OnKeyPress = EdttzKeyPress
  end
  object Edthf: TEdit [12]
    Left = 256
    Top = 70
    Width = 65
    Height = 21
    TabOrder = 3
    OnKeyPress = EdttzKeyPress
  end
  object Edtlf: TEdit [13]
    Left = 416
    Top = 70
    Width = 73
    Height = 21
    TabOrder = 4
    OnKeyPress = EdttzKeyPress
  end
  object Edttz: TEdit [14]
    Left = 104
    Top = 113
    Width = 65
    Height = 21
    TabOrder = 5
    OnKeyPress = EdttzKeyPress
  end
  object Edthff: TEdit [15]
    Left = 256
    Top = 113
    Width = 65
    Height = 21
    TabOrder = 6
    OnKeyPress = EdttzKeyPress
  end
  object DatePicker1: TDateTimePicker [16]
    Left = 354
    Top = 20
    Width = 137
    Height = 24
    CalAlignment = dtaLeft
    Date = 39724.8266870949
    Time = 39724.8266870949
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object ComboCoal: TComboBox [17]
    Left = 120
    Top = 22
    Width = 129
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object Edtnj: TEdit [18]
    Left = 416
    Top = 113
    Width = 75
    Height = 21
    TabOrder = 7
    OnKeyPress = EdttzKeyPress
  end
  object REdtbz: TRichEdit [19]
    Left = 104
    Top = 160
    Width = 385
    Height = 73
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
end
