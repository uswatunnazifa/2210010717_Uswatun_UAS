unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, frxClass, frxExportPDF;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    cbb1: TComboBox;
    lbl7: TLabel;
    lbl8: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    lbl9: TLabel;
    edt6: TEdit;
    btn6: TButton;
    btn7: TButton;
    dbgrd1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: string;

implementation

uses
  Unit2, Unit3;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
cbb1.Items.Clear;
cbb1.Items.Add('PILIH--');
cbb1.Items.Add('yes');
cbb1.Items.Add('no');
cbb1.ItemIndex := 0;
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
    edt1.Text := DataModule2.zqry1.Fields[1].AsString;
    edt2.Text := DataModule2.zqry1.Fields[2].AsString;
    edt3.Text := DataModule2.zqry1.Fields[3].AsString;
    edt4.Text := DataModule2.zqry1.Fields[4].AsString;
    edt5.Text := DataModule2.zqry1.Fields[5].AsString;
    cbb1.Text := DataModule2.zqry1.Fields[6].AsString;

    a := DataModule2.zqry1.Fields[0].AsString;

    btn1.Enabled := False;
    btn2.Enabled := False;
    btn3.Enabled := True;
    btn4.Enabled := True;
    btn5.Enabled := True;
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  diskon: Integer;
begin
if edt1.Text = '' then
begin
ShowMessage('NIK Tidak Boleh Kosong!');
end else
if DataModule2.zqry1.Locate('nik',edt1.Text,[]) then
begin
ShowMessage('NIK '+edt1.Text+' Sudah Ada Didalam Sistem');
end else
begin
  DataModule2.zqry1.SQL.Clear;
  DataModule2.zqry1.SQL.Add('insert into kustomer (nik, name, telp, email, alamat, member) values (:nik, :name, :telp, :email, :alamat, :member)');
  DataModule2.zqry1.Params.ParamByName('nik').AsInteger := StrToInt(edt1.Text);
  DataModule2.zqry1.Params.ParamByName('name').AsString := edt2.Text;
  DataModule2.zqry1.Params.ParamByName('telp').AsString := edt3.Text;
  DataModule2.zqry1.Params.ParamByName('email').AsString := edt4.Text;
  DataModule2.zqry1.Params.ParamByName('alamat').AsString := edt5.Text;
  DataModule2.zqry1.Params.ParamByName('member').AsString := cbb1.Text;
  DataModule2.zqry1.ExecSQL;


  if cbb1.Text = 'yes' then
    diskon := 10
  else
    diskon := 5;

  lbl8.Caption := IntToStr(diskon) + '%';

  DataModule2.zqry1.SQL.Clear;
  DataModule2.zqry1.SQL.Add('select * from kustomer');
  DataModule2.zqry1.Open;
  ShowMessage('Data Berhasil Disimpan!');
end;

end;

procedure TForm1.btn1Click(Sender: TObject);
begin
btn1.Enabled:= False;
btn2.Enabled:= True;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= True;
edt1.Text :='';
edt2.Text :='';
edt3.Text :='';
edt4.Text :='';
edt5.Text :='';
cbb1.Text :='';
lbl8.Caption :='';
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
if edt1.Text = '' then
begin
ShowMessage('NIK Tidak Boleh Kosong!');
end else
if DataModule2.zqry1.Locate('nik',edt1.Text,[]) then
begin
ShowMessage('NIK '+edt1.Text+' Sudah Ada Didalam Sistem');
end else
begin
DataModule2.zqry1.SQL.Clear;
DataModule2.zqry1.SQL.Add('update kustomer set nik = :nik, name = :name, telp = :telp, email = :email, alamat = :alamat, member = :member where id = :id');
DataModule2.zqry1.Params.ParamByName('nik').AsInteger := StrToInt(edt1.Text);
DataModule2.zqry1.Params.ParamByName('name').AsString := edt2.Text;
DataModule2.zqry1.Params.ParamByName('telp').AsString := edt3.Text;
DataModule2.zqry1.Params.ParamByName('email').AsString := edt4.Text;
DataModule2.zqry1.Params.ParamByName('alamat').AsString := edt5.Text;
DataModule2.zqry1.Params.ParamByName('member').AsString := cbb1.Text;
DataModule2.zqry1.Params.ParamByName('id').AsString := a;
DataModule2.zqry1.ExecSQL;

DataModule2.zqry1.SQL.Clear;
DataModule2.zqry1.SQL.Add('select * from kustomer');
DataModule2.zqry1.Open;
ShowMessage('Data Berhasil Diubah!');
end;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
DataModule2.zqry1.SQL.Clear;
DataModule2.zqry1.SQL.Add('delete from kustomer where id= "'+a+'"');
DataModule2.zqry1.ExecSQL;

DataModule2.zqry1.SQL.Clear;
DataModule2.zqry1.SQL.Add('select * from kustomer');
DataModule2.zqry1.Open;
ShowMessage('Data Berhasil Dihapus!');
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
btn1.Enabled:= True;
btn2.Enabled:= False;
btn3.Enabled:= False;
btn4.Enabled:= False;

edt1.Text :='';
edt2.Text :='';
edt3.Text :='';
edt4.Text :='';
edt5.Text :='';
edt6.Text :='';
cbb1.Text :='';
lbl8.Caption :='';

DataModule2.zqry1.SQL.Clear;
DataModule2.zqry1.SQL.Add('select * from kustomer');
DataModule2.zqry1.Open;
end;

procedure TForm1.btn6Click(Sender: TObject);
var
  searchTerm: string;
begin
  searchTerm := edt6.Text;

  DataModule2.zqry1.SQL.Clear;
  DataModule2.zqry1.SQL.Add('select * from kustomer where nik like :searchTerm or name like :searchTerm or telp like :searchTerm or email like :searchTerm or alamat like :searchTerm or member like :searchTerm');
  DataModule2.zqry1.Params.ParamByName('searchTerm').AsString := '%' + searchTerm + '%';
  DataModule2.zqry1.Open;
end;

procedure TForm1.btn7Click(Sender: TObject);
var
  Report: TfrxReport;
  PDFExport: TfrxPDFExport;
begin
  Report := TfrxReport.Create(nil);
  try
    Report.LoadFromFile('C:\Program Files (x86)\Borland\Delphi7\Projects\VISUAL UAS\laporan.fr3');
    PDFExport := TfrxPDFExport.Create(nil);
    try
      PDFExport.ShowDialog := False;
      PDFExport.FileName := 'laporan.pdf';
      Report.PrepareReport(True);
      Report.Export(PDFExport);
    finally
      PDFExport.Free;
    end;
  finally
    Report.Free;
  end;

  ShowMessage('Laporan telah diunduh sebagai file PDF.');
end;

end.
