﻿(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2019 Oleksiy Penkov (aka Koreec)
  *
  * Authors Aleksey Penkov   alex.penkov@gmail.com
  *         Nick Rymanov     nrymanov@gmail.com
  * Created                  20.08.2008
  * Description              
  *
  * $Id: frm_splash.pas 916 2010-11-17 08:19:10Z koreec $
  *
  * History
  *
  ****************************************************************************** *)

unit frm_splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, pngimage;

type
  TfrmSplash = class(TForm)
    Image1: TImage;
    lblState: TLabel;
    RzLabel1: TLabel;
  private
  public
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

end.
