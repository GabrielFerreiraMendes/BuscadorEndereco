unit endereco.controller;

interface

uses
  endereco.model, endereco.intf;

type
  TEnderecoController = class
  class function ConsultaEndereco(Cep:String): TEndereco;
  end;

implementation

{ TEnderecoController }

class function TEnderecoController.ConsultaEndereco(Cep: String): TEndereco;
begin
  Result := TEnderecoModel.ConsultarEndereco(Cep);
end;

end.
