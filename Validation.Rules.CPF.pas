unit Validation.Rules.CPF;

interface

uses
  Validation.Interfaces;

type
  TValidationRulesCPF = class(TInterfacedObject, iValidationRules)
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

{ TValidationRulesCPF }

function TValidationRulesCPF.&End: iValidation;
begin
  Result := FParent;

  if FParams.Component is TEdit then
  begin
    TEdit(FParams.Component).OnExit := _OnExit;
    TEdit(FParams.Component).OnChange := _OnChange;
  end;
end;

constructor TValidationRulesCPF.Create(Parent : iValidation);
begin
  FParent := Parent;
end;

destructor TValidationRulesCPF.Destroy;
begin

  inherited;
end;

class function TValidationRulesCPF.New(Parent : iValidation) : iValidationRules;
begin
  Result := Self.Create(Parent);
end;

procedure TValidationRulesCPF._OnChange(Sender: TObject);
begin
    //Implementar a Validação aqui
end;

procedure TValidationRulesCPF._OnExit(Sender: TObject);
begin
    //Implementar a Validação aqui
end;

function TValidationRulesCPF.Params: iValidationRulesParams;
begin
  if not Assigned(FParams) then
    FParams := TValidationRulesParams.New(Self);

  Result := FParams;
end;

end.
