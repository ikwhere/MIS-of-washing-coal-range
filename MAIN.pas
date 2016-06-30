unit MAIN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, Menus, StdCtrls, ExtCtrls, jpeg, ToolWin,
  ActnMan, ActnCtrls;
const qx_m=3;    //权限位数,用于控制权限 如111  ,  1111
type
  TFrmMain = class(TForm)
    ADOQuery1: TADOQuery;
    TreViNagter: TTreeView;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    GrpBoxH: TGroupBox;
    StatusBar1: TStatusBar;
    N2: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure TreViNagterMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }


    function inittree(workno:string;TreeView1:TTreeView):boolean;
    function ckqx(MainMenu1:TMainMenu;TreViNagter:TTreeView):boolean;
    procedure openform;
    //动作分发过程
    {capt 窗体标题
    action  动作编号  1 增加  2 修改  3 删除  4 复制  5 粘贴 }
    function depch(capt:string;action:integer):boolean;
  end;
  type
      PMyData=^TMyData;
      TMyData=Record
          sFName:string;
          sLName:String;
          nIndex:integer;
  end;
  type
      Tcuruser=class
        Name:string;
        usergroup:string;
  end;

var
  FrmMain: TFrmMain;
  curuser:Tcuruser;
implementation
uses MotherForm,jsqx, user, wroomdata, kkdata, price, myjs, Kjqj, coal,
  tpunit, truckinfo, ymzl, scjmzl, sczmcl, PducTkwt, Login1, jmsxdata,
  customs, jmsxzldata, jmprc, Othsxdata, xskk, sxjs, Keydatalog;
{$R *.dfm}
function TFrmMain.ckqx(MainMenu1:TMainMenu;TreViNagter:TTreeView):boolean;
var m:pointer;
    qxvalue:string;
    qx:integer;
begin
    N6.Enabled:=false;   //新建
    N5.Enabled:=false;   // 编辑
    N8.Enabled:=false;
    N9.Enabled:=false;
    N10.Enabled:=false;
    N20.Enabled:=false;  //删除
    if TreViNagter.Selected.Data<>nil then begin
      m:=TreViNagter.Selected.Data;
      qx:=pmyData(m)^.nIndex;
      qxvalue:=format('%.'+inttostr(qx_m)+'d',[qx]);
      if copy(qxvalue,1,1)='1' then N20.Enabled:=true;
      if copy(qxvalue,2,1)='1' then begin
           N5.Enabled:=true;
           N8.Enabled:=true;
           N9.Enabled:=true;
           N10.Enabled:=true;
      end;
      if copy(qxvalue,3,1)='1' then begin
         N6.Enabled:=TRUE;
      end;
    end;
end;

function TFrmMain.inittree(workno:string;TreeView1:TTreeView):boolean;
var tmpado:Tadoquery;
    tmpado1:Tadoquery;
    sqlstr:string;
    i,j:integer;
    newnode,chdnewnode:Ttreenode;
    myshuju: PMyData;
