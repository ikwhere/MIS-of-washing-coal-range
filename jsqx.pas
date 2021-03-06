unit jsqx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, DB, ADODB, StdCtrls, ExtCtrls, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms, ComCtrls;

type
  TFrmjsqx = class(TFrmMather)
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    Splitter1: TSplitter;
    dxDBGrid1Column1: TdxDBGridColumn;
    dxDBGrid1Column2: TdxDBGridColumn;
    dxDBGrid1Column3: TdxDBGridColumn;
    dxDBGrid1Column4: TdxDBGridCheckColumn;
    dxDBGrid1Column5: TdxDBGridCheckColumn;
    dxDBGrid1Column6: TdxDBGridCheckColumn;
    dxDBGrid1Column7: TdxDBGridCheckColumn;
    dxDBGrid1Column8: TdxDBGridColumn;
    Button5: TButton;
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
    function Copy():boolean;
    function Paste():boolean;
  end;

var
  Frmjsqx: TFrmjsqx;
  lcopydata:string;
implementation

{$R *.dfm}

function TFrmjsqx.Copy():boolean;
begin
   if ListBox1.ItemIndex>=0 then
      lcopydata:=ListBox1.Items[ListBox1.ItemIndex]
   else
    //  MessageDlg('您还没有选择要复制的数据!',mtWarning,[mbOK],0);
    MessageBox(Handle, '您还没有选择要复制的角色,请先选择角色!', '提示', MB_ICONERROR or MB_OK) ;
end;

function TFrmjsqx.Paste():boolean;
VAR SqlStr:string;
    TmpAdo,Tmpado2:Tadoquery;
    QXName:string;
begin
    IF lcopydata='' THEN BEGIN
       MessageBox(Handle, '您还没有选择要复制的角色,请先选择角色!', '提示', MB_ICONERROR or MB_OK);
       Abort
    END
    ELSE BEGIN
       QXName:=INPUTBOX('输入框','请输入要复制的角色名,可以定义新角色或已有角色','');
       IF  (QXName<>lcopydata) AND (QXName<>'') AND (MessageBox(Handle, PChar('您确定要把 '+lcopydata+' 的权限列表复制给 '+QXName+' 吗?'),'提示', MB_ICONWARNING or MB_YESNOCANCEL) = ID_YES) THEN BEGIN
           TmpAdo:=Tadoquery.Create(self);
           Tmpado2:=Tadoquery.Create(self);
           {Sqlstr:='delete from tree where usergroup='''+QXName+'''';
           adoqryexec(tmpado,sqlstr); }
           Sqlstr:='Select * from tree where usergroup='''+lcopydata+'''';
           adoqryopen(TmpAdo,sqlstr);
           WHILE NOT TmpAdo.Eof DO BEGIN
              Sqlstr:='Select count(*) as Rcount from tree'+//where usergroup='''+lcopydata+'''';
                                        ' where parentnode='''+TmpAdo.FIELDBYNAME('parentnode').AsString+''' '+
                                        ' and childnode='''+TmpAdo.FIELDBYNAME('childnode').AsString+''' '+
                                        ' and usergroup='''+QXName+'''';

              adoqryopen(ADOQtmp,sqlstr);
              if ADOQtmp.FieldByName('Rcount').AsInteger=0 then
              sqlstr:='INSERT INTO tree (parentnode,childnode,usergroup,qxread,qxwrite,qxdelete,qxadd,qxno) VALUES'+
                                        '('''+TmpAdo.FIELDBYNAME('parentnode').AsString+''','+
                                        ''''+TmpAdo.FIELDBYNAME('childnode').AsString+''','+
                                        ''''+QXName+''','+
                                        booltostr(TmpAdo.FIELDBYNAME('qxread').Asboolean)+','+
                                        booltostr(TmpAdo.FIELDBYNAME('qxwrite').Asboolean)+','+
                                        booltostr(TmpAdo.FIELDBYNAME('qxdelete').Asboolean)+','+
                                        booltostr(TmpAdo.FIELDBYNAME('qxadd').Asboolean)+','+
                                        getmax('tree','qxno')+')'
              else
               sqlstr:= 'update tree set qxread='+booltostr(TmpAdo.FIELDBYNAME('qxread').Asboolean)+','+
                                        'qxwrite='+booltostr(TmpAdo.FIELDBYNAME('qxwrite').Asboolean)+','+
                                        'qxdelete='+booltostr(TmpAdo.FIELDBYNAME('qxdelete').Asboolean)+','+
                                        'qxadd='+booltostr(TmpAdo.FIELDBYNAME('qxadd').Asboolean)+
                                        ' where parentnode='''+TmpAdo.FIELDBYNAME('parentnode').AsString+''' '+
                                        ' and childnode='''+TmpAdo.FIELDBYNAME('childnode').AsString+''' ' +
                                        ' and usergroup='''+QXName+'''';
               adoqryexec(Tmpado2,sqlstr);
               TmpAdo.Next;
           END;
           l_init;
           TmpAdo.Free;
           Tmpado2.Free;
       END;
    END;
end;

function TFrmjsqx.l_init:boolean;
VAR sqlstr:string;
    tmpado:Tadoquery;
    strlist1,strlist2:Tstringlist;
    i:integer;
begin
  tmpado:=Tadoquery.Create(self);
  strlist1:=Tstringlist.Create();
  sqlstr:='select distinct(usergroup) from tree';
  adoqryopen(tmpado,sqlstr);
  while not tmpado.Eof do begin
    strlist1.Add(tmpado.fieldbyname('usergroup').Value);
    tmpado.Next;
  end;
  ListBox1.Items.Assign(strlist1);

   Sqlstr:='Select * from funlist';
   adoqryopen(TmpAdo,sqlstr);
   for i:=0 to ListBox1.Items.Count-1 do begin
     TmpAdo.First;
     WHILE NOT TmpAdo.Eof DO BEGIN
        Sqlstr:='Select count(*) as Rcount from tree'+
                  ' where parentnode='''+TmpAdo.FIELDBYNAME('parentnode').AsString+''' '+
                  ' and childnode='''+TmpAdo.FIELDBYNAME('childnode').AsString+''''+
                  ' and usergroup='''+ListBox1.Items[i]+'''';;
        adoqryopen(ADOQtmp,sqlstr);
        if ADOQtmp.FieldByName('Rcount').AsInteger=0 then  begin
               sqlstr:='INSERT INTO tree (parentnode,childnode,usergroup,qxread,qxwrite,qxdelete,qxadd,qxno) VALUES'+
                            '('''+TmpAdo.FIELDBYNAME('parentnode').AsString+''','+
                            ''''+TmpAdo.FIELDBYNAME('childnode').AsString+''','+
                            ''''+ListBox1.Items[i]+''',0,0,0,0,'+getmax('tree','qxno')+')';
                adoqryexec(ADOQtmp,sqlstr);
        end;
        TmpAdo.Next;
     END;
   END;
  tmpado.Free;
