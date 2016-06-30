inherited FrmSczmclAdd: TFrmSczmclAdd
  Left = 524
  Top = 265
  Caption = #20013#29028'/'#30712#30707'/'#27877#29028#20135#37327#24405#20837
  ClientHeight = 293
  ClientWidth = 420
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Labelno: TLabel
    Left = 547
    Top = 328
  end
  object Label14: TLabel [1]
    Left = 16
    Top = 21
    Width = 65
    Height = 17
    AutoSize = False
    Caption = #29983#20135#26085#26399':'
  end
  object Label4: TLabel [2]
    Left = 230
    Top = 21
    Width = 49
    Height = 17
    AutoSize = False
    Caption = #29677'       '#27425':'
  end
  inherited Panel1: TPanel
    Top = 232
    Width = 420
    Height = 61
    TabOrder = 5
    inherited BitBtn1: TBitBtn
      Left = 112
      Top = 13
      OnClick = BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      Left = 208
      Top = 13
    end
  end
  object DatePicker1: TDateTimePicker [4]
    Left = 80
    Top = 15
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
  object Combobc: TComboBox [5]
    Left = 290
    Top = 17
    Width = 65
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      #30333#29677
      #22812#29677)
  end
  object GroupBox1: TGroupBox [6]
    Left = 0
    Top = 52
    Width = 420
    Height = 60
    Align = alBottom
    Caption = #20013#29028
    TabOrder = 2
    object Label5: TLabel
      Left = 32
      Top = 27
      Width = 57
      Height = 17
      AutoSize = False
      Caption = #20135'       '#37327':'
    end
    object Label11: TLabel
      Left = 152
      Top = 27
      Width = 25
      Height = 17
      AutoSize = False
      Caption = #21544
    end
    object Label1: TLabel
      Left = 240
      Top = 27
      Width = 57
      Height = 17
      AutoSize = False
      Caption = #36710'       '#25968':'
    end
    object Label2: TLabel
      Left = 360
      Top = 27
      Width = 25
      Height = 17
      AutoSize = False
      Caption = #36742
    end
    object Edtzmcl: TEdit
      Left = 88
      Top = 23
      Width = 58
      Height = 21
      Enabled = False
      TabOrder = 1
      OnKeyPress = EdtzmclKeyPress
    end
    object Edtzmcs: TEdit
      Left = 296
      Top = 23
      Width = 58
      Height = 21
      TabOrder = 0
      OnKeyPress = EdtzmclKeyPress
      OnKeyUp = EdtzmcsKeyUp
    end
    object Button1: TButton
      Left = 175
      Top = 21
      Width = 41
      Height = 25
      Caption = #35843#25972
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox [7]
    Left = 0
    Top = 112
    Width = 420
    Height = 60
    Align = alBottom
    Caption = #30712#30707
    TabOrder = 3
    object Label3: TLabel
      Left = 30
      Top = 27
      Width = 57
      Height = 17
      AutoSize = False
      Caption = #20135'       '#37327':'
    end
    object Label6: TLabel
      Left = 150
      Top = 27
      Width = 25
      Height = 17
      AutoSize = False
      Caption = #21544
    end
    object Label7: TLabel
      Left = 238
      Top = 27
      Width = 57
      Height = 17
      AutoSize = False
      Caption = #36710'       '#25968':'
    end
    object Label8: TLabel
      Left = 358
      Top = 27
      Width = 25
      Height = 17
      AutoSize = False
      Caption = #36742
    end
    object Edtgscl: TEdit
      Left = 86
      Top = 23
      Width = 58
      Height = 21
      Enabled = False
      TabOrder = 1
      OnKeyPress = EdtzmclKeyPress
    end
    object Edtgscs: TEdit
      Left = 294
      Top = 23
      Width = 58
      Height = 21
      TabOrder = 0
      OnKeyPress = EdtzmclKeyPress
      OnKeyUp = EdtgscsKeyUp
    end
    object Button2: TButton
      Left = 175
      Top = 21
      Width = 41
      Height = 25
      Caption = #35843#25972
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object GroupBox3: TGroupBox [8]
    Left = 0
    Top = 172
    Width = 420
    Height = 60
    Align = alBottom
    Caption = #27877#29028
    TabOrder = 4
    object Label9: TLabel
      Left = 29
      Top = 27
      Width = 57
      Height = 17
      AutoSize = False
      Caption = #20135'       '#37327':'
    end
    object Label10: TLabel
      Left = 149
      Top = 27
      Width = 25
      Height = 17
      AutoSize = False
      Caption = #21544
    end
    object Label12: TLabel
      Left = 237
      Top = 27
      Width = 57
      Height = 17
      AutoSize = False
      Caption = #36710'       '#25968':'
    end
    object Label13: TLabel
      Left = 357
      Top = 27
      Width = 25
      Height = 17
      AutoSize = False
      Caption = #36742
    end
    object Edtnmcl: TEdit
      Left = 85
      Top = 23
      Width = 58
      Height = 21
      Enabled = False
      TabOrder = 1
      OnKeyPress = EdtzmclKeyPress
    end
    object Edtnmcs: TEdit
      Left = 293
      Top = 23
      Width = 58
      Height = 21
      TabOrder = 0
      OnKeyPress = EdtzmclKeyPress
      OnKeyUp = EdtnmcsKeyUp
    end
    object Button3: TButton
      Left = 175
      Top = 21
      Width = 41
      Height = 25
      Caption = #35843#25972
      TabOrder = 2
      OnClick = Button3Click
    end
  end
end
