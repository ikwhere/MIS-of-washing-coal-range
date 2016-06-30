unit scjmzl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, DB, ADODB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, StdCtrls, ExtCtrls, ComCtrls;

type
  TFrmscjm = class(TFrmMather)
    dxDBGrid1scjmno: TdxDBGridMaskColumn;
    dxDBGrid1scjmdate: TdxDBGridMaskColumn;
    dxDBGrid1scjmbc: TdxDBGridMaskColumn;
    dxDBGrid1scjmstime: TdxDBGridMaskColumn;
    dxDBGrid1scjmetime: TdxDBGridMaskColumn;
    dxDBGrid1scjmcl: TdxDBGridMaskColumn;
    dxDBGrid1scjmhf: TdxDBGridMaskColumn;
    dxDBGrid1scjmhff: TdxDBGridMaskColumn;
    dxDBGrid1scjmlf: TdxDBGridMaskColumn;
    dxDBGrid1scjmtz: TdxDBGridMaskColumn;
    dxDBGrid1scjmfc: TdxDBGridMaskColumn;
    dxDBGrid1scjmnj: TdxDBGridMaskColumn;
    dxDBGrid1scjmbz: TdxDBGridMaskColumn;
    dxDBGrid1Column14: TdxDBGridMaskColumn;
    dxDBGrid1Column15: TdxDBGridMaskColumn;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  Frmscjm: TFrmscjm;

implementation

uses scjmzl_add;

{$R *.dfm}
function TFrmscjm.l_init:boolean;
VAR sqlstr:string;
begin
  sqlstr:='select * from scjm';
  adoqryopen(ADOQuery1,sqlstr);
end;
procedure TFrmscjm.FormShow(Sender: TObject);
begin
  inherited;
l_init
end;

procedure TFrmscjm.Button1Click(Sender: TObject);
begin
  inherited;
  FrmScjmAdd:=TFrmScjmAdd.Create(self);
  FrmScjmAdd.Labelno.Caption:=getmax('scjm','scjmno');
//  FrmScjmAdd.AutoInCombobox(FrmScjmAdd.ComboCoal,'select coalname from b_coal');
  FrmScjmAdd.Combobc.ItemIndex:=0;
  FrmScjmAdd.DatePicker1.Date:=now();
  FrmScjmAdd.TimePicker1.Time:=now();
  FrmScjmAdd.TimePicker2.Time:=now();
  FrmScjmAdd.ShowModal;
  l_init
end;

procedure TFrmscjm.Button3Click(Sender: TObject);
begin
  inherited;
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN begin
           savelog('删除<'+ADOQuery1.fieldbyname('scjmdate').AsString+'>'+
           ADOQuery1.fieldbyname('scjmbc').AsString+'精煤质量记录',ADOQuery1.fieldbyname('scjmno').AsString,'精煤产量/质量录入');
           DeleteSelection
        end
    ELSE
      IF FocusedNode <> nil THEN begin
      savelog('删除<'+ADOQuery1.fieldbyname('scjmdate').AsString+'>'+
      ADOQuery1.fieldbyname('scjmbc').AsString+'精煤质量记录',ADOQuery1.fieldbyname('scjmno').AsString,'精煤产量/质量录入');
      TdxDBGridNode(FocusedNode).Delete;
      end;
  END;
end;

procedure TFrmscjm.Button2Click(Sender: TObject);
begin
  inherited;
  FrmScjmAdd:=TFrmScjmAdd.Create(self);
  FrmScjmAdd.Labelno.Caption:=ADOQuery1.fieldbyname('scjmno').AsString;
//  FrmScjmAdd.AutoInCombobox(FrmScjmAdd.ComboCoal,'select coalname from b_coal');
  FrmScjmAdd.DatePicker1.Date:=ADOQuery1.fieldbyname('scjmdate').AsDateTime;
  FrmScjmAdd.Combobc.Text:=ADOQuery1.fieldbyname('scjmbc').AsString;
  FrmScjmAdd.Edtcl.Text:=ADOQuery1.fieldbyname('scjmcl').AsString;
  FrmScjmAdd.TimePicker1.Time:=ADOQuery1.fieldbyname('scjmstime').AsDateTime;
  FrmScjmAdd.TimePicker2.Time:=ADOQuery1.fieldbyname('scjmetime').AsDateTime;
  FrmScjmAdd.Edthf.Text:=ADOQuery1.fieldbyname('scjmhf').AsString;
  FrmScjmAdd.Edthff.text:=ADOQuery1.fieldbyname('scjmhff').AsString;
  FrmScjmAdd.Edtlf.Text:=ADOQuery1.fieldbyname('scjmlf').AsString;
  FrmScjmAdd.Edttz.Text:=ADOQuery1.fieldbyname('scjmtz').AsString;
  FrmScjmAdd.Edtfc.Text:=ADOQuery1.fieldbyname('scjmfc').AsString;
  FrmScjmAdd.Edtnj.Text:=ADOQuery1.fieldbyname('scjmnj').AsString;
  FrmScjmAdd.REdtbz.Text:=ADOQuery1.fieldbyname('scjmbz').AsString;
  FrmScjmAdd.ShowModal;
  l_init
end;

end.
