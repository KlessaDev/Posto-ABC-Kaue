unit DAO.Dados;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Model.Abastecimento,
  Model.Bomba,
  Model.Combustivel,
  Model.Diesel,
  Model.Gasolina,
  Model.Imobilizado,
  Model.Imposto,
  Model.Tanque,
  DM.Principal,
  FireDAC.Comp.Client,
  Auxs.Constants,
  Auxs.Types;

type
  TDadosDAO = class
    private
    function Salvar(AObject: TAbastecimento; ID: Integer = 0): Boolean; overload;
    function Salvar(AObject: TTanque; ID: Integer = 0): Boolean; overload;
    function Salvar(AObject: TBomba; ID: Integer = 0): Boolean; overload;
    function Salvar(AObject: TGasolina; ID: Integer = 0): Boolean; overload;
    function Salvar(AObject: TDiesel; ID: Integer = 0): Boolean; overload;
    function Salvar(AObject: TImposto; ID: Integer = 0): Boolean; overload;

    function GetAbastecimentos: TObjectList<TAbastecimento>;
    function GetTanques: TObjectList<TTanque>;
    function GetBombas: TObjectList<TBomba>;
    function GetGasolinas: TObjectList<TGasolina>;
    function GetDiesels: TObjectList<TDiesel>;
    function GetImpostos: TObjectList<TImposto>;
    function GetImobilizados<T: class>: TObjectList<TImobilizado<T>>;

    public
    class function Salvar<T: class>(AObject: T; ID: Integer = 0): Boolean; overload;
    class function Get<T: class>: TObjectList<T>; overload;
    class function Get<T: class>(ID: Integer): T; overload;
  end;

implementation

{ DadosDAO }

class function TDadosDAO.Salvar<T>(AObject: T; ID: Integer): Boolean;
var
  DAOLayer: TDadosDAO;
begin
  DAOLayer := TDadosDAO.Create;
  try
    with DAOLayer do
    begin
      if T = TAbastecimento then
        Salvar(TAbastecimento(AObject))
      else
      if T = TTanque then
        Salvar(TTanque(AObject))
      else
      if T = TBomba then
        Salvar(TBomba(AObject))
      else
      if T = TGasolina then
        Salvar(TGasolina(AObject))
      else
      if T = TDiesel then
        Salvar(TDiesel(AObject))
      else
      if T = TImposto then
        Salvar(TImposto(AObject))
    end;
  finally
    DAOLayer.Free;
  end;
end;

class function TDadosDAO.Get<T>: TObjectList<T>;
var
  DAOLayer: TDadosDAO;
begin
  DAOLayer := TDadosDAO.Create;
  Result := TObjectList<T>.Create;
  try
    with DAOLayer do
    begin
      if T = TAbastecimento then
      begin

      end
      else
      if T = TTanque then
      begin

      end
      else
      if T = TBomba then
      begin

      end
      else
      if T = TGasolina then
      begin

      end
      else
      if T = TDiesel then
      begin

      end
      else
      if T = TImposto then
      begin

      end;
    end;
  finally
    DAOLayer.Free;
  end;
end;

function TDadosDAO.Salvar(AObject: TAbastecimento; ID: Integer): Boolean;
var
  QRY: TFDQuery;
  FWhere: string;
begin
  FWhere := '';
  QRY := DMPrincipal.GetDAO;
  try
    if ID > 0 then
      FWhere := ' WHERE ID_ABASTECIMENTO = !ID '; //USO DE MACROS

    with QRY do
    begin
      SQL.Text := CONS_SELECT_ABASTECIMENTO_INSERT + FWhere;
      Open;
      if Macros.Count > 0 then
        MacroByName('ID').AsInteger := ID;
      Insert;
      FieldByName('ID_BOMBA').AsInteger := AObject.Bomba.ID_Bomba;
      FieldByName('DATA_HORA').AsDateTime := AObject.DataHora;
      FieldByName('LITROS').AsExtended := AObject.Litros;
      FieldByName('VALOR').AsExtended := AObject.Valor;
      FieldByName('VALOR_IMPOSTO').AsExtended := AObject.ValorImposto;
      Post;
      Result := True;
    end;
  finally
    QRY.Free;
  end;
end;

function TDadosDAO.Salvar(AObject: TBomba; ID: Integer): Boolean;
var
  QRY: TFDQuery;
  FWhere: string;
