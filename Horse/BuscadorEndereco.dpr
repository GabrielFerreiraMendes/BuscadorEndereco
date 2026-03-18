program BuscadorEndereco;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  endereco.controller in '..\controller\endereco.controller.pas',
  endereco.model in '..\model\endereco.model.pas',
  endereco.intf in '..\interface\endereco.intf.pas',
  apicep.model in '..\model\apicep.model.pas',
  awesomeapi.model in '..\model\awesomeapi.model.pas',
  viacep.model in '..\model\viacep.model.pas',
  apicep.dto in '..\dto\apicep.dto.pas',
  awesomeapi.dto in '..\dto\awesomeapi.dto.pas',
  viacep.dto in '..\dto\viacep.dto.pas';


var
  endereco: TEndereco;
  cep: String;
  response: String;
begin
  THorse.Get('/cep/:id',
    procedure(Req: THorseRequest; Res: THorseResponse)
    begin
      try
        cep := Req.Params['id'];
        Writeln('Requisição para o cep:' + cep);

        endereco := TEnderecoController.ConsultaEndereco(cep);
        response := endereco.ToJSON;

        Res.Status(THTTPStatus.OK).Send(response);
      except
        Res.Status(THTTPStatus.NotFound).Send('{"error": "Endereço não encontrado"}');
      end;
    end);

  THorse.Listen(9000, procedure
  begin
    Writeln('Servidor ouvindo na porta:' + THorse.Port.ToString);
  end);
end.
