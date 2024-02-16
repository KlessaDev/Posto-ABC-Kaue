unit Model.Gasolina;

interface

uses
  Model.Combustivel,
  Model.Imposto,
  Auxs.Types;

type
  TGasolina = class(TCombustivel)
    private
    FTipo: TTipoGasolina;
    procedure SetTipo(const Value: TTipoGasolina);

    public
    function ToString: string; override;
    function GetTipo: string;
    property Tipo: TTipoGasolina read FTipo write SetTipo;

    constructor Create(ID: Integer; ValorLitro: Extended; Tipo: string);
  end;

implementation

{ TGasolina }

constructor TGasolina.Create(ID: Integer; ValorLitro: Extended; Tipo: string);
begin
  inherited Create;
  Self.ID_Combustivel := ID;
  Self.ValorLitro := ValorLitro;
  Self.Imposto := TImposto.Create;
  Self.Imposto.Aliquota := 13.0;
  Self.Imposto.Descricao := 'ICMS';
  if Tipo = 'COMUM' then Self.Tipo := tgComum;
  if Tipo = 'PREMIUM' then Self.Tipo := tgPremium;
  if Tipo = 'ADITIVADA' then Self.Tipo := tgAditivada;
end;

function TGasolina.GetTipo: string;
begin
  case Tipo of
    tgComum: Result := 'COMUM';
    tgAditivada: Result := 'ADITIVADA';
    tgPremium: Result := 'PREMIUM';
  end;
end;

procedure TGasolina.SetTipo(const Value: TTipoGasolina);
begin
  FTipo := Value;
end;

function TGasolina.ToString: string;
begin
  Result := 'GASOLINA';
end;

end.
