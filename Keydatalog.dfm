inherited FrmLog: TFrmLog
  Caption = #37325#35201#25968#25454#26085#24535#26597#30475
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
    KeyField = 'logno'
    ShowGroupPanel = True
    Align = alClient
    Filter.Criteria = {00000000}
    object dxDBGrid1logno: TdxDBGridMaskColumn
      Caption = #32534#21495
      HeaderAlignment = taCenter
      Width = 30
      BandIndex = 0
      RowIndex = 0
      FieldName = 'logno'
    end
    object dxDBGrid1Column6: TdxDBGridMaskColumn
      Caption = #31243#24207
      HeaderAlignment = taCenter
      Width = 150
      BandIndex = 0
      RowIndex = 0
      FieldName = 'logproname'
    end
    object dxDBGrid1logcntet: TdxDBGridMaskColumn
      Caption = #20869#23481
      HeaderAlignment = taCenter
      Width = 300
      BandIndex = 0
      RowIndex = 0
      FieldName = 'logcntet'
    end
    object dxDBGrid1logvalue: TdxDBGridMaskColumn
      Caption = #21333#25454#32534#21495
      HeaderAlignment = taCenter
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'logvalue'
    end
    object dxDBGrid1logkeydate: TdxDBGridMaskColumn
      Caption = #24405#20837#26085#26399
      HeaderAlignment = taCenter
      Width = 110
      BandIndex = 0
      RowIndex = 0
      FieldName = 'logkeydate'
    end
    object dxDBGrid1loguser: TdxDBGridMaskColumn
      Caption = #24405#20837#29992#25143
      HeaderAlignment = taCenter
      Width = 116
      BandIndex = 0
      RowIndex = 0
      FieldName = 'loguser'
    end
  end
  inherited Panel1: TPanel
    inherited Button8: TButton
      OnClick = Button8Click
    end
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
  end
end
