inherited Frmscjm: TFrmscjm
  Left = 122
  Top = 122
  Width = 954
  Height = 586
  Caption = #31934#29028#20135#37327'/'#36136#37327#24405#20837
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 490
    Width = 946
  end
  inherited dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 49
    Width = 946
    Height = 441
    ShowGroupPanel = True
    Align = alClient
    Filter.Criteria = {00000000}
    object dxDBGrid1scjmno: TdxDBGridMaskColumn
      Alignment = taCenter
      Caption = #32534#21495
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scjmno'
    end
    object dxDBGrid1scjmdate: TdxDBGridMaskColumn
      Alignment = taCenter
      Caption = #29983#20135#26085#26399
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scjmdate'
    end
    object dxDBGrid1scjmbc: TdxDBGridMaskColumn
      Alignment = taCenter
      Caption = #29677#27425
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scjmbc'
    end
    object dxDBGrid1scjmstime: TdxDBGridMaskColumn
      Alignment = taCenter
      Caption = #24320#22987#26102#38388
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scjmstime'
    end
    object dxDBGrid1scjmetime: TdxDBGridMaskColumn
      Alignment = taCenter
      Caption = #32467#26463#26102#38388
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scjmetime'
    end
    object dxDBGrid1scjmcl: TdxDBGridMaskColumn
      Caption = #20135#37327'('#21544')'
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scjmcl'
    end
    object dxDBGrid1scjmhf: TdxDBGridMaskColumn
      Caption = #28784#20221'(%)'
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scjmhf'
    end
    object dxDBGrid1scjmhff: TdxDBGridMaskColumn
      Caption = #25381#21457#20221'(%)'
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scjmhff'
    end
    object dxDBGrid1scjmlf: TdxDBGridMaskColumn
      Caption = #30827#20221'(%)'
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scjmlf'
    end
    object dxDBGrid1scjmtz: TdxDBGridMaskColumn
      Caption = #29305#24449'(%)'
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scjmtz'
    end
    object dxDBGrid1scjmfc: TdxDBGridMaskColumn
      Caption = #28014#27785'(%)'
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scjmfc'
    end
    object dxDBGrid1scjmnj: TdxDBGridMaskColumn
      Caption = #31896#25509#25351#25968'(%)'
      HeaderAlignment = taCenter
      Width = 78
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scjmnj'
    end
    object dxDBGrid1scjmbz: TdxDBGridMaskColumn
      Alignment = taCenter
      Caption = #22791#27880
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scjmbz'
    end
    object dxDBGrid1Column14: TdxDBGridMaskColumn
      Caption = #24405#20837#26102#38388
      BandIndex = 0
      RowIndex = 0
      EditMask = 'keyuser'
    end
    object dxDBGrid1Column15: TdxDBGridMaskColumn
      Caption = #24405#20837#29992' '#25143
      BandIndex = 0
      RowIndex = 0
      FieldName = 'keyuser'
    end
  end
  inherited Panel1: TPanel
    Width = 946
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
  end
end
