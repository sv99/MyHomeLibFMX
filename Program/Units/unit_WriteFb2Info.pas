(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2019 Oleksiy Penkov (aka Koreec)
  *
  * Author(s)           Matvienko Sergei  matv84@mail.ru
  *                     Aleksey Penkov  alex.penkov@gmail.com
  * Created             12.02.2010
  * Description         ������ � fb2info ���������� �� ����
  *
  * $Id: unit_WriteFb2Info.pas 1064 2011-09-02 11:33:04Z eg_ $
  *
  * History
  * NickR 15.02.2010    ��� ����������������
  *
  ****************************************************************************** *)

unit unit_WriteFb2Info;

interface

uses
  unit_Globals;

function WriteFb2InfoToFile(const BookRecord: TBookRecord; const FileName: string): Boolean;

implementation

uses
  FictionBook_21,
  unit_Helpers,
  unit_Consts,
  dm_user,
  XMLDoc,
  SysUtils,
  unit_Templater,
  Dialogs;

resourcestring
  rstrCheckTemplateValidity = '��������� ������������ �������';

function WriteFb2InfoToFile(const BookRecord: TBookRecord; const FileName: string): Boolean;
var
  book: IXMLFictionBook;
  i: Integer;

  A: IXMLAuthorType;
  S: IXMLSequenceType;

  XML: TXmlDocument;

  TitleBook: string;

  Templater: TTemplater;
begin
  Result := False;
  try
    { TODO -oNickR -cBug : MEMLEAK ��������� }
    XML := TXmlDocument.Create(FileName);

    XML.Active := True;
    book := GetFictionBook(XML);

    Templater := TTemplater.Create;
    try
      if Templater.SetTemplate(Settings.BookHeaderTemplate, TpText) = ErFine then
        TitleBook := Templater.ParseString(BookRecord, TpText)
      else
      begin
        ShowMessage(rstrCheckTemplateValidity);
        Exit;
      end;
    finally
      Templater.Free;
    end;

    with book.Description.Titleinfo do
    begin
      Author.Clear;
      for i := 0 to High(BookRecord.Authors) do
      begin
        A := Author.Add;
        A.Lastname.Text := BookRecord.Authors[i].LastName;
        A.Firstname.Text := BookRecord.Authors[i].FirstName;
        A.Middlename.Text := BookRecord.Authors[i].MiddleName;
      end;

      Booktitle.Text := TitleBook;

      Genre.Clear;
      for i := 0 to High(BookRecord.Genres) do
        Genre.Add(BookRecord.Genres[i].FB2GenreCode);

      if BookRecord.Series <> NO_SERIES_TITLE then
      begin
        try
          Sequence.Clear;
          S := Sequence.Add;

          S.Name := BookRecord.Series;
          S.Number := BookRecord.SeqNumber;
        except
        end;
      end;
    end;
    XML.SaveToFile;
    Result := True;
  except

  end;
end;

end.
