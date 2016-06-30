unit wroomdata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, ADODB, DB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, StdCtrls, ExtCtrls, ComCtrls, dxDBTLCl, dxGrClms, Menus;

type
  TFrmwroomdata = class(TFrmMather)
    dxDBGrid1tpno: TdxDBGridMaskColumn;
    dxDBGrid1tpdate: TdxDBGridDateColumn;
    Panel3: TPanel;
    Button5: TButton;
    DateTimePicker1: TDateTimePicker;
    dxDBGrid1tpcoal: TdxDBGridPickColumn;
    dxDBGrid1tptrukno: TdxDBGridPickColumn;
    dxDBGrid1tpunit: TdxDBGridPickColumn;
    dxDBGrid1tptrukwt: TdxDBGridCurrencyColumn;
    dxDBGrid1tptotalwt: TdxDBGridCurrencyColumn;
    dxDBGrid1tpsuttle: TdxDBGridCurrencyColumn;
    dxDBGrid1zhzhz: TdxDBGridCheckColumn;
    Button7: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ListBox1: TListBox;
    dxDBGrid1Column10: TdxDBGridMaskColumn;
    dxDBGrid1Column11: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ADOTable1BeforeScroll(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure ADOTable1BeforeEdit(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  Frmwroomdata: TFrmwroomdata;

implementation

uses wroomdata_add;

{$R *.dfm}

procedure TFrmwroomdata.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=cafree;
end;
function TFrmwroomdata.l_init:boolean;
VAR sqlstr:string;
    strlist1:Tstringlist;
begin
{  ADOTable1.TableName:='wroomdata';
  ADOTable1.Active:=Enabled;  }
  sqlstr:='select * from wroomdata';
  adoqryopen(ADOQuery1,sqlstr);
  strlist1:=Tstringlist.Create();
  sqlstr:='select distinct(coalname) from b_coal';
  adoqryopen(ADOQtmp,sqlstr);
  while not ADOQtmp.Eof do begin
    strlist1.Add(ADOQtmp.fieldbyname('coalname').asString);
    ADOQtmp.Next;
  end;
  dxDBGrid1tpcoal.Items.Assign(strlist1);
  strlist1.Clear;
  sqlstr:='select distinct(tpunitname) from tpunit';
  adoqryopen(ADOQtmp,sqlstr);
  while not ADOQtmp.Eof do begin
    strlist1.Add(ADOQtmp.fieldbyname('tpunitname').asString);
    ADOQtmp.Next;
  end;
  dxDBGrid1tpunit.Items.Assign(strlist1);
  strlist1.Clear;
  sqlstr:='select distinct(tknumber) from truckinfo';
  adoqryopen(ADOQtmp,sqlstr);
  while not ADOQtmp.Eof do begin
    strlist1.Add(ADOQtmp.fieldbyname('tknumber').asString);
    ADOQtmp.Next;
  end;
  dxDBGrid1tptrukno.Items.Assign(strlist1);
  strlist1.Free;
end;
procedure TFrmwroomdata.FormShow(Sender: TObject);
begin
  inherited;
  l_init;
end;

procedure TFrmwroomdata.Button3Click(Sender: TObject);
begin
  inherited;
  with dxDBGrid1.DataSource.DataSet do
        if Fields[8].Value=true then
        begin
         MessageBox(Handle, '此笔原煤已入库,不能删除!', '提示', MB_ICONERROR or MB_OK) ;
         abort;
        end;
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN DeleteSelection
    ELSE
      IF FocusedNode <> nil THEN TdxDBGridNode(FocusedNode).Delete;
  END;
  savelog('删除<'+ADOQuery1.fieldbyname('tpcoal').AsString+'>煤矿'+
  ADOQuery1.fieldbyname('tpdate').AsString+'磅房记录,净重'+ADOQuery1.fieldbyname('tpsuttle').AsString+'吨',ADOQuery1.fieldbyname('tpno').AsString,'原煤磅房数据维护');

end;

procedure TFrmwroomdata.Button7Click(Sender: TObject);
var i:integer;
    sqlstr:string;
begin
  inherited;
  Listbox1.Clear;
  with dxDBGrid1.DataSource.DataSet do
    begin
        FOR   i   :=   0   to   dxDBGrid1.SelectedCount-1   do
        begin
          GotoBookmark(Pointer(dxDBGrid1.SelectedRows[i]));
          Listbox1.Items.Add(Fields[0].Value);
          IF  NOT Fields[8].Value THEN BEGIN
          //  sqlstr:='insert into zhz (tpno,zhzpay) values('+Fields[0].asstring+',false)';
         //   adoqryexec(ADOQtmp,sqlstr);
            sqlstr:='update wroomdata set tpzhz=1 where tpno='+Fields[0].asstring;
            adoqryexec(ADOQtmp,sqlstr);
          END;
        end;
    end;

end;

procedure TFrmwroomdata.ADOTable1BeforeScroll(DataSet: TDataSet);
begin
  inherited;
 { with dxDBGrid1.DataSource.DataSet do
        if Fields[8].Value=true then abort;  }
end;

procedure TFrmwroomdata.Button2Click(Sender: TObject);
begin
  inherited;
  with dxDBGrid1.DataSource.DataSet do
        if Fields[8].Value=true then
        begin
         MessageBox(Handle, '此笔原煤已入库,不能修改!', '提示', MB_ICONERROR or MB_OK) ;
         abort;
        end;
  FrmWroomdataAdd:=TFrmWroomdataAdd.Create(self);
  FrmWroomdataAdd.Labelno.Caption:=ADOQuery1.Fields[0].AsString;
  FrmWroomdataAdd.DatePicker1.Date:=ADOQuery1.Fields[1].AsDateTime;
  FrmWroomdataAdd.ComboCoal.Items.Assign(dxDBGrid1tpcoal.Items);
  FrmWroomdataAdd.ComboTpunit.Items.Assign(dxDBGrid1tpunit.Items);
  FrmWroomdataAdd.ComboCoal.TEXT:=ADOQuery1.Fields[4].AsString;
  FrmWroomdataAdd.ComboTpunit.TEXT:=ADOQuery1.Fields[2].AsString;
  FrmWroomdataAdd.ComboTknumb.Text:=ADOQuery1.Fields[3].AsString;
  FrmWroomdataAdd.Edit4.text:=ADOQuery1.Fields[5].AsString;
  FrmWroomdataAdd.Edit5.Text:=ADOQuery1.Fields[6].AsString;
  FrmWroomdataAdd.Edit6.Text:=ADOQuery1.Fields[7].AsString;
  FrmWroomdataAdd.ShowModal;
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

procedure TFrmwroomdata.ADOTable1BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with dxDBGrid1.DataSource.DataSet do
        if Fields[8].Value=true then
        begin
         MessageBox(Handle, '此笔原煤已入库,不能修改!', '提示', MB_ICONERROR or MB_OK) ;
         abort;
        end;
end;

procedure TFrmwroomdata.Button1Click(Sender: TObject);
begin
  inherited;
  FrmWroomdataAdd:=TFrmWroomdataAdd.Create(self);
  FrmWroomdataAdd.Labelno.Caption:=getmax('wroomdata','tpno');
  FrmWroomdataAdd.DatePicker1.Date:=date();
  FrmWroomdataAdd.ComboCoal.Items.Assign(dxDBGrid1tpcoal.Items);
  FrmWroomdataAdd.ComboTpunit.Items.Assign(dxDBGrid1tpunit.Items);
  //FrmWroomdataAdd.ComboTknumb.Items.Assign(dxDBGrid1tptrukno.Items);
  FrmWroomdataAdd.ShowModal;
  l_init;
end;

end.
