library commfunc;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  DB, ADODB, ComCtrls, Menus, StdCtrls, ExtCtrls, jpeg,Forms,Windows,
  comfun in 'comfun.pas';
{Const   WS_EX_LAYERED   = 80000;
Const   GWL_EXSTYLE   =   (-20);
Const   LWA_ALPHA   =   2;
Const   LWA_COLORKEY   =   1 ;
var ADOConnection1: TADOConnection;
{function initdb():boolean;export;
function adoqryopen(adoquery1:tadoquery;sqlstr:string):boolean;export;
function adoqryexec(adoquery1:tadoquery;sqlstr:string):boolean; export;   }
{function initdb():boolean;stdcall;
begin
    ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=db.mdb;Persist Security Info=False';
    ADOConnection1.LoginPrompt:=false;
end;
function adoqryopen(adoquery1:tadoquery;sqlstr:string):boolean;export;
begin
    adoquery1:=Tadoquery.Create(application);
    adoquery1.Connection:=ADOConnection1;
    adoquery1.SQL.Text:=sqlstr;
    adoquery1.Open;
end;
function adoqryexec(adoquery1:tadoquery;sqlstr:string):boolean; export;
begin
    adoquery1:=Tadoquery.Create(application);
    adoquery1.Connection:=ADOConnection1;
    adoquery1.SQL.Text:=sqlstr;
    adoquery1.ExecSQL;
end;
function changeform(form1:Tform):boolean; export;
var tmprtn:dword;
begin
     tmprtn:=getwindowlong(form1.Handle,WS_EX_LAYERED);
     tmprtn:= tmprtn Or WS_EX_LAYERED;
     setwindowlong(form1.Handle,WS_EX_LAYERED,tmprtn);
end;
function inittree(account:string;TreeView1:TTreeView):boolean;export;
var tmpado:Tadoquery;
    tmpado1:Tadoquery;
    sqlstr:string;
    i,j:integer;
    newnode:Ttreenode;
begin
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
{function initmainform(form1:Tform):boolean;
var i:dword;
begin

end; }
exports
initdb,changeform,inittree;
{$R *.res}

begin
end.
