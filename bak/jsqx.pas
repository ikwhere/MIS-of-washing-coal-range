unit jsqx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,MAIN,
  Menus, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms;

type
  TFrmjsqx = class(TFrmMather)
    ListBox1: TListBox;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ADOQtmp2: TADOQuery;
    dxDBGrid1node: TdxDBGridColumn;
    dxDBGrid1childnode: TdxDBGridColumn;
    dxDBGrid1usergroup: TdxDBGridColumn;
    dxDBGrid1qxread: TdxDBGridCheckColumn;
    dxDBGrid1qxwrite: TdxDBGridCheckColumn;
    dxDBGrid1qxdelete: TdxDBGridCheckColumn;
    dxDBGrid1qxadd: TdxDBGridCheckColumn;
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  Frmjsqx: TFrmjsqx;

implementation
uses jsqx_add ;
{$R *.dfm}
function TFrmjsqx.l_init:boolean;
var sqlstr:string;
    tmpado:Tadoquery;
    strlist1,strlist2:Tstringlist;
    i:integer;
begin
  tmpado:=Tadoquery.Create(application);
  strlist1:=Tstringlist.Create();
  sqlstr:='select distinct(usergroup) from tree';
  adoqryopen(tmpado,sqlstr);
  while not tmpado.Eof do begin
    strlist1.Add(tmpado.fieldbyname('usergroup').Value);
    tmpado.Next;
  end;
  ListBox1.Items.Assign(strlist1);

end;
procedure TFrmjsqx.FormShow(Sender: TObject);

begin
  inherited;
  l_init;
end;

procedure TFrmjsqx.ListBox1Click(Sender: TObject);
var sqlstr:string;
    tmpado:Tadoquery;
begin
  inherited;
 // if ListBox1.ItemIndex<>0 then begin
    if ListBox1.ItemIndex>=0 then begin
      sqlstr:='select * from tree where usergroup='''+ListBox1.Items[ListBox1.ItemIndex]+'''';
      adoqryopen(ADOQuery1,sqlstr);
    end;
//  end;
end;

procedure TFrmjsqx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
 // ADOQuery1.UpdateRecord;
 Action:=cafree;
end;

procedure TFrmjsqx.Button1Click(Sender: TObject);
begin
  inherited;
  IF NOT FrmMain.N6.Enabled THEN BEGIN
    MessageDlg('您无此权限,请联系管理员!',mtError,[mbOK],0);
    ABORT
  END;
  laction:='ADD';
  Frmjsqx_add:=TFrmjsqx_add.Create(self);
  Frmjsqx_add.ShowModal; 
end;

procedure TFrmjsqx.Button5Click(Sender: TObject);
VAR NewName:string;
VAR sqlstr:string;
begin
  inherited;
  IF NOT FrmMain.N6.Enabled THEN BEGIN
    MessageDlg('您无此权限,请联系管理员!',mtError,[mbOK],0);
    ABORT
  END;
  NewName:=INPUTBOX('输入框','请输入新定义的角色名','');
  if NewName<>'' then begin
     sqlstr:='select * from funlist';
     adoqryopen(ADOQtmp,sqlstr);
     WHILE NOT ADOQtmp.Eof DO BEGIN
        sqlstr:='INSERT INTO tree (node,childnode,usergroup) VALUES'+
                                  '('''+ADOQtmp.FIELDBYNAME('node').AsString+''','+
                                  ''''+ADOQtmp.FIELDBYNAME('childnode').AsString+''','+
                                  ''''+NewName+''''+')';
        adoqryexec(ADOQtmp2,sqlstr);
        ADOQtmp.Next;
     END;
     ListBox1.Items.Add(NewName);
  end;

end;

procedure TFrmjsqx.Button2Click(Sender: TObject);
begin
  inherited;
  IF NOT FrmMain.N5.Enabled THEN BEGIN
    MessageDlg('您无此权限,请联系管理员!',mtError,[mbOK],0);
    ABORT
  END;
  IF (Sender as Tbutton).Caption:='保存' THEN
    (Sender as Tbutton).Caption:='修改'
  ELSE
    (Sender as Tbutton).Caption:='保存';
  DBGrid1.Options:=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit];
  ADOQuery1.Insert;
end;

end.