begin
  FWhere := '';
  QRY := DMPrincipal.GetDAO;
  try
    if ID > 0 then
      FWhere := ' WHERE ID_BOMBA = :ID '; //USO DE PARAMETERS

    with QRY do
    begin
      SQL.Text := CONS_SELECT_BOMBA + FWhere;
      Open;
      if Params.Count > 0 then
        ParamByName('ID').AsInteger := ID;
      Insert;
      FieldByName('ID_TANQUE').AsInteger := AObject.Tanque.ID_Tanque;
      FieldByName('ID_IMOBILIZADO').AsInteger := AObject.ID_Imobilizado;
      FieldByName('DESCRICAO').AsString := AObject.Descricao;
      Post;
      Result := True;
    end;
  finally
    QRY.Free;
  end;
end;

function TDadosDAO.Salvar(AObject: TDiesel; ID: Integer): Boolean;
var
  QRY: TFDQuery;
  FWhere: string;
begin
  FWhere := '';
  QRY := DMPrincipal.GetDAO;
  try
    if ID > 0 then
      FWhere := ' WHERE ID_COMBUSTIVEL = '+ ID.ToString;

    with QRY do
    begin
      SQL.Text := CONS_SELECT_COMBUSTIVEL + FWhere;
      Open;
      Insert;
      FieldByName('ID_IMPOSTO').AsInteger := AObject.Imposto.ID_Imposto;
      FieldByName('VALOR_LITRO').AsExtended := AObject.ValorLitro;
      FieldByName('DESCRICAO').AsString := AObject.ToString;
      FieldByName('TIPO_COMBUSTIVEL').AsString := AObject.GetTipo;
      Post;
      Result := True;
    end;
  finally
    QRY.Free;
  end;
end;

function TDadosDAO.Salvar(AObject: TGasolina; ID: Integer): Boolean;
var
  QRY: TFDQuery;
  FWhere: string;
begin
  FWhere := '';
  QRY := DMPrincipal.GetDAO;
  try
    if ID > 0 then
      FWhere := ' WHERE ID_COMBUSTIVEL = ' + ID.ToString;

    with QRY do
    begin
      SQL.Text := CONS_SELECT_COMBUSTIVEL + FWhere;
      Open;
      Insert;
      FieldByName('ID_IMPOSTO').AsInteger := AObject.Imposto.ID_Imposto;
      FieldByName('VALOR_LITRO').AsExtended := AObject.ValorLitro;
      FieldByName('DESCRICAO').AsString := AObject.ToString;
      FieldByName('TIPO_COMBUSTIVEL').AsString := AObject.GetTipo;
      Post;
      Result := True;
    end;
  finally
    QRY.Free;
  end;
end;

function TDadosDAO.Salvar(AObject: TImposto; ID: Integer): Boolean;
var
  QRY: TFDQuery;
  FWhere: string;
begin
  FWhere := '';
  QRY := DMPrincipal.GetDAO;
  try
    if ID > 0 then
      FWhere := ' WHERE ID_IMPOSTO = ' + ID.ToString;

    with QRY do
    begin
      SQL.Text := CONS_SELECT_IMPOSTO + FWhere;
      Open;
      Insert;
      FieldByName('DESCRICAO').AsString := AObject.Descricao;
      FieldByName('ALIQUOTA').AsExtended := AObject.Aliquota;
      Post;
      Result := True;
    end;
  finally
    QRY.Free;
  end;
end;

function TDadosDAO.Salvar(AObject: TTanque; ID: Integer): Boolean;
var
  QRY: TFDQuery;
  FWhere: string;
begin
  FWhere := '';
  QRY := DMPrincipal.GetDAO;
  try
    if ID > 0 then
      FWhere := ' WHERE ID_TANQUE = ' + ID.ToString;

    with QRY do
    begin
      SQL.Text := CONS_SELECT_TANQUE + FWhere;
      Open;
      Insert;
      FieldByName('ID_COMBUSTIVEL').AsInteger := AObject.Combustivel.ID_Combustivel;
      FieldByName('ID_IMOBILIZADO').AsInteger := AObject.ID_Imobilizado;
      FieldByName('VOLUME_TOTAL').AsExtended := AObject.Capacidade;
      FieldByName('VOLUME_ATUAL').AsExtended := AObject.VolumeAtual;
      Post;
      Result := True;
    end;
  finally
    QRY.Free;
  end;
end;

class function TDadosDAO.Get<T>(ID: Integer): T;
var
  QRY: TFDQuery;
  sWhere: string;
  OBJ: TObject;
