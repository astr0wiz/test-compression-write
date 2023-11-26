unit MainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Spin, StdCtrls,indeflation;

const
  BBEGINCOUNT  = 163;
  BMIDDLECOUNT = 0;
  BENDCOUNT    = 0;

type

  { TForm1 }

  TForm1 = class(TForm)
    writeFile: TButton;
    createText: TButton;
    ClearOutput: TButton;
    Label1: TLabel;
    TextOutput: TMemo;
    msg: TLabel;
    totalRecords: TSpinEdit;
    procedure ClearOutputClick(Sender: TObject);
    procedure createTextClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure writeFileClick(Sender: TObject);
  private

  public

  end;

  TTestData = record
    Key:  longword;
    Name: string;
  end;

  {$packrecords 1}
  TGrammarBits = record
    Key:      word;
    CanBegin: boolean;
    Mids:     string[16];
    Ends:     string[16];
  end;

  {$packrecords default}

  TBigram    = array of string;
  TBigramSet = array of TGrammarBits;


function GetRandomString: string;
function GetRandomArticle: string;
function GetGrammarByKey(bufkey: word): TGrammarBits;
function Capitalize(const str: string): string;

var
  Form1:   TForm1;
  BigramBegin: array of string;
  Bigrams: TBigramSet;

implementation

function GetRandomString: string;
  var
    wordSize, i: byte;
    buf:         string;
    bufkey:      word;
    bit:         TGrammarBits;
    rp:          integer;
  begin
    wordSize := Random(8) + 3;
    Result   := BigramBegin[Random(Length(BigramBegin))];
    for i := 2 to wordSize - 1 do
      begin
      buf    := RightStr(Result, 2);
      bufkey := (Ord(buf[1]) shl 8) or (Ord(buf[2]));
      bit    := GetGrammarByKey(bufkey);
      if Length(bit.Mids) > 0 then
        begin
        rp     := Random(Length(bit.Mids)) + 1;
        Result := Result + bit.Mids[rp];
        //Form1.TextOutput.Lines.Add(format('---buf:%0s  bufkey:$%1x  rp:%2d  len(mids):%3d  Mids:%4s',
        //  [buf, bufkey, rp, Length(bit.Mids), bit.Mids]));
        end
      else
        break;
      end;
    buf    := RightStr(Result, 2);
    bufkey := (Ord(buf[1]) shl 8) or (Ord(buf[2]));
    bit    := GetGrammarByKey(bufkey);
    if Length(bit.Ends) > 0 then
      begin
      rp     := Random(Length(bit.Ends)) + 1;
      Result := Result + bit.Ends[rp];
      end;
  end;

function GetRandomArticle: string;
  begin
    case Random(40) of
      0..1: Result   := 'a ';
      10..11: Result := 'en ';
      20..21: Result := 'ol ';
      30..31: Result := 'il ';
      else
        Result := '';
      end;
  end;

function GetGrammarByKey(bufkey: word): TGrammarBits;
  var
    i: integer;
  begin
    i := 0;
    repeat
        begin
        Result := Bigrams[i];
        Inc(i);
        end;
    until (Result.Key = bufkey) or (i = Length(Bigrams));
  end;

function Capitalize(const str: string): string;
  begin
    Result    := LowerCase(str);
    Result[1] := UpCase(Result[1]);
  end;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormShow(Sender: TObject);
  var
    BigramStream: TMemoryStream;
    bit:          TGrammarBits;
  begin
    totalRecords.Value := 10;
    BigramStream       := TMemoryStream.Create;
    BigramStream.LoadFromFile('x.dat');
    while BigramStream.Read(bit, SizeOf(TGrammarBits)) > 0 do
      begin
      if (bit.CanBegin) then
        begin
        SetLength(BigramBegin, Length(BigramBegin) + 1);
        BigramBegin[Length(BigramBegin) - 1] := Chr(hi(bit.Key)) + Chr(lo(bit.Key));
        end;
      SetLength(Bigrams, Length(Bigrams) + 1);
      Bigrams[Length(Bigrams) - 1] := bit;
      end;
    FreeAndNil(BigramStream);
    msg.Caption := format('Total Bigrams: %0d  Beginners: %1d', [Length(Bigrams), Length(BigramBegin)]);
    TextOutput.Lines.Clear;
    Randomize;
  end;

procedure TForm1.writeFileClick(Sender: TObject);
  var
    SourceStream, DestStream: TMemoryStream;
    filename:   string;
    i:          integer;
    deflateOk:  boolean;
    HeaderData: TFileOmniHeader;
  begin
    filename           := 'H:\\Temp\\testdata.dat';
    SourceStream       := TMemoryStream.Create;
    DestStream         := TMemoryStream.Create;
    HeaderData.magicnum := MAGIC_FILE_NUM;
    HeaderData.version := 1;
    HeaderData.reccount := TextOutput.Lines.Count;
    for i := 0 to TextOutput.Lines.Count - 1 do
      begin
      SourceStream.WriteAnsiString(TextOutput.Lines[i]);
      end;
    deflateOk := deflation(SourceStream, DestStream, HeaderData);
    DestStream.SaveToFile(filename);
    msg.Caption:='File saved to ' + filename;
    FreeAndNil(SourceStream);
    FreeAndNil(DestStream);
  end;

procedure TForm1.createTextClick(Sender: TObject);
  var
    testdata:  TTestData;
    i, p:      longword;
    wordcount: integer;
    wcountmin, wcountmax: integer;
    parasize:  integer;
    para:      string;
    sentence:  string;
  begin
    if totalRecords.Value > 0 then
      begin
      parasize := Random(10);
      para     := '';
      for i := 1 to totalRecords.Value do
        begin
        para     := '';
        parasize := Random(10) + 1;
        for p := 1 to parasize do
          begin
          sentence  := '';
          wcountmin := Random(2) + 1;
          wcountmax := wcountmin + Random(10);
          for wordcount := wcountmin to wcountmax do
            sentence := sentence + ' ' + GetRandomArticle + GetRandomString;
          sentence   := Capitalize(Trim(sentence)) + '.';
          if length(para) > 0 then
            para := para + '  ' + sentence
          else
            para := sentence;
          end;
        if Length(para) > 0 then
          begin
          TextOutput.Lines.Add(para);
          TextOutput.Lines.Add('');
          end;
        end;
      end;
  end;

procedure TForm1.FormResize(Sender: TObject);
  begin
    Form1.TextOutput.Width  := Form1.Width - 49;
    Form1.TextOutput.Height := Form1.Height - 185;
  end;

procedure TForm1.ClearOutputClick(Sender: TObject);
  begin
    TextOutput.Clear;
  end;

end.
