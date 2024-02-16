unit Interfaces.Operacao;

interface

uses
  System.Generics.Collections;

type
  IOperacao<T: class> = interface
    function Salvar(AObject: T): Boolean;
    function Alterar(AObject: T; ID: Integer): Boolean;
    function Get(ID: Integer): T; overload;
    function Get(ACampo: string; AValor: Variant): T; overload;
    function Get: TObjectList<T>; overload;
  end;

implementation

end.
