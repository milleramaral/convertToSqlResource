unit uDaoMntAlterarSenhaDeUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDaoPoolConexao, FMTBcd, DB, SqlExpr;

type
  TDaoMntAlterarSenhaUsuario = class(TDaoPoolConexao)
    SqlAlterarUsuario: TSQLDataSet;
    SqlAlterarUsuarioCODIGO_USUARIO: TIntegerField;
    SqlAlterarUsuarioSENHA: TIntegerField;
    SqlAlterarUsuarioINTRUSO: TStringField;
    SqlAlterarUsuarioNOME: TStringField;
    SqlAlterarUsuarioNOME_COMPLETO: TStringField;
    SqlUpdateSenhaUsuario: TSQLDataSet;
  private
    procedure ConsultarUsuarioNoBanco(AIdUsuario: integer; var ASenha: integer; var ANome, ANomeCompleto: string);
    procedure ValidarSenhas(ASenhaBancoCriptografada: integer; ASenhaAtual, ANovaSenha, AConfirmacaoDaSenha: string);
    function GerarCRC(ANome, ANomeCompleto: string; AIdUsuario, ASenha: integer; AIntruso: string = 'N'): integer;
    function CriptografarSenha(ASenha: string): integer;
    procedure Mensagem(AMensagem: string);

  public
    procedure SalvarNovaSenha(AIdUsuario: integer; ASenhaAtual, ANovaSenha, AConfirmacaoSenha: string);
  end;

implementation

uses ObjCrc;

{$R *.dfm}

{ TDaoMntAlterarSenhaUsuario }


procedure TDaoMntAlterarSenhaUsuario.ConsultarUsuarioNoBanco(AIdUsuario: integer; var ASenha: integer;
  var ANome, ANomeCompleto: string);
begin
  SqlAlterarUsuario.Close;
  SqlAlterarUsuario.Params.ParamByName('CODIGO_USUARIO').AsInteger := AIdUsuario;
  SqlAlterarUsuario.Open;

  ASenha := SqlAlterarUsuario.FieldByName('SENHA').AsInteger;
  ANome := SqlAlterarUsuario.FieldByName('NOME').AsString;
  ANomeCompleto := SqlAlterarUsuario.FieldByName('NOME_COMPLETO').AsString;
  SqlAlterarUsuario.Close;
end;


function TDaoMntAlterarSenhaUsuario.CriptografarSenha(ASenha: string): integer;
begin
  Result :=  TCrc.GetInstance.Criptografar(ASenha);
end;

function TDaoMntAlterarSenhaUsuario.GerarCRC(ANome, ANomeCompleto: string; AIdUsuario, ASenha: integer; AIntruso: string = 'N'): integer;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  Lista.Clear;

  Lista.Add(IntToStr(AIdUsuario));
  Lista.Add(ANome);
  Lista.Add(ANomeCompleto);
  Lista.Add(IntToStr(ASenha));
  Lista.Add(AIntruso);

  Result := TCrc.GetInstance.GerarCrc(Lista);

  FreeAndNil(Lista);
end;

procedure TDaoMntAlterarSenhaUsuario.Mensagem(AMensagem: string);
begin
  raise Exception.Create(AMensagem);
end;

procedure TDaoMntAlterarSenhaUsuario.SalvarNovaSenha(AIdUsuario: integer; ASenhaAtual, ANovaSenha, AConfirmacaoSenha: string);
var
  Nome,
  NomeCompleto: string;
  NovaSenhaCriptografada,
  SenhaAtualBancoCriptografada: Integer;
begin
  ConsultarUsuarioNoBanco(AIdUsuario, SenhaAtualBancoCriptografada, Nome, NomeCompleto);
  ValidarSenhas(SenhaAtualBancoCriptografada, ASenhaAtual, ANovaSenha, AConfirmacaoSenha);
  NovaSenhaCriptografada := CriptografarSenha(ANovaSenha);

  SqlUpdateSenhaUsuario.Params.ParamByName('SENHA').AsInteger := NovaSenhaCriptografada;
  SqlUpdateSenhaUsuario.Params.ParamByName('CODIGO_USUARIO').AsInteger := AIdUsuario;
  SqlUpdateSenhaUsuario.Params.ParamByName('CRC').AsInteger := GerarCRC(Nome, NomeCompleto, AIdUsuario, NovaSenhaCriptografada);
  ExecutarSql(SqlUpdateSenhaUsuario);
end;

procedure TDaoMntAlterarSenhaUsuario.ValidarSenhas(ASenhaBancoCriptografada: integer; ASenhaAtual,
  ANovaSenha, AConfirmacaoDaSenha: string);
begin
  if(not TCrc.GetInstance.ChecarCriptografia(ASenhaAtual, ASenhaBancoCriptografada))then
  begin
    Mensagem('A senha atual digitada não corresponde com a senha atual.');
  end;

  if(ANovaSenha <> AConfirmacaoDaSenha)then
  begin
    Mensagem('A confirmação da senha deve ser igual a nova senha.');
  end;

  if(ANovaSenha =  '') or (AConfirmacaoDaSenha = '')then
  begin
    Mensagem('A nova senha não pode estar vazia.');
  end;
end;

end.
