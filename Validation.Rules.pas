unit Validation.Rules;

interface

uses
  Validation.Interfaces;

type
  TValidationRules = class (TInterfacedObject, iValidationRules)
    protected
      [weak]
      FParent : iValidation;
      FParams : iValidationRulesParams;
    public
      constructor Create(Parent : iValidation);
      destructor Destroy; override;
      class function New (Parent : iValidation) : iValidationRules;
      function Params : iValidationRulesParams;
      function &End : iValidation; virtual;
  end;

implementation

uses
  Validation.Rules.Params;

{ TValidationRules }

function TValidationRules.&End: iValidation;
begin
  Result := FParent;
end;

constructor TValidationRules.Create(Parent: iValidation);
begin
  FParent := Parent;
end;

destructor TValidationRules.Destroy;
begin

  inherited;
end;

class function TValidationRules.New(Parent: iValidation): iValidationRules;
begin
  Result := Self.Create(Parent);
end;

function TValidationRules.Params: iValidationRulesParams;
begin
  if not Assigned(FParams) then
    FParams := TValidationRulesParams.New(Self);

  Result := FParams;
end;

end.
