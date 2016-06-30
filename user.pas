unit user;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms,
  ComCtrls;

type
  TFrmUser = class(TFrmMather)
    dxDBGrid1Column1: TdxDBGridColumn;
    dxDBGrid1Column2: TdxDBGridColumn;
    dxDBGrid1Column3: TdxDBGridPickColumn;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  FrmUser: TFrmUser;

implementation

uses UserAdd;

{$R *.dfm}

procedure TFrmUser.Button4Click(Sender: TObject);
begin
  inherited;
  {IF (ADOTable1.State IN dsEditModes) THEN
         ADOTable1.Cancel;   }
    close;
end;

procedure TFrmUser.Button3Click(Sender: TObject);
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
function TFrmUser.l_init:boolean;
VAR sqlstr:string;
    strlist1:Tstringlist;
begin
  sqlstr:='select * from userlist';
  adoqryopen(ADOQuery1,sqlstr);
 { ADOTable1.TableName:='userlist';
  ADOTable1.Active:=Enabled;       }
  strlist1:=Tstringlist.Create();
  sqlstr:='select distinct(usergroup) from tree';
  adoqryopen(ADOQtmp,sqlstr);
  while not ADOQtmp.Eof do begin
    strlist1.Add(ADOQtmp.fieldbyname('usergroup').Value);
    ADOQtmp.Next;
  end;
  dxDBGrid1Column3.Items.Assign(strlist1);
end;
procedure TFrmUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action:=cafree;
end;

procedure TFrmUser.FormShow(Sender: TObject);
begin
  inherited;
  l_init;
end;

procedure TFrmUser.Button2Click(Sender: TObject);
begin
  inherited;
  FrmUserAdd:=TFrmUserAdd.Create(self);
  FrmUserAdd.ComboUG.Items.Assign(dxDBGrid1Column3.Items);
  FrmUserAdd.ComboUG.ItemIndex:=FrmUserAdd.ComboUG.Items.IndexOf(trim(ADOQuery1.Fields[3].AsString));
  FrmUserAdd.Labelno.Caption:=trim(ADOQuery1.Fields[0].AsString);
  FrmUserAdd.EdtUser.Text:=ADOQuery1.Fields[1].AsString;
  FrmUserAdd.EdtUser.Enabled:=False;
  FrmUserAdd.Edtpwd.Text:=ADOQuery1.Fields[2].AsString;
  FrmUserAdd.ShowModal;
  l_init
end;

procedure TFrmUser.Button1Click(Sender: TObject);
begin
  inherited;
  FrmUserAdd:=TFrmUserAdd.Create(self);
  FrmUserAdd.ComboUG.Items.Assign(dxDBGrid1Column3.Items);
  FrmUserAdd.Labelno.Caption:=getmax('userlist','userno');
  FrmUserAdd.ShowModal;
  l_init
end;

end.
