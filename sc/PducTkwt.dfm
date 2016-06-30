inherited FrmPducTkwt: TFrmPducTkwt
  Caption = #20135#21697#21517#31216#21450#21333#20301#21544#25968#32500#25252
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
    object dxDBGrid1scpductkno: TdxDBGridMaskColumn
      Alignment = taCenter
      Caption = #32534#21495
      HeaderAlignment = taCenter
      Visible = False
      Width = 124
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scpductkno'
    end
    object dxDBGrid1scpductkname: TdxDBGridMaskColumn
      Alignment = taCenter
      Caption = #20135#21697#21517#31216
      HeaderAlignment = taCenter
      Width = 221
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scpductkname'
    end
    object dxDBGrid1scpductkunit: TdxDBGridMaskColumn
      Alignment = taCenter
      Caption = #21333#20301
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scpductkunit'
    end
    object dxDBGrid1scpductkunitv: TdxDBGridMaskColumn
      Alignment = taRightJustify
      Caption = #21333#20301#20540
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scpductkunitv'
    end
    object dxDBGrid1scpductkunit1: TdxDBGridMaskColumn
      Alignment = taCenter
      Caption = #36716#25442#21333#20301
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scpductkunit1'
    end
    object dxDBGrid1scpductkunitv1: TdxDBGridMaskColumn
      Alignment = taRightJustify
      Caption = #36716#25442#21333#20301#20540'2'
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'scpductkunitv1'
    end
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
  end
end
