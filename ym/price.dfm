inherited Frmprice: TFrmprice
  Left = 233
  Top = 127
  Caption = #21407#29028#20215#26684#32500#25252
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 49
    Width = 688
    Height = 335
    ShowGroupPanel = True
    Align = alClient
    Filter.Criteria = {00000000}
    object dxDBGrid1ymprcno: TdxDBGridMaskColumn
      Visible = False
      Width = 53
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymprcno'
    end
    object dxDBGrid1prcdate: TdxDBGridColumn
      Caption = #26102#38388
      Width = 85
      BandIndex = 0
      RowIndex = 0
      FieldName = 'prcdate'
    end
    object dxDBGrid1ymprccoal: TdxDBGridColumn
      Caption = #29028#30719#21517#31216
      Width = 71
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymprccoal'
    end
    object dxDBGrid1ymprc: TdxDBGridCurrencyColumn
      Caption = #21407#29028#20215#26684
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymprc'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGrid1ymprctax: TdxDBGridCurrencyColumn
      Caption = #20215#26684'('#21547#31246')'
      Width = 60
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymprctax'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGrid1ymtpprc: TdxDBGridCurrencyColumn
      Caption = #21407#29028#36816#36153
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymtpprc'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGrid1ymtpprctax: TdxDBGridCurrencyColumn
      Caption = #36816#36153'('#21547#31246')'
      Width = 65
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ymtpprctax'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGrid1Column8: TdxDBGridMaskColumn
      Caption = #24405#20837#26102#38388
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keydate'
    end
    object dxDBGrid1Column9: TdxDBGridMaskColumn
      Caption = #24405#20837#29992#25143
      HeaderAlignment = taCenter
      Width = 72
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keyuser'
    end
  end
end
