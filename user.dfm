inherited FrmUser: TFrmUser
  Left = 283
  Top = 141
  Width = 738
  Height = 456
  Caption = #29992#25143#35774#32622
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 360
    Width = 730
    inherited Button1: TButton
      Left = 152
    end
    inherited Button2: TButton
      Left = 248
    end
    inherited Button3: TButton
      Left = 344
    end
    inherited Button4: TButton
      Left = 616
    end
    inherited Button6: TButton
      Left = 440
      Top = 15
    end
  end
  inherited dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 49
    Width = 730
    Height = 311
    Align = alClient
    Filter.Criteria = {00000000}
    object dxDBGrid1Column1: TdxDBGridColumn
      Caption = #24080#21495
      Width = 131
      BandIndex = 0
      RowIndex = 0
      FieldName = 'userid'
    end
    object dxDBGrid1Column2: TdxDBGridColumn
      Caption = #23494#30721
      PasswordChar = '*'
      Width = 95
      BandIndex = 0
      RowIndex = 0
      FieldName = 'userpwd'
    end
    object dxDBGrid1Column3: TdxDBGridPickColumn
      Caption = #35282#33394
      Width = 124
      BandIndex = 0
      RowIndex = 0
      FieldName = 'usergroup'
    end
  end
  inherited Panel1: TPanel
    Width = 730
    inherited Label3: TLabel
      Visible = False
    end
    inherited DatePicker1: TDateTimePicker
      Visible = False
    end
    inherited DatePicker2: TDateTimePicker
      Visible = False
    end
    inherited Button8: TButton
      Visible = False
    end
  end
end