begin
  QRY := DMPrincipal.GetDAO;
  OBJ := TObject.Create;
  try
    with QRY do
    begin
      if T = TAbastecimento then
      begin
        sWhere := ' WHERE ID_ABASTECIMENTO = ' + ID.ToString;
        SQL.Text := CONS_SELECT_ABASTECIMENTO + sWhere;
        Open;

        if not IsEmpty then
        begin
          TAbastecimento(OBJ).ID_Abastecimento := FieldByName('ID_ABASTECIMENTO').AsInteger;
          TAbastecimento(OBJ).Bomba := Get<TBomba>(FieldByName('ID_BOMBA').AsInteger);
          TAbastecimento(OBJ).DataHora := FieldByName('DATA_HORA').AsDateTime;
          TAbastecimento(OBJ).Litros := FieldByName('LITROS').AsExtended;
          Result := T(TAbastecimento(OBJ));
        end;
      end
      else
      if T = TTanque then
      begin
        sWhere := ' WHERE ID_TANQUE = ' + ID.ToString;
        SQL.Text := CONS_SELECT_TANQUE + sWhere;
        Open;

        if not IsEmpty then
        begin
          TTanque(OBJ).ID_Tanque := FieldByName('ID_TANQUE').AsInteger;
          TTanque(OBJ).Capacidade := FieldByName('VOLUME_TOTAL').AsExtended;
          TTanque(OBJ).VolumeAtual := FieldByName('VOLUME_ATUAL').AsExtended;
          TTanque(OBJ).ID_Imobilizado := FieldByName('ID_IMOBILIZADO').AsInteger;
          TTanque(OBJ).Numero := Get<TImobilizado<TTanque>>(FieldByName('ID_IMOBILIZADO').AsInteger).Numero;
          TTanque(OBJ).Combustivel := Get<TCombustivel>(FieldByName('ID_COMBUSTIVEL').AsInteger);
          Result := T(TTanque(OBJ));
        end;
      end
      else
      if T = TBomba then
      begin
        sWhere := ' WHERE ID_BOMBA = ' + ID.ToString;
        SQL.Text := CONS_SELECT_BOMBA + sWhere;
        Open;

        if not IsEmpty then
        begin
          TBomba(OBJ).ID_Bomba := FieldByName('ID_BOMBA').AsInteger;
          TBomba(OBJ).ID_Imobilizado := FieldByName('ID_IMOBILIZADO').AsInteger;
          TBomba(OBJ).Tanque := Get<TTanque>(FieldByName('ID_TANQUE').AsInteger);
          TBomba(OBJ).Numero := Get<TImobilizado<TBomba>>(FieldByName('ID_IMOBILIZADO').AsInteger).Numero;
          Result := T(TBomba(OBJ));
        end;
      end
      else
      if T = TImobilizado<T> then
      begin
        sWhere := ' WHERE ID_IMOBILIZADO = ' + ID.ToString;
        SQL.Text := CONS_SELECT_IMOBILIZADO + sWhere;
        Open;

        if not IsEmpty then
        begin
          TImobilizado<T>(OBJ).ID_Imobilizado := FieldByName('ID_IMOBILIZADO').AsInteger;
          TImobilizado<T>(OBJ).Numero := FieldByName('NUMERO').AsInteger;
          Result := T(TImobilizado<T>(OBJ));
        end;
      end;
      if T = TGasolina then
      begin

      end
      else
      if T = TDiesel then
      begin

      end
      else
      if T = TImposto then
      begin

      end;
    end;
  finally
    QRY.Free;
  end;
end;

function TDadosDAO.GetAbastecimentos: TObjectList<TAbastecimento>;
var
  QRY: TFDQuery;
  OBJ: TAbastecimento;
begin
  QRY := DMPrincipal.GetDAO;
  OBJ := TAbastecimento.Create;
  Result := TObjectList<TAbastecimento>.Create;
  try
    with QRY do
    begin
      SQL.Text := CONS_SELECT_ABASTECIMENTO;
      Open;
      First;
      while not Eof do
      begin
        OBJ.ID_Abastecimento := FieldByName('ID_ABASTECIMENTO').AsInteger;
        OBJ.Bomba := Get<TBomba>(FieldByName('ID_BOMBA').AsInteger);
        OBJ.DataHora := FieldByName('DATA_HORA').AsDateTime;
        OBJ.Litros := FieldByName('LITROS').AsExtended;
        Result.Add(OBJ);
      end;
    end;
  finally
    QRY.Free;
  end;
end;

function TDadosDAO.GetBombas: TObjectList<TBomba>;
var
  QRY: TFDQuery;
  OBJ: TBomba;
begin
  with QRY do
    begin
      SQL.Text := CONS_SELECT_ABASTECIMENTO;
      Open;
      First;
      while not Eof do
      begin
        OBJ.ID_Bomba := FieldByName('ID_BOMBA').AsInteger;
        OBJ.Tanque := Get<TTanque>(FieldByName('ID_TANQUE').AsInteger);
        OBJ.ID_Imobilizado := FieldByName('ID_IMOBILIZADO').AsInteger;
        OBJ.Numero := Get<TImobilizado<TBomba>>(FieldByName('ID_IMOBILIZADO').AsInteger).Numero;
        Result.Add(OBJ);
      end;
    end;
