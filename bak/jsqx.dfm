inherited Frmjsqx: TFrmjsqx
  Left = 209
  Top = 82
  Caption = #35282#33394#26435#38480#23450#20041
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox [0]
    Left = 0
    Top = 0
    Width = 121
    Height = 376
    Align = alLeft
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 376
    Width = 688
    Height = 70
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 504
      Top = 16
      Width = 81
      Height = 33
      Caption = #26032#22686
      TabOrder = 0
      Visible = False
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 240
      Top = 16
      Width = 81
      Height = 33
      Caption = #20462#25913
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 328
      Top = 16
      Width = 81
      Height = 33
      Caption = #21024#38500
      TabOrder = 2
    end
    object Button4: TButton
      Left = 416
      Top = 16
      Width = 73
      Height = 33
      Caption = #36864#20986
      TabOrder = 3
    end
    object Button5: TButton
      Left = 160
      Top = 16
      Width = 73
      Height = 33
      Caption = #26032#22686#35282#33394
      TabOrder = 4
      OnClick = Button5Click
    end
  end
  inherited dxDBGrid1: TdxDBGrid
    Left = 121
    Top = 0
    Width = 567
    Height = 376
    ShowGroupPanel = True
    Align = alClient
    TabOrder = 2
    DataSource = DataSource1
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAnsiSort, edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
    object dxDBGrid1node: TdxDBGridColumn
      Sorted = csUp
      Visible = False
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'node'
      GroupIndex = 1
    end
    object dxDBGrid1childnode: TdxDBGridColumn
      Width = 140
      BandIndex = 0
      RowIndex = 0
      FieldName = 'childnode'
    end
    object dxDBGrid1usergroup: TdxDBGridColumn
      Sorted = csUp
      Visible = False
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'usergroup'
      GroupIndex = 0
    end
    object dxDBGrid1qxread: TdxDBGridCheckColumn
      Width = 55
      BandIndex = 0
      RowIndex = 0
      FieldName = 'qxread'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dxDBGrid1qxwrite: TdxDBGridCheckColumn
      Width = 56
      BandIndex = 0
      RowIndex = 0
      FieldName = 'qxwrite'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dxDBGrid1qxdelete: TdxDBGridCheckColumn
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'qxdelete'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dxDBGrid1qxadd: TdxDBGridCheckColumn
      Width = 52
      BandIndex = 0
      RowIndex = 0
      FieldName = 'qxadd'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  inherited ADOConnection1: TADOConnection
    Connected = True
    Mode = cmShareDenyNone
  end
  inherited ADOQuery1: TADOQuery
    Active = True
    CursorType = ctStatic
    SQL.Strings = (
      'select * from tree')
  end
  inherited DataSource1: TDataSource
    Left = 224
    Top = 64
  end
  object ADOQtmp2: TADOQuery
    Parameters = <>
    Left = 384
    Top = 64
  end
end
