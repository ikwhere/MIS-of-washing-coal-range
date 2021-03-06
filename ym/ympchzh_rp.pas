unit ympchzh_rp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MotherForm_add, DB, ADODB, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  frxClass, frxDBSet;

type
  TFrmympchzhrp = class(TFrmAdd)
    Label1: TLabel;
    ComboBox1: TComboBox;
    DatePicker1: TDateTimePicker;
    DatePicker2: TDateTimePicker;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ComboBox2: TComboBox;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmympchzhrp: TFrmympchzhrp;

implementation

{$R *.dfm}

procedure TFrmympchzhrp.RadioButton1Click(Sender: TObject);
begin
  inherited;
  ComboBox2.Enabled:=false;
   DatePicker2.Enabled:=true;
   DatePicker1.Enabled:=true;
end;

procedure TFrmympchzhrp.RadioButton2Click(Sender: TObject);
begin
  inherited;
   DatePicker2.Enabled:=false;
   DatePicker1.Enabled:=false;
   ComboBox2.Enabled:=true;
end;

procedure TFrmympchzhrp.BitBtn1Click(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  sqlstr:='select * from wroomdata,ymzl where ymzldate=tpdate and ymzlcoal=tpcoal and '+
           ' tpdate between '+#39+datetostr(DatePicker1.Date)+
           #39+' and '+#39+datetostr(DatePicker1.Date)+#39;
  adoqryopen(ADOQuery1,sqlstr);
end;

procedure TFrmympchzhrp.FormShow(Sender: TObject);
begin
  inherited;
  AutoInCombobox(ComboBox1,'select coalname from b_coal');
  AutoInCombobox(ComboBox2,'select kjqj from kjqj where clscunt=0 order by startdate');
  RadioButton1.Checked:=true;
end;

end.
