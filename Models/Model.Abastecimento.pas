unit Model.Abastecimento;

interface

uses
  Model.Bomba;

type
  TAbastecimento = class
    private
    FBomba: TBomba;
    FDataHora: TDateTime;
    FLitros: Extended;
    FID_Abastecimento: Integer;
    procedure SetBomba(const Value: TBomba);
    procedure SetDataHora(const Value: TDateTime);
    procedure SetLitros(const Value: Extended);
    procedure SetID_Abastecimento(const Value: Integer);
    function GetValor: Extended;
    function GetValorImposto: Extended;

    public
    property ID_Abastecimento: Integer read FID_Abastecimento write SetID_Abastecimento;
    property Bomba: TBomba read FBomba write SetBomba;
    property DataHora: TDateTime read FDataHora write SetDataHora;
    property Litros: Extended read FLitros write SetLitros;
    property Valor: Extended read GetValor;
    property ValorImposto: Extended read GetValorImposto;
  end;

implementation

{ TAbastecimento }

function TAbastecimento.GetValor: Extended;
begin
  Result := Bomba.Tanque.Combustivel.ValorLitro * Litros;
end;

function TAbastecimento.GetValorImposto: Extended;
begin
  Result := Valor * (Bomba.Tanque.Combustivel.Imposto.Aliquota / 100);
end;

procedure TAbastecimento.SetBomba(const Value: TBomba);
begin
  FBomba := Value;
end;

procedure TAbastecimento.SetDataHora(const Value: TDateTime);
begin
  FDataHora := Value;
end;

procedure TAbastecimento.SetID_Abastecimento(const Value: Integer);
begin
  FID_Abastecimento := Value;
end;

procedure TAbastecimento.SetLitros(const Value: Extended);
begin
  FLitros := Value;
end;

end.
