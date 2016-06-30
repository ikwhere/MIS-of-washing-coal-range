unit coal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, DB, ADODB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, StdCtrls, ExtCtrls, ComCtrls;

type
  TFrmCoal = class(TFrmMather)
    dxDBGrid1coalno: TdxDBGridMaskColumn;
    dxDBGrid1coalname: TdxDBGridColumn;
    dxDBGrid1Column3: TdxDBGridMaskColumn;
    dxDBGrid1Column4: TdxDBGridMaskColumn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  FrmCoal: TFrmCoal;

implementation
uses main;
{$R *.dfm}
function TFrmCoal.l_init:boolean;
var sqlstr:string;
begin
  sqlstr:='select * from b_coal';
  adoqryopen(ADOQuery1,sqlstr);
end;
procedure TFrmCoal.Button1Click(Sender: TObject);
begin
  inherited;
  with dxDBGrid1.DataSource.DataSet  do begin
        Append;
        Fields[1].Value:=INPUTBOX('输入框','请输入新添加的煤矿','');
        if Fields[1].Value<>'' then
        begin
           Fields[0].Value:=getmax('b_coal','coalno');
           Fields[2].Value:=datetostr(now);
           Fields[3].Value:=curuser.Name;
           post;
           savelog('增加<'+Fields[1].Value+'>煤矿记录',Fields[0].Value,'煤矿信息录入');
        end
        else Cancel;
  end;
  
    dxDBGrid1.OptionsBehavior:=dxDBGrid1.OptionsBehavior-[edgoEditing];
end;

procedure TFrmCoal.Button2Click(Sender: TObject);
var l_name:string;
begin
  inherited;
  with dxDBGrid1.DataSource.DataSet  do begin
        Edit;
        l_name:=trim(INPUTBOX('输入框','请输入修改的煤矿',''));
        if l_name<>'' then
        savelog('修改<'+Fields[1].Value+'>煤矿记录',Fields[0].Value,'煤矿信息录入');
        Fields[1].Value:=l_name;
        Fields[2].Value:=datetostr(now);
        Fields[3].Value:=curuser.Name;
        post;
  end;
end;

procedure TFrmCoal.Button3Click(Sender: TObject);
begin
  inherited;

  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN begin
        savelog('删除<'+ADOQuery1.fieldbyname('coalname').AsString+'>煤矿记录',ADOQuery1.fieldbyname('coalno').AsString,'煤矿信息录入');
        DeleteSelection;
    end
    ELSE
      IF FocusedNode <> nil THEN begin
        savelog('删除<'+ADOQuery1.fieldbyname('coalname').AsString+'>煤矿记录',ADOQuery1.fieldbyname('coalno').AsString,'煤矿信息录入');
        TdxDBGridNode(FocusedNode).Delete;
      end;
  END;

end;

procedure TFrmCoal.FormShow(Sender: TObject);
begin
  inherited;
  l_init
end;

end.
