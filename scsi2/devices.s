------+---------------------+-------------+----+---------+------+-----------------------+-------------------------------------------------------------------
 Line | # File         Line | Line Type   | MX |  Reloc  | Size | Address   Object Code |  Source Code                                                      
------+---------------------+-------------+----+---------+------+-----------------------+-------------------------------------------------------------------
    1 |  1 devices.s      1 | Comment     | 11 |         |    0 | 00/0000               | *
    2 |  1 devices.s      2 | Comment     | 11 |         |    0 | 00/0000               | * Devices
    3 |  1 devices.s      3 | Comment     | 11 |         |    0 | 00/0000               | * Show all connected devices
    4 |  1 devices.s      4 | Comment     | 11 |         |    0 | 00/0000               | *
    5 |  1 devices.s      5 | Comment     | 11 |         |    0 | 00/0000               | * (c) 2023, Brutal Deluxe Software
    6 |  1 devices.s      6 | Comment     | 11 |         |    0 | 00/0000               | * Visit brutaldeluxe.fr
    7 |  1 devices.s      7 | Comment     | 11 |         |    0 | 00/0000               | *
    8 |  1 devices.s      8 | Empty       | 11 |         |    0 | 00/0000               |                                          
    9 |  1 devices.s      9 | Directive   | 11 |         |    0 | 00/0000               |                 xc                       
   10 |  1 devices.s     10 | Directive   | 11 |         |    0 | 00/0000               |                 xc                       
   11 |  1 devices.s     11 | Directive   | 00 |         |    0 | 00/0000               |                 mx        %00            
   12 |  1 devices.s     12 | Empty       | 00 |         |    0 | 00/0000               |                                          
   13 |  1 devices.s     13 | Directive   | 00 |         |    0 | 00/0000               |                 rel                      
   14 |  1 devices.s     14 | Directive   | 00 |         |    0 | 00/0000               |                 dsk       devices.l      
   15 |  1 devices.s     15 | Directive   | 00 |         |    0 | 00/0000               |                 lst       off            
   16 |  1 devices.s     16 | Empty       | 00 |         |    0 | 00/0000               |                                          
   17 |  1 devices.s     17 | Comment     | 00 |         |    0 | 00/0000               | *----------
   18 |  1 devices.s     18 | Empty       | 00 |         |    0 | 00/0000               |                                          
   19 |  1 devices.s     19 | Directive   | 00 |         |    0 | 00/0000               |                 use       4/Int.Macs     
   20 |  1 devices.s     20 | Directive   | 00 |         |    0 | 00/0000               |                 use       4/Locator.Macs 
   21 |  1 devices.s     21 | Directive   | 00 |         |    0 | 00/0000               |                 use       4/Mem.Macs     
   22 |  1 devices.s     22 | Directive   | 00 |         |    0 | 00/0000               |                 use       4/Misc.Macs    
   23 |  1 devices.s     23 | Directive   | 00 |         |    0 | 00/0000               |                 use       4/Text.Macs    
   24 |  1 devices.s     24 | Directive   | 00 |         |    0 | 00/0000               |                 use       4/Util.Macs    
   25 |  1 devices.s     25 | Empty       | 00 |         |    0 | 00/0000               |                                          
   26 |  1 devices.s     26 | Equivalence | 00 |         |    0 | 00/0000               | Debut           =         $00            
   27 |  1 devices.s     27 | Equivalence | 00 |         |    0 | 00/0000               | GSOS            =         $e100a8        
   28 |  1 devices.s     28 | Empty       | 00 |         |    0 | 00/0000               |                                          
   29 |  1 devices.s     29 | Comment     | 00 |         |    0 | 00/0000               | *----------
   30 |  1 devices.s     30 | Empty       | 00 |         |    0 | 00/0000               |                                          
   31 |  1 devices.s     31 | Equivalence | 00 |         |    0 | 00/0000               | dcREMOVE        =         $0004          
   32 |  1 devices.s     32 | Equivalence | 00 |         |    0 | 00/0000               | dcONLINE        =         $0010          
   33 |  1 devices.s     33 | Equivalence | 00 |         |    0 | 00/0000               | dcBLOCKDEVICE   =         $0080          
   34 |  1 devices.s     34 | Empty       | 00 |         |    0 | 00/0000               |                                          
   35 |  1 devices.s     35 | Equivalence | 00 |         |    0 | 00/0000               | maxDEVICES      =         128            
   36 |  1 devices.s     36 | Empty       | 00 |         |    0 | 00/0000               |                                          
   37 |  1 devices.s     37 | Equivalence | 00 |         |    0 | 00/0000               | dcINQUIRY       =         $8012          
   38 |  1 devices.s     38 | Equivalence | 00 |         |    0 | 00/0000               | doMODESELECT    =         $8015          
   39 |  1 devices.s     39 | Equivalence | 00 |         |    0 | 00/0000               | dcMODESENSE6    =         $801a          
   40 |  1 devices.s     40 | Equivalence | 00 |         |    0 | 00/0000               | dcSTARTSTOP     =         $801b          ; also eject/insert
   41 |  1 devices.s     41 | Equivalence | 00 |         |    0 | 00/0000               | dcREADCAPACITY  =         $8025          
   42 |  1 devices.s     42 | Equivalence | 00 |         |    0 | 00/0000               | dcSUBCHANNEL    =         $8042          
   43 |  1 devices.s     43 | Equivalence | 00 |         |    0 | 00/0000               | dcREADTOC       =         $8043          
   44 |  1 devices.s     44 | Equivalence | 00 |         |    0 | 00/0000               | dcPATI          =         $8048          
   45 |  1 devices.s     45 | Equivalence | 00 |         |    0 | 00/0000               | dcPAUSERESUME   =         $804b          
   46 |  1 devices.s     46 | Equivalence | 00 |         |    0 | 00/0000               | dcMODESENSE10   =         $805a          
   47 |  1 devices.s     47 | Empty       | 00 |         |    0 | 00/0000               |                                          
   48 |  1 devices.s     48 | Comment     | 00 |         |    0 | 00/0000               | *----------
   49 |  1 devices.s     49 | Empty       | 00 |         |    0 | 00/0000               |                                          
   50 |  1 devices.s     50 | Code        | 00 |         |    1 | 00/0000 : 4B          |                 phk                      
   51 |  1 devices.s     51 | Code        | 00 |         |    1 | 00/0001 : AB          |                 plb                      
   52 |  1 devices.s     52 | Empty       | 00 |         |    0 | 00/0002               |                                          
   53 |  1 devices.s     53 | Code        | 00 |         |    1 | 00/0002 : 7B          |                 tdc                      
   54 |  1 devices.s     54 | Code        | 00 |  2      |    3 | 00/0003 : 8D 7D 02    |                 sta       myDP           
   55 |  1 devices.s     55 | Empty       | 00 |         |    0 | 00/0006               |                                          
   56 |  1 devices.s     56 | Macro       | 00 |         |    0 | 00/0006               |                 _TLStartUp                 
   58 |  1 devices.s     56 | Code        | 00 |         |    3 | 00/0006 : A2 01 02    |                 LDX       #$201          ; load tool call #
   59 |  1 devices.s     56 | Code        | 00 |         |    4 | 00/0009 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
   60 |  1 devices.s     57 | Code        | 00 |         |    1 | 00/000D : 48          |                 pha                      
   61 |  1 devices.s     58 | Macro       | 00 |         |    0 | 00/000E               |                 _MMStartUp                 
   63 |  1 devices.s     58 | Code        | 00 |         |    3 | 00/000E : A2 02 02    |                 LDX       #$202          ; load tool call #
   64 |  1 devices.s     58 | Code        | 00 |         |    4 | 00/0011 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
   65 |  1 devices.s     59 | Code        | 00 |         |    1 | 00/0015 : 68          |                 pla                      
   66 |  1 devices.s     60 | Code        | 00 |  2      |    3 | 00/0016 : 8D 79 02    |                 sta       appID          
   67 |  1 devices.s     61 | Code        | 00 |         |    3 | 00/0019 : 09 00 01    |                 ora       #$0100         
   68 |  1 devices.s     62 | Code        | 00 |  2      |    3 | 00/001C : 8D 7B 02    |                 sta       myID           
   69 |  1 devices.s     63 | Empty       | 00 |         |    0 | 00/001F               |                                          
   70 |  1 devices.s     64 | Macro       | 00 |         |    0 | 00/001F               |                 _MTStartUp                 
   72 |  1 devices.s     64 | Code        | 00 |         |    3 | 00/001F : A2 03 02    |                 LDX       #$203          ; load tool call #
   73 |  1 devices.s     64 | Code        | 00 |         |    4 | 00/0022 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
   74 |  1 devices.s     65 | Macro       | 00 |         |    0 | 00/0026               |                 _TextStartUp                 
   76 |  1 devices.s     65 | Code        | 00 |         |    3 | 00/0026 : A2 0C 02    |                 LDX       #$20C          ; load tool call #
   77 |  1 devices.s     65 | Code        | 00 |         |    4 | 00/0029 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
   78 |  1 devices.s     66 | Empty       | 00 |         |    0 | 00/002D               |                                          
   79 |  1 devices.s     67 | Macro       | 00 |         |    0 | 00/002D               |                 _IMStartUp                 
   81 |  1 devices.s     67 | Code        | 00 |         |    3 | 00/002D : A2 0B 02    |                 LDX       #$20B          ; load tool call #
   82 |  1 devices.s     67 | Code        | 00 |         |    4 | 00/0030 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
   83 |  1 devices.s     68 | Empty       | 00 |         |    0 | 00/0034               |                                          
   84 |  1 devices.s     69 | Code        | 00 |         |    1 | 00/0034 : 48          |                 pha                      
   85 |  1 devices.s     70 | Code        | 00 |         |    1 | 00/0035 : 48          |                 pha                      
   86 |  1 devices.s     71 | Macro       | 00 |         |    0 | 00/0036               |                 PushLong  #$010000       
   90 |  1 devices.s     71 | Code        | 00 |         |    3 | 00/0036 : F4 01 00    |                 PEA       #^#$010000     
   97 |  1 devices.s     71 | Code        | 00 |         |    3 | 00/0039 : F4 00 00    |                 PEA       #$010000       
  100 |  1 devices.s     72 | Macro       | 00 |         |    0 | 00/003C               |                 PushWord  myID           
  105 |  1 devices.s     72 | Code        | 00 |  2      |    3 | 00/003C : AD 7B 02    |                 LDA       myID           
  106 |  1 devices.s     72 | Code        | 00 |         |    1 | 00/003F : 48          |                 PHA                      
  108 |  1 devices.s     73 | Macro       | 00 |         |    0 | 00/0040               |                 PushWord  #%11000000_00011100
  110 |  1 devices.s     73 | Code        | 00 |         |    3 | 00/0040 : F4 1C C0    |                 PEA       #%11000000_00011100
  113 |  1 devices.s     74 | Macro       | 00 |         |    0 | 00/0043               |                 PushLong  #0             
  117 |  1 devices.s     74 | Code        | 00 |         |    3 | 00/0043 : F4 00 00    |                 PEA       #^#0           
  124 |  1 devices.s     74 | Code        | 00 |         |    3 | 00/0046 : F4 00 00    |                 PEA       #0             
  127 |  1 devices.s     75 | Macro       | 00 |         |    0 | 00/0049               |                 _NewHandle                 
  129 |  1 devices.s     75 | Code        | 00 |         |    3 | 00/0049 : A2 02 09    |                 LDX       #$902          ; load tool call #
  130 |  1 devices.s     75 | Code        | 00 |         |    4 | 00/004C : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  131 |  1 devices.s     76 | Code        | 00 |         |    1 | 00/0050 : 0B          |                 phd                      
  132 |  1 devices.s     77 | Code        | 00 |         |    1 | 00/0051 : 3B          |                 tsc                      
  133 |  1 devices.s     78 | Code        | 00 |         |    1 | 00/0052 : 5B          |                 tcd                      
  134 |  1 devices.s     79 | Code        | 00 |         |    2 | 00/0053 : A7 03       |                 lda       [3]            
  135 |  1 devices.s     80 | Code        | 00 |  2      |    3 | 00/0055 : 8D 7F 02    |                 sta       ptrBUFFER      
  136 |  1 devices.s     81 | Code        | 00 |         |    3 | 00/0058 : A0 02 00    |                 ldy       #2             
  137 |  1 devices.s     82 | Code        | 00 |         |    2 | 00/005B : B7 03       |                 lda       [3],y          
  138 |  1 devices.s     83 | Code        | 00 |  2      |    3 | 00/005D : 8D 81 02    |                 sta       ptrBUFFER+2    
  139 |  1 devices.s     84 | Code        | 00 |         |    1 | 00/0060 : 2B          |                 pld                      
  140 |  1 devices.s     85 | Code        | 00 |         |    1 | 00/0061 : 7A          |                 ply                      
  141 |  1 devices.s     86 | Code        | 00 |  2      |    3 | 00/0062 : 8C 83 02    |                 sty       haBUFFER       
  142 |  1 devices.s     87 | Code        | 00 |         |    1 | 00/0065 : FA          |                 plx                      
  143 |  1 devices.s     88 | Code        | 00 |  2      |    3 | 00/0066 : 8E 85 02    |                 stx       haBUFFER+2     
  144 |  1 devices.s     89 | Empty       | 00 |         |    0 | 00/0069               |                                          
  145 |  1 devices.s     90 | Comment     | 00 |         |    0 | 00/0069               | *----------
  146 |  1 devices.s     91 | Empty       | 00 |         |    0 | 00/0069               |                                          
  147 |  1 devices.s     92 | Macro       | 00 |         |    0 | 00/0069               |                 PushWord  #$00FF         
  149 |  1 devices.s     92 | Code        | 00 |         |    3 | 00/0069 : F4 FF 00    |                 PEA       #$00FF         
  152 |  1 devices.s     93 | Macro       | 00 |         |    0 | 00/006C               |                 PushWord  #$0080         
  154 |  1 devices.s     93 | Code        | 00 |         |    3 | 00/006C : F4 80 00    |                 PEA       #$0080         
  157 |  1 devices.s     94 | Macro       | 00 |         |    0 | 00/006F               |                 _SetInGlobals                 
  159 |  1 devices.s     94 | Code        | 00 |         |    3 | 00/006F : A2 0C 09    |                 LDX       #$90C          ; load tool call #
  160 |  1 devices.s     94 | Code        | 00 |         |    4 | 00/0072 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  161 |  1 devices.s     95 | Macro       | 00 |         |    0 | 00/0076               |                 PushWord  #$00FF         
  163 |  1 devices.s     95 | Code        | 00 |         |    3 | 00/0076 : F4 FF 00    |                 PEA       #$00FF         
  166 |  1 devices.s     96 | Macro       | 00 |         |    0 | 00/0079               |                 PushWord  #$0080         
  168 |  1 devices.s     96 | Code        | 00 |         |    3 | 00/0079 : F4 80 00    |                 PEA       #$0080         
  171 |  1 devices.s     97 | Macro       | 00 |         |    0 | 00/007C               |                 _SetOutGlobals                 
  173 |  1 devices.s     97 | Code        | 00 |         |    3 | 00/007C : A2 0C 0A    |                 LDX       #$A0C          ; load tool call #
  174 |  1 devices.s     97 | Code        | 00 |         |    4 | 00/007F : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  175 |  1 devices.s     98 | Macro       | 00 |         |    0 | 00/0083               |                 PushWord  #$00FF         
  177 |  1 devices.s     98 | Code        | 00 |         |    3 | 00/0083 : F4 FF 00    |                 PEA       #$00FF         
  180 |  1 devices.s     99 | Macro       | 00 |         |    0 | 00/0086               |                 PushWord  #$0080         
  182 |  1 devices.s     99 | Code        | 00 |         |    3 | 00/0086 : F4 80 00    |                 PEA       #$0080         
  185 |  1 devices.s    100 | Macro       | 00 |         |    0 | 00/0089               |                 _SetErrGlobals                 
  187 |  1 devices.s    100 | Code        | 00 |         |    3 | 00/0089 : A2 0C 0B    |                 LDX       #$B0C          ; load tool call #
  188 |  1 devices.s    100 | Code        | 00 |         |    4 | 00/008C : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  189 |  1 devices.s    101 | Empty       | 00 |         |    0 | 00/0090               |                                          
  190 |  1 devices.s    102 | Macro       | 00 |         |    0 | 00/0090               |                 PushWord  #0             
  192 |  1 devices.s    102 | Code        | 00 |         |    3 | 00/0090 : F4 00 00    |                 PEA       #0             
  195 |  1 devices.s    103 | Macro       | 00 |         |    0 | 00/0093               |                 PushLong  #3             
  199 |  1 devices.s    103 | Code        | 00 |         |    3 | 00/0093 : F4 00 00    |                 PEA       #^#3           
  206 |  1 devices.s    103 | Code        | 00 |         |    3 | 00/0096 : F4 03 00    |                 PEA       #3             
  209 |  1 devices.s    104 | Macro       | 00 |         |    0 | 00/0099               |                 _SetInputDevice                 
  211 |  1 devices.s    104 | Code        | 00 |         |    3 | 00/0099 : A2 0C 0F    |                 LDX       #$F0C          ; load tool call #
  212 |  1 devices.s    104 | Code        | 00 |         |    4 | 00/009C : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  213 |  1 devices.s    105 | Macro       | 00 |         |    0 | 00/00A0               |                 PushWord  #0             
  215 |  1 devices.s    105 | Code        | 00 |         |    3 | 00/00A0 : F4 00 00    |                 PEA       #0             
  218 |  1 devices.s    106 | Macro       | 00 |         |    0 | 00/00A3               |                 PushLong  #3             
  222 |  1 devices.s    106 | Code        | 00 |         |    3 | 00/00A3 : F4 00 00    |                 PEA       #^#3           
  229 |  1 devices.s    106 | Code        | 00 |         |    3 | 00/00A6 : F4 03 00    |                 PEA       #3             
  232 |  1 devices.s    107 | Macro       | 00 |         |    0 | 00/00A9               |                 _SetOutputDevice                 
  234 |  1 devices.s    107 | Code        | 00 |         |    3 | 00/00A9 : A2 0C 10    |                 LDX       #$100C         ; load tool call #
  235 |  1 devices.s    107 | Code        | 00 |         |    4 | 00/00AC : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  236 |  1 devices.s    108 | Macro       | 00 |         |    0 | 00/00B0               |                 PushWord  #0             
  238 |  1 devices.s    108 | Code        | 00 |         |    3 | 00/00B0 : F4 00 00    |                 PEA       #0             
  241 |  1 devices.s    109 | Macro       | 00 |         |    0 | 00/00B3               |                 PushLong  #3             
  245 |  1 devices.s    109 | Code        | 00 |         |    3 | 00/00B3 : F4 00 00    |                 PEA       #^#3           
  252 |  1 devices.s    109 | Code        | 00 |         |    3 | 00/00B6 : F4 03 00    |                 PEA       #3             
  255 |  1 devices.s    110 | Macro       | 00 |         |    0 | 00/00B9               |                 _SetErrorDevice                 
  257 |  1 devices.s    110 | Code        | 00 |         |    3 | 00/00B9 : A2 0C 11    |                 LDX       #$110C         ; load tool call #
  258 |  1 devices.s    110 | Code        | 00 |         |    4 | 00/00BC : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  259 |  1 devices.s    111 | Empty       | 00 |         |    0 | 00/00C0               |                                          
  260 |  1 devices.s    112 | Macro       | 00 |         |    0 | 00/00C0               |                 PushWord  #0             
  262 |  1 devices.s    112 | Code        | 00 |         |    3 | 00/00C0 : F4 00 00    |                 PEA       #0             
  265 |  1 devices.s    113 | Macro       | 00 |         |    0 | 00/00C3               |                 _InitTextDev                 
  267 |  1 devices.s    113 | Code        | 00 |         |    3 | 00/00C3 : A2 0C 15    |                 LDX       #$150C         ; load tool call #
  268 |  1 devices.s    113 | Code        | 00 |         |    4 | 00/00C6 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  269 |  1 devices.s    114 | Macro       | 00 |         |    0 | 00/00CA               |                 PushWord  #1             
  271 |  1 devices.s    114 | Code        | 00 |         |    3 | 00/00CA : F4 01 00    |                 PEA       #1             
  274 |  1 devices.s    115 | Macro       | 00 |         |    0 | 00/00CD               |                 _InitTextDev                 
  276 |  1 devices.s    115 | Code        | 00 |         |    3 | 00/00CD : A2 0C 15    |                 LDX       #$150C         ; load tool call #
  277 |  1 devices.s    115 | Code        | 00 |         |    4 | 00/00D0 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  278 |  1 devices.s    116 | Macro       | 00 |         |    0 | 00/00D4               |                 PushWord  #2             
  280 |  1 devices.s    116 | Code        | 00 |         |    3 | 00/00D4 : F4 02 00    |                 PEA       #2             
  283 |  1 devices.s    117 | Macro       | 00 |         |    0 | 00/00D7               |                 _InitTextDev                 
  285 |  1 devices.s    117 | Code        | 00 |         |    3 | 00/00D7 : A2 0C 15    |                 LDX       #$150C         ; load tool call #
  286 |  1 devices.s    117 | Code        | 00 |         |    4 | 00/00DA : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  287 |  1 devices.s    118 | Empty       | 00 |         |    0 | 00/00DE               |                                          
  288 |  1 devices.s    119 | Macro       | 00 |         |    0 | 00/00DE               |                 PushWord  #$0c           ; home
  290 |  1 devices.s    119 | Code        | 00 |         |    3 | 00/00DE : F4 0C 00    |                 PEA       #$0c           
  293 |  1 devices.s    120 | Macro       | 00 |         |    0 | 00/00E1               |                 _WriteChar                 
  295 |  1 devices.s    120 | Code        | 00 |         |    3 | 00/00E1 : A2 0C 18    |                 LDX       #$180C         ; load tool call #
  296 |  1 devices.s    120 | Code        | 00 |         |    4 | 00/00E4 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  297 |  1 devices.s    121 | Empty       | 00 |         |    0 | 00/00E8               |                                          
  298 |  1 devices.s    122 | Comment     | 00 |         |    0 | 00/00E8               | *----------------------------
  299 |  1 devices.s    123 | Comment     | 00 |         |    0 | 00/00E8               | * MAIN MENU
  300 |  1 devices.s    124 | Comment     | 00 |         |    0 | 00/00E8               | *----------------------------
  301 |  1 devices.s    125 | Empty       | 00 |         |    0 | 00/00E8               |                                          
  302 |  1 devices.s    126 | Empty       | 00 |         |    0 | 00/00E8               | mainMENU                                 
  303 |  1 devices.s    127 | Empty       | 00 |         |    0 | 00/00E8               |                                          
  304 |  1 devices.s    128 | Macro       | 00 |         |    0 | 00/00E8               |                 PushLong  #strMAINMENU   
  308 |  1 devices.s    128 | Code        | 00 |  1 >>16 |    3 | 00/00E8 : F4 00 00    |                 PEA       #^#strMAINMENU 
  315 |  1 devices.s    128 | Code        | 00 |  2      |    3 | 00/00EB : F4 FE 00    |                 PEA       #strMAINMENU   
  318 |  1 devices.s    129 | Macro       | 00 |         |    0 | 00/00EE               |                 _WriteCString                 
  320 |  1 devices.s    129 | Code        | 00 |         |    3 | 00/00EE : A2 0C 20    |                 LDX       #$200C         ; load tool call #
  321 |  1 devices.s    129 | Code        | 00 |         |    4 | 00/00F1 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  322 |  1 devices.s    130 | Empty       | 00 |         |    0 | 00/00F5               |                                          
  323 |  1 devices.s    131 | Code        | 00 |  2      |    3 | 00/00F5 : 20 6C 01    |                 jsr       pollDEVICES    ; show CD-ROM devices
  324 |  1 devices.s    132 | Code        | 00 |  2      |    3 | 00/00F8 : 20 02 02    |                 jsr       waitFORKEY     ; is it 0-9
  325 |  1 devices.s    133 | Code        | 00 |  2      |    3 | 00/00FB : 4C 2E 01    |                 jmp       doQUIT         
  326 |  1 devices.s    134 | Empty       | 00 |         |    0 | 00/00FE               |                                          
  327 |  1 devices.s    135 | Comment     | 00 |         |    0 | 00/00FE               | *--- Data
  328 |  1 devices.s    136 | Empty       | 00 |         |    0 | 00/00FE               |                                          
  329 |  1 devices.s    137 | Data        | 00 |         |   14 | 00/00FE : 0D 53 68 6F | strMAINMENU     asc       0d'Show devices'0d
      |                     |             |    |         |      |           77 20 64 65 |
      |                     |             |    |         |      |           76 69 63 65 |
      |                     |             |    |         |      |           73 0D       |
  330 |  1 devices.s    138 | Data        | 00 |         |   34 | 00/010C : 28 63 29 20 |                 asc       '(c) 2023, Brutal Deluxe Software'0d00
      |                     |             |    |         |      |           32 30 32 33 |
      |                     |             |    |         |      |           2C 20 42 72 |
      |                     |             |    |         |      |           75 74 61 6C |
      |                     |             |    |         |      |           20 44 65 6C |
      |                     |             |    |         |      |           75 78 65 20 |
      |                     |             |    |         |      |           53 6F 66 74 |
      |                     |             |    |         |      |           77 61 72 65 |
      |                     |             |    |         |      |           0D 00       |
  331 |  1 devices.s    139 | Empty       | 00 |         |    0 | 00/012E               |                                          
  332 |  1 devices.s    140 | Comment     | 00 |         |    0 | 00/012E               | *----------------------------
  333 |  1 devices.s    141 | Comment     | 00 |         |    0 | 00/012E               | * QUIT PROGRAM
  334 |  1 devices.s    142 | Comment     | 00 |         |    0 | 00/012E               | *----------------------------
  335 |  1 devices.s    143 | Empty       | 00 |         |    0 | 00/012E               |                                          
  336 |  1 devices.s    144 | Macro       | 00 |         |    0 | 00/012E               | doQUIT          _IMShutDown                 
  338 |  1 devices.s    144 | Code        | 00 |         |    3 | 00/012E : A2 0B 03    |                 LDX       #$30B          ; load tool call #
  339 |  1 devices.s    144 | Code        | 00 |         |    4 | 00/0131 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  340 |  1 devices.s    145 | Macro       | 00 |         |    0 | 00/0135               |                 _TextShutDown                 
  342 |  1 devices.s    145 | Code        | 00 |         |    3 | 00/0135 : A2 0C 03    |                 LDX       #$30C          ; load tool call #
  343 |  1 devices.s    145 | Code        | 00 |         |    4 | 00/0138 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  344 |  1 devices.s    146 | Macro       | 00 |         |    0 | 00/013C               |                 _MTShutDown                 
  346 |  1 devices.s    146 | Code        | 00 |         |    3 | 00/013C : A2 03 03    |                 LDX       #$303          ; load tool call #
  347 |  1 devices.s    146 | Code        | 00 |         |    4 | 00/013F : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  348 |  1 devices.s    147 | Empty       | 00 |         |    0 | 00/0143               |                                          
  349 |  1 devices.s    148 | Macro       | 00 |         |    0 | 00/0143               |                 PushWord  myID           
  354 |  1 devices.s    148 | Code        | 00 |  2      |    3 | 00/0143 : AD 7B 02    |                 LDA       myID           
  355 |  1 devices.s    148 | Code        | 00 |         |    1 | 00/0146 : 48          |                 PHA                      
  357 |  1 devices.s    149 | Macro       | 00 |         |    0 | 00/0147               |                 _DisposeAll                 
  359 |  1 devices.s    149 | Code        | 00 |         |    3 | 00/0147 : A2 02 11    |                 LDX       #$1102         ; load tool call #
  360 |  1 devices.s    149 | Code        | 00 |         |    4 | 00/014A : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  361 |  1 devices.s    150 | Empty       | 00 |         |    0 | 00/014E               |                                          
  362 |  1 devices.s    151 | Macro       | 00 |         |    0 | 00/014E               |                 PushWord  appID          
  367 |  1 devices.s    151 | Code        | 00 |  2      |    3 | 00/014E : AD 79 02    |                 LDA       appID          
  368 |  1 devices.s    151 | Code        | 00 |         |    1 | 00/0151 : 48          |                 PHA                      
  370 |  1 devices.s    152 | Macro       | 00 |         |    0 | 00/0152               |                 _MMShutDown                 
  372 |  1 devices.s    152 | Code        | 00 |         |    3 | 00/0152 : A2 02 03    |                 LDX       #$302          ; load tool call #
  373 |  1 devices.s    152 | Code        | 00 |         |    4 | 00/0155 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  374 |  1 devices.s    153 | Empty       | 00 |         |    0 | 00/0159               |                                          
  375 |  1 devices.s    154 | Macro       | 00 |         |    0 | 00/0159               |                 _TLShutDown                 
  377 |  1 devices.s    154 | Code        | 00 |         |    3 | 00/0159 : A2 01 03    |                 LDX       #$301          ; load tool call #
  378 |  1 devices.s    154 | Code        | 00 |         |    4 | 00/015C : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  379 |  1 devices.s    155 | Empty       | 00 |         |    0 | 00/0160               |                                          
  380 |  1 devices.s    156 | Code        | 00 |         |    4 | 00/0160 : 22 A8 00 E1 |                 jsl       {$e100a8}      
  381 |  1 devices.s    157 | Data        | 00 |         |    2 | 00/0164 : 29 20       |                 dw        $2029          
  382 |  1 devices.s    158 | Data        | 00 |  3      |    4 | 00/0166 : 27 02 00 00 |                 adrl      proQUIT        
  383 |  1 devices.s    159 | Empty       | 00 |         |    0 | 00/016A               |                                          
  384 |  1 devices.s    160 | Code        | 00 |         |    2 | 00/016A : 00 BD       |                 brk       $bd            
  385 |  1 devices.s    161 | Empty       | 00 |         |    0 | 00/016C               |                                          
  386 |  1 devices.s    162 | Comment     | 00 |         |    0 | 00/016C               | *----------------------------
  387 |  1 devices.s    163 | Comment     | 00 |         |    0 | 00/016C               | * POLL DEVICES
  388 |  1 devices.s    164 | Comment     | 00 |         |    0 | 00/016C               | *----------------------------
  389 |  1 devices.s    165 | Empty       | 00 |         |    0 | 00/016C               |                                          
  390 |  1 devices.s    166 | Code        | 00 |         |    3 | 00/016C : A9 01 00    | pollDEVICES     lda       #1             ; start with device 1
  391 |  1 devices.s    167 | Code        | 00 |  2      |    3 | 00/016F : 8D 31 02    |                 sta       proDINFO+2     
  392 |  1 devices.s    168 | Empty       | 00 |         |    0 | 00/0172               |                                          
  393 |  1 devices.s    169 | Code        | 00 |         |    4 | 00/0172 : 22 A8 00 E1 | ozunid_1        jsl       {$e100a8}      ; do a DInfo
  394 |  1 devices.s    170 | Data        | 00 |         |    2 | 00/0176 : 2C 20       |                 dw        $202c          
  395 |  1 devices.s    171 | Data        | 00 |  3      |    4 | 00/0178 : 2F 02 00 00 |                 adrl      proDINFO       
  396 |  1 devices.s    172 | Code        | 00 |         |    2 | 00/017C : 90 0B       |                 bcc       found          
  397 |  1 devices.s    173 | Empty       | 00 |         |    0 | 00/017E               |                                          
  398 |  1 devices.s    174 | Code        | 00 |         |    3 | 00/017E : C9 11 00    |                 cmp       #$0011         ; no more devices
  399 |  1 devices.s    175 | Code        | 00 |         |    2 | 00/0181 : D0 01       |                 bne       loop           
  400 |  1 devices.s    176 | Code        | 00 |         |    1 | 00/0183 : 60          |                 rts                      
  401 |  1 devices.s    177 | Empty       | 00 |         |    0 | 00/0184               |                                          
  402 |  1 devices.s    178 | Code        | 00 |  2      |    3 | 00/0184 : EE 31 02    | loop            inc       proDINFO+2     
  403 |  1 devices.s    179 | Code        | 00 |         |    2 | 00/0187 : 80 E9       |                 bra       ozunid_1       
  404 |  1 devices.s    180 | Empty       | 00 |         |    0 | 00/0189               |                                          
  405 |  1 devices.s    181 | Comment     | 00 |         |    0 | 00/0189               | *---------- Show device
  406 |  1 devices.s    182 | Empty       | 00 |         |    0 | 00/0189               |                                          
  407 |  1 devices.s    183 | Code        | 00 |  2      |    3 | 00/0189 : AD 37 02    | found           lda       proDINFO+8     ; not removable
  408 |  1 devices.s    184 | Code        | 00 |         |    3 | 00/018C : 29 80 00    |                 and       #{$0080}       
  409 |  1 devices.s    185 | Code        | 00 |         |    2 | 00/018F : F0 F3       |                 beq       loop           
  410 |  1 devices.s    186 | Empty       | 00 |         |    0 | 00/0191               |                                          
  411 |  1 devices.s    187 | Code        | 00 |  2      |    3 | 00/0191 : 20 96 01    |                 jsr       showDEVICEINFO 
  412 |  1 devices.s    188 | Code        | 00 |         |    2 | 00/0194 : 80 EE       |                 bra       loop           
  413 |  1 devices.s    189 | Empty       | 00 |         |    0 | 00/0196               |                                          
  414 |  1 devices.s    190 | Comment     | 00 |         |    0 | 00/0196               | *--- Sub routines
  415 |  1 devices.s    191 | Comment     | 00 |         |    0 | 00/0196               | *
  416 |  1 devices.s    192 | Comment     | 00 |         |    0 | 00/0196               | * x - $xxxx - .NAMEOFDEVICE
  417 |  1 devices.s    193 | Empty       | 00 |         |    0 | 00/0196               |                                          
  418 |  1 devices.s    194 | Empty       | 00 |         |    0 | 00/0196               | showDEVICEINFO                           
  419 |  1 devices.s    195 | Code        | 00 |  2      |    3 | 00/0196 : AD 31 02    |                 lda       proDINFO+2     
  420 |  1 devices.s    196 | Code        | 00 |         |    1 | 00/0199 : 48          |                 pha                      ; from a word to a string
  421 |  1 devices.s    197 | Code        | 00 |         |    1 | 00/019A : 48          |                 pha                      
  422 |  1 devices.s    198 | Code        | 00 |         |    1 | 00/019B : 48          |                 pha                      
  423 |  1 devices.s    199 | Macro       | 00 |         |    0 | 00/019C               |                 _HexIt                   
  425 |  1 devices.s    199 | Code        | 00 |         |    3 | 00/019C : A2 0B 2A    |                 LDX       #$2A0B         ; load tool call #
  426 |  1 devices.s    199 | Code        | 00 |         |    4 | 00/019F : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  427 |  1 devices.s    200 | Macro       | 00 |         |    0 | 00/01A3               |                 PullLong  strDEVID       
  430 |  1 devices.s    200 | Code        | 00 |         |    1 | 00/01A3 : 68          |                 PLA                      
  432 |  1 devices.s    200 | Code        | 00 |  2      |    3 | 00/01A4 : 8D FA 01    |                 STA       strDEVID       
  437 |  1 devices.s    200 | Code        | 00 |         |    1 | 00/01A7 : 68          |                 PLA                      
  439 |  1 devices.s    200 | Code        | 00 |  2      |    3 | 00/01A8 : 8D FC 01    |                 STA       strDEVID+2     
  445 |  1 devices.s    201 | Empty       | 00 |         |    0 | 00/01AB               |                                          
  446 |  1 devices.s    202 | Macro       | 00 |         |    0 | 00/01AB               |                 PushLong  #strDEV        ; show the string
  450 |  1 devices.s    202 | Code        | 00 |  1 >>16 |    3 | 00/01AB : F4 00 00    |                 PEA       #^#strDEV      
  457 |  1 devices.s    202 | Code        | 00 |  2      |    3 | 00/01AE : F4 F9 01    |                 PEA       #strDEV        
  460 |  1 devices.s    203 | Macro       | 00 |         |    0 | 00/01B1               |                 _WriteCString                 
  462 |  1 devices.s    203 | Code        | 00 |         |    3 | 00/01B1 : A2 0C 20    |                 LDX       #$200C         ; load tool call #
  463 |  1 devices.s    203 | Code        | 00 |         |    4 | 00/01B4 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  464 |  1 devices.s    204 | Empty       | 00 |         |    0 | 00/01B8               |                                          
  465 |  1 devices.s    205 | Comment     | 00 |         |    0 | 00/01B8               | *--- characteristics
  466 |  1 devices.s    206 | Empty       | 00 |         |    0 | 00/01B8               |                                          
  467 |  1 devices.s    207 | Code        | 00 |  2      |    3 | 00/01B8 : AD 37 02    |                 lda       proDINFO+8     
  468 |  1 devices.s    208 | Code        | 00 |         |    1 | 00/01BB : 48          |                 pha                      ; from a word to a string
  469 |  1 devices.s    209 | Code        | 00 |         |    1 | 00/01BC : 48          |                 pha                      
  470 |  1 devices.s    210 | Code        | 00 |         |    1 | 00/01BD : 48          |                 pha                      
  471 |  1 devices.s    211 | Macro       | 00 |         |    0 | 00/01BE               |                 _HexIt                   
  473 |  1 devices.s    211 | Code        | 00 |         |    3 | 00/01BE : A2 0B 2A    |                 LDX       #$2A0B         ; load tool call #
  474 |  1 devices.s    211 | Code        | 00 |         |    4 | 00/01C1 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  475 |  1 devices.s    212 | Macro       | 00 |         |    0 | 00/01C5               |                 PullLong  strDEVID       
  478 |  1 devices.s    212 | Code        | 00 |         |    1 | 00/01C5 : 68          |                 PLA                      
  480 |  1 devices.s    212 | Code        | 00 |  2      |    3 | 00/01C6 : 8D FA 01    |                 STA       strDEVID       
  485 |  1 devices.s    212 | Code        | 00 |         |    1 | 00/01C9 : 68          |                 PLA                      
  487 |  1 devices.s    212 | Code        | 00 |  2      |    3 | 00/01CA : 8D FC 01    |                 STA       strDEVID+2     
  493 |  1 devices.s    213 | Empty       | 00 |         |    0 | 00/01CD               |                                          
  494 |  1 devices.s    214 | Macro       | 00 |         |    0 | 00/01CD               |                 PushLong  #strDEV        ; show the string
  498 |  1 devices.s    214 | Code        | 00 |  1 >>16 |    3 | 00/01CD : F4 00 00    |                 PEA       #^#strDEV      
  505 |  1 devices.s    214 | Code        | 00 |  2      |    3 | 00/01D0 : F4 F9 01    |                 PEA       #strDEV        
  508 |  1 devices.s    215 | Macro       | 00 |         |    0 | 00/01D3               |                 _WriteCString                 
  510 |  1 devices.s    215 | Code        | 00 |         |    3 | 00/01D3 : A2 0C 20    |                 LDX       #$200C         ; load tool call #
  511 |  1 devices.s    215 | Code        | 00 |         |    4 | 00/01D6 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  512 |  1 devices.s    216 | Empty       | 00 |         |    0 | 00/01DA               |                                          
  513 |  1 devices.s    217 | Comment     | 00 |         |    0 | 00/01DA               | *--- name
  514 |  1 devices.s    218 | Empty       | 00 |         |    0 | 00/01DA               |                                          
  515 |  1 devices.s    219 | Code        | 00 |  2      |    3 | 00/01DA : AD 47 02    |                 lda       devINFO1       ; from a STRL to a STR
  516 |  1 devices.s    220 | Code        | 00 |         |    1 | 00/01DD : EB          |                 xba                      
  517 |  1 devices.s    221 | Code        | 00 |  2      |    3 | 00/01DE : 8D 47 02    |                 sta       devINFO1       
  518 |  1 devices.s    222 | Empty       | 00 |         |    0 | 00/01E1               |                                          
  519 |  1 devices.s    223 | Macro       | 00 |         |    0 | 00/01E1               |                 PushLong  #devINFO2      
  523 |  1 devices.s    223 | Code        | 00 |  1 >>16 |    3 | 00/01E1 : F4 00 00    |                 PEA       #^#devINFO2    
  530 |  1 devices.s    223 | Code        | 00 |  2      |    3 | 00/01E4 : F4 48 02    |                 PEA       #devINFO2      
  533 |  1 devices.s    224 | Macro       | 00 |         |    0 | 00/01E7               |                 _WriteString                 
  535 |  1 devices.s    224 | Code        | 00 |         |    3 | 00/01E7 : A2 0C 1C    |                 LDX       #$1C0C         ; load tool call #
  536 |  1 devices.s    224 | Code        | 00 |         |    4 | 00/01EA : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  537 |  1 devices.s    225 | Empty       | 00 |         |    0 | 00/01EE               |                                          
  538 |  1 devices.s    226 | Macro       | 00 |         |    0 | 00/01EE               |                 PushWord  #$0d           
  540 |  1 devices.s    226 | Code        | 00 |         |    3 | 00/01EE : F4 0D 00    |                 PEA       #$0d           
  543 |  1 devices.s    227 | Macro       | 00 |         |    0 | 00/01F1               |                 _WriteChar                 
  545 |  1 devices.s    227 | Code        | 00 |         |    3 | 00/01F1 : A2 0C 18    |                 LDX       #$180C         ; load tool call #
  546 |  1 devices.s    227 | Code        | 00 |         |    4 | 00/01F4 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  547 |  1 devices.s    228 | Code        | 00 |         |    1 | 00/01F8 : 60          |                 rts                      
  548 |  1 devices.s    229 | Empty       | 00 |         |    0 | 00/01F9               |                                          
  549 |  1 devices.s    230 | Comment     | 00 |         |    0 | 00/01F9               | *---------- Data
  550 |  1 devices.s    231 | Empty       | 00 |         |    0 | 00/01F9               |                                          
  551 |  1 devices.s    232 | Data        | 00 |         |    1 | 00/01F9 : 24          | strDEV          asc       '$'            
  552 |  1 devices.s    233 | Data        | 00 |         |    8 | 00/01FA : 30 30 30 30 | strDEVID        asc       '0000 - '00    
      |                     |             |    |         |      |           20 2D 20 00 |
  553 |  1 devices.s    234 | Empty       | 00 |         |    0 | 00/0202               |                                          
  554 |  1 devices.s    235 | Comment     | 00 |         |    0 | 00/0202               | *----------------------------
  555 |  1 devices.s    236 | Comment     | 00 |         |    0 | 00/0202               | * TEXT ROUTINES
  556 |  1 devices.s    237 | Comment     | 00 |         |    0 | 00/0202               | *----------------------------
  557 |  1 devices.s    238 | Empty       | 00 |         |    0 | 00/0202               |                                          
  558 |  1 devices.s    239 | Comment     | 00 |         |    0 | 00/0202               | *---------- Wait for a key
  559 |  1 devices.s    240 | Empty       | 00 |         |    0 | 00/0202               |                                          
  560 |  1 devices.s    241 | Macro       | 00 |         |    0 | 00/0202               | waitFORKEY      PushWord  #0             ; wait for key
  562 |  1 devices.s    241 | Code        | 00 |         |    3 | 00/0202 : F4 00 00    |                 PEA       #0             
  565 |  1 devices.s    242 | Macro       | 00 |         |    0 | 00/0205               |                 PushWord  #1             ; echo char
  567 |  1 devices.s    242 | Code        | 00 |         |    3 | 00/0205 : F4 01 00    |                 PEA       #1             
  570 |  1 devices.s    243 | Macro       | 00 |         |    0 | 00/0208               |                 _ReadChar                 
  572 |  1 devices.s    243 | Code        | 00 |         |    3 | 00/0208 : A2 0C 22    |                 LDX       #$220C         ; load tool call #
  573 |  1 devices.s    243 | Code        | 00 |         |    4 | 00/020B : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  574 |  1 devices.s    244 | Empty       | 00 |         |    0 | 00/020F               |                                          
  575 |  1 devices.s    245 | Code        | 00 |         |    2 | 00/020F : A3 01       | waitKEY1        lda       1,s            ; check CR
  576 |  1 devices.s    246 | Code        | 00 |         |    3 | 00/0211 : 29 FF 00    |                 and       #$ff           ; of typed
  577 |  1 devices.s    247 | Code        | 00 |         |    2 | 00/0214 : 83 01       |                 sta       1,s            ; in char
  578 |  1 devices.s    248 | Code        | 00 |         |    3 | 00/0216 : C9 8D 00    |                 cmp       #$8d           
  579 |  1 devices.s    249 | Code        | 00 |         |    2 | 00/0219 : F0 0A       |                 beq       waitKEY9       
  580 |  1 devices.s    250 | Empty       | 00 |         |    0 | 00/021B               |                                          
  581 |  1 devices.s    251 | Macro       | 00 |         |    0 | 00/021B               | waitKEY8        PushWord  #$0d           ; return
  583 |  1 devices.s    251 | Code        | 00 |         |    3 | 00/021B : F4 0D 00    |                 PEA       #$0d           
  586 |  1 devices.s    252 | Macro       | 00 |         |    0 | 00/021E               |                 _WriteChar                 
  588 |  1 devices.s    252 | Code        | 00 |         |    3 | 00/021E : A2 0C 18    |                 LDX       #$180C         ; load tool call #
  589 |  1 devices.s    252 | Code        | 00 |         |    4 | 00/0221 : 22 00 00 E1 |                 JSL       $E10000        ; go to dispatcher
  590 |  1 devices.s    253 | Empty       | 00 |         |    0 | 00/0225               |                                          
  591 |  1 devices.s    254 | Code        | 00 |         |    1 | 00/0225 : 68          | waitKEY9        pla                      ; restore entered char
  592 |  1 devices.s    255 | Code        | 00 |         |    1 | 00/0226 : 60          |                 rts                      
  593 |  1 devices.s    256 | Empty       | 00 |         |    0 | 00/0227               |                                          
  594 |  1 devices.s    257 | Comment     | 00 |         |    0 | 00/0227               | *----------------------------
  595 |  1 devices.s    258 | Comment     | 00 |         |    0 | 00/0227               | * DATA
  596 |  1 devices.s    259 | Comment     | 00 |         |    0 | 00/0227               | *----------------------------
  597 |  1 devices.s    260 | Empty       | 00 |         |    0 | 00/0227               |                                          
  598 |  1 devices.s    261 | Data        | 00 |         |    2 | 00/0227 : 02 00       | proQUIT         dw        2              ; pcount
  599 |  1 devices.s    262 | Data        | 00 |         |    4 | 00/0229 : 00 00 00 00 |                 ds        4              ; pathname
  600 |  1 devices.s    263 | Data        | 00 |         |    2 | 00/022D : 00 00       |                 ds        2              ; flags
  601 |  1 devices.s    264 | Empty       | 00 |         |    0 | 00/022F               |                                          
  602 |  1 devices.s    265 | Data        | 00 |         |    2 | 00/022F : 08 00       | proDINFO        dw        8              ; Parms for DInfo
  603 |  1 devices.s    266 | Data        | 00 |         |    2 | 00/0231 : 00 00       |                 ds        2              ; 02 device num
  604 |  1 devices.s    267 | Data        | 00 |  3      |    4 | 00/0233 : 45 02 00 00 |                 adrl      devINFO        ; 04 device name
  605 |  1 devices.s    268 | Data        | 00 |         |    2 | 00/0237 : 00 00       |                 ds        2              ; 08 characteristics
  606 |  1 devices.s    269 | Data        | 00 |         |    4 | 00/0239 : 00 00 00 00 |                 ds        4              ; 0A total blocks
  607 |  1 devices.s    270 | Data        | 00 |         |    2 | 00/023D : 00 00       |                 ds        2              ; 0E slot number
  608 |  1 devices.s    271 | Data        | 00 |         |    2 | 00/023F : 00 00       |                 ds        2              ; 10 unit number
  609 |  1 devices.s    272 | Data        | 00 |         |    2 | 00/0241 : 00 00       |                 ds        2              ; 12 version
  610 |  1 devices.s    273 | Data        | 00 |         |    2 | 00/0243 : 00 00       |                 ds        2              ; 14 device id
  611 |  1 devices.s    274 | Empty       | 00 |         |    0 | 00/0245               |                                          
  612 |  1 devices.s    275 | Data        | 00 |         |    2 | 00/0245 : 32 00       | devINFO         dw        $0032          ; buffer size
  613 |  1 devices.s    276 | Data        | 00 |         |    1 | 00/0247 : 00          | devINFO1        db        $00            ; length
  614 |  1 devices.s    277 | Data        | 00 |         |    1 | 00/0248 : 00          | devINFO2        db        $00            
  615 |  1 devices.s    278 | Data        | 00 |         |   48 | 00/0249 : 00 00 00 00 | devINFO3        ds        $30            ; data
      |                     |             |    |         |      |           00 00 00 00 |
      |                     |             |    |         |      |           00 00 00 00 |
      |                     |             |    |         |      |           00 00 00 00 |
      |                     |             |    |         |      |           00 00 00 00 |
      |                     |             |    |         |      |           00 00 00 00 |
      |                     |             |    |         |      |           00 00 00 00 |
      |                     |             |    |         |      |           00 00 00 00 |
      |                     |             |    |         |      |           00 00 00 00 |
      |                     |             |    |         |      |           00 00 00 00 |
      |                     |             |    |         |      |           00 00 00 00 |
      |                     |             |    |         |      |           00 00 00 00 |
  616 |  1 devices.s    279 | Empty       | 00 |         |    0 | 00/0279               |                                          
  617 |  1 devices.s    280 | Comment     | 00 |         |    0 | 00/0279               | *----------
  618 |  1 devices.s    281 | Empty       | 00 |         |    0 | 00/0279               |                                          
  619 |  1 devices.s    282 | Data        | 00 |         |    2 | 00/0279 : 00 00       | appID           ds        2              
  620 |  1 devices.s    283 | Data        | 00 |         |    2 | 00/027B : 00 00       | myID            ds        2              
  621 |  1 devices.s    284 | Empty       | 00 |         |    0 | 00/027D               |                                          
  622 |  1 devices.s    285 | Data        | 00 |         |    2 | 00/027D : 00 00       | myDP            ds        2              
  623 |  1 devices.s    286 | Data        | 00 |         |    4 | 00/027F : 00 00 00 00 | ptrBUFFER       ds        4              
  624 |  1 devices.s    287 | Data        | 00 |         |    4 | 00/0283 : 00 00 00 00 | haBUFFER        ds        4              
  625 |  1 devices.s    288 | Empty       | 00 |         |    0 | 00/0287               |                                          
  626 |  1 devices.s    289 | Empty       | 00 |         |    0 | 00/0287               |                                          
------+---------------------+-------------+----+---------+------+-----------------------+-------------------------------------------------------------------
