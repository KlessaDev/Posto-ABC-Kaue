unit Model.Combustivel;

interface

uses
  Model.Imposto;

type
  TCombustivel = class
    private
    FValorLitro: Extended;
    FImposto: TImposto;
    FID_Combustivel: Integer;
    procedure SetValorLitro(const Value: Extended);
    procedure SetImposto(const Value: TImposto);
    procedure SetID_Combustivel(const Value: Integer);

    public
    property ID_Combustivel: Integer read FID_Combustivel write SetID_Combustivel;
    property ValorLitro: Extended read FValorLitro write SetValorLitro;
    property Imposto: TImposto read FImposto write SetImposto;
  end;

implementation

{ TCombustivel }

procedure TCombustivel.SetID_Combustivel(const Value: Integer);
begin
  FID_Combustivel := Value;
end;

procedure TCombustivel.SetImposto(const Value: TImposto);
begin
  FImposto := Value;
end;

procedure TCombustivel.SetValorLitro(const Value: Extended);
begin
  FValorLitro := Value;
end;

end.
