inherited FrmPriceAdd: TFrmPriceAdd
  Left = 237
  Top = 330
  Caption = #21407#29028#20215#26684#32500#25252
  ClientHeight = 260
  ClientWidth = 633
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Labelno: TLabel
    Left = 603
    Top = 352
  end
  object Labtpuntno: TLabel [1]
    Left = 320
    Top = 262
    Width = 3
    Height = 13
    Visible = False
  end
  object Label3: TLabel [2]
    Left = 32
    Top = 33
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #26102'         '#38388':'
  end
  object Label2: TLabel [3]
    Left = 80
    Top = 78
    Width = 3
    Height = 13
    Visible = False
  end
  object Label4: TLabel [4]
    Left = 32
    Top = 73
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #29028#30719#21517#31216':'
  end
  object Label5: TLabel [5]
    Left = 80
    Top = 118
    Width = 3
    Height = 13
    Visible = False
  end
  object Label6: TLabel [6]
    Left = 32
    Top = 113
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #21407#29028#20215#26684':'
  end
  object Label7: TLabel [7]
    Left = 80
    Top = 158
    Width = 3
    Height = 13
    Visible = False
  end
  object Label8: TLabel [8]
    Left = 32
    Top = 153
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #29028#20215'('#21547#31246'):'
  end
  object Label9: TLabel [9]
    Left = 368
    Top = 118
    Width = 3
    Height = 13
    Visible = False
  end
  object Label10: TLabel [10]
    Left = 320
    Top = 113
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #21407#29028#36816#36153':'
  end
  object Label11: TLabel [11]
    Left = 368
    Top = 158
    Width = 3
    Height = 13
    Visible = False
  end
  object Label12: TLabel [12]
    Left = 320
    Top = 153
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #36816#36153'('#21547#31246'):'
  end
  object Label13: TLabel [13]
    Left = 248
    Top = 113
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #20803
  end
  object Label14: TLabel [14]
    Left = 248
    Top = 153
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #20803
  end
  object Label15: TLabel [15]
    Left = 536
    Top = 113
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #20803
  end
  object Label16: TLabel [16]
    Left = 536
    Top = 153
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #20803
  end
  inherited Panel1: TPanel
    Top = 194
    Width = 633
    inherited BitBtn1: TBitBtn
      Left = 208
      OnClick = BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      Left = 344
    end
  end
  object ComboPrcTime: TComboBox [18]
    Tag = 1
    Left = 104
    Top = 30
    Width = 137
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object EdtPrcym: TEdit [19]
    Left = 104
    Top = 110
    Width = 137
    Height = 21
    TabOrder = 2
    OnKeyPress = EdtPrcymKeyPress
  end
  object EdtPrcyms: TEdit [20]
    Left = 104
    Top = 150
    Width = 137
    Height = 21
    TabOrder = 3
    OnKeyPress = EdtPrcymKeyPress
  end
  object EdtPrctp: TEdit [21]
    Left = 392
    Top = 110
    Width = 137
    Height = 21
    TabOrder = 4
    OnKeyPress = EdtPrcymKeyPress
  end
  object EdtPrctps: TEdit [22]
    Left = 392
    Top = 150
    Width = 137
    Height = 21
    TabOrder = 5
    OnKeyPress = EdtPrcymKeyPress
  end
  object EdtPrcName: TComboBox [23]
    Left = 103
    Top = 69
    Width = 137
    Height = 21
    ItemHeight = 13
    TabOrder = 6
  end
end
