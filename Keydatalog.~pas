unit Keydatalog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm, dxExEdtr, DB, ADODB, ComCtrls, StdCtrls, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, ExtCtrls;

type
  TFrmLog = class(TFrmMather)
    dxDBGrid1logno: TdxDBGridMaskColumn;
    dxDBGrid1logcntet: TdxDBGridMaskColumn;
    dxDBGrid1logvalue: TdxDBGridMaskColumn;
    dxDBGrid1logkeydate: TdxDBGridMaskColumn;
    dxDBGrid1loguser: TdxDBGridMaskColumn;
    dxDBGrid1Column6: TdxDBGridMaskColumn;
    procedure FormShow(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  FrmLog: TFrmLog;

implementation

{$R *.dfm}
function TFrmLog.l_init:boolean;
VAR sqlstr:string;
begin
    sqlstr:='select * from b_log';
    adoqryopen(ADOQuery1,sqlstr);
    ADOQuery1.Refresh;
end;
procedure TFrmLog.FormShow(Sender: TObject);
begin
  inherited;
l_init
end;

procedure TFrmLog.Button8Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
    sqlstr:='select * from b_log where logkeydate between '+#39+datetostr(DatePicker1.Date)+#39+' and '+#39+datetostr(DatePicker2.Date)+#39+'';
    adoqryopen(ADOQuery1,sqlstr);
    ADOQuery1.Refresh;
end;

end.
