unit comfun;

interface
uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, Menus, StdCtrls, ExtCtrls, jpeg;
Const   WS_EX_LAYERED   = 80000;
Const   GWL_EXSTYLE   =   (-20);
Const   LWA_ALPHA   =   2;
Const   LWA_COLORKEY   =   1 ;
var ADOConnection1: TADOConnection;
function initdb():boolean;export;
//function adoqryopen(adoquery1:tadoquery;sqlstr:string):boolean;export;
//function adoqryexec(adoquery1:tadoquery;sqlstr:string):boolean; export;
function changeform(form1:Tform):boolean; export;
function inittree(account:string;TreeView1:TTreeView):boolean;export;
implementation
//初始化数据库连接
function initdb():boolean;export;
begin
    ADOConnection1:=TADOConnection.Create(application);
    ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=db.mdb;Persist Security Info=False';
    ADOConnection1.LoginPrompt:=false;
end;
//开启游标
function adoqryopen(adoquery1:tadoquery;sqlstr:string):boolean;export;
begin
    adoquery1:=Tadoquery.Create(application);
    adoquery1.Connection:=ADOConnection1;
    adoquery1.SQL.Text:=sqlstr;
    adoquery1.Open;
end;
//执行SQL
function adoqryexec(adoquery1:tadoquery;sqlstr:string):boolean; export;
begin
    adoquery1.Connection:=ADOConnection1;
    adoquery1.SQL.Text:=sqlstr;
    adoquery1.ExecSQL;
end;

//改变窗体格式
function changeform(form1:Tform):boolean; export;
var tmprtn:dword;
begin
     tmprtn:=getwindowlong(form1.Handle,WS_EX_LAYERED);
     tmprtn:= tmprtn Or WS_EX_LAYERED;
     setwindowlong(form1.Handle,WS_EX_LAYERED,tmprtn);
end;
//初始化侧边栏树结构
function inittree(account:string;TreeView1:TTreeView):boolean;export;
var tmpado:Tadoquery;
    tmpado1:Tadoquery;
    sqlstr:string;
    i,j:integer;
    newnode:Ttreenode;
begin
  initdb;
  sqlstr:='select * from tree where accout='''+account+''' and read=true';
  adoqryopen(tmpado,sqlstr);
  newnode:=Ttreenode.Create(nil);

  for i:=1 to tmpado.RecordCount do begin
     // newnode:=tmpado.fieldbyname('node').Value;
      newnode:=TreeView1.Items.Add(nil,newnode.Text);
      sqlstr:='select * from tree where accout='''+account+''' and node='''+newnode.Text+'''  and read=true';
      adoqryopen(tmpado1,sqlstr);
      for j:=1 to tmpado1.RecordCount do
          TreeView1.Items.AddChild(newnode,newnode.Text);
  end;
  newnode.Free;
end;
function initcheckcustom(ComboBox:TComboBox):boolean;export;
var sqlstr:string;
    ADOQtmp:tadoquery ;
begin
   sqlstr:='select CustomName from customs';
   ADOQtmp:=tadoquery.CREATE(APPLICATION);
   adoqryexec(ADOQtmp,sqlstr);
   while not ADOQtmp.eof do  begin

     ComboBox.Items.Add(ADOQtmp.fieldbyname('CustomName').asstring);
     ADOQtmp.Next;
   end;
end;
end.