end;

function TDadosDAO.GetDiesels: TObjectList<TDiesel>;
var
  QRY: TFDQuery;
  OBJ: TDiesel;
  sTipo: string;
begin
  with QRY do
    begin
      SQL.Text := CONS_SELECT_COMBUSTIVEL;
      Open;
      First;
      while not Eof do
      begin
        OBJ.ID_Combustivel := FieldByName('ID_COMBUSTIVEL').AsInteger;
        OBJ.Imposto := Get<TImposto>(FieldByName('ID_IMPOSTO').AsInteger);
        OBJ.ValorLitro := FieldByName('VALOR_LITRO').AsExtended;
        sTipo := FieldByName('TIPO_COMBUSTIVEL').AsString;
        if sTipo = 'S10' then OBJ.Tipo := tdS10;
        if sTipo = 'S50' then OBJ.Tipo := tdS50;
        if sTipo = 'S500' then OBJ.Tipo := tdS500;
        if sTipo = 'S1800' then OBJ.Tipo := tdS1800;
        Result.Add(OBJ);
      end;
    end;
end;

function TDadosDAO.GetGasolinas: TObjectList<TGasolina>;
var
  QRY: TFDQuery;
  OBJ: TGasolina;
  sTipo: string;
begin
  with QRY do
    begin
      SQL.Text := CONS_SELECT_COMBUSTIVEL;
      Open;
      First;
      while not Eof do
      begin
        OBJ.ID_Combustivel := FieldByName('ID_COMBUSTIVEL').AsInteger;
        OBJ.Imposto := Get<TImposto>(FieldByName('ID_IMPOSTO').AsInteger);
        OBJ.ValorLitro := FieldByName('VALOR_LITRO').AsExtended;
        sTipo := FieldByName('TIPO_COMBUSTIVEL').AsString;
        if sTipo = 'COMUM' then OBJ.Tipo := tgComum;
        if sTipo = 'ADITIVADA' then OBJ.Tipo := tgAditivada;
        if sTipo = 'PREMIUM' then OBJ.Tipo := tgPremium;
        Result.Add(OBJ);
      end;
    end;
end;

function TDadosDAO.GetImobilizados<T>: TObjectList<TImobilizado<T>>;
var
  QRY: TFDQuery;
  OBJ: TImobilizado<T>;
  sStatus: Integer;
begin
  with QRY do
    begin
      SQL.Text := CONS_SELECT_IMOBILIZADO;
      Open;
      First;
      while not Eof do
      begin
        OBJ.ID_Imobilizado := FieldByName('ID_IMOBILIZADO').AsInteger;
        OBJ.Numero := FieldByName('NUMERO').AsInteger;
        OBJ.Status := TStatus(FieldByName('STATUS').AsInteger);
        Result.Add(OBJ);
      end;
    end;
end;

function TDadosDAO.GetImpostos: TObjectList<TImposto>;
var
  QRY: TFDQuery;
  OBJ: TImposto;
begin
  with QRY do
    begin
      SQL.Text := CONS_SELECT_IMPOSTO;
      Open;
      First;
      while not Eof do
      begin
        OBJ.ID_Imposto := FieldByName('ID_IMPOSTO').AsInteger;
        OBJ.Descricao := FieldByName('DESCRICAO').AsString;
        OBJ.Aliquota := FieldByName('ALIQUOTA').AsExtended;
        Result.Add(OBJ);
      end;
    end;
end;

function TDadosDAO.GetTanques: TObjectList<TTanque>;
var
  QRY: TFDQuery;
  OBJ: TTanque;
begin
  with QRY do
    begin
      SQL.Text := CONS_SELECT_TANQUE;
      Open;
      First;
      while not Eof do
      begin
        OBJ.ID_Tanque := FieldByName('ID_TANQUE').AsInteger;
        OBJ.Combustivel := Get<TCombustivel>(FieldByName('ID_COMBUSTIVEL').AsInteger);
        OBJ.ID_Imobilizado := FieldByName('ID_IMOBILIZADO').AsInteger;
        OBJ.Numero := Get<TImobilizado<TTAnque>>(FieldByName('ID_IMOBILIZADO').AsInteger).Numero;
        OBJ.Capacidade := FieldByName('VOLUME_TOTAL').AsExtended;
        OBJ.VolumeAtual := FieldByName('VOLUME_ATUAL').AsExtended;
        Result.Add(OBJ);
      end;
    end;
end;

end.
