unit Validation.Interfaces;

interface

uses
  System.Classes,
  Vcl.Graphics;

type
  iValidationRulesParams = interface;
  iValidationRules = interface;

  iValidation = interface
    ['{53120B74-C4DE-4AD8-8817-41A8D5C04D3B}']
    function NotNull : iValidationRules;
    function MaxLength : iValidationRules;
  end;

  iValidationRules = interface
    ['{F3074B37-80EC-4665-B8A7-4626D2119121}']
    function Params : iValidationRulesParams;
    function &End : iValidation;
  end;

  iValidationRulesParams = interface
    ['{BAAAEB94-735B-40D6-8DA9-4A7338576A7E}']
    function Component ( aValue : TComponent ) : iValidationRulesParams; overload;
    function Component : TComponent; overload;
    function ColorDanger ( aValue : TColor ) : iValidationRulesParams; overload;
    function ColorDanger : TColor; overload;
    function ColorDefault ( aValue : TColor ) : iValidationRulesParams; overload;
    function ColorDefault : TColor; overload;
    function DisplayLabel ( aValue : TComponent ) : iValidationRulesParams; overload;
    function DisplayLabel : TComponent; overload;
    function DisplayMsg ( aValue : String ) : iValidationRulesParams; overload;
    function DisplayMsg : String; overload;
    function MinLength ( aValue : Integer ) : iValidationRulesParams; overload;
    function MinLength : Integer; overload;
    function MaxLength ( aValue : Integer ) : iValidationRulesParams; overload;
    function MaxLength : Integer; overload;
    function &End : iValidationRules;
  end;

implementation

end.
