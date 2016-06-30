unit ymzl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, DB, ADODB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, StdCtrls, ExtCtrls, ComCtrls;

type
  TFrmymzl = class(TFrmMather)
    dxDBGrid1ymzlno: TdxDBGridMaskColumn;
    dxDBGrid1ymzlcoal: TdxDBGridMaskColumn;
    dxDBGrid1ymzldate: TdxDBGridMaskColumn;
    dxDBGrid1ymzlback: TdxDBGridMaskColumn;
    dxDBGrid1ymzlhf: TdxDBGridMaskColumn;
    dxDBGrid1ymzllf: TdxDBGridMaskColumn;
    dxDBGrid1ymzltz: TdxDBGridMaskColumn;
    dxDBGrid1ymzlhff: TdxDBGridMaskColumn;
    dxDBGrid1ymzlnj: TdxDBGridMaskColumn;
    dxDBGrid1ymzlbz: TdxDBGridMaskColumn;
    dxDBGrid1Column11: TdxDBGridMaskColumn;
    dxDBGrid1Column12: TdxDBGridMaskColumn;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  Frmymzl: TFrmymzl;

implementation

uses ymzl_add,ympchzh_rp;

{$R *.dfm}
function TFrmymzl.l_init:boolean;
VAR sqlstr:string;
begin
  sqlstr:='select * from ymzl';
  adoqryopen(ADOQuery1,sqlstr);
end;
procedure TFrmymzl.Button1Click(Sender: TObject);
begin
  inherited;
  FrmYmzlAdd:=TFrmYmzlAdd.Create(self);
  FrmYmzlAdd.Labelno.Caption:=getmax('ymzl','ymzlno');
  FrmYmzlAdd.AutoInCombobox(FrmYmzlAdd.ComboCoal,'select coalname from b_coal');
  FrmYmzlAdd.ComboCoal.ItemIndex:=0;
  FrmYmzlAdd.DatePicker1.Date:=now();
  FrmYmzlAdd.ShowModal;
  l_init
end;

procedure TFrmymzl.Button2Click(Sender: TObject);
begin
  inherited;
  FrmYmzlAdd:=TFrmYmzlAdd.Create(self);
  FrmYmzlAdd.Labelno.Caption:=ADOQuery1.fieldbyname('ymzlno').AsString;
  FrmYmzlAdd.AutoInCombobox(FrmYmzlAdd.ComboCoal,'select coalname from b_coal');
  FrmYmzlAdd.ComboCoal.Text:=ADOQuery1.fieldbyname('ymzlcoal').AsString;
  FrmYmzlAdd.DatePicker1.Date:=ADOQuery1.fieldbyname('ymzldate').AsDateTime;
  FrmYmzlAdd.Edtback.TEXT:=ADOQuery1.fieldbyname('ymzlback').AsString;
  FrmYmzlAdd.Edthf.Text:=ADOQuery1.fieldbyname('ymzlhf').AsString;
  FrmYmzlAdd.Edtlf.text:=ADOQuery1.fieldbyname('ymzllf').AsString;
  FrmYmzlAdd.Edttz.Text:=ADOQuery1.fieldbyname('ymzltz').AsString;
  FrmYmzlAdd.Edthff.Text:=ADOQuery1.fieldbyname('ymzlhff').AsString;
  FrmYmzlAdd.Edtnj.Text:=ADOQuery1.fieldbyname('ymzlnj').AsString;
  FrmYmzlAdd.REdtbz.Text:=ADOQuery1.fieldbyname('ymzlbz').AsString;
  FrmYmzlAdd.ShowModal;
  l_init
end;

procedure TFrmymzl.FormShow(Sender: TObject);
begin
  inherited;
  l_init
end;

procedure TFrmymzl.Button3Click(Sender: TObject);
begin
  inherited;
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN begin
       savelog('删除<'+ADOQuery1.fieldbyname('ymzlcoal').AsString+'>煤矿'+
        ADOQuery1.fieldbyname('ymzldate').AsString+'质量记录',ADOQuery1.fieldbyname('ymprcno').AsString,'原煤质量数据录入');

        DeleteSelection
    end
    ELSE
      IF FocusedNode <> nil THEN begin
      savelog('删除<'+ADOQuery1.fieldbyname('ymzlcoal').AsString+'>煤矿'+
      ADOQuery1.fieldbyname('ymzldate').AsString+'质量记录',ADOQuery1.fieldbyname('ymprcno').AsString,'原煤质量数据录入');

      TdxDBGridNode(FocusedNode).Delete;
      end;
  END;

end;

procedure TFrmymzl.Button5Click(Sender: TObject);
begin
  inherited;
  Frmympchzhrp:=TFrmympchzhrp.Create(self);
  Frmympchzhrp.ShowModal;
end;

end.
