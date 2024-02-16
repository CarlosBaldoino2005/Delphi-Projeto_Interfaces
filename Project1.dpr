program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Validation.Interfaces in 'Validation.Interfaces.pas',
  Validation.Rules.Params in 'Validation.Rules.Params.pas',
  Validation.Rules.NotNull in 'Validation.Rules.NotNull.pas',
  Validation in 'Validation.pas',
  Validation.Rules.MaxLength in 'Validation.Rules.MaxLength.pas',
  Validation.Rules in 'Validation.Rules.pas',
  Validation.Rules.MinLength in 'Validation.Rules.MinLength.pas',
  Validation.Rules.CPF in 'Validation.Rules.CPF.pas',
  Validation.Rules.CNPJ in 'Validation.Rules.CNPJ.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