end;



procedure TFrmjsqx.FormShow(Sender: TObject);
begin
  inherited;
  l_init;
end;

procedure TFrmjsqx.ListBox1Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
    if ListBox1.ItemIndex>=0 then begin
      sqlstr:='select * from tree where usergroup='''+ListBox1.Items[ListBox1.ItemIndex]+'''';
      adoqryopen(ADOQuery1,sqlstr);
    end;

end;

procedure TFrmjsqx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action:=cafree;
end;

procedure TFrmjsqx.Button1Click(Sender: TObject);
VAR sqlstr,NewName:string;
    strlist1:Tstringlist;
    Tmpado2:TADOQuery;
    Tmpstr:string;
begin
  inherited;
  NewName:=INPUTBOX('输入框','请输入新定义的角色名','');
  IF NewName<>'' then begin
     sqlstr:='select * from funlist';
     adoqryopen(ADOQtmp,sqlstr);
     Tmpado2:=TADOQuery.Create(self);
     WHILE NOT ADOQtmp.Eof DO BEGIN
        sqlstr:='INSERT INTO tree (qxno,parentnode,childnode,usergroup) VALUES'+
                                  '('+getmax('tree','qxno')+','+
                                  ''''+ADOQtmp.FIELDBYNAME('parentnode').AsString+''','+
                                  ''''+ADOQtmp.FIELDBYNAME('childnode').AsString+''','+
                                  ''''+NewName+''''+')';
        adoqryexec(Tmpado2,sqlstr);
        ADOQtmp.Next;
     END;
     ListBox1.Items.Add(NewName);
     Tmpado2.Free;
     l_init;
  END;
  dxDBGrid1.OptionsBehavior:=dxDBGrid1.OptionsBehavior-[edgoEditing];
end;

procedure TFrmjsqx.Button3Click(Sender: TObject);
VAR SqlStr:string;
    TmpAdo:Tadoquery;
begin
  inherited;
  if ListBox1.ItemIndex>=0 then BEGIN
     TmpAdo:=Tadoquery.Create(self);
     Sqlstr:='delete from tree where usergroup='''+ListBox1.Items[ListBox1.ItemIndex]+'''';
     adoqryexec(TmpAdo,sqlstr);
     TmpAdo.Free;
     l_init;
  END;
end;

procedure TFrmjsqx.Button4Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmjsqx.Button6Click(Sender: TObject);
VAR SqlStr:string;
    TmpAdo:Tadoquery;
begin
  inherited;
  dxDBGrid1.DataSource.DataSet.First;
  TmpAdo:=Tadoquery.Create(self);
  while not dxDBGrid1.DataSource.DataSet.Eof do begin
        sqlstr:='update tree set qxread='+booltostr(dxDBGrid1.DataSource.DataSet.fieldbyname('qxread').AsBoolean)+','+
                                'qxwrite='+booltostr(dxDBGrid1.DataSource.DataSet.fieldbyname('qxwrite').AsBoolean)+','+
                                'qxdelete='+booltostr(dxDBGrid1.DataSource.DataSet.fieldbyname('qxdelete').AsBoolean)+','+
                                'qxadd='+booltostr(dxDBGrid1.DataSource.DataSet.fieldbyname('qxadd').AsBoolean)+
                                ' where qxno='+dxDBGrid1.DataSource.DataSet.fieldbyname('qxno').AsString;

        adoqryexec(TmpAdo,sqlstr);
        dxDBGrid1.DataSource.DataSet.Next;
  end;
end;

procedure TFrmjsqx.Button2Click(Sender: TObject);
begin
  inherited;
    dxDBGrid1.OptionsBehavior:=dxDBGrid1.OptionsBehavior+[edgoEditing];
end;

end.
