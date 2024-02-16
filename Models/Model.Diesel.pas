unit Model.Diesel;

interface

uses
  Model.Combustivel,
  Model.Imposto,
  Aux.Types;

type
  TDiesel = class(TCombustivel)
    private
    FTipo: TTipoDiesel;
    procedure SetTipo(const Value: TTipoDiesel);

    public
    function ToString: string; override;
    function GetTipo: string;
    property Tipo: TTipoDiesel read FTipo write SetTipo;

    constructor Create(ID: Integer; ValorLitro: Extended; Tipo: string);
  end;

implementation

{ TDiesel }

constructor TDiesel.Create(ID: Integer; ValorLitro: Extended; Tipo: string);
begin
  inherited Create;
  Self.ID_Combustivel := ID;
  Self.ValorLitro := ValorLitro;
  Self.Imposto := TImposto.Create;
  Self.Imposto.Aliquota := 13.0;
  Self.Imposto.Descricao := 'ICMS';
  if Tipo = 'S10' then Self.Tipo := tdS10;
  if Tipo = 'S50' then Self.Tipo := tdS50;
  if Tipo = 'S500' then Self.Tipo := tdS500;
  if Tipo = 'S1800' then Self.Tipo := tdS1800;
end;

function TDiesel.GetTipo: string;
begin
  case Tipo of
    tdS10: Result := 'S10';
    tdS50: Result := 'S50';
    tdS500: Result := 'S500';
    tdS1800: Result := 'S1800';
  end;
end;

procedure TDiesel.SetTipo(const Value: TTipoDiesel);
begin
  FTipo := Value;
end;

function TDiesel.ToString: string;
begin
  Result := 'DIESEL';
end;

end.
