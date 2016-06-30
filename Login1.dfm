object FrmLogin: TFrmLogin
  Left = 207
  Top = 116
  Width = 696
  Height = 480
  Caption = #30331#38470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 216
    Top = 168
    Width = 65
    Height = 33
    AutoSize = False
    Caption = #22995#21517
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 216
    Top = 216
    Width = 65
    Height = 25
    AutoSize = False
    Caption = #23494#30721
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtnLogin: TBitBtn
    Left = 248
    Top = 272
    Width = 97
    Height = 33
    Caption = #30331#38470
    Default = True
    TabOrder = 0
    OnClick = BitBtnLoginClick
  end
  object BitBtnCanel: TBitBtn
    Left = 360
    Top = 272
    Width = 97
    Height = 33
    Caption = #21462#28040
    TabOrder = 1
    OnClick = BitBtnCanelClick
  end
  object EdtName: TEdit
    Left = 296
    Top = 168
    Width = 177
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object EdtPwd: TEdit
    Left = 296
    Top = 216
    Width = 177
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 3
  end
end
