/BFI - BRAINFUCK INTERPRETER
*30
BFBUFF,     2000
BFPTR,      0
*200
/INIT
START,      CLA CLL
            KCC
            TLS
            TAD KPROMT
            JMS TYPE
            TAD BFBUFF
            DCA BFPTR
/READ ONE CHAR FROM CONSOLE
READ,       JMS LISN
            DCA I BFPTR
            TAD I BFPTR
            TAD KMRETURN
            SNA
            JMP PARSE
            TAD I BFPTR
            JMS TYPE
            ISZ BFPTR
            JMP READ
/GET CHAR FROM INPUT, VALUE IS LEFT IN AC
LISN,       0
            KSF
            JMP .-1
            KRB
            TLS
            JMP I LISN
/TYPE ONE CHAR TO CONSOLE
TYPE,       0
            TSF
            JMP .-1
            TLS
            CLA CLL
            JMP I TYPE
/TYPE MOVE ONE LINE DOWN
CRLF,       0
            TAD KRETURN
            JMS TYPE
            TAD KLFEED
            JMS TYPE
            JMP I CRLF
*400
/PARSE INPUT
PARSE,      JMS CRLF
            JMS CLEAN
            CLA CLL
            TAD PBUFF
            DCA PPTR
            TAD BFBUFF
            DCA BFPTR

NEXT,       TAD I BFPTR
            TAD KMPLUS /CHECK AGAINST + MASK
            SNA
            JMP ONADD /ADD 1 TO VALUE ON CURRENT POINTER LOCATION

            CLA CLL
            TAD I BFPTR
            TAD KMMINUS /CHECK AGAINST - MASK
            SNA
            JMP ONDEC /DEC 1 TO VALUE ON CURRENT POINTER LOCATION

            CLA CLL
            TAD I BFPTR
            TAD KMLARROW /CHECK AGAINST < MASK
            SNA
            JMP ONLARROW /DEC CURRENT POINTER LOCATION

            CLA CLL
            TAD I BFPTR
            TAD KMRARROW /CHECK AGAINST > MASK
            SNA
            JMP ONRARROW /ADD CURRENT POINTER LOCATION

            CLA CLL
            TAD I BFPTR
            TAD KMOUT /CHECK AGAINST . MASK
            SNA
            JMP ONPRINT /PRINT VALUE AT CURRENT POINTER LOCATION

            CLA CLL
            TAD I BFPTR
            TAD KMIN /CHECK AGAINST , MASK
            SNA
            JMP ONINPUT /GET INPUT TO CURRENT POINTER LOCATION

            CLA CLL
            TAD I BFPTR
            TAD KMRETURN
            SNA
            HLT /HALT PROGRAM 
            /JMP I [7600 /EXIT PROGRAM

PREPN,      CLA CLL
            ISZ BFPTR         
            JMP NEXT

/CLEAN MEMORY FOR BF BUFFER
CLEAN,      0
            CLA CLL
            TAD PBUFF
            DCA PPTR
CLEANNEXT,  CLA CLL
            TAD (0
            DCA I PPTR
            ISZ PPTR
            CLA CLL
            TAD PPTR            
            TAD BSIZE
            SNA
            JMP I CLEAN
            JMP CLEANNEXT

/ADD 1 TO CURRENT POINTER LOCATION
ONADD,      CLA CLL
            TAD I PPTR
            IAC
            DCA I PPTR
            JMP PREPN
/DEC 1 TO CURRENT POINTER LOCATION
ONDEC,      CLA CLL
            TAD (1
            CIA
            TAD I PPTR
            DCA I PPTR            
            JMP PREPN
/DEC 1 TO POINTER
ONLARROW,   CLA CLL
            TAD (1
            CIA
            TAD PPTR
            DCA PPTR
            JMP PREPN
/ADD 1 TO POINTER
ONRARROW,   CLA CLL
            TAD PPTR
            IAC
            DCA PPTR
            JMP PREPN
/PRINT VALUE AT CURRENT POINTER LOCATION
ONPRINT,    CLA CLL
            TAD I PPTR
            JMS TYPE
            JMP PREPN
/GET INPUT AND STORE VALUE AT CURRENT POINTER LOCATION
ONINPUT,    CLA CLL
            JMS LISN
            DCA I PPTR
            JMP PREPN

PBUFF,      4000
PPTR,       0
BSIZE,      3730
KMPLUS,     7525 /0253 +
KMMINUS,    7523 /0255 -
KMLARROW,   7504 /0274 <
KMRARROW,   7502 /0276 >
KMLSQB,     7445 /0333 [
KMRSQB,     7443 /0335 ]
KMOUT,      7522 /0256 .
KMIN,       7524 /0254 ,
KPROMT,     252 /PROMPT *
KRETURN,    215 /RETURN
KLFEED,     212 /LINE FEED
KMRETURN,   7563 /RETURN MASK
$
