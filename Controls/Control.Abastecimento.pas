unit Control.Abastecimento;

interface

uses
  System.SysUtils,
  System.Classes,
  Model.Abastecimento,
  Model.Bomba,
  Model.Tanque,
  Model.Gasolina,
  Model.Diesel,
  Model.Combustivel,
  Aux.Types,
  DAO.Operacoes;

type
  TAbastecimentoControl = class
    private


    public
    function Post(ABomba: TBomba; ALitros: Extended): TAbastecimento;
//    constructor Create(ABomba: TBomba; ALitros: Extended);
  end;
implementation

{ AbastecimentoControl }

function TAbastecimentoControl.Post(ABomba: TBomba;
  ALitros: Extended): TAbastecimento;
var
  DAO: TOperacaoDAO<TAbastecimento>;
begin
  DAO := TOperacaoDAO<TAbastecimento>.Create;
  try
    Result := TAbastecimento.Create;
    Result.Bomba := ABomba;
    Result.DataHora := Now;
    Result.Litros := ALitros;
    DAO.Salvar(Result);
  finally
    DAO.Free;
  end;

end;

//constructor TAbastecimentoControl.Create(ABomba: TBomba;
//  ALitros: Extended);
//begin
//  inherited Create;
//
//  Post(ABomba, ALitros);
//end;

end.
