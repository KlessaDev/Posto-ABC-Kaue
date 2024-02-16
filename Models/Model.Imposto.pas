unit Model.Imposto;

interface

Type
  TImposto = class
    private
    FDescricao: string;
    FAliquota: Extended;
    FID_Imposto: Integer;
    procedure SetAliquota(const Value: Extended);
    procedure SetDescricao(const Value: string);
    procedure SetID_Imposto(const Value: Integer);

    public
      property ID_Imposto: Integer read FID_Imposto write SetID_Imposto;
      property Descricao: string read FDescricao write SetDescricao;
      property Aliquota: Extended read FAliquota write SetAliquota;
  end;

implementation

{ TImposto }

procedure TImposto.SetAliquota(const Value: Extended);
begin
  FAliquota := Value;
end;

procedure TImposto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TImposto.SetID_Imposto(const Value: Integer);
begin
  FID_Imposto := Value;
end;

end.
