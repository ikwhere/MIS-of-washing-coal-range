inherited Frmxskk: TFrmxskk
  Left = 255
  Top = 78
  Caption = #38144#21806#25187#27454#24405#20837
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
    object dxDBGrid1xskkno: TdxDBGridMaskColumn
      Caption = #32534#21495
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xskkno'
    end
    object dxDBGrid1xskkdate: TdxDBGridMaskColumn
      Caption = #25187#27454#26085#26399
      HeaderAlignment = taCenter
      Width = 112
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xskkdate'
    end
    object dxDBGrid1xskkcustomer: TdxDBGridMaskColumn
      Caption = #23458#25143
      HeaderAlignment = taCenter
      Width = 140
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xskkcustomer'
    end
    object dxDBGrid1xskkname: TdxDBGridMaskColumn
      Caption = #20135#21697
      HeaderAlignment = taCenter
      Width = 87
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xskkname'
    end
    object dxDBGrid1xskkwt: TdxDBGridCurrencyColumn
      Caption = #25187#27454#25968#37327'('#21544')'
      HeaderAlignment = taCenter
      Width = 90
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xskkwt'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGrid1xskksign: TdxDBGridCheckColumn
      Caption = #24050#25187#27454
      HeaderAlignment = taCenter
      Width = 73
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xskksign'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dxDBGrid1xsjsno: TdxDBGridMaskColumn
      Caption = #32467#31639#21333#21495
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xsjsno'
    end
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
  end
end
