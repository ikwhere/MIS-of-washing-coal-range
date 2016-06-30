unit Kjqj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, ADODB, DB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, StdCtrls, ExtCtrls,DateUtils, dxDBTLCl, dxGrClms, ComCtrls;

type
  TFrmKjqj = class(TFrmMather)
    Button5: TButton;
    dxDBGrid1kjqj: TdxDBGridColumn;
    dxDBGrid1startdate: TdxDBGridDateColumn;
    dxDBGrid1enddate: TdxDBGridDateColumn;
    dxDBGrid1season: TdxDBGridColumn;
    dxDBGrid1Column5: TdxDBGridCheckColumn;
    Button7: TButton;
    Button9: TButton;
    procedure Button5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  FrmKjqj: TFrmKjqj;

implementation

uses MAIN;

{$R *.dfm}
function TFrmKjqj.l_init:boolean;
var sqlstr:string;
begin
  sqlstr:='select * from kjqj order by startdate';
  adoqryopen(ADOQuery1,sqlstr);
 {  ADOTable1.TableName:='kjqj';
   ADOTable1.Active:=true;   }
end;
procedure TFrmKjqj.Button5Click(Sender: TObject);
var l_year:string;
        i:integer;
    sqlstr:string;
begin
  inherited;
  IF NOT FrmMain.N6.Enabled THEN BEGIN
    MessageBox(Handle, '您无此权限,请联系管理员!', '提示', MB_ICONERROR or MB_OK) ;
    ABORT
  END;
  dxDBGrid1.OptionsBehavior:=dxDBGrid1.OptionsBehavior+[edgoEditing];
  Button6.Enabled:=TRUE;
  laction:='ADD';
  l_year:=INPUTBOX('输入框','请输入要添加会计期间的年份',inttostr(yearof(now())));
  if l_year='' then ABORT;
  sqlstr:='select distinct(kjqj) from kjqj ';
  adoqryopen(ADOQtmp,sqlstr);
  while NOT ADOQtmp.Eof do begin
       if l_year=copy(ADOQtmp.Fields[0].AsString,1,4) then begin
           MessageBox(Handle, '此年份的会计期间已存在!', '提示', MB_ICONERROR or MB_OK) ;
           ABORT
       end;
       ADOQtmp.Next;
  end;
  if l_year<>'' then begin
     for i:=1 to 12 do begin
         with dxDBGrid1.DataSource.DataSet do begin
           Insert;
           Fields[0].Value:=l_year+'年'+inttostr(i)+'月';
           Fields[1].Value:=l_year+'-'+inttostr(i)+'-1';
         case i of
         1: begin
                Fields[2].Value:=l_year+'-'+inttostr(i)+'-31';
                Fields[3].Value:='一';
                Fields[4].Value:=true;
            end;
         2: begin
             If (strtoint(l_year) Mod 400 = 0) Or ((strtoint(l_year) Mod 4 = 0) And (strtoint(l_year) Mod 100 <> 0)) Then
                    Fields[2].Value:=l_year+'-'+inttostr(i)+'-29'
             else
                   Fields[2].Value:=l_year+'-'+inttostr(i)+'-28';
             Fields[3].Value:='一';
             Fields[4].Value:=true;
            end;
         3: begin
             Fields[2].Value:=l_year+'-'+inttostr(i)+'-31';
             Fields[3].Value:='一';
             Fields[4].Value:=true;
            end;
         4: begin
             Fields[2].Value:=l_year+'-'+inttostr(i)+'-30';
             Fields[3].Value:='二';
             Fields[4].Value:=true;
            end;
         5: begin
             Fields[2].Value:=l_year+'-'+inttostr(i)+'-31';
             Fields[3].Value:='二';
             Fields[4].Value:=true;
            end;
         6: begin
             Fields[2].Value:=l_year+'-'+inttostr(i)+'-30';
             Fields[3].Value:='二';
             Fields[4].Value:=true;
            end;
         7: begin
             Fields[2].Value:=l_year+'-'+inttostr(i)+'-31';
             Fields[3].Value:='三';
             Fields[4].Value:=true;
            end;
         8: begin
             Fields[2].Value:=l_year+'-'+inttostr(i)+'-31';
             Fields[3].Value:='三';
             Fields[4].Value:=true;
            end;
         9: begin
             Fields[2].Value:=l_year+'-'+inttostr(i)+'-30';
             Fields[3].Value:='三';
             Fields[4].Value:=true;
            end;
         10: begin
             Fields[2].Value:=l_year+'-'+inttostr(i)+'-31';
             Fields[3].Value:='四';
             Fields[4].Value:=true;
            end;
         11: begin
             Fields[2].Value:=l_year+'-'+inttostr(i)+'-30';
             Fields[3].Value:='四';
             Fields[4].Value:=true;
            end;
         12: begin
             Fields[2].Value:=l_year+'-'+inttostr(i)+'-31';
             Fields[3].Value:='四';
             Fields[4].Value:=true;
            end;
         end;
     end;
  end;
end;
end;
procedure TFrmKjqj.FormShow(Sender: TObject);
begin
  inherited;
  l_init
end;

procedure TFrmKjqj.Button2Click(Sender: TObject);
begin
  inherited;
   dxDBGrid1.OptionsBehavior:=dxDBGrid1.OptionsBehavior+[edgoEditing];
end;

procedure TFrmKjqj.Button3Click(Sender: TObject);
begin
  inherited;
  WITH dxDBGrid1 DO
  BEGIN
    IF (FocusedNode <> nil) AND (SelectedCount = 1) AND
       FocusedNode.HasChildren THEN Exit;
    IF SelectedCount > 1 THEN DeleteSelection
    ELSE
      IF FocusedNode <> nil THEN TdxDBGridNode(FocusedNode).Delete;
  END;
end;

procedure TFrmKjqj.Button7Click(Sender: TObject);
var pkjqj:pchar;
begin
  inherited;
  IF NOT FrmMain.N5.Enabled THEN BEGIN
 //   MessageDlg('您无此权限,请联系管理员!',mtError,[mbOK],0);
    MessageBox(Handle, '您无此权限,请联系管理员!', '提示', MB_ICONERROR or MB_OK) ;
    ABORT
  END;
  pkjqj:=PChar('您确定要关闭'+adoquery1.fieldbyname('kjqj').asstring+'的帐目吗?');
   if not (MessageBox(Handle, pkjqj,
      '提示', MB_ICONWARNING or MB_YESNOCANCEL) = ID_YES) then
      Abort;
    with dxDBGrid1.DataSource.DataSet do begin
        edit;
        FIELDS[4].Value:=true;
        post;
    end;
end;

procedure TFrmKjqj.Button9Click(Sender: TObject);
begin
  inherited;
  IF NOT FrmMain.N5.Enabled THEN BEGIN
 //   MessageDlg('您无此权限,请联系管理员!',mtError,[mbOK],0);
    MessageBox(Handle, '您无此权限,请联系管理员!', '提示', MB_ICONERROR or MB_OK) ;
    ABORT
  END;
    with dxDBGrid1.DataSource.DataSet do begin
        edit;
        FIELDS[4].Value:=false;
        post;
    end;
end;

end.
