inherited FrmJmPrcadd: TFrmJmPrcadd
  Left = 190
  Top = 66
  Caption = #38144#21806#20215#26684#32500#25252
  ClientHeight = 261
  ClientWidth = 516
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [1]
    Left = 40
    Top = 32
    Width = 41
    Height = 17
    AutoSize = False
    Caption = #20135#21697#65306
  end
  object Label2: TLabel [2]
    Left = 240
    Top = 72
    Width = 70
    Height = 13
    Caption = #20215#26684#26376#20221#65306
  end
  object Label3: TLabel [3]
    Left = 40
    Top = 72
    Width = 41
    Height = 17
    AutoSize = False
    Caption = #23458#25143#65306
  end
  object Label4: TLabel [4]
    Left = 40
    Top = 112
    Width = 41
    Height = 17
    AutoSize = False
    Caption = #20215#26684#65306
  end
  object Label5: TLabel [5]
    Left = 240
    Top = 112
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #21547#31246#20215#26684#65306
  end
  object Label6: TLabel [6]
    Left = 40
    Top = 152
    Width = 41
    Height = 17
    AutoSize = False
    Caption = #36816#36153#65306
  end
  object Label7: TLabel [7]
    Left = 240
    Top = 152
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #21547#31246#36816#36153#65306
  end
  inherited Panel1: TPanel
    Top = 195
    Width = 516
    TabOrder = 7
    inherited BitBtn1: TBitBtn
      Left = 144
      OnClick = BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      Left = 232
    end
  end
  object ComboName: TComboBox [9]
    Left = 96
    Top = 28
    Width = 101
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      #31934#29028
      #20013#29028
      #27877#29028
      #30712#30707)
  end
  object ComboCustom: TComboBox [10]
    Left = 96
    Top = 68
    Width = 101
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object EdtPrc: TEdit [11]
    Left = 96
    Top = 108
    Width = 97
    Height = 21
    TabOrder = 3
    OnKeyPress = EdtPrcKeyPress
  end
  object EdtPrctax: TEdit [12]
    Left = 320
    Top = 108
    Width = 97
    Height = 21
    TabOrder = 4
    OnKeyPress = EdtPrcKeyPress
  end
  object Edttpprc: TEdit [13]
    Left = 96
    Top = 148
    Width = 97
    Height = 21
    TabOrder = 5
    OnKeyPress = EdtPrcKeyPress
  end
  object Edttpprctax: TEdit [14]
    Left = 320
    Top = 148
    Width = 97
    Height = 21
    TabOrder = 6
    OnKeyPress = EdtPrcKeyPress
  end
  object ComboMonth: TComboBox [15]
    Left = 320
    Top = 68
    Width = 101
    Height = 21
    ItemHeight = 13
    TabOrder = 2
  end
end
