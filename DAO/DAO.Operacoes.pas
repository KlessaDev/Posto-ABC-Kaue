unit DAO.Operacoes;

interface

uses
  System.Generics.Collections,
  Interfaces.Operacao,
  DAO.Dados;

type
  TOperacaoDAO<T: class> = class(TInterfacedObject, IOperacao<T>)
    private

    public
    function Salvar(AObject: T): Boolean;
    function Alterar(AObject: T; ID: Integer): Boolean;
    function Get(ID: Integer): T; overload;
    function Get(ACampo: string; AValor: Variant): T; overload;
    function Get: TObjectList<T>; overload;
  end;

implementation

{ TDados<T> }

function TOperacaoDAO<T>.Get: TObjectList<T>;
begin
  Result := TDadosDAO.Get<T>;
end;

function TOperacaoDAO<T>.Salvar(AObject: T): Boolean;
begin
  TDadosDAO.Salvar<T>(AObject);
end;

function TOperacaoDAO<T>.Alterar(AObject: T; ID: Integer): Boolean;
begin
  TDadosDAO.Salvar<T>(AObject, ID);
end;

function TOperacaoDAO<T>.Get(ID: Integer): T;
begin
  Result := TDadosDAO.Get<T>(ID);
end;

function TOperacaoDAO<T>.Get(ACampo: string; AValor: Variant): T;
begin

end;

end.
