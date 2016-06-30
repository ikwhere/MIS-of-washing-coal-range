inherited FrmCustomsAdd: TFrmCustomsAdd
  Left = 399
  Top = 163
  Caption = #23458#25143#21333#20301#25968#25454#24405#20837
  ClientHeight = 227
  ClientWidth = 277
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Labelno: TLabel
    Left = 48
    Top = 80
  end
  object Label1: TLabel [1]
    Left = 24
    Top = 32
    Width = 97
    Height = 25
    AutoSize = False
    Caption = #23458#25143#21517#31216#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 161
    Width = 277
    inherited BitBtn1: TBitBtn
      Left = 56
      OnClick = BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      Left = 144
    end
  end
  object EdtName: TEdit [3]
    Left = 24
    Top = 72
    Width = 233
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
end
