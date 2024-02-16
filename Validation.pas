unit Validation;

interface

uses
  Validation.Interfaces,
  System.Generics.Collections;

type
  TValidation = class(TInterfacedObject, iValidation)
    private
      FListRules : TList<iValidationRules>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iValidation;
      function NotNull : iValidationRules;
      function MaxLength : iValidationRules;
  end;

implementation

uses
  Validation.Rules.NotNull, Validation.Rules.MaxLength;

{ TValidation }

constructor TValidation.Create;
begin
  FListRules := TList<iValidationRules>.Create;
end;

destructor TValidation.Destroy;
begin
  FListRules.Free;
  inherited;
end;

function TValidation.MaxLength: iValidationRules;
begin
  FListRules.Add(TValidationRulesMaxLength.New(Self));
  Result := FListRules.Last;
end;

class function TValidation.New: iValidation;
begin
  Result := Self.Create;
end;

function TValidation.NotNull: iValidationRules;
begin
  FListRules.Add(TValidationRulesNotNull.New(Self));
  Result := FListRules.Last;
end;

end.
