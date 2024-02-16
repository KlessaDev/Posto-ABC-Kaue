unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  DM.Principal,
  Control.Abastecimento,
  Model.Bomba,
  Model.Tanque,
  Model.Gasolina,
  Model.Diesel,
  Report.Abastecimentos, Vcl.ComCtrls;

type
  TFormPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnlBomba1: TPanel;
    edtValorLitro1: TEdit;
    edtLitros1: TEdit;
    edtValorImposto1: TEdit;
    lblBomba1: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnAbastece1: TButton;
    btnReport: TButton;
    DBGrid1: TDBGrid;
    dsGridAbastecimento: TDataSource;
    Panel3: TPanel;
    lblBomba2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtValorLitro2: TEdit;
    edtLitros2: TEdit;
    edtValorImposto2: TEdit;
    btnAbastece2: TButton;
    Panel4: TPanel;
    lblBomba3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtValorLitro3: TEdit;
    edtLitros3: TEdit;
    edtValorImposto3: TEdit;
    btnAbastece3: TButton;
    Panel5: TPanel;
    lblBomba4: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtValorLitro4: TEdit;
    edtLitros4: TEdit;
    edtValorImposto4: TEdit;
    btnAbastece4: TButton;
    dtInicio: TDateTimePicker;
    dtFim: TDateTimePicker;
    Label4: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnAbastece1Click(Sender: TObject);
    procedure btnAbastece2Click(Sender: TObject);
    procedure btnAbastece3Click(Sender: TObject);
    procedure btnAbastece4Click(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
  private
    { Private declarations }
  FBomba1: TBomba;
  FBomba2: TBomba;
  FBomba3: TBomba;
  FBomba4: TBomba;
  function Abastece(ABomba: TBomba; ALitros: Extended; EditImposto: TEdit): Boolean;
  procedure AlimentaDados;

  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

function TFormPrincipal.Abastece(ABomba: TBomba; ALitros: Extended; EditImposto: TEdit): Boolean;
var
  FAbastecimento: TAbastecimentoControl;
begin
  FAbastecimento := TAbastecimentoControl.Create;
  try
    TEdit(EditImposto).Text := FloatToStr(FAbastecimento.Post(ABomba, ALitros).ValorImposto);
    dsGridAbastecimento.DataSet.Refresh;
    Result := True;
  finally
    FAbastecimento.Free;
  end;
end;

procedure TFormPrincipal.AlimentaDados;
begin
  FBomba1 := TBomba.Create(1,TTanque.Create(1,50000,50000,TGasolina.Create(1,5.23,'COMUM')),1);
  FBomba2 := TBomba.Create(2,TTanque.Create(2,50000,50000,TGasolina.Create(1,5.23,'COMUM')),2);
  FBomba3 := TBomba.Create(3,TTanque.Create(3,50000,50000,TDiesel.Create(1,6.47,'S10')),3);
  FBomba4 := TBomba.Create(4,TTanque.Create(4,50000,50000,TDiesel.Create(1,6.47,'S500')),4);

  lblBomba1.Caption := FBomba1.Descricao;
  lblBomba2.Caption := FBomba2.Descricao;
  lblBomba3.Caption := FBomba3.Descricao;
  lblBomba4.Caption := FBomba4.Descricao;

  edtValorLitro1.Text := FBomba1.Tanque.Combustivel.ValorLitro.ToString;
  edtValorLitro2.Text := FBomba2.Tanque.Combustivel.ValorLitro.ToString;
  edtValorLitro3.Text := FBomba3.Tanque.Combustivel.ValorLitro.ToString;
  edtValorLitro4.Text := FBomba4.Tanque.Combustivel.ValorLitro.ToString;
end;

procedure TFormPrincipal.btnAbastece1Click(Sender: TObject);
begin
  Abastece(FBomba1,StrToFloat(edtLitros1.Text), edtValorImposto1);
end;

procedure TFormPrincipal.btnAbastece2Click(Sender: TObject);
begin
  Abastece(FBomba2,StrToFloat(edtLitros2.Text), edtValorImposto2);
end;

procedure TFormPrincipal.btnAbastece3Click(Sender: TObject);
begin
  Abastece(FBomba3,StrToFloat(edtLitros3.Text), edtValorImposto3);
end;

procedure TFormPrincipal.btnAbastece4Click(Sender: TObject);
begin
  Abastece(FBomba4,StrToFloat(edtLitros4.Text), edtValorImposto4);
end;

procedure TFormPrincipal.btnReportClick(Sender: TObject);
begin
  ReportAbastecimento := TReportAbastecimento.Create(Self);
  ReportAbastecimento.qryReport.ParamByName('dtini').AsDateTime := dtInicio.DateTime;
  ReportAbastecimento.qryReport.ParamByName('dtfim').AsDateTime := dtFim.DateTime;
  ReportAbastecimento.qryTotais.ParamByName('dtini').AsDateTime := dtInicio.DateTime;
  ReportAbastecimento.qryTotais.ParamByName('dtfim').AsDateTime := dtFim.DateTime;
  ReportAbastecimento.ReportOpen;
  ReportAbastecimento.Free;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  AlimentaDados;
end;

end.
