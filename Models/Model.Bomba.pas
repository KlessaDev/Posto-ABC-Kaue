unit Model.Bomba;

interface

uses
  System.SysUtils,
  Model.Imobilizado,
  Model.Tanque;

type
  TBomba = class(TImobilizado<TBomba>)
    private
    FTanque: TTanque;
    FID_Bomba: Integer;
    procedure SetTanque(const Value: TTanque);
    function GetDescricao: string;
    procedure SetId_Bomba(const Value: Integer);

    public
    property ID_Bomba: Integer read FID_Bomba write SetId_Bomba;
    property Tanque: TTanque read FTanque write SetTanque;
    property Descricao: string read GetDescricao;

    constructor Create(ID: Integer; ATanque: TTanque; ANumero: Integer);
  end;

implementation

{ TBomba }

constructor TBomba.Create(ID: Integer; ATanque: TTanque; ANumero: Integer);
begin
  inherited Create();
  Self.ID_Bomba := ID;
  Self.Tanque := ATanque;
  Self.Numero := ANumero;
end;

function TBomba.GetDescricao: string;
begin
  Result := 'BOMBA ' + IntToStr(Numero);
end;

procedure TBomba.SetId_Bomba(const Value: Integer);
begin
  FID_Bomba := Value;
end;

procedure TBomba.SetTanque(const Value: TTanque);
begin
  FTanque := Value;
end;

end.
