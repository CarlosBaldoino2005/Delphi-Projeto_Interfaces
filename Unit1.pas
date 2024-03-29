unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Validation.Interfaces;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FValidation : iValidation;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Validation, Validation.Rules.MinLength;

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
begin
  //TValidationRulesMinLength.New(nil).Params.Component(nil).
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

   FValidation := TValidation.New;

    FValidation
      .NotNull
        .Params
          .Component(Edit1)
          .DisplayLabel(Label1)
        .&End
      .&End
      .NotNull
        .Params
          .Component(Edit2)
          .DisplayLabel(Label2)
        .&End
      .&End
      .MaxLength
        .Params
          .Component(Edit1)
          .MaxLength(10)
          .DisplayLabel(Label1)
        .&End
      .&End;

      { .MinLength
        .Params
          .Component(Edit1)
          .ColorDanger(clRed)
          .ColorDefault(clWhite)
          .DisplayLabel(Label1)
          .DisplayMsg('Edit1 n�o pode ter menos de 3 caracteres')
          .MinLength(3)
        .&End
      .&End
      .MaxLength
        .Params
          .Component(Edit1)
          .ColorDanger(clRed)
          .ColorDefault(clWhite)
          .DisplayLabel(Label1)
          .DisplayMsg('Edit1 n�o pode ter menos de 10 caracteres')
          .MaxLength(10)
        .&End
      .&End
  }
end;

end.
