inherited FrmScjmAdd: TFrmScjmAdd
  Left = 311
  Top = 51
  Caption = #31934#29028#20135#37327'/'#36136#37327#24405#20837
  ClientHeight = 375
  ClientWidth = 535
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Labelno: TLabel
    Left = 320
    Top = 368
  end
  object Label14: TLabel [1]
    Left = 32
    Top = 34
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #29983#20135#26085#26399':'
  end
  object Label4: TLabel [2]
    Left = 214
    Top = 34
    Width = 49
    Height = 17
    AutoSize = False
    Caption = #29677'       '#27425':'
  end
  object Label6: TLabel [3]
    Left = 33
    Top = 121
    Width = 56
    Height = 17
    AutoSize = False
    Caption = #28784'       '#20221':'
  end
  object Label10: TLabel [4]
    Left = 32
    Top = 165
    Width = 49
    Height = 17
    AutoSize = False
    Caption = #29305'       '#24449':'
  end
  object Label12: TLabel [5]
    Left = 182
    Top = 122
    Width = 52
    Height = 17
    AutoSize = False
    Caption = #25381'  '#21457'  '#20221':'
  end
  object Label1: TLabel [6]
    Left = 332
    Top = 121
    Width = 57
    Height = 17
    AutoSize = False
    Caption = #30827'        '#20221':'
  end
  object Label2: TLabel [7]
    Left = 331
    Top = 164
    Width = 62
    Height = 17
    AutoSize = False
    Caption = #31896#25509#25351#25968':'
  end
  object Label5: TLabel [8]
    Left = 360
    Top = 33
    Width = 57
    Height = 17
    AutoSize = False
    Caption = #20135'       '#37327':'
  end
  object Label7: TLabel [9]
    Left = 31
    Top = 77
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #24320#22987#26102#38388':'
  end
  object Label8: TLabel [10]
    Left = 255
    Top = 77
    Width = 62
    Height = 17
    AutoSize = False
    Caption = #32467#26463#26102#38388':'
  end
  object Label3: TLabel [11]
    Left = 182
    Top = 165
    Width = 57
    Height = 17
    AutoSize = False
    Caption = #28014'       '#27785':'
  end
  object Label9: TLabel [12]
    Left = 32
    Top = 210
    Width = 49
    Height = 17
    AutoSize = False
    Caption = #22791'       '#27880':'
  end
  object Label11: TLabel [13]
    Left = 480
    Top = 33
    Width = 57
    Height = 17
    AutoSize = False
    Caption = #21544
  end
  inherited Panel1: TPanel
    Top = 309
    Width = 535
    TabOrder = 12
    inherited BitBtn1: TBitBtn
      Left = 192
      OnClick = BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      Left = 280
    end
  end
  object DatePicker1: TDateTimePicker [15]
    Left = 88
    Top = 28
    Width = 105
    Height = 24
    CalAlignment = dtaLeft
    Date = 39725.8266870949
    Time = 39725.8266870949
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object Combobc: TComboBox [16]
    Left = 274
    Top = 30
    Width = 65
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      #30333#29677
      #22812#29677)
  end
  object Edthf: TEdit [17]
    Left = 88
    Top = 118
    Width = 65
    Height = 21
    TabOrder = 5
    OnKeyPress = EdthfKeyPress
  end
  object Edtlf: TEdit [18]
    Left = 400
    Top = 118
    Width = 73
    Height = 21
    TabOrder = 7
    OnKeyPress = EdthfKeyPress
  end
  object Edttz: TEdit [19]
    Left = 90
    Top = 161
    Width = 65
    Height = 21
    TabOrder = 8
    OnKeyPress = EdthfKeyPress
  end
  object Edthff: TEdit [20]
    Left = 240
    Top = 119
    Width = 65
    Height = 21
    TabOrder = 6
    OnKeyPress = EdthfKeyPress
  end
  object Edtnj: TEdit [21]
    Left = 400
    Top = 161
    Width = 75
    Height = 21
    TabOrder = 10
    OnKeyPress = EdthfKeyPress
  end
  object Edtcl: TEdit [22]
    Left = 416
    Top = 30
    Width = 58
    Height = 21
    TabOrder = 2
    OnKeyPress = EdthfKeyPress
  end
  object TimePicker1: TDateTimePicker [23]
    Left = 99
    Top = 72
    Width = 121
    Height = 24
    CalAlignment = dtaLeft
    Date = 39725.3875983796
    Time = 39725.3875983796
    DateFormat = dfShort
    DateMode = dmComboBox
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Kind = dtkTime
    ParseInput = False
    ParentFont = False
    TabOrder = 3
  end
  object TimePicker2: TDateTimePicker [24]
    Left = 327
    Top = 72
    Width = 121
    Height = 24
    CalAlignment = dtaLeft
    Date = 39725.3875983796
    Time = 39725.3875983796
    DateFormat = dfShort
    DateMode = dmComboBox
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Kind = dtkTime
    ParseInput = False
    ParentFont = False
    TabOrder = 4
  end
  object Edtfc: TEdit [25]
    Left = 239
    Top = 162
    Width = 67
    Height = 21
    TabOrder = 9
    OnKeyPress = EdthfKeyPress
  end
  object REdtbz: TRichEdit [26]
    Left = 88
    Top = 208
    Width = 385
    Height = 73
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
end
