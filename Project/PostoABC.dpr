program PostoABC;

uses
  Vcl.Forms,
  Form.Principal in '..\Views\Form.Principal.pas' {FormPrincipal},
  DM.Principal in '..\DataModules\DM.Principal.pas' {DMPrincipal: TDataModule},
  Model.Combustivel in '..\Models\Model.Combustivel.pas',
  Model.Gasolina in '..\Models\Model.Gasolina.pas',
  Model.Diesel in '..\Models\Model.Diesel.pas',
  Auxs.Types in '..\Auxs\Auxs.Types.pas',
  Model.Imposto in '..\Models\Model.Imposto.pas',
  Model.Tanque in '..\Models\Model.Tanque.pas',
  Model.Imobilizado in '..\Models\Model.Imobilizado.pas',
  Model.Bomba in '..\Models\Model.Bomba.pas',
  Model.Abastecimento in '..\Models\Model.Abastecimento.pas',
  Control.Abastecimento in '..\Controls\Control.Abastecimento.pas',
  DAO.Operacoes in '..\DAO\DAO.Operacoes.pas',
  Interfaces.Operacao in '..\Interfaces\Interfaces.Operacao.pas',
  DAO.Dados in '..\DAO\DAO.Dados.pas',
  Auxs.Constants in '..\Auxs\Auxs.Constants.pas',
  Report.Abastecimentos in '..\Reports\Report.Abastecimentos.pas' {ReportAbastecimento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.Run;
end.
