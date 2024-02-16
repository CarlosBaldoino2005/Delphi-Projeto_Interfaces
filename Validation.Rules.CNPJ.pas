unit Validation.Rules.CNPJ;

interface

uses
  Validation.Interfaces;

type
  TValidationRulesCNPJ = class(TInterfacedObject, iValidationRules)
    private
      [weak]
      FParent : iValidation;
      FParams : iValidationRulesParams;
      procedure _OnExit ( Sender : TObject );
      procedure _OnChange ( Sender : TObject );
    public
      constructor Create(Parent : iValidation);
      destructor Destroy; override;
      class function New(Parent : iValidation) : iValidationRules;
      function Params : iValidationRulesParams;
      function &End : iValidation;
  end;

implementation

uses
  Validation.Rules.Params,
  Vcl.StdCtrls, System.SysUtils;

{ TValidationRulesCNPJ }

function TValidationRulesCNPJ.&End: iValidation;
begin
  Result := FParent;

  if FParams.Component is TEdit then
  begin
    TEdit(FParams.Component).OnExit := _OnExit;
    TEdit(FParams.Component).OnChange := _OnChange;
  end;
end;

constructor TValidationRulesCNPJ.Create(Parent : iValidation);
begin
  FParent := Parent;
end;

destructor TValidationRulesCNPJ.Destroy;
begin

  inherited;
end;

class function TValidationRulesCNPJ.New(Parent : iValidation) : iValidationRules;
begin
  Result := Self.Create(Parent);
end;

procedure TValidationRulesCNPJ._OnChange(Sender: TObject);
begin
    //Implementar a Validação aqui
end;

procedure TValidationRulesCNPJ._OnExit(Sender: TObject);
begin
    //Implementar a Validação aqui
end;

function TValidationRulesCNPJ.Params: iValidationRulesParams;
begin
  if not Assigned(FParams) then
    FParams := TValidationRulesParams.New(Self);

  Result := FParams;
end;

end.
