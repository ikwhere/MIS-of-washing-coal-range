object FrmAdd: TFrmAdd
  Left = 328
  Top = 155
  BorderStyle = bsSingle
  Caption = 'FrmAdd'
  ClientHeight = 450
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Labelno: TLabel
    Left = 56
    Top = 88
    Width = 3
    Height = 13
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 384
    Width = 688
    Height = 66
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 240
      Top = 16
      Width = 81
      Height = 33
      Caption = #20445#23384
      Default = True
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 328
      Top = 16
      Width = 89
      Height = 33
      Cancel = True
      Caption = #21462#28040
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctDynamic
    Parameters = <>
    Left = 88
    Top = 400
  end
  object ADOQtmp: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 168
    Top = 400
  end
end
