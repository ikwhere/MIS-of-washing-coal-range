inherited FrmxskkAdd: TFrmxskkAdd
  Left = 338
  Top = 135
  Caption = #38144#21806#25187#27454#22686#21152
  ClientHeight = 236
  ClientWidth = 345
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Labelno: TLabel
    Top = 120
  end
  object Label1: TLabel [1]
    Left = 35
    Top = 160
    Width = 3
    Height = 13
    Visible = False
  end
  object Label2: TLabel [2]
    Left = 88
    Top = 30
    Width = 3
    Height = 13
    Visible = False
  end
  object Label3: TLabel [3]
    Left = 40
    Top = 25
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #25187#27454#26102#38388':'
  end
  object Label4: TLabel [4]
    Left = 88
    Top = 62
    Width = 3
    Height = 13
    Visible = False
  end
  object Label5: TLabel [5]
    Left = 40
    Top = 57
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #23458#25143#21517#31216':'
  end
  object Label6: TLabel [6]
    Left = 88
    Top = 126
    Width = 3
    Height = 13
    Visible = False
  end
  object Label7: TLabel [7]
    Left = 40
    Top = 121
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #25187#27454#25968#37327':'
  end
  object Label8: TLabel [8]
    Left = 256
    Top = 121
    Width = 33
    Height = 17
    AutoSize = False
    Caption = #21544
  end
  object Label9: TLabel [9]
    Left = 88
    Top = 94
    Width = 3
    Height = 13
    Visible = False
  end
  object Label10: TLabel [10]
    Left = 40
    Top = 89
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #20135#21697#21517#31216':'
  end
  inherited Panel1: TPanel
    Top = 170
    Width = 345
    inherited BitBtn1: TBitBtn
      Left = 80
      OnClick = BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      Left = 168
    end
  end
  object CombokkTime: TComboBox [12]
    Tag = 1
    Left = 112
    Top = 22
    Width = 137
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object Edtkkwt: TEdit [13]
    Left = 112
    Top = 118
    Width = 137
    Height = 21
    TabOrder = 2
    OnKeyPress = EdtkkwtKeyPress
  end
  object ComboCustom: TComboBox [14]
    Tag = 1
    Left = 112
    Top = 54
    Width = 137
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object ComboName: TComboBox [15]
    Tag = 1
    Left = 112
    Top = 86
    Width = 137
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
end
