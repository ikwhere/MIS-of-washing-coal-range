unit kkdata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, ADODB, DB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, StdCtrls, ExtCtrls, dxDBTLCl, dxGrClms, ComCtrls;

type
  TFrmkkdata = class(TFrmMather)
    dxDBGrid1ymkkno: TdxDBGridMaskColumn;
    dxDBGrid1ymkkdate: TdxDBGridDateColumn;
    dxDBGrid1ymkkwt: TdxDBGridCurrencyColumn;
    dxDBGrid1ymkkcoal: TdxDBGridPickColumn;
    dxDBGrid1ymkksign: TdxDBGridCheckColumn;
    dxDBGrid1Column6: TdxDBGridColumn;
    dxDBGrid1Column7: TdxDBGridMaskColumn;
    dxDBGrid1Column8: TdxDBGridMaskColumn;
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  Frmkkdata: TFrmkkdata;

implementation

uses kkdata_add;

{$R *.dfm}
function TFrmkkdata.l_init:boolean;
VAR sqlstr:string;
    strlist1:Tstringlist;
begin
  sqlstr:='select * from ymkkdata';
  adoqryopen(ADOQuery1,sqlstr);
{  ADOTable1.TableName:='ymkkdata';
  ADOTable1.Active:=Enabled;  }
  strlist1:=Tstringlist.Create();
  sqlstr:='select distinct(tpcoal) from wroomdata';
  adoqryopen(ADOQtmp,sqlstr);
  while not ADOQtmp.Eof do begin
    strlist1.Add(ADOQtmp.fieldbyname('tpcoal').asString);
    ADOQtmp.Next;
  end;
  dxDBGrid1ymkkcoal.Items.Assign(strlist1);
  strlist1.Clear;
  strlist1.Free;
end;
procedure TFrmkkdata.Button3Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN DeleteSelection
    ELSE
      sqlstr:='select xskksign,ymjsno from ymkkdata where ymkkno='''+trim(ADOQuery1.fieldbyname('ymkkno').asstring)+'''';
      adoqryopen(ADOQtmp,sqlstr);
      if ADOQtmp.Fields[0].AsString='True'  then begin
          MessageBox(Handle, pchar('此笔扣款记录已纳入结算，结算单号'+ADOQtmp.Fields[1].AsString+',不能删除!'), '提示', MB_ICONERROR or MB_OK) ;
          abort;
      end;
      IF FocusedNode <> nil THEN begin
        savelog('删除<'+ADOQuery1.fieldbyname('ymkkcoal').AsString+'>煤矿'+
        ADOQuery1.fieldbyname('ymkkdate').AsString+'扣款记录',ADOQuery1.fieldbyname('ymkkno').AsString,'原煤扣款录入');

      TdxDBGridNode(FocusedNode).Delete;
      end;
  END;
end;

procedure TFrmkkdata.FormShow(Sender: TObject);
begin
  inherited;
  l_init
end;

procedure TFrmkkdata.Button1Click(Sender: TObject);
begin
  inherited;
  FrmkkdataAdd:=TFrmkkdataAdd.Create(self);
  FrmkkdataAdd.Labelno.Caption:=getmax('ymkkdata','ymkkno');
  FrmkkdataAdd.AutoInCombobox(FrmkkdataAdd.CombokkTime,'select kjqj from kjqj where clscunt=0 order by startdate');
  FrmkkdataAdd.CombokkTime.ItemIndex:=1;
  FrmkkdataAdd.ShowModal;
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

procedure TFrmkkdata.Button2Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  sqlstr:='select ymkksign,ymjsno from ymkkdata where ymkkno='''+trim(ADOQuery1.fieldbyname('ymkkno').asstring)+'''';
  adoqryopen(ADOQtmp,sqlstr);
  if ADOQtmp.Fields[0].AsString='True'  then begin
        MessageBox(Handle, pchar('此笔扣款记录已纳入结算，结算单号'+ADOQtmp.Fields[1].AsString+',不能修改!'), '提示', MB_ICONERROR or MB_OK) ;
        abort;
  end;
  FrmkkdataAdd:=TFrmkkdataAdd.Create(self);
  FrmkkdataAdd.Labelno.Caption:=ADOQuery1.Fields[0].AsString;
  FrmkkdataAdd.AutoInCombobox(FrmkkdataAdd.CombokkTime,'select kjqj from kjqj where clscunt=0 order by kjqj');
  FrmkkdataAdd.CombokkTime.TEXT:=ADOQuery1.Fields[1].AsString;
  FrmkkdataAdd.EdtkkName.Text:=ADOQuery1.Fields[2].AsString;
  FrmkkdataAdd.Edtkkwt.Text:=ADOQuery1.Fields[3].AsString;
  FrmkkdataAdd.ShowModal;
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

end.