begin
  sqlstr:='select distinct(parentnode) from tree,userlist where userlist.usergroup=tree.usergroup and userid='''+workno+''' and qxread=1';
  tmpado:=Tadoquery.Create(application);
  tmpado1:=Tadoquery.Create(application);
  FrmMather.adoqryopen(tmpado,sqlstr);
  newnode:=Ttreenode.Create(nil);
  chdnewnode:=Ttreenode.Create(nil);
  for i:=1 to tmpado.RecordCount do begin
     // newnode:=tmpado.fieldbyname('node').Value;
      newnode:=TreeView1.Items.Add(nil,tmpado.fieldbyname('parentnode').Value);
    //  sqlstr:='select * from tree,userlist where tree.usergroup=userlist.usergroup and userid='''+workno+''' and parentnode='''+newnode.Text+'''  and qxread=1';
    
      FrmMather.adoqryopen(tmpado1,sqlstr);
      for j:=1 to tmpado1.RecordCount do begin
          chdnewnode:=TreeView1.Items.AddChild(newnode,tmpado1.fieldbyname('childnode').Value);
          New(myshuju);
          myshuju.nIndex:=0;
          myshuju.sFName:=tmpado1.fieldbyname('childnode').Value;
          if tmpado1.fieldbyname('qxwrite').Value=true then begin
             myshuju.nIndex:=myshuju.nIndex+10;
          end;
          if tmpado1.fieldbyname('qxdelete').Value=true then begin
             myshuju.nIndex:=myshuju.nIndex+100;
          end;
          if tmpado1.fieldbyname('qxadd').Value=true then begin
             myshuju.nIndex:=myshuju.nIndex+1;
          end;
          chdnewnode.Data:=myshuju;
          tmpado1.Next;
      end;
      tmpado.Next;
  end;
  tmpado.Free;
  tmpado1.Free;
end;
procedure TFrmMain.N3Click(Sender: TObject);
begin
   application.Terminate;
end;

procedure TFrmMain.N13Click(Sender: TObject);
begin
    (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
    if (Sender as TMenuItem).Checked then GrpBoxH.Visible:=true else GrpBoxH.Visible:=false;
    GrpBoxH.Repaint;
end;

procedure TFrmMain.N12Click(Sender: TObject);
begin
    (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
    if (Sender as TMenuItem).Checked then TreViNagter.Visible:=true else TreViNagter.Visible:=false;
end;
procedure TFrmMain.openform;
var m:pointer;
    value:string;
    i:integer;
begin
  {点击操作树执行的动作

  ***********新增程式格式*********
  
  if pmyData(m)^.sFName='程式名' then begin
    WindowName:=TWindowName.Create(self);
    WindowName.Show;
  end;

 }
      if TreViNagter.Selected.Data<>nil then begin
      m:=TreViNagter.Selected.Data;
      for i:=0 to FrmMain.MDIChildCount do begin
      //   FrmMain.MDIChildren[i].Free;
      end;
      if pmyData(m)^.sFName='权限设置' then begin
        Frmjsqx:=TFrmjsqx.Create(self);
        Frmjsqx.Show;
      end;
      if pmyData(m)^.sFName='用户设置' then begin
        FrmUser:=TFrmUser.Create(self);
        FrmUser.Show;
      end;
      if pmyData(m)^.sFName='原煤磅房数据维护' then begin
        Frmwroomdata:=TFrmwroomdata.Create(self);
        Frmwroomdata.Show;
      end;
      if pmyData(m)^.sFName='原煤扣款录入' then begin
        Frmkkdata:=TFrmkkdata.Create(self);
        Frmkkdata.Show;
      end;
      if pmyData(m)^.sFName='原煤价格维护' then begin
        Frmprice:=TFrmprice.Create(self);
        Frmprice.Show;
      end;
      if pmyData(m)^.sFName='原煤煤款运费结算' then begin
        Frmmyjs:=TFrmmyjs.Create(self);
        Frmmyjs.Show;
      end;
      if pmyData(m)^.sFName='会计期间设置' then begin
        FrmKjqj:=TFrmKjqj.Create(self);
        FrmKjqj.Show;
      end;
      if pmyData(m)^.sFName='煤矿信息录入' then begin
        FrmCoal:=TFrmCoal.Create(self);
        FrmCoal.Show;
      end;
      if pmyData(m)^.sFName='承运单位信息' then begin
        Frmtpunit:=TFrmtpunit.Create(self);
        Frmtpunit.Show;
      end;
      if pmyData(m)^.sFName='承运车号录入' then begin
        FrmTruckInfo:=TFrmTruckInfo.Create(self);
        FrmTruckInfo.Show;
      end;
      if pmyData(m)^.sFName='原煤质量数据录入' then begin
        Frmymzl:=TFrmymzl.Create(self);
        Frmymzl.Show;
      end;
      if pmyData(m)^.sFName='精煤产量/质量录入' then begin
        Frmscjm:=TFrmscjm.Create(self);
        Frmscjm.Show;
      end;
      if pmyData(m)^.sFName='中煤/矸石/泥煤产量录入' then begin
        FrmSczmcl:=TFrmSczmcl.Create(self);
        FrmSczmcl.Show;
      end;
      if pmyData(m)^.sFName='产品名称及单位吨数维护' then begin
        FrmPducTkwt:=TFrmPducTkwt.Create(self);
        FrmPducTkwt.Show;
      end;
      if pmyData(m)^.sFName='精煤销售数据录入' then begin
        Frmjmsxdata:=TFrmjmsxdata.Create(self);
        Frmjmsxdata.Show;
      end;
      if pmyData(m)^.sFName='客户单位维护' then begin
        FrmCustoms:=TFrmCustoms.Create(self);
        FrmCustoms.Show;
      end;
      if pmyData(m)^.sFName='精煤销售质量数据录入' then begin
        Frmjmsxzldata:=TFrmjmsxzldata.Create(self);
        Frmjmsxzldata.Show;
      end;
      if pmyData(m)^.sFName='销售价格录入' then begin
        FrmJmprc:=TFrmJmprc.Create(self);
        FrmJmprc.Show;
      end;
      if pmyData(m)^.sFName='中煤/泥煤/矸石销售数据录入' then begin
        FrmOthXs:=TFrmOthXs.Create(self);
        FrmOthXs.Show;
      end;
      if pmyData(m)^.sFName='销售扣款录入' then begin
        Frmxskk:=TFrmxskk.Create(self);
        Frmxskk.Show;
      end;
      if pmyData(m)^.sFName='销售结算' then begin
        Frmsxjs:=TFrmsxjs.Create(self);
        Frmsxjs.Show;
      end;
      if pmyData(m)^.sFName='重要数据日志查看' then begin
        FrmLog:=TFrmLog.Create(self);
        FrmLog.Show;
      end;
    end;
end;
procedure TFrmMain.TreViNagterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if TreViNagter.Items.Count>0 then begin
      ckqx(MainMenu1,TreViNagter);
      openform;
   end
end;

procedure TFrmMain.FormCreate(Sender: TObject);

begin
   curuser:=Tcuruser.Create;

end;
function TFrmMain.depch(capt:string;action:integer):boolean;
begin
  if capt='角色权限设置' then begin
    if action=1 then begin
       Frmjsqx.Button1.Click;
    end;
    IF action=4 then begin
       Frmjsqx.copy;
    end;
    IF action=5 then begin
       Frmjsqx.paste;
    end;
  end;

end;
procedure TFrmMain.N6Click(Sender: TObject);
begin
  depch(FrmMain.ActiveMDIChild.Caption,1)
end;

procedure TFrmMain.N5Click(Sender: TObject);
begin
  depch(FrmMain.ActiveMDIChild.Caption,2);
end;

procedure TFrmMain.N20Click(Sender: TObject);
begin
  depch(FrmMain.ActiveMDIChild.Caption,3);
end;
procedure TFrmMain.N9Click(Sender: TObject);
begin
  depch(FrmMain.ActiveMDIChild.Caption,4);
end;

procedure TFrmMain.N10Click(Sender: TObject);
begin
  depch(FrmMain.ActiveMDIChild.Caption,5);
end;

procedure TFrmMain.N2Click(Sender: TObject);
var i:integer;
begin
   curuser.Name:='';
   curuser.usergroup:='';
   TreViNagter.Items.Clear;
   FOR i:=0 to FrmMain.MDIChildCount-1 do begin
        FrmMain.MDIChildren[i].Free;
   end;
   FrmLogin:=TFrmLogin.Create(self);
   FrmLogin.Show;
end;

end.
