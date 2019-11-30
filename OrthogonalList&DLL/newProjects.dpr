program newProjects;

uses
  Vcl.Forms,
  main in 'main.pas' {Form2},
  dll in 'dll.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
