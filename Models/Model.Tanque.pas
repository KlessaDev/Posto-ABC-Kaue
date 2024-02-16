unit Model.Tanque;

interface

uses
  System.SysUtils,
  Model.Imobilizado,
  Model.Combustivel;

Type
  TTanque = class(TImobilizado<TTanque>) //HERANÇA E GENERICS
  private
    FVolumeAtual: Extended;
    FCapacidade: Extended;
    FCombustivel: TCombustivel;
    FID_Tanque: Integer;
    procedure SetCapacidade(const Value: Extended);
    procedure SetCombustivel(const Value: TCombustivel);
    procedure SetVolumeAtual(const Value: Extended);
    function GetIdentificacao: string;
    procedure SetID_Tanque(const Value: Integer);

  public
    property ID_Tanque: Integer read FID_Tanque write SetID_Tanque;
    property Capacidade: Extended read FCapacidade write SetCapacidade;
    property VolumeAtual: Extended read FVolumeAtual write SetVolumeAtual;
    property Combustivel: TCombustivel read FCombustivel write SetCombustivel;
    property Identificacao: string read GetIdentificacao;

    constructor Create(ID: Integer; Capacidade, VolumeAtual: Extended; Combustivel: TCombustivel);
  end;
implementation

{ TTanque }

constructor TTanque.Create(ID: Integer; Capacidade, VolumeAtual: Extended; Combustivel: TCombustivel);
begin
  inherited Create;
  Self.ID_Tanque := ID;
  Self.Capacidade := Capacidade;
  Self.VolumeAtual := VolumeAtual;
  Self.Combustivel := Combustivel;
end;

function TTanque.GetIdentificacao: string;
begin
  Result := 'Tanque ' + IntToStr(Numero);
end;

procedure TTanque.SetCapacidade(const Value: Extended);
begin
  FCapacidade := Value;
end;

procedure TTanque.SetCombustivel(const Value: TCombustivel);
begin
  FCombustivel := Value;
end;

procedure TTanque.SetID_Tanque(const Value: Integer);
begin
  FID_Tanque := Value;
end;

procedure TTanque.SetVolumeAtual(const Value: Extended);
begin
  FVolumeAtual := Value;
end;

end.
