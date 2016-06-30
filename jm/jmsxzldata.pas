unit jmsxzldata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, DB, ADODB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, StdCtrls, ExtCtrls, ComCtrls;

type
  TFrmjmsxzldata = class(TFrmMather)
    dxDBGrid1jmsxzlno: TdxDBGridMaskColumn;
    dxDBGrid1jmsxzldate: TdxDBGridMaskColumn;
    dxDBGrid1jmsxzlsf: TdxDBGridMaskColumn;
    dxDBGrid1jmsxzlhf: TdxDBGridMaskColumn;
    dxDBGrid1jmsxzllf: TdxDBGridMaskColumn;
    dxDBGrid1jmsxzltz: TdxDBGridMaskColumn;
    dxDBGrid1jmsxzlhff: TdxDBGridMaskColumn;
    dxDBGrid1jmsxzlljzs: TdxDBGridMaskColumn;
    dxDBGrid1jmsxzlkeydate: TdxDBGridMaskColumn;
    dxDBGrid1jmsxzlkeyuser: TdxDBGridMaskColumn;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  Frmjmsxzldata: TFrmjmsxzldata;

implementation

uses jmsxzldata_add;

{$R *.dfm}

procedure TFrmjmsxzldata.Button1Click(Sender: TObject);
begin
  inherited;
  Frmjmsxzldataadd:=TFrmjmsxzldataadd.Create(self);
  Frmjmsxzldataadd.Labelno.Caption:=getmax('jmsxzldata','jmsxzlno');
  Frmjmsxzldataadd.DatePicker1.Date:=now();
  Frmjmsxzldataadd.ShowModal;
  l_init
end;
function TFrmjmsxzldata.l_init:boolean;
VAR sqlstr:string;
begin
  sqlstr:='select * from jmsxzldata';
  adoqryopen(ADOQuery1,sqlstr);
end;
procedure TFrmjmsxzldata.Button3Click(Sender: TObject);
begin
  inherited;
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN begin
         savelog('删除<'+ADOQuery1.fieldbyname('jmsxzldate').AsString+'>'+
        '销售精煤质量记录',ADOQuery1.fieldbyname('jmsxzlno').AsString,'精煤销售质量数据录入');
        DeleteSelection
    end
    ELSE
      IF FocusedNode <> nil THEN begin
         savelog('删除<'+ADOQuery1.fieldbyname('jmsxzldate').AsString+'>'+
        '销售精煤质量记录',ADOQuery1.fieldbyname('jmsxzlno').AsString,'精煤销售质量数据录入');
        TdxDBGridNode(FocusedNode).Delete;
      end;
  END;
end;

procedure TFrmjmsxzldata.Button2Click(Sender: TObject);
begin
  inherited;
  Frmjmsxzldataadd:=TFrmjmsxzldataadd.Create(self);
  Frmjmsxzldataadd.Labelno.Caption:=ADOQuery1.fieldbyname('jmsxzlno').AsString;
  Frmjmsxzldataadd.DatePicker1.Date:=ADOQuery1.fieldbyname('jmsxzldate').AsDateTime;
  Frmjmsxzldataadd.Edtsf.Text:=ADOQuery1.fieldbyname('jmsxzlsf').AsString;
  Frmjmsxzldataadd.Edthff.Text:=ADOQuery1.fieldbyname('jmsxzlhff').AsString;
  Frmjmsxzldataadd.Edthf.Text:=ADOQuery1.fieldbyname('jmsxzlhf').AsString;
  Frmjmsxzldataadd.Edttz.text:=ADOQuery1.fieldbyname('jmsxzltz').AsString;
  Frmjmsxzldataadd.Edtlf.Text:=ADOQuery1.fieldbyname('jmsxzllf').AsString;
  Frmjmsxzldataadd.Edtljzs.Text:=ADOQuery1.fieldbyname('jmsxzlljzs').AsString;
  Frmjmsxzldataadd.ShowModal;
  l_init
end;

procedure TFrmjmsxzldata.FormShow(Sender: TObject);
begin
  inherited;
l_init
end;

end.
