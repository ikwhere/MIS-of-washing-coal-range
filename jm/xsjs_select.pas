unit xsjs_select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm_add, DB, ADODB, StdCtrls, Buttons, ExtCtrls;

type
  TFrmXsjsSelect = class(TFrmAdd)
    Label1: TLabel;
    ComboMonth: TComboBox;
    Label2: TLabel;
    ComboCustom: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function l_init:boolean;
  end;

var
  FrmXsjsSelect: TFrmXsjsSelect;

implementation

uses xsjs_add;

{$R *.dfm}
function TFrmXsjsSelect.l_init:boolean;

begin
AutoInCombobox(ComboCustom,'select CustomName from customs');
AutoInCombobox(ComboMonth,'select kjqj from kjqj  where clscunt=0 order by kjqj ');

end;
procedure TFrmXsjsSelect.FormShow(Sender: TObject);
begin
  inherited;
  l_init
end;

procedure TFrmXsjsSelect.BitBtn1Click(Sender: TObject);
begin
  inherited;
  FrmXsjsAdd:=TFrmXsjsAdd.Create(self);
  FrmXsjsAdd.SMonth:=ComboMonth.text;
  FrmXsjsAdd.Scustom:=ComboCustom.text;
  FrmXsjsAdd.ShowModal;
  self.Close;
end;

end.
