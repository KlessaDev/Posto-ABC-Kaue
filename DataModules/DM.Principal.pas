unit DM.Principal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDMPrincipal = class(TDataModule)
    FDConnection1: TFDConnection;
    qryGridAbastecimento: TFDQuery;
    qryGridAbastecimentoID_ABASTECIMENTO: TIntegerField;
    qryGridAbastecimentoID_BOMBA: TIntegerField;
    qryGridAbastecimentoDATA_HORA: TSQLTimeStampField;
    qryGridAbastecimentoLITROS: TFMTBCDField;
    qryGridAbastecimentoVALOR: TFMTBCDField;
    qryGridAbastecimentoVALOR_IMPOSTO: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetDAO: TFDQuery;
  end;

var
  DMPrincipal: TDMPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMPrincipal }

procedure TDMPrincipal.DataModuleCreate(Sender: TObject);
begin
  qryGridAbastecimento.Open;
end;

function TDMPrincipal.GetDAO: TFDQuery;
var
  DAO: TFDQuery;
begin
  DAO := TFDQuery.Create(Self);
  DAO.Connection := FDConnection1;
  Result := DAO;
end;

end.
