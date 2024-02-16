unit Validation.Rules.MaxLength;

interface

uses
  Validation.Interfaces;

type
  TValidationRulesMaxLength = class(TInterfacedObject, iValidationRules)
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

{ TValidationRulesNotNull }

function TValidationRulesMaxLength.&End: iValidation;
begin
  Result := FParent;

  if FParams.Component is TEdit then
  begin
    TEdit(FParams.Component).OnExit := _OnExit;
    TEdit(FParams.Component).OnChange := _OnChange;
  end;

end;

constructor TValidationRulesMaxLength.Create(Parent : iValidation);
begin
  FParent := Parent;
end;

destructor TValidationRulesMaxLength.Destroy;
begin

  inherited;
end;

class function TValidationRulesMaxLength.New(Parent : iValidation) : iValidationRules;
begin
  Result := Self.Create(Parent);
end;

procedure TValidationRulesMaxLength._OnChange(Sender: TObject);
begin
  if Length(Trim(TEdit(Sender).Text)) <= FParams.MaxLength then
  begin
    TLabel(FParams.DisplayLabel).Visible := False;
    TEdit(Sender).Color := FParams.ColorDefault;
  end;
end;

procedure TValidationRulesMaxLength._OnExit(Sender: TObject);
begin
  if Length(Trim(TEdit(Sender).Text)) > FParams.MaxLength then
  begin
    TEdit(Sender).Color := FParams.ColorDanger;
    TEdit(Sender).SetFocus;
    TLabel(FParams.DisplayLabel).Visible := True;

    if Trim(FParams.DisplayMsg) = '' then
      TLabel(FParams.DisplayLabel).Caption :=
        TEdit(Sender).Name + ' não pode ser maior do que ' + IntToStr(FParams.MaxLength) + ' Caracteres'
    else
      TLabel(FParams.DisplayLabel).Caption := FParams.DisplayMsg;
  end;
end;

function TValidationRulesMaxLength.Params: iValidationRulesParams;
begin
  if not Assigned(FParams) then
    FParams := TValidationRulesParams.New(Self);

  Result := FParams;
end;

end.

