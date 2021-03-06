{*******************************************************}
{                                                       }
{       Report Manager Server configuration             }
{                                                       }
{       unewaliasvcl                                    }
{                                                       }
{       Ask info to create a new alias                  }
{                                                       }
{       Copyright (c) 1994-2019 Toni Martir             }
{       toni@reportman.es                                   }
{                                                       }
{       This file is under the MPL license              }
{       If you enhace this file you must provide        }
{       source code                                     }
{                                                       }
{                                                       }
{*******************************************************}

unit unewaliasvcl;

interface

uses SysUtils, Classes, Graphics, Forms,
  Buttons, ExtCtrls, Controls, StdCtrls,rpmdconsts;

type
  TFNewAliasVCL = class(TForm)
    BOk: TButton;
    BCancel: TButton;
    LAlias: TLabel;
    EAliasName: TEdit;
    EPath: TEdit;
    LPath: TLabel;
    LAliasbase: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BOkClick(Sender: TObject);
  private
    { Private declarations }
    dook:boolean;
  public
    { Public declarations }
  end;


function AskForNewAlias(var aliasname,path:string):boolean;

implementation

{$R *.dfm}


function AskForNewAlias(var aliasname,path:string):boolean;
var
 dia:TFNewAliasVCL;
begin
 Result:=false;
 dia:=TFNewAliasVCL.Create(Application);
 try
  dia.ActiveControl:=dia.EAliasName;
  dia.EAliasName.Text:=aliasname;
  dia.EPath.Text:=path;
  dia.showmodal;
  if dia.dook then
  begin
   aliasname:=Trim(Uppercase(dia.EAliasName.Text));
   path:=Copy(Trim(dia.EPath.Text),1,250);
   Result:=True;
  end;
 finally
  dia.free;
 end;
end;

procedure TFNewAliasVCL.FormCreate(Sender: TObject);
begin
 Caption:=TranslateStr(806,Caption);
 LAlias.Caption:=TranslateStr(807,LAlias.Caption);
 LPath.Caption:=TranslateStr(808,LPath.Caption);
 BOK.Caption:=TranslateStr(93,BOK.Caption);
 BCancel.Caption:=TranslateStr(94,BCancel.Caption);
 LAliasBase.Caption:=SRpAliasPath;
 LAliasBase.Font.Style:=[fsBold];
end;

procedure TFNewAliasVCL.BOkClick(Sender: TObject);
begin
 if Length(Trim(EPath.Text))<1 then
 begin
  EPath.SetFocus;
  Raise Exception.Create(SRpAPathMustBeAssigned);
 end;
 if Length(Trim(EAliasname.Text))<1 then
 begin
  EAliasName.SetFocus;
  Raise Exception.Create(SRpAAliasnameBeAssigned);
 end;
 dook:=true;
 Close;
end;

end.
