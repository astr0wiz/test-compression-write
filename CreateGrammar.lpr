program CreateGrammar;

(*
===================================================================================================
This creates a file which holds the records for generating 'words' via bigrams and trigrams which
were identified by the fine folks who wrote the blog, from which I found a link, at Scrollback:
https://www.hackerearth.com/practice/notes/random-pronouncable-text-generator/

The function should follow this general pseudo-code:

  a) Randomly select one of the Bigrams with CanBegin = true and put in buffer.
  b) Loop from 3 to number-of-letters-in-expected-word-minus-one.
      1) Get the last two letters in buffer
      2) Look up Mids string for Bigram represented by those two letters.
      3) Randomly select one of the Mids letters and append in buffer.
  c) At end of loop, look up Ends string for Bigram of last two letters.
  d) Randomly pick one letter from Ends and append to buffer.
===================================================================================================
*)

{$H-}

uses
  SysUtils,
  Classes;

type
  {$packrecords 1}
  TGrammarBits = record
    Key:      word;
    CanBegin: boolean;
    Mids:     string[16];
    Ends:     string[16];
    end;

  {$packrecords default}

  function GetData(i: integer): TGrammarBits;
    begin
      FillByte(Result, SizeOf(TGrammarBits), $00);
      with Result do
        case i of
          1: (* ---- AB ---- *)
            begin
            Key      := $4142;
            CanBegin := True;
            Mids     := 'LOI';
            Ends     := 'E';
            end;
          2: (* ---- AC ---- *)
            begin
            Key      := $4143;
            CanBegin := True;
            Mids     := 'TEKHCRI';
            Ends     := 'TEKH';
            end;
          3: (* ---- AD ---- *)
            begin
            Key      := $4144;
            CanBegin := True;
            Mids     := 'EIYVMD';
            Ends     := 'EY';
            end;
          4: (* ---- AF ---- *)
            begin
            Key      := $4146;
            CanBegin := True;
            Mids     := 'TF';
            Ends     := 'TF';
            end;
          5: (* ---- AG ---- *)
            begin
            Key      := $4147;
            CanBegin := True;
            Mids     := 'EAO';
            Ends     := 'EO';
            end;
          6: (* ---- AI ---- *)
            begin
            Key      := $4149;
            CanBegin := True;
            Mids     := 'NDRLT';
            Ends     := 'NDRLT';
            end;
          7: (* ---- AK ---- *)
            begin
            Key      := $414b;
            CanBegin := False;
            Mids     := 'EI';
            Ends     := 'E';
            end;
          8: (* ---- AL ---- *)
            begin
            Key      := $414c;
            CanBegin := True;
            Mids     := 'LSITEUOMKFA';
            Ends     := 'LSTEF';
            end;
          9: (* ---- AM ---- *)
            begin
            Key      := $414d;
            CanBegin := True;
            Mids     := 'EPIOA';
            Ends     := 'E';
            end;
          10: (* ---- AN ---- *)
            begin
            Key      := $414e;
            CanBegin := True;
            Mids     := 'DTYCSGNIOEAK';
            Ends     := 'DTYSGOEAK';
            end;
          11: (* ---- AP ---- *)
            begin
            Key      := $4150;
            CanBegin := True;
            Mids     := 'PEA';
            Ends     := 'E';
            end;
          12: (* ---- AR ---- *)
            begin
            Key      := $4152;
            CanBegin := True;
            Mids     := 'ETDYSIRLMKGAONC';
            Ends     := 'ETDYSMKAN';
            end;
          13: (* ---- AS ---- *)
            begin
            Key      := $4153;
            CanBegin := True;
            Mids     := 'TSEIUOKH';
            Ends     := 'TSEOH';
            end;
          14: (* ---- AT ---- *)
            begin
            Key      := $4154;
            CanBegin := True;
            Mids     := 'IETHUOC';
            Ends     := 'EHO';
            end;
          15: (* ---- AU ---- *)
            begin
            Key      := $4155;
            CanBegin := True;
            Mids     := 'TS';
            Ends     := 'TS';
            end;
          16: (* ---- AV ---- *)
            begin
            Key      := $4156;
            CanBegin := True;
            Mids     := 'EIA';
            Ends     := 'E';
            end;
          17: (* ---- AW ---- *)
            begin
            Key      := $4157;
            CanBegin := True;
            Mids     := 'A';
            Ends     := '';
            end;
          18: (* ---- AY ---- *)
            begin
            Key      := $4159;
            CanBegin := False;
            Mids     := 'SE';
            Ends     := 'S';
            end;
          19: (* ---- BA ---- *)
            begin
            Key      := $4241;
            CanBegin := True;
            Mids     := 'SCRNL';
            Ends     := 'SRNL';
            end;
          20: (* ---- BE ---- *)
            begin
            Key      := $4245;
            CanBegin := True;
            Mids     := 'RECTLFSIGDA';
            Ends     := 'RETLSDA';
            end;
          21: (* ---- BI ---- *)
            begin
            Key      := $4249;
            CanBegin := True;
            Mids     := 'LTN';
            Ends     := 'LTN';
            end;
          22: (* ---- BJ ---- *)
            begin
            Key      := $424a;
            CanBegin := False;
            Mids     := 'E';
            Ends     := '';
            end;
          23: (* ---- BL ---- *)
            begin
            Key      := $424c;
            CanBegin := True;
            Mids     := 'EIYOA';
            Ends     := 'EY';
            end;
          24: (* ---- BO ---- *)
            begin
            Key      := $424f;
            CanBegin := True;
            Mids     := 'UTRODA';
            Ends     := 'UTROD';
            end;
          25: (* ---- BR ---- *)
            begin
            Key      := $4252;
            CanBegin := True;
            Mids     := 'OIEA';
            Ends     := 'EA';
            end;
          26: (* ---- BU ---- *)
            begin
            Key      := $4255;
            CanBegin := True;
            Mids     := 'TSRI';
            Ends     := 'TSR';
            end;
          27: (* ---- CA ---- *)
            begin
            Key      := $4341;
            CanBegin := true;
            Mids     := 'LNTRUSMP';
            Ends     := 'LNTRSM';
            end;
          28: (* ---- CC ---- *)
            begin
            Key      := $4343;
            CanBegin := False;
            Mids     := 'UOE';
            Ends     := 'E';
            end;
          29: (* ---- CE ---- *)
            begin
            Key      := $4345;
            CanBegin := true;
            Mids     := 'SNRDPLI';
            Ends     := 'SNRDPL';
            end;
          30: (* ---- CH ---- *)
            begin
            Key      := $4348;
            CanBegin := true;
            Mids     := 'EAIOUR';
            Ends     := 'EO';
            end;
          31: (* ---- CI ---- *)
            begin
            Key      := $4349;
            CanBegin := true;
            Mids     := 'ATESPN';
            Ends     := 'ATESPN';
            end;
          32: (* ---- CK ---- *)
            begin
            Key      := $434b;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          33: (* ---- CL ---- *)
            begin
            Key      := $434c;
            CanBegin := true;
            Mids     := 'EAUO';
            Ends     := 'E';
            end;
          34: (* ---- CO ---- *)
            begin
            Key      := $434f;
            CanBegin := true;
            Mids     := 'NMURLVSO';
            Ends     := 'NMURLO';
            end;
          35: (* ---- CR ---- *)
            begin
            Key      := $4352;
            CanBegin := true;
            Mids     := 'EIOA';
            Ends     := 'EA';
            end;
          36: (* ---- CT ---- *)
            begin
            Key      := $4354;
            CanBegin := False;
            Mids     := 'IEUSO';
            Ends     := 'ESO';
            end;
          37: (* ---- CU ---- *)
            begin
            Key      := $4355;
            CanBegin := true;
            Mids     := 'LRTS';
            Ends     := 'LRTS';
            end;
          38: (* ---- DA ---- *)
            begin
            Key      := $4441;
            CanBegin := true;
            Mids     := 'YTRN';
            Ends     := 'YTRN';
            end;
          39: (* ---- DD ---- *)
            begin
            Key      := $4444;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          40: (* ---- DE ---- *)
            begin
            Key      := $4445;
            CanBegin := true;
            Mids     := 'RNSDAVPTMLF';
            Ends     := 'RNSDAPTML';
            end;
          41: (* ---- DG ---- *)
            begin
            Key      := $4447;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          42: (* ---- DI ---- *)
            begin
            Key      := $4449;
            CanBegin := true;
            Mids     := 'SNTDFECAVR';
            Ends     := 'SNTDFECAR';
            end;
          43: (* ---- DL ---- *)
            begin
            Key      := $444c;
            CanBegin := False;
            Mids     := 'YE';
            Ends     := 'YE';
            end;
          44: (* ---- DM ---- *)
            begin
            Key      := $444d;
            CanBegin := False;
            Mids     := 'I';
            Ends     := '';
            end;
          45: (* ---- DO ---- *)
            begin
            Key      := $444f;
            CanBegin := true;
            Mids     := 'WNME';
            Ends     := 'WNM';
            end;
          46: (* ---- DR ---- *)
            begin
            Key      := $4452;
            CanBegin := true;
            Mids     := 'EOIA';
            Ends     := 'EA';
            end;
          47: (* ---- DU ---- *)
            begin
            Key      := $4455;
            CanBegin := true;
            Mids     := 'CSRA';
            Ends     := 'SR';
            end;
          48: (* ---- EA ---- *)
            begin
            Key      := $4541;
            CanBegin := true;
            Mids     := 'RSTDLCNVMK';
            Ends     := 'RSTDLNM';
            end;
          49: (* ---- EC ---- *)
            begin
            Key      := $4543;
            CanBegin := true;
            Mids     := 'TOIEAURH';
            Ends     := 'TEH';
            end;
          50: (* ---- ED ---- *)
            begin
            Key      := $4544;
            CanBegin := true;
            Mids     := 'IUE';
            Ends     := 'E';
            end;
          51: (* ---- EE ---- *)
            begin
            Key      := $4545;
            CanBegin := False;
            Mids     := 'NDTMSRPLK';
            Ends     := 'NDTMSRPLK';
            end;
          52: (* ---- EF ---- *)
            begin
            Key      := $4546;
            CanBegin := true;
            Mids     := 'OFUTE';
            Ends     := 'FTE';
            end;
          53: (* ---- EG ---- *)
            begin
            Key      := $4547;
            CanBegin := False;
            Mids     := 'ARIE';
            Ends     := 'E';
            end;
          54: (* ---- EI ---- *)
            begin
            Key      := $4549;
            CanBegin := true;
            Mids     := 'RNGT';
            Ends     := 'RNGT';
            end;
          55: (* ---- EL ---- *)
            begin
            Key      := $454c;
            CanBegin := true;
            Mids     := 'LYIEFOATSPD';
            Ends     := 'LYEFTSD';
            end;
          56: (* ---- EM ---- *)
            begin
            Key      := $454d;
            CanBegin := true;
            Mids     := 'ESPOBAI';
            Ends     := 'ES';
            end;
          57: (* ---- EN ---- *)
            begin
            Key      := $454e;
            CanBegin := true;
            Mids     := 'TCDSEIGONA';
            Ends     := 'TDSEGOA';
            end;
          58: (* ---- EO ---- *)
            begin
            Key      := $454f;
            CanBegin := true;
            Mids     := 'RP';
            Ends     := 'RP';
            end;
          59: (* ---- EP ---- *)
            begin
            Key      := $4550;
            CanBegin := False;
            Mids     := 'TOEA';
            Ends     := 'TE';
            end;
          60: (* ---- EQ ---- *)
            begin
            Key      := $4551;
            CanBegin := False;
            Mids     := 'U';
            Ends     := '';
            end;
          61: (* ---- ER ---- *)
            begin
            Key      := $4552;
            CanBegin := False;
            Mids     := 'ESIANYTVMROLGFC';
            Ends     := 'ESANYTM';
            end;
          62: (* ---- ES ---- *)
            begin
            Key      := $4553;
            CanBegin := true;
            Mids     := 'STEIPUC';
            Ends     := 'STE';
            end;
          63: (* ---- ET ---- *)
            begin
            Key      := $4554;
            CanBegin := False;
            Mids     := 'TIHEYWSA';
            Ends     := 'HEYSA';
            end;
          64: (* ---- EV ---- *)
            begin
            Key      := $4556;
            CanBegin := true;
            Mids     := 'EI';
            Ends     := 'E';
            end;
          65: (* ---- EX ---- *)
            begin
            Key      := $4558;
            CanBegin := true;
            Mids     := 'PTICA';
            Ends     := 'T';
            end;
          66: (* ---- EY ---- *)
            begin
            Key      := $4559;
            CanBegin := true;
            Mids     := 'E';
            Ends     := '';
            end;
          67: (* ---- FA ---- *)
            begin
            Key      := $4641;
            CanBegin := true;
            Mids     := 'CRMI';
            Ends     := 'RM';
            end;
          68: (* ---- FE ---- *)
            begin
            Key      := $4645;
            CanBegin := true;
            Mids     := 'REWLCA';
            Ends     := 'REWLA';
            end;
          69: (* ---- FF ---- *)
            begin
            Key      := $4646;
            CanBegin := False;
            Mids     := 'EI';
            Ends     := 'E';
            end;
          70: (* ---- FI ---- *)
            begin
            Key      := $4649;
            CanBegin := true;
            Mids     := 'RNCELG';
            Ends     := 'RNCELG';
            end;
          71: (* ---- FL ---- *)
            begin
            Key      := $464c;
            CanBegin := true;
            Mids     := 'OE';
            Ends     := 'E';
            end;
          72: (* ---- FO ---- *)
            begin
            Key      := $464f;
            CanBegin := true;
            Mids     := 'RUOL';
            Ends     := 'RUOL';
            end;
          73: (* ---- FR ---- *)
            begin
            Key      := $4652;
            CanBegin := true;
            Mids     := 'OEA';
            Ends     := 'EA';
            end;
          74: (* ---- FT ---- *)
            begin
            Key      := $4654;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          75: (* ---- FU ---- *)
            begin
            Key      := $4655;
            CanBegin := true;
            Mids     := 'LRN';
            Ends     := 'LRN';
            end;
          76: (* ---- GA ---- *)
            begin
            Key      := $4741;
            CanBegin := true;
            Mids     := 'NITR';
            Ends     := 'NTR';
            end;
          77: (* ---- GE ---- *)
            begin
            Key      := $4745;
            CanBegin := true;
            Mids     := 'NTSRD';
            Ends     := 'NTSRD';
            end;
          78: (* ---- GG ---- *)
            begin
            Key      := $4747;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          79: (* ---- GH ---- *)
            begin
            Key      := $4748;
            CanBegin := False;
            Mids     := 'T';
            Ends     := 'T';
            end;
          80: (* ---- GI ---- *)
            begin
            Key      := $4749;
            CanBegin := true;
            Mids     := 'NVOC';
            Ends     := 'NC';
            end;
          81: (* ---- GL ---- *)
            begin
            Key      := $474c;
            CanBegin := true;
            Mids     := 'EA';
            Ends     := 'E';
            end;
          82: (* ---- GN ---- *)
            begin
            Key      := $474e;
            CanBegin := False;
            Mids     := 'I';
            Ends     := '';
            end;
          83: (* ---- GO ---- *)
            begin
            Key      := $474f;
            CanBegin := true;
            Mids     := 'VTO';
            Ends     := 'TO';
            end;
          84: (* ---- GR ---- *)
            begin
            Key      := $4752;
            CanBegin := true;
            Mids     := 'EAO';
            Ends     := 'EA';
            end;
          85: (* ---- GU ---- *)
            begin
            Key      := $4755;
            CanBegin := true;
            Mids     := 'E';
            Ends     := 'E';
            end;
          86: (* ---- HA ---- *)
            begin
            Key      := $4841;
            CanBegin := true;
            Mids     := 'TDVNSRPL';
            Ends     := 'TDNSRL';
            end;
          87: (* ---- HE ---- *)
            begin
            Key      := $4845;
            CanBegin := true;
            Mids     := 'RNYSMIALDT';
            Ends     := 'RNYSMALDT';
            end;
          88: (* ---- HI ---- *)
            begin
            Key      := $4849;
            CanBegin := true;
            Mids     := 'SNCMLPGTRE';
            Ends     := 'SNCMLPGTRE';
            end;
          89: (* ---- HO ---- *)
            begin
            Key      := $484f;
            CanBegin := true;
            Mids     := 'UWSRLOMTPND';
            Ends     := 'UWRLOMTPND';
            end;
          90: (* ---- HR ---- *)
            begin
            Key      := $4852;
            CanBegin := False;
            Mids     := 'OEI';
            Ends     := 'E';
            end;
          91: (* ---- HT ---- *)
            begin
            Key      := $4854;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          92: (* ---- HU ---- *)
            begin
            Key      := $4855;
            CanBegin := true;
            Mids     := 'SRNM';
            Ends     := 'SRNM';
            end;
          93: (* ---- IA ---- *)
            begin
            Key      := $4941;
            CanBegin := False;
            Mids     := 'LNT';
            Ends     := 'LNT';
            end;
          94: (* ---- IB ---- *)
            begin
            Key      := $4942;
            CanBegin := False;
            Mids     := 'LIE';
            Ends     := 'E';
            end;
          95: (* ---- IC ---- *)
            begin
            Key      := $4943;
            CanBegin := False;
            Mids     := 'AHEITKUS';
            Ends     := 'HETKS';
            end;
          96: (* ---- ID ---- *)
            begin
            Key      := $4944;
            CanBegin := true;
            Mids     := 'E';
            Ends     := 'E';
            end;
          97: (* ---- IE ---- *)
            begin
            Key      := $4945;
            CanBegin := False;
            Mids     := 'SNDTWVRLF';
            Ends     := 'SNDTWRL';
            end;
          98: (* ---- IF ---- *)
            begin
            Key      := $4946;
            CanBegin := true;
            Mids     := 'IFET';
            Ends     := 'FET';
            end;
          99: (* ---- IG ---- *)
            begin
            Key      := $4947;
            CanBegin := False;
            Mids     := 'HNI';
            Ends     := 'HN';
            end;
          100: (* ---- IK ---- *)
            begin
            Key      := $494b;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          101: (* ---- IL ---- *)
            begin
            Key      := $494c;
            CanBegin := False;
            Mids     := 'LEIYDA';
            Ends     := 'LEYD';
            end;
          102: (* ---- IM ---- *)
            begin
            Key      := $494d;
            CanBegin := true;
            Mids     := 'EPIASM';
            Ends     := 'ES';
            end;
          103: (* ---- IN ---- *)
            begin
            Key      := $494e;
            CanBegin := true;
            Mids     := 'GTEDSCAIKVUNF';
            Ends     := 'GTEDSAK';
            end;
          104: (* ---- IO ---- *)
            begin
            Key      := $494f;
            CanBegin := False;
            Mids     := 'NUR';
            Ends     := 'NUR';
            end;
          105: (* ---- IR ---- *)
            begin
            Key      := $4952;
            CanBegin := False;
            Mids     := 'ESTLI';
            Ends     := 'EST';
            end;
          106: (* ---- IS ---- *)
            begin
            Key      := $4953;
            CanBegin := true;
            Mids     := 'THSIECM';
            Ends     := 'THSEM';
            end;
          107: (* ---- IT ---- *)
            begin
            Key      := $4954;
            CanBegin := true;
            Mids     := 'HIYESTAU';
            Ends     := 'HYESA';
            end;
          108: (* ---- IV ---- *)
            begin
            Key      := $4956;
            CanBegin := False;
            Mids     := 'EIA';
            Ends     := 'E';
            end;
          109: (* ---- IZ ---- *)
            begin
            Key      := $495a;
            CanBegin := False;
            Mids     := 'EA';
            Ends     := 'E';
            end;
          110: (* ---- JE ---- *)
            begin
            Key      := $4a45;
            CanBegin := true;
            Mids     := 'C';
            Ends     := '';
            end;
          111: (* ---- JO ---- *)
            begin
            Key      := $4a4f;
            CanBegin := true;
            Mids     := 'H';
            Ends     := '';
            end;
          112: (* ---- JU ---- *)
            begin
            Key      := $4a55;
            CanBegin := true;
            Mids     := 'S';
            Ends     := 'S';
            end;
          113: (* ---- KE ---- *)
            begin
            Key      := $4b45;
            CanBegin := true;
            Mids     := 'DNTSRE';
            Ends     := 'DNTSRE';
            end;
          114: (* ---- KI ---- *)
            begin
            Key      := $4b49;
            CanBegin := true;
            Mids     := 'N';
            Ends     := 'N';
            end;
          115: (* ---- KN ---- *)
            begin
            Key      := $4b4e;
            CanBegin := true;
            Mids     := 'OE';
            Ends     := 'OE';
            end;
          116: (* ---- LA ---- *)
            begin
            Key      := $4c41;
            CanBegin := true;
            Mids     := 'TNRSCYWIB';
            Ends     := 'TNRSYW';
            end;
          117: (* ---- LD ---- *)
            begin
            Key      := $4c44;
            CanBegin := False;
            Mids     := 'IE';
            Ends     := 'E';
            end;
          118: (* ---- LE ---- *)
            begin
            Key      := $4c45;
            CanBegin := true;
            Mids     := 'SDATCRNMGVF';
            Ends     := 'SDATRNM';
            end;
          119: (* ---- LI ---- *)
            begin
            Key      := $4c49;
            CanBegin := true;
            Mids     := 'NTSCKGEFVOMA';
            Ends     := 'NTSCGEFMZA';
            end;
          120: (* ---- LL ---- *)
            begin
            Key      := $4c4c;
            CanBegin := False;
            Mids     := 'YEOISA';
            Ends     := 'YES';
            end;
          121: (* ---- LM ---- *)
            begin
            Key      := $4c4d;
            CanBegin := False;
            Mids     := 'O';
            Ends     := '';
            end;
          122: (* ---- LO ---- *)
            begin
            Key      := $4c4f;
            CanBegin := true;
            Mids     := 'WNOSCVUTRPG';
            Ends     := 'WNOUTRP';
            end;
          123: (* ---- LS ---- *)
            begin
            Key      := $4c53;
            CanBegin := False;
            Mids     := 'O';
            Ends     := 'O';
            end;
          124: (* ---- LT ---- *)
            begin
            Key      := $4c54;
            CanBegin := False;
            Mids     := 'HE';
            Ends     := 'HE';
            end;
          125: (* ---- LU ---- *)
            begin
            Key      := $4c55;
            CanBegin := true;
            Mids     := 'TSMED';
            Ends     := 'TSME';
            end;
          126: (* ---- LV ---- *)
            begin
            Key      := $4c56;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          127: (* ---- MA ---- *)
            begin
            Key      := $4d41;
            CanBegin := true;
            Mids     := 'NTLKDSIG';
            Ends     := 'NTLDS';
            end;
          128: (* ---- MB ---- *)
            begin
            Key      := $4d42;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          129: (* ---- ME ---- *)
            begin
            Key      := $4d45;
            CanBegin := true;
            Mids     := 'NRDTSMA';
            Ends     := 'NRDTSMA';
            end;
          130: (* ---- MI ---- *)
            begin
            Key      := $4d49;
            CanBegin := true;
            Mids     := 'NLSTCG';
            Ends     := 'NLSTCG';
            end;
          131: (* ---- MM ---- *)
            begin
            Key      := $4d4d;
            CanBegin := False;
            Mids     := 'EUI';
            Ends     := 'E';
            end;
          132: (* ---- MO ---- *)
            begin
            Key      := $4d4f;
            CanBegin := true;
            Mids     := 'RSVTUD';
            Ends     := 'RTUD';
            end;
          133: (* ---- MP ---- *)
            begin
            Key      := $4d50;
            CanBegin := False;
            Mids     := 'LOATRE';
            Ends     := 'TE';
            end;
          134: (* ---- MR ---- *)
            begin
            Key      := $4d52;
            CanBegin := true;
            Mids     := 'S';
            Ends     := 'S';
            end;
          135: (* ---- MS ---- *)
            begin
            Key      := $4d53;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          136: (* ---- MU ---- *)
            begin
            Key      := $4d55;
            CanBegin := true;
            Mids     := 'SNLC';
            Ends     := 'SNL';
            end;
          137: (* ---- NA ---- *)
            begin
            Key      := $4e41;
            CanBegin := true;
            Mids     := 'LTRNM';
            Ends     := 'LTRNM';
            end;
          138: (* ---- NC ---- *)
            begin
            Key      := $4e43;
            CanBegin := False;
            Mids     := 'EIHTROL';
            Ends     := 'EHT';
            end;
          139: (* ---- ND ---- *)
            begin
            Key      := $4e44;
            CanBegin := False;
            Mids     := 'EISAUO';
            Ends     := 'ESO';
            end;
          140: (* ---- NE ---- *)
            begin
            Key      := $4e45;
            CanBegin := true;
            Mids     := 'DSWREYVTLCA';
            Ends     := 'DSWREYTLA';
            end;
          141: (* ---- NF ---- *)
            begin
            Key      := $4e46;
            CanBegin := False;
            Mids     := 'O';
            Ends     := '';
            end;
          142: (* ---- NG ---- *)
            begin
            Key      := $4e47;
            CanBegin := False;
            Mids     := 'ESLTRI';
            Ends     := 'ES';
            end;
          143: (* ---- NI ---- *)
            begin
            Key      := $4e49;
            CanBegin := true;
            Mids     := 'NTSCZOGF';
            Ends     := 'NTSCGF';
            end;
          144: (* ---- NL ---- *)
            begin
            Key      := $4e4c;
            CanBegin := False;
            Mids     := 'Y';
            Ends     := 'Y';
            end;
          145: (* ---- NM ---- *)
            begin
            Key      := $4e4d;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          146: (* ---- NN ---- *)
            begin
            Key      := $4e4e;
            CanBegin := False;
            Mids     := 'EOI';
            Ends     := 'EO';
            end;
          147: (* ---- NO ---- *)
            begin
            Key      := $4e4f;
            CanBegin := true;
            Mids     := 'TWRUNM';
            Ends     := 'TWRUNM';
            end;
          148: (* ---- NS ---- *)
            begin
            Key      := $4e53;
            CanBegin := False;
            Mids     := 'TIE';
            Ends     := 'TE';
            end;
          149: (* ---- NT ---- *)
            begin
            Key      := $4e54;
            CanBegin := False;
            Mids     := 'EISROALYUH';
            Ends     := 'ESOAYH';
            end;
          150: (* ---- NU ---- *)
            begin
            Key      := $4e55;
            CanBegin := true;
            Mids     := 'M';
            Ends     := 'M';
            end;
          151: (* ---- NV ---- *)
            begin
            Key      := $4e56;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          152: (* ---- OA ---- *)
            begin
            Key      := $4f41;
            CanBegin := False;
            Mids     := 'TRD';
            Ends     := 'TRD';
            end;
          153: (* ---- OB ---- *)
            begin
            Key      := $4f42;
            CanBegin := true;
            Mids     := 'L';
            Ends     := '';
            end;
          154: (* ---- OC ---- *)
            begin
            Key      := $4f43;
            CanBegin := true;
            Mids     := 'KIECA';
            Ends     := 'KE';
            end;
          155: (* ---- OD ---- *)
            begin
            Key      := $4f44;
            CanBegin := False;
            Mids     := 'EYU';
            Ends     := 'EY';
            end;
          156: (* ---- OE ---- *)
            begin
            Key      := $4f45;
            CanBegin := False;
            Mids     := 'S';
            Ends     := 'S';
            end;
          157: (* ---- OF ---- *)
            begin
            Key      := $4f46;
            CanBegin := true;
            Mids     := 'FT';
            Ends     := 'FT';
            end;
          158: (* ---- OG ---- *)
            begin
            Key      := $4f47;
            CanBegin := False;
            Mids     := 'RI';
            Ends     := '';
            end;
          159: (* ---- OH ---- *)
            begin
            Key      := $4f48;
            CanBegin := False;
            Mids     := 'N';
            Ends     := '';
            end;
          160: (* ---- OI ---- *)
            begin
            Key      := $4f49;
            CanBegin := False;
            Mids     := 'N';
            Ends     := 'N';
            end;
          161: (* ---- OK ---- *)
            begin
            Key      := $4f4b;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          162: (* ---- OL ---- *)
            begin
            Key      := $4f4c;
            CanBegin := true;
            Mids     := 'DLIOEU';
            Ends     := 'DLE';
            end;
          163: (* ---- OM ---- *)
            begin
            Key      := $4f4d;
            CanBegin := true;
            Mids     := 'EPMIA';
            Ends     := 'E';
            end;
          164: (* ---- ON ---- *)
            begin
            Key      := $4f4e;
            CanBegin := False;
            Mids     := 'SETGADLCVOIF';
            Ends     := 'SETGADO';
            end;
          165: (* ---- OO ---- *)
            begin
            Key      := $4f4f;
            CanBegin := False;
            Mids     := 'KDLTRNM';
            Ends     := 'KDLTRNM';
            end;
          166: (* ---- OP ---- *)
            begin
            Key      := $4f50;
            CanBegin := true;
            Mids     := 'EPL';
            Ends     := 'E';
            end;
          167: (* ---- OR ---- *)
            begin
            Key      := $4f52;
            CanBegin := true;
            Mids     := 'ETMDSKIYLGARNC';
            Ends     := 'ETMDSKYAN';
            end;
          168: (* ---- OS ---- *)
            begin
            Key      := $4f53;
            CanBegin := False;
            Mids     := 'TESI';
            Ends     := 'TES';
            end;
          169: (* ---- OT ---- *)
            begin
            Key      := $4f54;
            CanBegin := true;
            Mids     := 'HETI';
            Ends     := 'HE';
            end;
          170: (* ---- OU ---- *)
            begin
            Key      := $4f55;
            CanBegin := true;
            Mids     := 'TLRNSGPB';
            Ends     := 'TLRNSP';
            end;
          171: (* ---- OV ---- *)
            begin
            Key      := $4f56;
            CanBegin := true;
            Mids     := 'EI';
            Ends     := 'E';
            end;
          172: (* ---- OW ---- *)
            begin
            Key      := $4f57;
            CanBegin := true;
            Mids     := 'NESIA';
            Ends     := 'NES';
            end;
          173: (* ---- PA ---- *)
            begin
            Key      := $5041;
            CanBegin := true;
            Mids     := 'RTSNLIC';
            Ends     := 'RTSNL';
            end;
          174: (* ---- PE ---- *)
            begin
            Key      := $5045;
            CanBegin := true;
            Mids     := 'RNCADTO';
            Ends     := 'RNADT';
            end;
          175: (* ---- PH ---- *)
            begin
            Key      := $5048;
            CanBegin := true;
            Mids     := 'YOIE';
            Ends     := 'YOE';
            end;
          176: (* ---- PI ---- *)
            begin
            Key      := $5049;
            CanBegin := true;
            Mids     := 'NTREC';
            Ends     := 'NTREC';
            end;
          177: (* ---- PL ---- *)
            begin
            Key      := $504c;
            CanBegin := true;
            Mids     := 'AEIYO';
            Ends     := 'EY';
            end;
          178: (* ---- PM ---- *)
            begin
            Key      := $504d;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          179: (* ---- PO ---- *)
            begin
            Key      := $504f;
            CanBegin := true;
            Mids     := 'SRNLWTI';
            Ends     := 'RNLWT';
            end;
          180: (* ---- PP ---- *)
            begin
            Key      := $5050;
            CanBegin := False;
            Mids     := 'EORL';
            Ends     := 'E';
            end;
          181: (* ---- PR ---- *)
            begin
            Key      := $5052;
            CanBegin := true;
            Mids     := 'OEIA';
            Ends     := 'EA';
            end;
          182: (* ---- PT ---- *)
            begin
            Key      := $5054;
            CanBegin := False;
            Mids     := 'I';
            Ends     := '';
            end;
          183: (* ---- PU ---- *)
            begin
            Key      := $5055;
            CanBegin := true;
            Mids     := 'TRLB';
            Ends     := 'TRL';
            end;
          184: (* ---- QU ---- *)
            begin
            Key      := $5155;
            CanBegin := true;
            Mids     := 'IEA';
            Ends     := 'E';
            end;
          185: (* ---- RA ---- *)
            begin
            Key      := $5241;
            CanBegin := true;
            Mids     := 'TNLCIMDSRPGB';
            Ends     := 'TNLMDSR';
            end;
          186: (* ---- RC ---- *)
            begin
            Key      := $5243;
            CanBegin := False;
            Mids     := 'HE';
            Ends     := 'HE';
            end;
          187: (* ---- RD ---- *)
            begin
            Key      := $5244;
            CanBegin := False;
            Mids     := 'SEI';
            Ends     := 'SE';
            end;
          188: (* ---- RE ---- *)
            begin
            Key      := $5245;
            CanBegin := true;
            Mids     := 'SADNECLTPMVGFQ';
            Ends     := 'SADNELTPM';
            end;
          189: (* ---- RG ---- *)
            begin
            Key      := $5247;
            CanBegin := False;
            Mids     := 'EA';
            Ends     := 'E';
            end;
          190: (* ---- RI ---- *)
            begin
            Key      := $5249;
            CanBegin := true;
            Mids     := 'NECTSGAVOPMLDB';
            Ends     := 'NECTSGAPMLD';
            end;
          191: (* ---- RK ---- *)
            begin
            Key      := $524b;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          192: (* ---- RL ---- *)
            begin
            Key      := $524c;
            CanBegin := False;
            Mids     := 'YD';
            Ends     := 'YD';
            end;
          193: (* ---- RM ---- *)
            begin
            Key      := $524d;
            CanBegin := False;
            Mids     := 'ASIE';
            Ends     := 'SE';
            end;
          194: (* ---- RN ---- *)
            begin
            Key      := $524e;
            CanBegin := False;
            Mids     := 'IEMA';
            Ends     := 'EA';
            end;
          195: (* ---- RO ---- *)
            begin
            Key      := $524f;
            CanBegin := true;
            Mids     := 'MUVPNWSOLDCBATG';
            Ends     := 'MUPNWOLDT';
            end;
          196: (* ---- RP ---- *)
            begin
            Key      := $5250;
            CanBegin := False;
            Mids     := 'O';
            Ends     := '';
            end;
          197: (* ---- RR ---- *)
            begin
            Key      := $5252;
            CanBegin := False;
            Mids     := 'IEYO';
            Ends     := 'EY';
            end;
          198: (* ---- RS ---- *)
            begin
            Key      := $5253;
            CanBegin := False;
            Mids     := 'TEOI';
            Ends     := 'TEO';
            end;
          199: (* ---- RT ---- *)
            begin
            Key      := $5254;
            CanBegin := False;
            Mids     := 'IHAEYUS';
            Ends     := 'HAEYS';
            end;
          200: (* ---- RU ---- *)
            begin
            Key      := $5255;
            CanBegin := true;
            Mids     := 'SNC';
            Ends     := 'SN';
            end;
          201: (* ---- RV ---- *)
            begin
            Key      := $5256;
            CanBegin := False;
            Mids     := 'EI';
            Ends     := 'E';
            end;
          202: (* ---- SA ---- *)
            begin
            Key      := $5341;
            CanBegin := true;
            Mids     := 'IMYNL';
            Ends     := 'MYNL';
            end;
          203: (* ---- SC ---- *)
            begin
            Key      := $5343;
            CanBegin := true;
            Mids     := 'HROIA';
            Ends     := 'H';
            end;
          204: (* ---- SE ---- *)
            begin
            Key      := $5345;
            CanBegin := true;
            Mids     := 'DNLSRECTVA';
            Ends     := 'DNLSRETA';
            end;
          205: (* ---- SH ---- *)
            begin
            Key      := $5348;
            CanBegin := true;
            Mids     := 'EOIA';
            Ends     := 'EO';
            end;
          206: (* ---- SI ---- *)
            begin
            Key      := $5349;
            CanBegin := true;
            Mids     := 'ONDTSGCBVMA';
            Ends     := 'NDTSGCMA';
            end;
          207: (* ---- SK ---- *)
            begin
            Key      := $534b;
            CanBegin := true;
            Mids     := 'IE';
            Ends     := 'E';
            end;
          208: (* ---- SL ---- *)
            begin
            Key      := $534c;
            CanBegin := true;
            Mids     := 'YA';
            Ends     := 'Y';
            end;
          209: (* ---- SM ---- *)
            begin
            Key      := $534d;
            CanBegin := true;
            Mids     := 'A';
            Ends     := '';
            end;
          210: (* ---- SO ---- *)
            begin
            Key      := $534f;
            CanBegin := true;
            Mids     := 'NMULCR';
            Ends     := 'NMULR';
            end;
          211: (* ---- SP ---- *)
            begin
            Key      := $5350;
            CanBegin := true;
            Mids     := 'EOIA';
            Ends     := 'E';
            end;
          212: (* ---- SS ---- *)
            begin
            Key      := $5353;
            CanBegin := False;
            Mids     := 'IEUOA';
            Ends     := 'EO';
            end;
          213: (* ---- ST ---- *)
            begin
            Key      := $5354;
            CanBegin := true;
            Mids     := 'ARIEOUS';
            Ends     := 'AEOS';
            end;
          214: (* ---- SU ---- *)
            begin
            Key      := $5355;
            CanBegin := true;
            Mids     := 'RCPBMLA';
            Ends     := 'RPML';
            end;
          215: (* ---- SW ---- *)
            begin
            Key      := $5357;
            CanBegin := true;
            Mids     := 'E';
            Ends     := 'E';
            end;
          216: (* ---- SY ---- *)
            begin
            Key      := $5359;
            CanBegin := true;
            Mids     := 'S';
            Ends     := 'S';
            end;
          217: (* ---- TA ---- *)
            begin
            Key      := $5441;
            CanBegin := true;
            Mids     := 'TNLIRKBGC';
            Ends     := 'TNLR';
            end;
          218: (* ---- TC ---- *)
            begin
            Key      := $5443;
            CanBegin := False;
            Mids     := 'H';
            Ends     := 'H';
            end;
          219: (* ---- TE ---- *)
            begin
            Key      := $5445;
            CanBegin := true;
            Mids     := 'RDNSMLECA';
            Ends     := 'RDNSMLEA';
            end;
          220: (* ---- TH ---- *)
            begin
            Key      := $5448;
            CanBegin := true;
            Mids     := 'EAIOR';
            Ends     := 'EO';
            end;
          221: (* ---- TI ---- *)
            begin
            Key      := $5449;
            CanBegin := true;
            Mids     := 'ONCVMLETSARF';
            Ends     := 'NCMLETSARF';
            end;
          222: (* ---- TL ---- *)
            begin
            Key      := $544c;
            CanBegin := False;
            Mids     := 'YE';
            Ends     := 'YE';
            end;
          223: (* ---- TM ---- *)
            begin
            Key      := $544d;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          224: (* ---- TO ---- *)
            begin
            Key      := $544f;
            CanBegin := true;
            Mids     := 'RONWPML';
            Ends     := 'RONWPML';
            end;
          225: (* ---- TR ---- *)
            begin
            Key      := $5452;
            CanBegin := true;
            Mids     := 'AIOEUY';
            Ends     := 'AEY';
            end;
          226: (* ---- TT ---- *)
            begin
            Key      := $5454;
            CanBegin := False;
            Mids     := 'ELI';
            Ends     := 'E';
            end;
          227: (* ---- TU ---- *)
            begin
            Key      := $5455;
            CanBegin := true;
            Mids     := 'RDAT';
            Ends     := 'RT';
            end;
          228: (* ---- TW ---- *)
            begin
            Key      := $5457;
            CanBegin := true;
            Mids     := 'OE';
            Ends     := 'OE';
            end;
          229: (* ---- TY ---- *)
            begin
            Key      := $5459;
            CanBegin := true;
            Mids     := 'P';
            Ends     := '';
            end;
          230: (* ---- UA ---- *)
            begin
            Key      := $5541;
            CanBegin := False;
            Mids     := 'LTR';
            Ends     := 'LTR';
            end;
          231: (* ---- UB ---- *)
            begin
            Key      := $5542;
            CanBegin := False;
            Mids     := 'L';
            Ends     := '';
            end;
          232: (* ---- UC ---- *)
            begin
            Key      := $5543;
            CanBegin := False;
            Mids     := 'HTKE';
            Ends     := 'HTKE';
            end;
          233: (* ---- UD ---- *)
            begin
            Key      := $5544;
            CanBegin := False;
            Mids     := 'EI';
            Ends     := 'E';
            end;
          234: (* ---- UE ---- *)
            begin
            Key      := $5545;
            CanBegin := False;
            Mids     := 'SN';
            Ends     := 'SN';
            end;
          235: (* ---- UF ---- *)
            begin
            Key      := $5546;
            CanBegin := False;
            Mids     := 'F';
            Ends     := 'F';
            end;
          236: (* ---- UG ---- *)
            begin
            Key      := $5547;
            CanBegin := False;
            Mids     := 'HG';
            Ends     := 'H';
            end;
          237: (* ---- UI ---- *)
            begin
            Key      := $5549;
            CanBegin := False;
            Mids     := 'TRL';
            Ends     := 'TRL';
            end;
          238: (* ---- UL ---- *)
            begin
            Key      := $554c;
            CanBegin := False;
            Mids     := 'DTAL';
            Ends     := 'DTL';
            end;
          239: (* ---- UM ---- *)
            begin
            Key      := $554d;
            CanBegin := False;
            Mids     := 'BE';
            Ends     := 'E';
            end;
          240: (* ---- UN ---- *)
            begin
            Key      := $554e;
            CanBegin := true;
            Mids     := 'DTICG';
            Ends     := 'DTG';
            end;
          241: (* ---- UP ---- *)
            begin
            Key      := $5550;
            CanBegin := true;
            Mids     := 'PO';
            Ends     := '';
            end;
          242: (* ---- UR ---- *)
            begin
            Key      := $5552;
            CanBegin := False;
            Mids     := 'ENTSIAYRPC';
            Ends     := 'ENTSAY';
            end;
          243: (* ---- US ---- *)
            begin
            Key      := $5553;
            CanBegin := true;
            Mids     := 'ETISLH';
            Ends     := 'ETSH';
            end;
          244: (* ---- UT ---- *)
            begin
            Key      := $5554;
            CanBegin := False;
            Mids     := 'IHE';
            Ends     := 'HE';
            end;
          245: (* ---- VA ---- *)
            begin
            Key      := $5641;
            CanBegin := true;
            Mids     := 'LTRN';
            Ends     := 'LTRN';
            end;
          246: (* ---- VE ---- *)
            begin
            Key      := $5645;
            CanBegin := true;
            Mids     := 'RNLSD';
            Ends     := 'RNLSD';
            end;
          247: (* ---- VI ---- *)
            begin
            Key      := $5649;
            CanBegin := true;
            Mids     := 'NDSCTOLE';
            Ends     := 'NDSCTLE';
            end;
          248: (* ---- VO ---- *)
            begin
            Key      := $564f;
            CanBegin := true;
            Mids     := 'L';
            Ends     := 'L';
            end;
          249: (* ---- WA ---- *)
            begin
            Key      := $5741;
            CanBegin := true;
            Mids     := 'SYRTNL';
            Ends     := 'SYRTNL';
            end;
          250: (* ---- WE ---- *)
            begin
            Key      := $5745;
            CanBegin := true;
            Mids     := 'RLEVSNA';
            Ends     := 'RLESNA';
            end;
          251: (* ---- WH ---- *)
            begin
            Key      := $5748;
            CanBegin := true;
            Mids     := 'IEOA';
            Ends     := 'EO';
            end;
          252: (* ---- WI ---- *)
            begin
            Key      := $5749;
            CanBegin := true;
            Mids     := 'TLNS';
            Ends     := 'TLNS';
            end;
          253: (* ---- WO ---- *)
            begin
            Key      := $574f;
            CanBegin := true;
            Mids     := 'RU';
            Ends     := 'RU';
            end;
          254: (* ---- WR ---- *)
            begin
            Key      := $5752;
            CanBegin := true;
            Mids     := 'I';
            Ends     := '';
            end;
          255: (* ---- XA ---- *)
            begin
            Key      := $5841;
            CanBegin := False;
            Mids     := 'M';
            Ends     := 'M';
            end;
          256: (* ---- XC ---- *)
            begin
            Key      := $5843;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          257: (* ---- XP ---- *)
            begin
            Key      := $5850;
            CanBegin := False;
            Mids     := 'E';
            Ends     := 'E';
            end;
          258: (* ---- YE ---- *)
            begin
            Key      := $5945;
            CanBegin := true;
            Mids     := 'ASD';
            Ends     := 'ASD';
            end;
          259: (* ---- YI ---- *)
            begin
            Key      := $5949;
            CanBegin := False;
            Mids     := 'N';
            Ends     := 'N';
            end;
          260: (* ---- YO ---- *)
            begin
            Key      := $594f;
            CanBegin := true;
            Mids     := 'U';
            Ends     := 'U';
            end;
          261: (* ---- YS ---- *)
            begin
            Key      := $5953;
            CanBegin := False;
            Mids     := 'T';
            Ends     := 'T';
            end;
          262: (* ---- YT ---- *)
            begin
            Key      := $5954;
            CanBegin := False;
            Mids     := 'H';
            Ends     := 'H';
            end;
          263: (* ---- ZA ---- *)
            begin
            Key      := $5a41;
            CanBegin := False;
            Mids     := 'T';
            Ends     := 'T';
            end;
          264: (* ---- ZE ---- *)
            begin
            Key      := $5a45;
            CanBegin := False;
            Mids     := 'D';
            Ends     := 'D';
            end;
          (* ----------------Missing----------------- *)
          265: (* ---- BY ---- *)
            begin
            Key      := $4259;
            CanBegin := True;
            Mids     := 'S';
            Ends     := 'N';
            end;
          266: (* ---- JA ---- *)
            begin
            Key      := $4a41;
            CanBegin := True;
            Mids     := 'LMS';
            Ends     := 'DM';
            end;
          267: (* ---- MY ---- *)
            begin
            Key      := $4d59;
            CanBegin := True;
            Mids     := 'LS';
            Ends     := 'N';
            end;
          end;
    end;

var
  bit, bot: TGrammarBits;
  StreamOut, StreamIn: TMemoryStream;
  c:        char;
  i:        integer;

begin
  StreamOut := TMemoryStream.Create;
  for i := 1 to 267 do
    begin
    bit := GetData(i);
    StreamOut.WriteBuffer(bit, SizeOf(TGrammarBits));
    end;
  StreamOut.SaveToFile('x.dat');
  FreeAndNil(StreamOut);

  (* ---------------------- TEST --------------------------------- *)
  StreamIn := TMemoryStream.Create;
  StreamIn.LoadFromFile('x.dat');
  StreamIn.Read(bot, SizeOf(TGrammarBits));
  WriteLn('key: ' + Chr(hi(bot.Key)) + Chr(lo(bot.Key)));
  WriteLn('CanBegin: ', bot.CanBegin);
  WriteLn('Mids length,value: ', Length(bot.Mids), ', ', bot.Mids);
  WriteLn('Ends length,value: ', Length(bot.Ends), ', ', bot.Ends);
  FreeAndNil(StreamIn);

  Read(c);
end.
