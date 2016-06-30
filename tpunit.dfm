inherited Frmtpunit: TFrmtpunit
  Caption = #25215#36816#21333#20301#20449#24687
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
    Align = alClient
    Filter.Criteria = {00000000}
    object dxDBGrid1tpno: TdxDBGridMaskColumn
      Caption = #25215#36816#21333#20301#32534#21495
      Width = 78
      BandIndex = 0
      RowIndex = 0
      FieldName = 'tpno'
    end
    object dxDBGrid1tpunitname: TdxDBGridColumn
      Caption = #25215#36816#21333#20301#21517#31216
      Width = 78
      BandIndex = 0
      RowIndex = 0
      FieldName = 'tpunitname'
    end
    object dxDBGrid1Column3: TdxDBGridMaskColumn
      Caption = #24405#20837#26102#38388
      HeaderAlignment = taCenter
      Width = 73
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keydate'
    end
    object dxDBGrid1Column4: TdxDBGridMaskColumn
      Caption = #24405#20837#29992#25143
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keyuser'
    end
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
  end
end
