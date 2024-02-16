unit Model.Imobilizado;

interface

uses
  Aux.Types;

type
  TImobilizado<T: class> = class
  private
  FNumero: Integer;
  FStatus: TStatus;
    FID_Imobilizado: Integer;
  procedure SetNumero(const Value: Integer);
  procedure SetStatus(const Value: TStatus);
  function GetTipo: TTipoImobilizado;
    procedure SetID_Imobilizado(const Value: Integer);

  public
  property ID_Imobilizado: Integer read FID_Imobilizado write SetID_Imobilizado;
  property Numero: Integer read FNumero write SetNumero;
  property Status: TStatus read FStatus write SetStatus;
  property Tipo: TTipoImobilizado read GetTipo;
  end;

implementation

{ TImobilizado }

function TImobilizado<T>.GetTipo: TTipoImobilizado;
var
  Obj: T;
  sImobilizado: string;
begin
  sImobilizado := Obj.ToString;
  if sImobilizado = 'TBomba' then
    Result := tiMaquinario;
  if sImobilizado = 'TTanque' then
    Result := tiEstrutural;
end;

procedure TImobilizado<T>.SetID_Imobilizado(const Value: Integer);
begin
  FID_Imobilizado := Value;
end;

procedure TImobilizado<T>.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TImobilizado<T>.SetStatus(const Value: TStatus);
begin
  FStatus := Value;
end;

end.
