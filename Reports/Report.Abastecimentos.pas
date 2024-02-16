unit Report.Abastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, DM.Principal;

type
  TReportAbastecimento = class(TForm)
    rpAbastecimentos: TRLReport;
    qryReport: TFDQuery;
    dsReport: TDataSource;
    qryReportDATA_HORA: TSQLTimeStampField;
    qryReportID_TANQUE: TIntegerField;
    qryReportDESCRICAO: TStringField;
    qryReportVALOR: TFMTBCDField;
    qryReportVALOR_IMPOSTO: TFMTBCDField;
    RLBand2: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLBand3: TRLBand;
    RLLabel6: TRLLabel;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    qryTotais: TFDQuery;
    qryTotaisTOTAL_VALOR: TFMTBCDField;
    qryTotaisTOTAL_IMPOSTO: TFMTBCDField;
    dsTotais: TDataSource;
    procedure rpAbastecimentosBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ReportOpen;
  end;

var
  ReportAbastecimento: TReportAbastecimento;

implementation

{$R *.dfm}

{ TReportAbastecimento }

procedure TReportAbastecimento.ReportOpen;
begin
  rpAbastecimentos.Preview();
end;

procedure TReportAbastecimento.rpAbastecimentosBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  qryReport.Open;
  qryTotais.Open;
end;

end.
