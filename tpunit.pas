unit tpunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, DB, ADODB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, StdCtrls, ExtCtrls, ComCtrls;

type
  TFrmtpunit = class(TFrmMather)
    dxDBGrid1tpno: TdxDBGridMaskColumn;
    dxDBGrid1tpunitname: TdxDBGridColumn;
    dxDBGrid1Column3: TdxDBGridMaskColumn;
    dxDBGrid1Column4: TdxDBGridMaskColumn;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      function l_init:boolean;
  end;

var
  Frmtpunit: TFrmtpunit;

implementation
uses main;
{$R *.dfm}

procedure TFrmtpunit.FormShow(Sender: TObject);
begin
  inherited;
  l_init
end;
function TFrmtpunit.l_init:boolean;
var sqlstr:string;
begin
  sqlstr:='select * from tpunit';
  adoqryopen(ADOQuery1,sqlstr);
end;
procedure TFrmtpunit.Button1Click(Sender: TObject);
begin
  inherited;
  with dxDBGrid1.DataSource.DataSet  do begin
        Append;
        Fields[1].Value:=INPUTBOX('�����','�����������ӵĳ��˵�λ','');
        Fields[2].Value:=datetostr(now);
        Fields[3].Value:=curuser.Name;
        Fields[0].Value:=getmax('tpunit','tpno');
        if Fields[1].Value<>'' then post else Cancel;
        savelog('����<'+Fields[1].Value+'>���˵�λ��¼',Fields[0].Value,'���˵�λ��Ϣ');
  end;
   dxDBGrid1.OptionsBehavior:=dxDBGrid1.OptionsBehavior-[edgoEditing];
end;

procedure TFrmtpunit.Button2Click(Sender: TObject);
var l_name:string;
begin
  inherited;
  with dxDBGrid1.DataSource.DataSet  do begin
        Edit;
        l_name :=INPUTBOX('�����','�������޸ĵĳ��˵�λ','');
        savelog('�޸�<'+Fields[1].Value+'>���˵�λ��¼',Fields[0].Value,'���˵�λ��Ϣ');
        if l_name<>'' then
        Fields[1].Value:=l_name;
        Fields[2].Value:=datetostr(now);
        Fields[3].Value:=curuser.Name;
        post;
  end;
end;

procedure TFrmtpunit.Button3Click(Sender: TObject);
begin
  inherited;
  
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN begin
        savelog('ɾ��<'+ADOQuery1.fieldbyname('tpunitname').AsString+'>���˵�λ��¼',ADOQuery1.fieldbyname('coalno').AsString,'���˵�λ��Ϣ');
        DeleteSelection
    end
    ELSE
      IF FocusedNode <> nil THEN begin
         savelog('ɾ��<'+ADOQuery1.fieldbyname('coalname').AsString+'>���˵�λ��¼',ADOQuery1.fieldbyname('coalno').AsString,'���˵�λ��Ϣ');
         TdxDBGridNode(FocusedNode).Delete;
      end;
  END;

end;

end.