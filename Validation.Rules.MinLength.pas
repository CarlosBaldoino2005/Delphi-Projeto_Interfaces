unit Validation.Rules.MinLength;

interface

uses
  Validation.Rules,
  Validation.Interfaces;

type
  TValidationRulesMinLength = class(TValidationRules)
    private
      procedure NotNullOnExit ( Sender : TObject );
      procedure NotNullOnChange ( Sender : TObject );
    public
      function &End : iValidation; override;
  end;

implementation

uses
  Vcl.StdCtrls;

{ TValidationRulesMinLength }

function TValidationRulesMinLength.&End: iValidation;
begin

  if FParams.Component is TEdit then
  begin
    TEdit(FParams.Component).OnExit := NotNullOnExit;
    TEdit(FParams.Component).OnChange := NotNullOnChange;
  end;

  inherited;
end;

procedure TValidationRulesMinLength.NotNullOnChange(Sender: TObject);
begin
  //
end;

procedure TValidationRulesMinLength.NotNullOnExit(Sender: TObject);
begin
  //
end;

end.
