inherited FrmSczmcl: TFrmSczmcl
  Left = 71
  Top = 130
  Caption = #20013#29028'/'#30712#30707'/'#27877#29028#20135#37327#24405#20837
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
    object dxDBGrid1sczmno: TdxDBGridMaskColumn
      Alignment = taCenter
      Caption = #32534#21495
      HeaderAlignment = taCenter
      Width = 44
      BandIndex = 0
      RowIndex = 0
      FieldName = 'sczmno'
    end
    object dxDBGrid1sczmdate: TdxDBGridMaskColumn
      Alignment = taCenter
      Caption = #29983#20135#26085#26399
      HeaderAlignment = taCenter
      Width = 88
      BandIndex = 0
      RowIndex = 0
      FieldName = 'sczmdate'
    end
    object dxDBGrid1sczmbc: TdxDBGridMaskColumn
      Alignment = taCenter
      Caption = #29677#27425
      HeaderAlignment = taCenter
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'sczmbc'
    end
    object dxDBGrid1sczmcl: TdxDBGridMaskColumn
      Caption = #20013#29028#20135#37327'('#21544')'
      HeaderAlignment = taCenter
      Width = 86
      BandIndex = 0
      RowIndex = 0
      FieldName = 'sczmcl'
    end
    object dxDBGrid1sczmcs: TdxDBGridMaskColumn
      Caption = #36710#25968
      HeaderAlignment = taCenter
      Width = 45
      BandIndex = 0
      RowIndex = 0
      FieldName = 'sczmcs'
    end
    object dxDBGrid1scgscl: TdxDBGridMaskColumn
      Caption = #30712#30707#20135#37327'('#21544')'
      HeaderAlignment = taCenter
      Width = 88
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scgscl'
    end
    object dxDBGrid1scgscs: TdxDBGridMaskColumn
      Caption = #36710#25968
      HeaderAlignment = taCenter
      Width = 49
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scgscs'
    end
    object dxDBGrid1scnmcl: TdxDBGridMaskColumn
      Caption = #27877#29028#20135#37327'('#21544')'
      HeaderAlignment = taCenter
      Width = 90
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scnmcl'
    end
    object dxDBGrid1scnmcs: TdxDBGridMaskColumn
      Caption = #38130#25968
      HeaderAlignment = taCenter
      Width = 57
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scnmcs'
    end
    object dxDBGrid1Column10: TdxDBGridMaskColumn
      Caption = #24405#20837#26102#38388
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keydate'
    end
    object dxDBGrid1Column11: TdxDBGridMaskColumn
      Caption = #24405#20837#29992#25143
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keyuser'
    end
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
  end
end
