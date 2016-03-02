Memory Address 0x30000 - 0x3A500 (3000:0000 - 3000:A500)
Bochs BIOS - build: 08/22/15
$Revision: 12579
Options: apmbios pcibios pnpbios eltorito rombios32

Assumed: memset (BYTE)
00000000  55                push bp
00000001  89E5              mov bp,sp
00000003  50                push ax
00000004  51                push cx
00000005  06                push es
00000006  57                push di
00000007  8B4E0A            mov cx,[bp+0xa]
0000000A  E309              jcxz 0x15
0000000C  C47E06            les di,[bp+0x6]
0000000F  8A4604            mov al,[bp+0x4]
00000012  FC                cld
00000013  F3AA              rep stosb
00000015  5F                pop di
00000016  07                pop es
00000017  59                pop cx
00000018  58                pop ax
00000019  5D                pop bp
0000001A  C3                ret

Assumed: memcpy (BYTE)
0000001B  55                push bp
0000001C  89E5              mov bp,sp
0000001E  51                push cx
0000001F  06                push es
00000020  57                push di
00000021  1E                push ds
00000022  56                push si
00000023  8B4E0C            mov cx,[bp+0xc]
00000026  E309              jcxz 0x31
00000028  C47E04            les di,[bp+0x4]
0000002B  C57608            lds si,[bp+0x8]
0000002E  FC                cld
0000002F  F3A4              rep movsb
00000031  5E                pop si
00000032  1F                pop ds
00000033  5F                pop di
00000034  07                pop es
00000035  59                pop cx
00000036  5D                pop bp
00000037  C3                ret

Assumed: memcpy (DWORD)
00000038  55                push bp
00000039  89E5              mov bp,sp
0000003B  51                push cx
0000003C  06                push es
0000003D  57                push di
0000003E  1E                push ds
0000003F  56                push si
00000040  8B4E0C            mov cx,[bp+0xc]
00000043  E30A              jcxz 0x4f
00000045  C47E04            les di,[bp+0x4]
00000048  C57608            lds si,[bp+0x8]
0000004B  FC                cld
0000004C  F366A5            rep movsd
0000004F  5E                pop si
00000050  1F                pop ds
00000051  5F                pop di
00000052  07                pop es
00000053  59                pop cx
00000054  5D                pop bp
00000055  C3                ret

Assumed: Get Far Pointer ax:dx
00000056  55                push bp
00000057  89E5              mov bp,sp
00000059  53                push bx
0000005A  1E                push ds
0000005B  C55E04            lds bx,[bp+0x4]
0000005E  8B07              mov ax,[bx]
00000060  8B5702            mov dx,[bx+0x2]
00000063  1F                pop ds
00000064  5B                pop bx
00000065  5D                pop bp
00000066  C3                ret

Assumed: Set Far Pointer
00000067  55                push bp
00000068  89E5              mov bp,sp
0000006A  6650              push eax
0000006C  53                push bx
0000006D  1E                push ds
0000006E  C55E08            lds bx,[bp+0x8]
00000071  668B4604          mov eax,[bp+0x4]
00000075  668907            mov [bx],eax
00000078  1F                pop ds
00000079  5B                pop bx
0000007A  6658              pop eax
0000007C  5D                pop bp
0000007D  C3                ret


0000007E  55                push bp
0000007F  89E5              mov bp,sp
00000081  8B6E04            mov bp,[bp+0x4]
00000084  8B4600            mov ax,[bp+0x0]
00000087  8B5602            mov dx,[bp+0x2]
0000008A  5D                pop bp
0000008B  C3                ret
0000008C  362305            and ax,[ss:di]
0000008F  36235D02          and bx,[ss:di+0x2]
00000093  C3                ret
00000094  360305            add ax,[ss:di]
00000097  36135D02          adc bx,[ss:di+0x2]
0000009B  C3                ret
0000009C  6625FFFF0000      and eax,0xffff
000000A2  66C1E310          shl ebx,byte 0x10
000000A6  6609D8            or eax,ebx
000000A9  66C1EB10          shr ebx,byte 0x10
000000AD  36663B05          cmp eax,[ss:di]
000000B1  C3                ret
000000B2  362B05            sub ax,[ss:di]
000000B5  361B5D02          sbb bx,[ss:di+0x2]
000000B9  C3                ret
000000BA  6625FFFF0000      and eax,0xffff
000000C0  66C1E310          shl ebx,byte 0x10
000000C4  6609D8            or eax,ebx
000000C7  3666F725          mul dword [ss:di]
000000CB  6689C3            mov ebx,eax
000000CE  66C1EB10          shr ebx,byte 0x10
000000D2  C3                ret
000000D3  3666FF0F          dec dword [ss:bx]
000000D7  C3                ret
000000D8  360B05            or ax,[ss:di]
000000DB  360B5D02          or bx,[ss:di+0x2]
000000DF  C3                ret
000000E0  3666FF07          inc dword [ss:bx]
000000E4  C3                ret
000000E5  6625FFFF0000      and eax,0xffff
000000EB  66C1E310          shl ebx,byte 0x10
000000EF  6609D8            or eax,ebx
000000F2  66C1EB10          shr ebx,byte 0x10
000000F6  6685C0            test eax,eax
000000F9  C3                ret
000000FA  89F9              mov cx,di
000000FC  E319              jcxz 0x117
000000FE  6625FFFF0000      and eax,0xffff
00000104  66C1E310          shl ebx,byte 0x10
00000108  6609D8            or eax,ebx
0000010B  66D1E8            shr eax,1
0000010E  E2FB              loop 0x10b
00000110  6689C3            mov ebx,eax
00000113  66C1EB10          shr ebx,byte 0x10
00000117  C3                ret
00000118  89F9              mov cx,di
0000011A  E319              jcxz 0x135
0000011C  6625FFFF0000      and eax,0xffff
00000122  66C1E310          shl ebx,byte 0x10
00000126  6609D8            or eax,ebx
00000129  66D1E0            shl eax,1
0000012C  E2FB              loop 0x129
0000012E  6689C3            mov ebx,eax
00000131  66C1EB10          shr ebx,byte 0x10
00000135  C3                ret
00000136  99                cwd
00000137  F7FB              idiv bx
00000139  C3                ret
0000013A  31D2              xor dx,dx
0000013C  F7F3              div bx
0000013E  C3                ret
0000013F  6625FFFF0000      and eax,0xffff
00000145  66C1E310          shl ebx,byte 0x10
00000149  6609D8            or eax,ebx
0000014C  6631D2            xor edx,edx
0000014F  368B5D02          mov bx,[ss:di+0x2]
00000153  66C1E310          shl ebx,byte 0x10
00000157  368B1D            mov bx,[ss:di]
0000015A  66F7F3            div ebx
0000015D  6689C3            mov ebx,eax
00000160  66C1EB10          shr ebx,byte 0x10
00000164  C3                ret
00000165  2452              and al,0x52
00000167  657669            gs jna 0x1d3
0000016A  7369              jnc 0x1d5
0000016C  6F                outsw
0000016D  6E                outsb
0000016E  3A20              cmp ah,[bx+si]
00000170  3132              xor [bp+si],si
00000172  353739            xor ax,0x3937
00000175  2024              and [si],ah
00000177  2024              and [si],ah
00000179  44                inc sp
0000017A  61                popaw
0000017B  7465              jz 0x1e2
0000017D  3A20              cmp ah,[bx+si]
0000017F  3230              xor dh,[bx+si]
00000181  3134              xor [si],si
00000183  2D3132            sub ax,0x3231
00000186  2D3236            sub ax,0x3632
00000189  2031              and [bx+di],dh
0000018B  313A              xor [bp+si],di
0000018D  3331              xor si,[bx+di]
0000018F  3A33              cmp dh,[bp+di]
00000191  3920              cmp [bx+si],sp
00000193  2B30              sub si,[bx+si]
00000195  3130              xor [bx+si],si
00000197  3020              xor [bx+si],ah
00000199  284672            sub [bp+0x72],al
0000019C  2C20              sub al,0x20
0000019E  32362E20          xor dh,[0x202e]
000001A2  44                inc sp
000001A3  657A20            gs jpe 0x1c6
000001A6  3230              xor dh,[bx+si]
000001A8  3134              xor [si],si
000001AA  2920              sub [bx+si],sp
000001AC  2400              and al,0x0
000001AE  0000              add [bx+si],al
000001B0  0000              add [bx+si],al
000001B2  0000              add [bx+si],al
000001B4  0000              add [bx+si],al
000001B6  0000              add [bx+si],al
000001B8  001B              add [bp+di],bl
000001BA  011B              add [bp+di],bx
000001BC  011B              add [bp+di],bx
000001BE  0100              add [bx+si],ax
000001C0  0100              add [bx+si],ax
000001C2  0031              add [bx+di],dh
000001C4  0221              add ah,[bx+di]
000001C6  0200              add al,[bx+si]
000001C8  0000              add [bx+si],al
000001CA  7800              js 0x1cc
000001CC  0032              add [bp+si],dh
000001CE  034003            add ax,[bx+si+0x3]
000001D1  0003              add [bp+di],al
000001D3  007900            add [bx+di+0x0],bh
000001D6  0033              add [bp+di],dh
000001D8  0423              add al,0x23
000001DA  0400              add al,0x0
000001DC  0000              add [bx+si],al
000001DE  7A00              jpe 0x1e0
000001E0  0034              add [si],dh
000001E2  052405            add ax,0x524
000001E5  0000              add [bx+si],al
000001E7  007B00            add [bp+di+0x0],bh
000001EA  0035              add [di],dh
000001EC  06                push es
000001ED  250600            and ax,0x6
000001F0  0000              add [bx+si],al
000001F2  7C00              jl 0x1f4
000001F4  0036075E          add [0x5e07],dh
000001F8  07                pop es
000001F9  1E                push ds
000001FA  07                pop es
000001FB  007D00            add [di+0x0],bh
000001FE  0037              add [bx],dh
00000200  08260800          or [0x8],ah
00000204  0000              add [bx+si],al
00000206  7E00              jng 0x208
00000208  0038              add [bx+si],bh
0000020A  092A              or [bp+si],bp
0000020C  0900              or [bx+si],ax
0000020E  0000              add [bx+si],al
00000210  7F00              jg 0x212
00000212  0039              add [bx+di],bh
00000214  0A28              or ch,[bx+si]
00000216  0A00              or al,[bx+si]
00000218  0000              add [bx+si],al
0000021A  800000            add byte [bx+si],0x0
0000021D  300B              xor [bp+di],cl
0000021F  290B              sub [bp+di],cx
00000221  0000              add [bx+si],al
00000223  00810000          add [bx+di+0x0],al
00000227  2D0C5F            sub ax,0x5f0c
0000022A  0C1F              or al,0x1f
0000022C  0C00              or al,0x0
0000022E  82                db 0x82
0000022F  0000              add [bx+si],al
00000231  3D0D2B            cmp ax,0x2b0d
00000234  0D0000            or ax,0x0
00000237  00830000          add [bp+di+0x0],al
0000023B  080E080E          or [0xe08],cl
0000023F  7F0E              jg 0x24f
00000241  0000              add [bx+si],al
00000243  0000              add [bx+si],al
00000245  090F              or [bx],cx
00000247  000F              add [bx],cl
00000249  0000              add [bx+si],al
0000024B  0000              add [bx+si],al
0000024D  0000              add [bx+si],al
0000024F  7110              jno 0x261
00000251  51                push cx
00000252  1011              adc [bx+di],dl
00000254  1000              adc [bx+si],al
00000256  104000            adc [bx+si+0x0],al
00000259  7711              ja 0x26c
0000025B  57                push di
0000025C  1117              adc [bx],dx
0000025E  1100              adc [bx+si],ax
00000260  114000            adc [bx+si+0x0],ax
00000263  65124512          adc al,[gs:di+0x12]
00000267  051200            add ax,0x12
0000026A  124000            adc al,[bx+si+0x0]
0000026D  7213              jc 0x282
0000026F  52                push dx
00000270  1312              adc dx,[bp+si]
00000272  1300              adc ax,[bx+si]
00000274  134000            adc ax,[bx+si+0x0]
00000277  7414              jz 0x28d
00000279  54                push sp
0000027A  1414              adc al,0x14
0000027C  1400              adc al,0x0
0000027E  1440              adc al,0x40
00000280  007915            add [bx+di+0x15],bh
00000283  59                pop cx
00000284  151915            adc ax,0x1519
00000287  0015              add [di],dl
00000289  40                inc ax
0000028A  007516            add [di+0x16],dh
0000028D  55                push bp
0000028E  16                push ss
0000028F  151600            adc ax,0x16
00000292  16                push ss
00000293  40                inc ax
00000294  006917            add [bx+di+0x17],ch
00000297  49                dec cx
00000298  17                pop ss
00000299  0917              or [bx],dx
0000029B  0017              add [bx],dl
0000029D  40                inc ax
0000029E  006F18            add [bx+0x18],ch
000002A1  4F                dec di
000002A2  180F              sbb [bx],cl
000002A4  1800              sbb [bx+si],al
000002A6  184000            sbb [bx+si+0x0],al
000002A9  7019              jo 0x2c4
000002AB  50                push ax
000002AC  1910              sbb [bx+si],dx
000002AE  1900              sbb [bx+si],ax
000002B0  194000            sbb [bx+si+0x0],ax
000002B3  5B                pop bx
000002B4  1A7B1A            sbb bh,[bp+di+0x1a]
000002B7  1B1A              sbb bx,[bp+si]
000002B9  0000              add [bx+si],al
000002BB  0000              add [bx+si],al
000002BD  5D                pop bp
000002BE  1B7D1B            sbb di,[di+0x1b]
000002C1  1D1B00            sbb ax,0x1b
000002C4  0000              add [bx+si],al
000002C6  000D              add [di],cl
000002C8  1C0D              sbb al,0xd
000002CA  1C0A              sbb al,0xa
000002CC  1C00              sbb al,0x0
000002CE  0000              add [bx+si],al
000002D0  0000              add [bx+si],al
000002D2  0000              add [bx+si],al
000002D4  0000              add [bx+si],al
000002D6  0000              add [bx+si],al
000002D8  0000              add [bx+si],al
000002DA  00611E            add [bx+di+0x1e],ah
000002DD  41                inc cx
000002DE  1E                push ds
000002DF  011E001E          add [0x1e00],bx
000002E3  40                inc ax
000002E4  00731F            add [bp+di+0x1f],dh
000002E7  53                push bx
000002E8  1F                pop ds
000002E9  131F              adc bx,[bx]
000002EB  001F              add [bx],bl
000002ED  40                inc ax
000002EE  006420            add [si+0x20],ah
000002F1  44                inc sp
000002F2  2004              and [si],al
000002F4  2000              and [bx+si],al
000002F6  204000            and [bx+si+0x0],al
000002F9  66214621          and [bp+0x21],eax
000002FD  06                push es
000002FE  2100              and [bx+si],ax
00000300  214000            and [bx+si+0x0],ax
00000303  67224722          and al,[edi+0x22]
00000307  07                pop es
00000308  2200              and al,[bx+si]
0000030A  224000            and al,[bx+si+0x0]
0000030D  682348            push word 0x4823
00000310  2308              and cx,[bx+si]
00000312  2300              and ax,[bx+si]
00000314  234000            and ax,[bx+si+0x0]
00000317  6A24              push byte +0x24
00000319  4A                dec dx
0000031A  240A              and al,0xa
0000031C  2400              and al,0x0
0000031E  2440              and al,0x40
00000320  006B25            add [bp+di+0x25],ch
00000323  4B                dec bx
00000324  250B25            and ax,0x250b
00000327  0025              add [di],ah
00000329  40                inc ax
0000032A  006C26            add [si+0x26],ch
0000032D  4C                dec sp
0000032E  260C26            es or al,0x26
00000331  00264000          add [0x40],ah
00000335  3B27              cmp sp,[bx]
00000337  3A27              cmp ah,[bx]
00000339  0000              add [bx+si],al
0000033B  0000              add [bx+si],al
0000033D  0000              add [bx+si],al
0000033F  27                daa
00000340  2822              sub [bp+si],ah
00000342  2800              sub [bx+si],al
00000344  0000              add [bx+si],al
00000346  0000              add [bx+si],al
00000348  006029            add [bx+si+0x29],ah
0000034B  7E29              jng 0x376
0000034D  0000              add [bx+si],al
0000034F  0000              add [bx+si],al
00000351  0000              add [bx+si],al
00000353  0000              add [bx+si],al
00000355  0000              add [bx+si],al
00000357  0000              add [bx+si],al
00000359  0000              add [bx+si],al
0000035B  0000              add [bx+si],al
0000035D  5C                pop sp
0000035E  2B7C2B            sub di,[si+0x2b]
00000361  1C2B              sbb al,0x2b
00000363  0000              add [bx+si],al
00000365  0000              add [bx+si],al
00000367  7A2C              jpe 0x395
00000369  5A                pop dx
0000036A  2C1A              sub al,0x1a
0000036C  2C00              sub al,0x0
0000036E  2C40              sub al,0x40
00000370  00782D            add [bx+si+0x2d],bh
00000373  58                pop ax
00000374  2D182D            sub ax,0x2d18
00000377  002D              add [di],ch
00000379  40                inc ax
0000037A  00632E            add [bp+di+0x2e],ah
0000037D  43                inc bx
0000037E  2E032E002E        add bp,[cs:0x2e00]
00000383  40                inc ax
00000384  00762F            add [bp+0x2f],dh
00000387  56                push si
00000388  2F                das
00000389  16                push ss
0000038A  2F                das
0000038B  002F              add [bx],ch
0000038D  40                inc ax
0000038E  006230            add [bp+si+0x30],ah
00000391  42                inc dx
00000392  3002              xor [bp+si],al
00000394  3000              xor [bx+si],al
00000396  304000            xor [bx+si+0x0],al
00000399  6E                outsb
0000039A  314E31            xor [bp+0x31],cx
0000039D  0E                push cs
0000039E  3100              xor [bx+si],ax
000003A0  314000            xor [bx+si+0x0],ax
000003A3  6D                insw
000003A4  324D32            xor cl,[di+0x32]
000003A7  0D3200            or ax,0x32
000003AA  324000            xor al,[bx+si+0x0]
000003AD  2C33              sub al,0x33
000003AF  3C33              cmp al,0x33
000003B1  0000              add [bx+si],al
000003B3  0000              add [bx+si],al
000003B5  0000              add [bx+si],al
000003B7  2E343E            cs xor al,0x3e
000003BA  3400              xor al,0x0
000003BC  0000              add [bx+si],al
000003BE  0000              add [bx+si],al
000003C0  002F              add [bx],ch
000003C2  353F35            xor ax,0x353f
000003C5  0000              add [bx+si],al
000003C7  0000              add [bx+si],al
000003C9  0000              add [bx+si],al
000003CB  0000              add [bx+si],al
000003CD  0000              add [bx+si],al
000003CF  0000              add [bx+si],al
000003D1  0000              add [bx+si],al
000003D3  0000              add [bx+si],al
000003D5  2A37              sub dh,[bx]
000003D7  2A37              sub dh,[bx]
000003D9  0000              add [bx+si],al
000003DB  0000              add [bx+si],al
000003DD  0000              add [bx+si],al
000003DF  0000              add [bx+si],al
000003E1  0000              add [bx+si],al
000003E3  0000              add [bx+si],al
000003E5  0000              add [bx+si],al
000003E7  0000              add [bx+si],al
000003E9  2039              and [bx+di],bh
000003EB  2039              and [bx+di],bh
000003ED  2039              and [bx+di],bh
000003EF  2039              and [bx+di],bh
000003F1  0000              add [bx+si],al
000003F3  0000              add [bx+si],al
000003F5  0000              add [bx+si],al
000003F7  0000              add [bx+si],al
000003F9  0000              add [bx+si],al
000003FB  0000              add [bx+si],al
000003FD  003B              add [bp+di],bh
000003FF  005400            add [si+0x0],dl
00000402  5E                pop si
00000403  006800            add [bx+si+0x0],ch
00000406  0000              add [bx+si],al
00000408  3C00              cmp al,0x0
0000040A  55                push bp
0000040B  005F00            add [bx+0x0],bl
0000040E  69000000          imul ax,[bx+si],word 0x0
00000412  3D0056            cmp ax,0x5600
00000415  006000            add [bx+si+0x0],ah
00000418  6A00              push byte +0x0
0000041A  0000              add [bx+si],al
0000041C  3E005700          add [ds:bx+0x0],dl
00000420  61                popaw
00000421  006B00            add [bp+di+0x0],ch
00000424  0000              add [bx+si],al
00000426  3F                aas
00000427  005800            add [bx+si+0x0],bl
0000042A  6200              bound ax,[bx+si]
0000042C  6C                insb
0000042D  0000              add [bx+si],al
0000042F  004000            add [bx+si+0x0],al
00000432  59                pop cx
00000433  006300            add [bp+di+0x0],ah
00000436  6D                insw
00000437  0000              add [bx+si],al
00000439  004100            add [bx+di+0x0],al
0000043C  5A                pop dx
0000043D  006400            add [si+0x0],ah
00000440  6E                outsb
00000441  0000              add [bx+si],al
00000443  004200            add [bp+si+0x0],al
00000446  5B                pop bx
00000447  006500            add [di+0x0],ah
0000044A  6F                outsw
0000044B  0000              add [bx+si],al
0000044D  004300            add [bp+di+0x0],al
00000450  5C                pop sp
00000451  006600            add [bp+0x0],ah
00000454  7000              jo 0x456
00000456  0000              add [bx+si],al
00000458  44                inc sp
00000459  005D00            add [di+0x0],bl
0000045C  67007100          add [ecx+0x0],dh
00000460  0000              add [bx+si],al
00000462  0000              add [bx+si],al
00000464  0000              add [bx+si],al
00000466  0000              add [bx+si],al
00000468  0000              add [bx+si],al
0000046A  0000              add [bx+si],al
0000046C  0000              add [bx+si],al
0000046E  0000              add [bx+si],al
00000470  0000              add [bx+si],al
00000472  0000              add [bx+si],al
00000474  0000              add [bx+si],al
00000476  47                inc di
00000477  37                aaa
00000478  47                inc di
00000479  007700            add [bx+0x0],dh
0000047C  0020              add [bx+si],ah
0000047E  0000              add [bx+si],al
00000480  48                dec ax
00000481  384800            cmp [bx+si+0x0],cl
00000484  0000              add [bx+si],al
00000486  0020              add [bx+si],ah
00000488  0000              add [bx+si],al
0000048A  49                dec cx
0000048B  394900            cmp [bx+di+0x0],cx
0000048E  8400              test [bx+si],al
00000490  0020              add [bx+si],ah
00000492  002D              add [di],ch
00000494  4A                dec dx
00000495  2D4A00            sub ax,0x4a
00000498  0000              add [bx+si],al
0000049A  0000              add [bx+si],al
0000049C  0000              add [bx+si],al
0000049E  4B                dec bx
0000049F  344B              xor al,0x4b
000004A1  007300            add [bp+di+0x0],dh
000004A4  0020              add [bx+si],ah
000004A6  0000              add [bx+si],al
000004A8  4C                dec sp
000004A9  354C00            xor ax,0x4c
000004AC  0000              add [bx+si],al
000004AE  0020              add [bx+si],ah
000004B0  0000              add [bx+si],al
000004B2  4D                dec bp
000004B3  364D              ss dec bp
000004B5  007400            add [si+0x0],dh
000004B8  0020              add [bx+si],ah
000004BA  002B              add [bp+di],ch
000004BC  4E                dec si
000004BD  2B4E00            sub cx,[bp+0x0]
000004C0  0000              add [bx+si],al
000004C2  0000              add [bx+si],al
000004C4  0000              add [bx+si],al
000004C6  4F                dec di
000004C7  314F00            xor [bx+0x0],cx
000004CA  7500              jnz 0x4cc
000004CC  0020              add [bx+si],ah
000004CE  0000              add [bx+si],al
000004D0  50                push ax
000004D1  325000            xor dl,[bx+si+0x0]
000004D4  0000              add [bx+si],al
000004D6  0020              add [bx+si],ah
000004D8  0000              add [bx+si],al
000004DA  51                push cx
000004DB  335100            xor dx,[bx+di+0x0]
000004DE  7600              jna 0x4e0
000004E0  0020              add [bx+si],ah
000004E2  0000              add [bx+si],al
000004E4  52                push dx
000004E5  305200            xor [bp+si+0x0],dl
000004E8  0000              add [bx+si],al
000004EA  0020              add [bx+si],ah
000004EC  0000              add [bx+si],al
000004EE  53                push bx
000004EF  2E53              cs push bx
000004F1  0000              add [bx+si],al
000004F3  0000              add [bx+si],al
000004F5  2000              and [bx+si],al
000004F7  0000              add [bx+si],al
000004F9  0000              add [bx+si],al
000004FB  0000              add [bx+si],al
000004FD  0000              add [bx+si],al
000004FF  0000              add [bx+si],al
00000501  0000              add [bx+si],al
00000503  0000              add [bx+si],al
00000505  0000              add [bx+si],al
00000507  0000              add [bx+si],al
00000509  0000              add [bx+si],al
0000050B  5C                pop sp
0000050C  56                push si
0000050D  7C56              jl 0x565
0000050F  0000              add [bx+si],al
00000511  0000              add [bx+si],al
00000513  0000              add [bx+si],al
00000515  00850087          add [di-0x7900],al
00000519  0089008B          add [bx+di-0x7500],cl
0000051D  0000              add [bx+si],al
0000051F  00860088          add [bp-0x7800],al
00000523  008A008C          add [bp+si-0x7400],cl
00000527  0000              add [bx+si],al
00000529  55                push bp
0000052A  89E5              mov bp,sp
0000052C  52                push dx
0000052D  8B5604            mov dx,[bp+0x4]
00000530  EC                in al,dx
00000531  5A                pop dx
00000532  5D                pop bp
00000533  C3                ret
00000534  55                push bp
00000535  89E5              mov bp,sp
00000537  52                push dx
00000538  8B5604            mov dx,[bp+0x4]
0000053B  ED                in ax,dx
0000053C  5A                pop dx
0000053D  5D                pop bp
0000053E  C3                ret
0000053F  55                push bp
00000540  89E5              mov bp,sp
00000542  50                push ax
00000543  52                push dx
00000544  8B5604            mov dx,[bp+0x4]
00000547  8A4606            mov al,[bp+0x6]
0000054A  EE                out dx,al
0000054B  5A                pop dx
0000054C  58                pop ax
0000054D  5D                pop bp
0000054E  C3                ret
0000054F  55                push bp
00000550  89E5              mov bp,sp
00000552  50                push ax
00000553  52                push dx
00000554  8B5604            mov dx,[bp+0x4]
00000557  8B4606            mov ax,[bp+0x6]
0000055A  EF                out dx,ax
0000055B  5A                pop dx
0000055C  58                pop ax
0000055D  5D                pop bp
0000055E  C3                ret
0000055F  55                push bp
00000560  89E5              mov bp,sp
00000562  8A4604            mov al,[bp+0x4]
00000565  E670              out 0x70,al
00000567  8A4606            mov al,[bp+0x6]
0000056A  E671              out 0x71,al
0000056C  5D                pop bp
0000056D  C3                ret
0000056E  55                push bp
0000056F  89E5              mov bp,sp
00000571  8A4604            mov al,[bp+0x4]
00000574  E670              out 0x70,al
00000576  E471              in al,0x71
00000578  5D                pop bp
00000579  C3                ret
0000057A  55                push bp
0000057B  89E5              mov bp,sp
0000057D  B82600            mov ax,0x26
00000580  50                push ax
00000581  B80A00            mov ax,0xa
00000584  50                push ax
00000585  E8D7FF            call word 0x55f
00000588  89EC              mov sp,bp
0000058A  B80200            mov ax,0x2
0000058D  50                push ax
0000058E  B80B00            mov ax,0xb
00000591  50                push ax
00000592  E8CAFF            call word 0x55f
00000595  89EC              mov sp,bp
00000597  B80C00            mov ax,0xc
0000059A  50                push ax
0000059B  E8D0FF            call word 0x56e
0000059E  89EC              mov sp,bp
000005A0  B80D00            mov ax,0xd
000005A3  50                push ax
000005A4  E8C7FF            call word 0x56e
000005A7  89EC              mov sp,bp
000005A9  5D                pop bp
000005AA  C3                ret
000005AB  55                push bp
000005AC  89E5              mov bp,sp
000005AE  4C                dec sp
000005AF  4C                dec sp
000005B0  B8A861            mov ax,0x61a8
000005B3  8946FE            mov [bp-0x2],ax
000005B6  EB15              jmp short 0x5cd
000005B8  B80A00            mov ax,0xa
000005BB  50                push ax
000005BC  E8AFFF            call word 0x56e
000005BF  44                inc sp
000005C0  44                inc sp
000005C1  2480              and al,0x80
000005C3  84C0              test al,al
000005C5  7506              jnz 0x5cd
000005C7  31C0              xor ax,ax
000005C9  89EC              mov sp,bp
000005CB  5D                pop bp
000005CC  C3                ret
000005CD  8B46FE            mov ax,[bp-0x2]
000005D0  48                dec ax
000005D1  8946FE            mov [bp-0x2],ax
000005D4  85C0              test ax,ax
000005D6  75E0              jnz 0x5b8
000005D8  B80100            mov ax,0x1
000005DB  89EC              mov sp,bp
000005DD  5D                pop bp
000005DE  C3                ret
000005DF  55                push bp
000005E0  89E5              mov bp,sp
000005E2  53                push bx
000005E3  1E                push ds
000005E4  C55E04            lds bx,[bp+0x4]
000005E7  8A07              mov al,[bx]
000005E9  1F                pop ds
000005EA  5B                pop bx
000005EB  5D                pop bp
000005EC  C3                ret
000005ED  55                push bp
000005EE  89E5              mov bp,sp
000005F0  53                push bx
000005F1  1E                push ds
000005F2  C55E04            lds bx,[bp+0x4]
000005F5  8B07              mov ax,[bx]
000005F7  1F                pop ds
000005F8  5B                pop bx
000005F9  5D                pop bp
000005FA  C3                ret
000005FB  55                push bp
000005FC  89E5              mov bp,sp
000005FE  50                push ax
000005FF  53                push bx
00000600  1E                push ds
00000601  C55E06            lds bx,[bp+0x6]
00000604  8A4604            mov al,[bp+0x4]
00000607  8807              mov [bx],al
00000609  1F                pop ds
0000060A  5B                pop bx
0000060B  58                pop ax
0000060C  5D                pop bp
0000060D  C3                ret
0000060E  55                push bp
0000060F  89E5              mov bp,sp
00000611  50                push ax
00000612  53                push bx
00000613  1E                push ds
00000614  C55E06            lds bx,[bp+0x6]
00000617  8B4604            mov ax,[bp+0x4]
0000061A  8907              mov [bx],ax
0000061C  1F                pop ds
0000061D  5B                pop bx
0000061E  58                pop ax
0000061F  5D                pop bp
00000620  C3                ret
00000621  55                push bp
00000622  89E5              mov bp,sp
00000624  8B6E04            mov bp,[bp+0x4]
00000627  8A4600            mov al,[bp+0x0]
0000062A  5D                pop bp
0000062B  C3                ret
0000062C  55                push bp
0000062D  89E5              mov bp,sp
0000062F  8B6E04            mov bp,[bp+0x4]
00000632  8B4600            mov ax,[bp+0x0]
00000635  5D                pop bp
00000636  C3                ret
00000637  55                push bp
00000638  89E5              mov bp,sp
0000063A  50                push ax
0000063B  8A4604            mov al,[bp+0x4]
0000063E  8B6E06            mov bp,[bp+0x6]
00000641  884600            mov [bp+0x0],al
00000644  58                pop ax
00000645  5D                pop bp
00000646  C3                ret
00000647  55                push bp
00000648  89E5              mov bp,sp
0000064A  50                push ax
0000064B  8B4604            mov ax,[bp+0x4]
0000064E  8B6E06            mov bp,[bp+0x6]
00000651  894600            mov [bp+0x0],ax
00000654  58                pop ax
00000655  5D                pop bp
00000656  C3                ret
00000657  8CC8              mov ax,cs
00000659  C3                ret
0000065A  8CD0              mov ax,ss
0000065C  C3                ret
0000065D  55                push bp
0000065E  89E5              mov bp,sp
00000660  1E                push ds
00000661  8E5E04            mov ds,[bp+0x4]
00000664  58                pop ax
00000665  5D                pop bp
00000666  C3                ret
00000667  55                push bp
00000668  89E5              mov bp,sp
0000066A  53                push bx
0000066B  B40E              mov ah,0xe
0000066D  8A4604            mov al,[bp+0x4]
00000670  31DB              xor bx,bx
00000672  CD10              int 0x10
00000674  5B                pop bx
00000675  5D                pop bp
00000676  C3                ret
00000677  55                push bp
00000678  89E5              mov bp,sp
0000067A  8A4604            mov al,[bp+0x4]
0000067D  2408              and al,0x8
0000067F  84C0              test al,al
00000681  740F              jz 0x692
00000683  8A4606            mov al,[bp+0x6]
00000686  30E4              xor ah,ah
00000688  50                push ax
00000689  B80304            mov ax,0x403
0000068C  50                push ax
0000068D  E8AFFE            call word 0x53f
00000690  89EC              mov sp,bp
00000692  8A4604            mov al,[bp+0x4]
00000695  2404              and al,0x4
00000697  84C0              test al,al
00000699  740F              jz 0x6aa
0000069B  8A4606            mov al,[bp+0x6]
0000069E  30E4              xor ah,ah
000006A0  50                push ax
000006A1  B80204            mov ax,0x402
000006A4  50                push ax
000006A5  E897FE            call word 0x53f
000006A8  89EC              mov sp,bp
000006AA  8A4604            mov al,[bp+0x4]
000006AD  2402              and al,0x2
000006AF  84C0              test al,al
000006B1  741B              jz 0x6ce
000006B3  8A4606            mov al,[bp+0x6]
000006B6  3C0A              cmp al,0xa
000006B8  7509              jnz 0x6c3
000006BA  B80D00            mov ax,0xd
000006BD  50                push ax
000006BE  E8A6FF            call word 0x667
000006C1  89EC              mov sp,bp
000006C3  8A4606            mov al,[bp+0x6]
000006C6  30E4              xor ah,ah
000006C8  50                push ax
000006C9  E89BFF            call word 0x667
000006CC  89EC              mov sp,bp
000006CE  5D                pop bp
000006CF  C3                ret
000006D0  55                push bp
000006D1  89E5              mov bp,sp
000006D3  4C                dec sp
000006D4  4C                dec sp
000006D5  8B4606            mov ax,[bp+0x6]
000006D8  BB0A00            mov bx,0xa
000006DB  E85CFA            call word 0x13a
000006DE  8946FE            mov [bp-0x2],ax
000006E1  8B46FE            mov ax,[bp-0x2]
000006E4  85C0              test ax,ax
000006E6  7416              jz 0x6fe
000006E8  FF760A            push word [bp+0xa]
000006EB  8B4608            mov ax,[bp+0x8]
000006EE  48                dec ax
000006EF  50                push ax
000006F0  FF76FE            push word [bp-0x2]
000006F3  FF7604            push word [bp+0x4]
000006F6  E8D7FF            call word 0x6d0
000006F9  83C408            add sp,byte +0x8
000006FC  EB2E              jmp short 0x72c
000006FE  EB0D              jmp short 0x70d
00000700  B82000            mov ax,0x20
00000703  50                push ax
00000704  FF7604            push word [bp+0x4]
00000707  E86DFF            call word 0x677
0000070A  83C404            add sp,byte +0x4
0000070D  8B4608            mov ax,[bp+0x8]
00000710  48                dec ax
00000711  894608            mov [bp+0x8],ax
00000714  85C0              test ax,ax
00000716  7FE8              jg 0x700
00000718  8B460A            mov ax,[bp+0xa]
0000071B  85C0              test ax,ax
0000071D  740D              jz 0x72c
0000071F  B82D00            mov ax,0x2d
00000722  50                push ax
00000723  FF7604            push word [bp+0x4]
00000726  E84EFF            call word 0x677
00000729  83C404            add sp,byte +0x4
0000072C  8B46FE            mov ax,[bp-0x2]
0000072F  89C2              mov dx,ax
00000731  D1E0              shl ax,1
00000733  D1E0              shl ax,1
00000735  01D0              add ax,dx
00000737  D1E0              shl ax,1
00000739  50                push ax
0000073A  8B4606            mov ax,[bp+0x6]
0000073D  2B46FC            sub ax,[bp-0x4]
00000740  44                inc sp
00000741  44                inc sp
00000742  053000            add ax,0x30
00000745  50                push ax
00000746  FF7604            push word [bp+0x4]
00000749  E82BFF            call word 0x677
0000074C  83C404            add sp,byte +0x4
0000074F  89EC              mov sp,bp
00000751  5D                pop bp
00000752  C3                ret
00000753  55                push bp
00000754  89E5              mov bp,sp
00000756  83C4FC            add sp,byte -0x4
00000759  B80A00            mov ax,0xa
0000075C  31DB              xor bx,bx
0000075E  53                push bx
0000075F  50                push ax
00000760  8B4606            mov ax,[bp+0x6]
00000763  8B5E08            mov bx,[bp+0x8]
00000766  8D7EF8            lea di,[bp-0x8]
00000769  E8D3F9            call word 0x13f
0000076C  83C404            add sp,byte +0x4
0000076F  8946FC            mov [bp-0x4],ax
00000772  895EFE            mov [bp-0x2],bx
00000775  8B46FC            mov ax,[bp-0x4]
00000778  8B5EFE            mov bx,[bp-0x2]
0000077B  E867F9            call word 0xe5
0000077E  7419              jz 0x799
00000780  FF760C            push word [bp+0xc]
00000783  8B460A            mov ax,[bp+0xa]
00000786  48                dec ax
00000787  50                push ax
00000788  FF76FE            push word [bp-0x2]
0000078B  FF76FC            push word [bp-0x4]
0000078E  FF7604            push word [bp+0x4]
00000791  E8BFFF            call word 0x753
00000794  83C40A            add sp,byte +0xa
00000797  EB2E              jmp short 0x7c7
00000799  EB0D              jmp short 0x7a8
0000079B  B82000            mov ax,0x20
0000079E  50                push ax
0000079F  FF7604            push word [bp+0x4]
000007A2  E8D2FE            call word 0x677
000007A5  83C404            add sp,byte +0x4
000007A8  8B460A            mov ax,[bp+0xa]
000007AB  48                dec ax
000007AC  89460A            mov [bp+0xa],ax
000007AF  85C0              test ax,ax
000007B1  7FE8              jg 0x79b
000007B3  8B460C            mov ax,[bp+0xc]
000007B6  85C0              test ax,ax
000007B8  740D              jz 0x7c7
000007BA  B82D00            mov ax,0x2d
000007BD  50                push ax
000007BE  FF7604            push word [bp+0x4]
000007C1  E8B3FE            call word 0x677
000007C4  83C404            add sp,byte +0x4
000007C7  B80A00            mov ax,0xa
000007CA  31DB              xor bx,bx
000007CC  8D7EFC            lea di,[bp-0x4]
000007CF  E8E8F8            call word 0xba
000007D2  53                push bx
000007D3  50                push ax
000007D4  8B4606            mov ax,[bp+0x6]
000007D7  8B5E08            mov bx,[bp+0x8]
000007DA  8D7EF8            lea di,[bp-0x8]
000007DD  E8D2F8            call word 0xb2
000007E0  83C404            add sp,byte +0x4
000007E3  53                push bx
000007E4  50                push ax
000007E5  B83000            mov ax,0x30
000007E8  31DB              xor bx,bx
000007EA  53                push bx
000007EB  50                push ax
000007EC  8B46F8            mov ax,[bp-0x8]
000007EF  8B5EFA            mov bx,[bp-0x6]
000007F2  8D7EF4            lea di,[bp-0xc]
000007F5  E89CF8            call word 0x94
000007F8  83C408            add sp,byte +0x8
000007FB  53                push bx
000007FC  50                push ax
000007FD  FF7604            push word [bp+0x4]
00000800  E874FE            call word 0x677
00000803  83C406            add sp,byte +0x6
00000806  89EC              mov sp,bp
00000808  5D                pop bp
00000809  C3                ret
0000080A  55                push bp
0000080B  89E5              mov bp,sp
0000080D  4C                dec sp
0000080E  4C                dec sp
0000080F  EB16              jmp short 0x827
00000811  8A46FF            mov al,[bp-0x1]
00000814  30E4              xor ah,ah
00000816  50                push ax
00000817  FF7604            push word [bp+0x4]
0000081A  E85AFE            call word 0x677
0000081D  83C404            add sp,byte +0x4
00000820  8B4608            mov ax,[bp+0x8]
00000823  40                inc ax
00000824  894608            mov [bp+0x8],ax
00000827  FF7606            push word [bp+0x6]
0000082A  FF7608            push word [bp+0x8]
0000082D  E8AFFD            call word 0x5df
00000830  83C404            add sp,byte +0x4
00000833  8846FF            mov [bp-0x1],al
00000836  84C0              test al,al
00000838  75D7              jnz 0x811
0000083A  89EC              mov sp,bp
0000083C  5D                pop bp
0000083D  C3                ret
0000083E  55                push bp
0000083F  89E5              mov bp,sp
00000841  83C4F0            add sp,byte -0x10
00000844  9C                pushfw
00000845  1E                push ds
00000846  6A00              push byte +0x0
00000848  1F                pop ds
00000849  FB                sti
0000084A  8B4604            mov ax,[bp+0x4]
0000084D  31DB              xor bx,bx
0000084F  8946FC            mov [bp-0x4],ax
00000852  895EFE            mov [bp-0x2],bx
00000855  A16C04            mov ax,[0x46c]
00000858  8B1E6E04          mov bx,[0x46e]
0000085C  8946F4            mov [bp-0xc],ax
0000085F  895EF6            mov [bp-0xa],bx
00000862  F4                hlt
00000863  A16C04            mov ax,[0x46c]
00000866  8B1E6E04          mov bx,[0x46e]
0000086A  8946F0            mov [bp-0x10],ax
0000086D  895EF2            mov [bp-0xe],bx
00000870  8B46F4            mov ax,[bp-0xc]
00000873  8B5EF6            mov bx,[bp-0xa]
00000876  8D7EF0            lea di,[bp-0x10]
00000879  E820F8            call word 0x9c
0000087C  7326              jnc 0x8a4
0000087E  8B46F0            mov ax,[bp-0x10]
00000881  8B5EF2            mov bx,[bp-0xe]
00000884  8D7EF4            lea di,[bp-0xc]
00000887  E828F8            call word 0xb2
0000088A  8946F8            mov [bp-0x8],ax
0000088D  895EFA            mov [bp-0x6],bx
00000890  8B46FC            mov ax,[bp-0x4]
00000893  8B5EFE            mov bx,[bp-0x2]
00000896  8D7EF8            lea di,[bp-0x8]
00000899  E816F8            call word 0xb2
0000089C  8946FC            mov [bp-0x4],ax
0000089F  895EFE            mov [bp-0x2],bx
000008A2  EB20              jmp short 0x8c4
000008A4  8B46F4            mov ax,[bp-0xc]
000008A7  8B5EF6            mov bx,[bp-0xa]
000008AA  8D7EF0            lea di,[bp-0x10]
000008AD  E8ECF7            call word 0x9c
000008B0  7612              jna 0x8c4
000008B2  8B46FC            mov ax,[bp-0x4]
000008B5  8B5EFE            mov bx,[bp-0x2]
000008B8  8D7EF0            lea di,[bp-0x10]
000008BB  E8F4F7            call word 0xb2
000008BE  8946FC            mov [bp-0x4],ax
000008C1  895EFE            mov [bp-0x2],bx
000008C4  8B46F0            mov ax,[bp-0x10]
000008C7  8B5EF2            mov bx,[bp-0xe]
000008CA  8946F4            mov [bp-0xc],ax
000008CD  895EF6            mov [bp-0xa],bx
000008D0  31C0              xor ax,ax
000008D2  31DB              xor bx,bx
000008D4  8D7EFC            lea di,[bp-0x4]
000008D7  E8C2F7            call word 0x9c
000008DA  7C86              jl 0x862
000008DC  FA                cli
000008DD  1F                pop ds
000008DE  9D                popfw
000008DF  89EC              mov sp,bp
000008E1  5D                pop bp
000008E2  C3                ret
000008E3  B80001            mov ax,0x100
000008E6  CD16              int 0x16
000008E8  7404              jz 0x8ee
000008EA  B001              mov al,0x1
000008EC  EB02              jmp short 0x8f0
000008EE  30C0              xor al,al
000008F0  C3                ret
000008F1  B80000            mov ax,0x0
000008F4  CD16              int 0x16
000008F6  86C4              xchg al,ah
000008F8  C3                ret
000008F9  55                push bp
000008FA  89E5              mov bp,sp
000008FC  4C                dec sp
000008FD  4C                dec sp
000008FE  B80100            mov ax,0x1
00000901  8946FE            mov [bp-0x2],ax
00000904  EB18              jmp short 0x91e
00000906  FF7604            push word [bp+0x4]
00000909  E832FF            call word 0x83e
0000090C  44                inc sp
0000090D  44                inc sp
0000090E  E8D2FF            call word 0x8e3
00000911  84C0              test al,al
00000913  7402              jz 0x917
00000915  EB0F              jmp short 0x926
00000917  8B46FE            mov ax,[bp-0x2]
0000091A  40                inc ax
0000091B  8946FE            mov [bp-0x2],ax
0000091E  8B46FE            mov ax,[bp-0x2]
00000921  3B4606            cmp ax,[bp+0x6]
00000924  76E0              jna 0x906
00000926  89EC              mov sp,bp
00000928  5D                pop bp
00000929  C3                ret
0000092A  55                push bp
0000092B  89E5              mov bp,sp
0000092D  83C4EC            add sp,byte -0x14
00000930  E824FD            call word 0x657
00000933  50                push ax
00000934  E826FD            call word 0x65d
00000937  44                inc sp
00000938  44                inc sp
00000939  8946EC            mov [bp-0x14],ax
0000093C  8D5E06            lea bx,[bp+0x6]
0000093F  895EF8            mov [bp-0x8],bx
00000942  31C0              xor ax,ax
00000944  8946FC            mov [bp-0x4],ax
00000947  31C0              xor ax,ax
00000949  8946EE            mov [bp-0x12],ax
0000094C  8A4604            mov al,[bp+0x4]
0000094F  2407              and al,0x7
00000951  3C07              cmp al,0x7
00000953  751B              jnz 0x970
00000955  31C0              xor ax,ax
00000957  50                push ax
00000958  B80104            mov ax,0x401
0000095B  50                push ax
0000095C  E8E0FB            call word 0x53f
0000095F  83C404            add sp,byte +0x4
00000962  BB07DA            mov bx,0xda07
00000965  53                push bx
00000966  B80200            mov ax,0x2
00000969  50                push ax
0000096A  E8BDFF            call word 0x92a
0000096D  83C404            add sp,byte +0x4
00000970  E92603            jmp word 0xc99
00000973  8A46FF            mov al,[bp-0x1]
00000976  3C25              cmp al,0x25
00000978  750E              jnz 0x988
0000097A  B80100            mov ax,0x1
0000097D  8946FC            mov [bp-0x4],ax
00000980  31C0              xor ax,ax
00000982  8946EE            mov [bp-0x12],ax
00000985  E90A03            jmp word 0xc92
00000988  8B46FC            mov ax,[bp-0x4]
0000098B  85C0              test ax,ax
0000098D  0F84F202          jz word 0xc83
00000991  8A46FF            mov al,[bp-0x1]
00000994  3C30              cmp al,0x30
00000996  7228              jc 0x9c0
00000998  8A46FF            mov al,[bp-0x1]
0000099B  3C39              cmp al,0x39
0000099D  7721              ja 0x9c0
0000099F  8A46FF            mov al,[bp-0x1]
000009A2  30E4              xor ah,ah
000009A4  05D0FF            add ax,0xffd0
000009A7  50                push ax
000009A8  8B46EE            mov ax,[bp-0x12]
000009AB  89C2              mov dx,ax
000009AD  D1E0              shl ax,1
000009AF  D1E0              shl ax,1
000009B1  01D0              add ax,dx
000009B3  D1E0              shl ax,1
000009B5  0346EA            add ax,[bp-0x16]
000009B8  44                inc sp
000009B9  44                inc sp
000009BA  8946EE            mov [bp-0x12],ax
000009BD  E9C102            jmp word 0xc81
000009C0  8B5EF8            mov bx,[bp-0x8]
000009C3  43                inc bx
000009C4  43                inc bx
000009C5  895EF8            mov [bp-0x8],bx
000009C8  FF76F8            push word [bp-0x8]
000009CB  E85EFC            call word 0x62c
000009CE  44                inc sp
000009CF  44                inc sp
000009D0  8946F6            mov [bp-0xa],ax
000009D3  8A46FF            mov al,[bp-0x1]
000009D6  24DF              and al,0xdf
000009D8  3C58              cmp al,0x58
000009DA  7564              jnz 0xa40
000009DC  8B46EE            mov ax,[bp-0x12]
000009DF  85C0              test ax,ax
000009E1  7506              jnz 0x9e9
000009E3  B80400            mov ax,0x4
000009E6  8946EE            mov [bp-0x12],ax
000009E9  8B46EE            mov ax,[bp-0x12]
000009EC  48                dec ax
000009ED  8946FA            mov [bp-0x6],ax
000009F0  EB44              jmp short 0xa36
000009F2  8B46FA            mov ax,[bp-0x6]
000009F5  D1E0              shl ax,1
000009F7  D1E0              shl ax,1
000009F9  89C3              mov bx,ax
000009FB  8B46F6            mov ax,[bp-0xa]
000009FE  89D9              mov cx,bx
00000A00  D3E8              shr ax,cl
00000A02  240F              and al,0xf
00000A04  30E4              xor ah,ah
00000A06  8946F4            mov [bp-0xc],ax
00000A09  8B46F4            mov ax,[bp-0xc]
00000A0C  3D0900            cmp ax,0x9
00000A0F  7708              ja 0xa19
00000A11  8B46F4            mov ax,[bp-0xc]
00000A14  053000            add ax,0x30
00000A17  EB0C              jmp short 0xa25
00000A19  8B46F4            mov ax,[bp-0xc]
00000A1C  0246FF            add al,[bp-0x1]
00000A1F  80D400            adc ah,0x0
00000A22  05DFFF            add ax,0xffdf
00000A25  50                push ax
00000A26  FF7604            push word [bp+0x4]
00000A29  E84BFC            call word 0x677
00000A2C  83C404            add sp,byte +0x4
00000A2F  8B46FA            mov ax,[bp-0x6]
00000A32  48                dec ax
00000A33  8946FA            mov [bp-0x6],ax
00000A36  8B46FA            mov ax,[bp-0x6]
00000A39  85C0              test ax,ax
00000A3B  7DB5              jnl 0x9f2
00000A3D  E93C02            jmp word 0xc7c
00000A40  8A46FF            mov al,[bp-0x1]
00000A43  3C75              cmp al,0x75
00000A45  7515              jnz 0xa5c
00000A47  31C0              xor ax,ax
00000A49  50                push ax
00000A4A  FF76EE            push word [bp-0x12]
00000A4D  FF76F6            push word [bp-0xa]
00000A50  FF7604            push word [bp+0x4]
00000A53  E87AFC            call word 0x6d0
00000A56  83C408            add sp,byte +0x8
00000A59  E92002            jmp word 0xc7c
00000A5C  8A46FF            mov al,[bp-0x1]
00000A5F  3C6C              cmp al,0x6c
00000A61  0F856A01          jnz word 0xbcf
00000A65  8B5E06            mov bx,[bp+0x6]
00000A68  43                inc bx
00000A69  895E06            mov [bp+0x6],bx
00000A6C  8B5E06            mov bx,[bp+0x6]
00000A6F  8A07              mov al,[bx]
00000A71  8846FF            mov [bp-0x1],al
00000A74  8B5EF8            mov bx,[bp-0x8]
00000A77  43                inc bx
00000A78  43                inc bx
00000A79  895EF8            mov [bp-0x8],bx
00000A7C  FF76F8            push word [bp-0x8]
00000A7F  E8AAFB            call word 0x62c
00000A82  44                inc sp
00000A83  44                inc sp
00000A84  8946F2            mov [bp-0xe],ax
00000A87  8A46FF            mov al,[bp-0x1]
00000A8A  3C64              cmp al,0x64
00000A8C  7573              jnz 0xb01
00000A8E  8B46F2            mov ax,[bp-0xe]
00000A91  250080            and ax,0x8000
00000A94  85C0              test ax,ax
00000A96  743D              jz 0xad5
00000A98  B80100            mov ax,0x1
00000A9B  50                push ax
00000A9C  8B46EE            mov ax,[bp-0x12]
00000A9F  48                dec ax
00000AA0  50                push ax
00000AA1  8B46F6            mov ax,[bp-0xa]
00000AA4  31DB              xor bx,bx
00000AA6  53                push bx
00000AA7  50                push ax
00000AA8  8B46F2            mov ax,[bp-0xe]
00000AAB  31DB              xor bx,bx
00000AAD  93                xchg ax,bx
00000AAE  31C0              xor ax,ax
00000AB0  8D7EE4            lea di,[bp-0x1c]
00000AB3  E822F6            call word 0xd8
00000AB6  83C404            add sp,byte +0x4
00000AB9  53                push bx
00000ABA  50                push ax
00000ABB  31C0              xor ax,ax
00000ABD  31DB              xor bx,bx
00000ABF  8D7EE4            lea di,[bp-0x1c]
00000AC2  E8EDF5            call word 0xb2
00000AC5  83C404            add sp,byte +0x4
00000AC8  53                push bx
00000AC9  50                push ax
00000ACA  FF7604            push word [bp+0x4]
00000ACD  E883FC            call word 0x753
00000AD0  83C40A            add sp,byte +0xa
00000AD3  EB29              jmp short 0xafe
00000AD5  31C0              xor ax,ax
00000AD7  50                push ax
00000AD8  FF76EE            push word [bp-0x12]
00000ADB  8B46F6            mov ax,[bp-0xa]
00000ADE  31DB              xor bx,bx
00000AE0  53                push bx
00000AE1  50                push ax
00000AE2  8B46F2            mov ax,[bp-0xe]
00000AE5  31DB              xor bx,bx
00000AE7  93                xchg ax,bx
00000AE8  31C0              xor ax,ax
00000AEA  8D7EE4            lea di,[bp-0x1c]
00000AED  E8E8F5            call word 0xd8
00000AF0  83C404            add sp,byte +0x4
00000AF3  53                push bx
00000AF4  50                push ax
00000AF5  FF7604            push word [bp+0x4]
00000AF8  E858FC            call word 0x753
00000AFB  83C40A            add sp,byte +0xa
00000AFE  E9CB00            jmp word 0xbcc
00000B01  8A46FF            mov al,[bp-0x1]
00000B04  3C75              cmp al,0x75
00000B06  752C              jnz 0xb34
00000B08  31C0              xor ax,ax
00000B0A  50                push ax
00000B0B  FF76EE            push word [bp-0x12]
00000B0E  8B46F6            mov ax,[bp-0xa]
00000B11  31DB              xor bx,bx
00000B13  53                push bx
00000B14  50                push ax
00000B15  8B46F2            mov ax,[bp-0xe]
00000B18  31DB              xor bx,bx
00000B1A  93                xchg ax,bx
00000B1B  31C0              xor ax,ax
00000B1D  8D7EE4            lea di,[bp-0x1c]
00000B20  E8B5F5            call word 0xd8
00000B23  83C404            add sp,byte +0x4
00000B26  53                push bx
00000B27  50                push ax
00000B28  FF7604            push word [bp+0x4]
00000B2B  E825FC            call word 0x753
00000B2E  83C40A            add sp,byte +0xa
00000B31  E99800            jmp word 0xbcc
00000B34  8A46FF            mov al,[bp-0x1]
00000B37  24DF              and al,0xdf
00000B39  3C58              cmp al,0x58
00000B3B  0F858D00          jnz word 0xbcc
00000B3F  8B46EE            mov ax,[bp-0x12]
00000B42  85C0              test ax,ax
00000B44  7506              jnz 0xb4c
00000B46  B80800            mov ax,0x8
00000B49  8946EE            mov [bp-0x12],ax
00000B4C  8B46EE            mov ax,[bp-0x12]
00000B4F  48                dec ax
00000B50  8946FA            mov [bp-0x6],ax
00000B53  EB70              jmp short 0xbc5
00000B55  8B46FA            mov ax,[bp-0x6]
00000B58  D1E0              shl ax,1
00000B5A  D1E0              shl ax,1
00000B5C  50                push ax
00000B5D  8B46F6            mov ax,[bp-0xa]
00000B60  31DB              xor bx,bx
00000B62  53                push bx
00000B63  50                push ax
00000B64  8B46F2            mov ax,[bp-0xe]
00000B67  31DB              xor bx,bx
00000B69  93                xchg ax,bx
00000B6A  31C0              xor ax,ax
00000B6C  8D7EE6            lea di,[bp-0x1a]
00000B6F  E866F5            call word 0xd8
00000B72  83C404            add sp,byte +0x4
00000B75  8B7EEA            mov di,[bp-0x16]
00000B78  E87FF5            call word 0xfa
00000B7B  44                inc sp
00000B7C  44                inc sp
00000B7D  53                push bx
00000B7E  50                push ax
00000B7F  B80F00            mov ax,0xf
00000B82  31DB              xor bx,bx
00000B84  53                push bx
00000B85  50                push ax
00000B86  8B46E8            mov ax,[bp-0x18]
00000B89  8B5EEA            mov bx,[bp-0x16]
00000B8C  8D7EE4            lea di,[bp-0x1c]
00000B8F  E8FAF4            call word 0x8c
00000B92  83C408            add sp,byte +0x8
00000B95  8946F4            mov [bp-0xc],ax
00000B98  8B46F4            mov ax,[bp-0xc]
00000B9B  3D0900            cmp ax,0x9
00000B9E  7708              ja 0xba8
00000BA0  8B46F4            mov ax,[bp-0xc]
00000BA3  053000            add ax,0x30
00000BA6  EB0C              jmp short 0xbb4
00000BA8  8B46F4            mov ax,[bp-0xc]
00000BAB  0246FF            add al,[bp-0x1]
00000BAE  80D400            adc ah,0x0
00000BB1  05DFFF            add ax,0xffdf
00000BB4  50                push ax
00000BB5  FF7604            push word [bp+0x4]
00000BB8  E8BCFA            call word 0x677
00000BBB  83C404            add sp,byte +0x4
00000BBE  8B46FA            mov ax,[bp-0x6]
00000BC1  48                dec ax
00000BC2  8946FA            mov [bp-0x6],ax
00000BC5  8B46FA            mov ax,[bp-0x6]
00000BC8  85C0              test ax,ax
00000BCA  7D89              jnl 0xb55
00000BCC  E9AD00            jmp word 0xc7c
00000BCF  8A46FF            mov al,[bp-0x1]
00000BD2  3C64              cmp al,0x64
00000BD4  7539              jnz 0xc0f
00000BD6  8B46F6            mov ax,[bp-0xa]
00000BD9  250080            and ax,0x8000
00000BDC  85C0              test ax,ax
00000BDE  741A              jz 0xbfa
00000BE0  B80100            mov ax,0x1
00000BE3  50                push ax
00000BE4  8B46EE            mov ax,[bp-0x12]
00000BE7  48                dec ax
00000BE8  50                push ax
00000BE9  31C0              xor ax,ax
00000BEB  2B46F6            sub ax,[bp-0xa]
00000BEE  50                push ax
00000BEF  FF7604            push word [bp+0x4]
00000BF2  E8DBFA            call word 0x6d0
00000BF5  83C408            add sp,byte +0x8
00000BF8  EB12              jmp short 0xc0c
00000BFA  31C0              xor ax,ax
00000BFC  50                push ax
00000BFD  FF76EE            push word [bp-0x12]
00000C00  FF76F6            push word [bp-0xa]
00000C03  FF7604            push word [bp+0x4]
00000C06  E8C7FA            call word 0x6d0
00000C09  83C408            add sp,byte +0x8
00000C0C  E96D00            jmp word 0xc7c
00000C0F  8A46FF            mov al,[bp-0x1]
00000C12  3C73              cmp al,0x73
00000C14  7512              jnz 0xc28
00000C16  FF76F6            push word [bp-0xa]
00000C19  E83BFA            call word 0x657
00000C1C  50                push ax
00000C1D  FF7604            push word [bp+0x4]
00000C20  E8E7FB            call word 0x80a
00000C23  83C406            add sp,byte +0x6
00000C26  EB54              jmp short 0xc7c
00000C28  8A46FF            mov al,[bp-0x1]
00000C2B  3C53              cmp al,0x53
00000C2D  752A              jnz 0xc59
00000C2F  8B46F6            mov ax,[bp-0xa]
00000C32  8946F2            mov [bp-0xe],ax
00000C35  8B5EF8            mov bx,[bp-0x8]
00000C38  43                inc bx
00000C39  43                inc bx
00000C3A  895EF8            mov [bp-0x8],bx
00000C3D  FF76F8            push word [bp-0x8]
00000C40  E8E9F9            call word 0x62c
00000C43  44                inc sp
00000C44  44                inc sp
00000C45  8946F6            mov [bp-0xa],ax
00000C48  FF76F6            push word [bp-0xa]
00000C4B  FF76F2            push word [bp-0xe]
00000C4E  FF7604            push word [bp+0x4]
00000C51  E8B6FB            call word 0x80a
00000C54  83C406            add sp,byte +0x6
00000C57  EB23              jmp short 0xc7c
00000C59  8A46FF            mov al,[bp-0x1]
00000C5C  3C63              cmp al,0x63
00000C5E  750E              jnz 0xc6e
00000C60  FF76F6            push word [bp-0xa]
00000C63  FF7604            push word [bp+0x4]
00000C66  E80EFA            call word 0x677
00000C69  83C404            add sp,byte +0x4
00000C6C  EB0E              jmp short 0xc7c
00000C6E  BBEAD9            mov bx,0xd9ea
00000C71  53                push bx
00000C72  B80700            mov ax,0x7
00000C75  50                push ax
00000C76  E8B1FC            call word 0x92a
00000C79  83C404            add sp,byte +0x4
00000C7C  31C0              xor ax,ax
00000C7E  8946FC            mov [bp-0x4],ax
00000C81  EB0F              jmp short 0xc92
00000C83  8A46FF            mov al,[bp-0x1]
00000C86  30E4              xor ah,ah
00000C88  50                push ax
00000C89  FF7604            push word [bp+0x4]
00000C8C  E8E8F9            call word 0x677
00000C8F  83C404            add sp,byte +0x4
00000C92  8B5E06            mov bx,[bp+0x6]
00000C95  43                inc bx
00000C96  895E06            mov [bp+0x6],bx
00000C99  8B5E06            mov bx,[bp+0x6]
00000C9C  8A07              mov al,[bx]
00000C9E  8846FF            mov [bp-0x1],al
00000CA1  84C0              test al,al
00000CA3  0F85CCFC          jnz word 0x973
00000CA7  8A4604            mov al,[bp+0x4]
00000CAA  2401              and al,0x1
00000CAC  84C0              test al,al
00000CAE  7404              jz 0xcb4
00000CB0  FA                cli
00000CB1  F4                hlt
00000CB2  EBFD              jmp short 0xcb1
00000CB4  FF76EC            push word [bp-0x14]
00000CB7  E8A3F9            call word 0x65d
00000CBA  44                inc sp
00000CBB  44                inc sp
00000CBC  89EC              mov sp,bp
00000CBE  5D                pop bp
00000CBF  C3                ret
00000CC0  55                push bp
00000CC1  89E5              mov bp,sp
00000CC3  4C                dec sp
00000CC4  4C                dec sp
00000CC5  B8FFFF            mov ax,0xffff
00000CC8  8946FE            mov [bp-0x2],ax
00000CCB  EB0D              jmp short 0xcda
00000CCD  31C0              xor ax,ax
00000CCF  50                push ax
00000CD0  B88000            mov ax,0x80
00000CD3  50                push ax
00000CD4  E868F8            call word 0x53f
00000CD7  83C404            add sp,byte +0x4
00000CDA  B86400            mov ax,0x64
00000CDD  50                push ax
00000CDE  E848F8            call word 0x529
00000CE1  44                inc sp
00000CE2  44                inc sp
00000CE3  2402              and al,0x2
00000CE5  84C0              test al,al
00000CE7  740B              jz 0xcf4
00000CE9  8B46FE            mov ax,[bp-0x2]
00000CEC  48                dec ax
00000CED  8946FE            mov [bp-0x2],ax
00000CF0  85C0              test ax,ax
00000CF2  75D9              jnz 0xccd
00000CF4  B80020            mov ax,0x2000
00000CF7  8946FE            mov [bp-0x2],ax
00000CFA  EB2B              jmp short 0xd27
00000CFC  31C0              xor ax,ax
00000CFE  50                push ax
00000CFF  B88000            mov ax,0x80
00000D02  50                push ax
00000D03  E839F8            call word 0x53f
00000D06  83C404            add sp,byte +0x4
00000D09  B86400            mov ax,0x64
00000D0C  50                push ax
00000D0D  E819F8            call word 0x529
00000D10  44                inc sp
00000D11  44                inc sp
00000D12  2401              and al,0x1
00000D14  84C0              test al,al
00000D16  740F              jz 0xd27
00000D18  B86000            mov ax,0x60
00000D1B  50                push ax
00000D1C  E80AF8            call word 0x529
00000D1F  44                inc sp
00000D20  44                inc sp
00000D21  B80020            mov ax,0x2000
00000D24  8946FE            mov [bp-0x2],ax
00000D27  8B46FE            mov ax,[bp-0x2]
00000D2A  48                dec ax
00000D2B  8946FE            mov [bp-0x2],ax
00000D2E  85C0              test ax,ax
00000D30  75CA              jnz 0xcfc
00000D32  B8AA00            mov ax,0xaa
00000D35  50                push ax
00000D36  B86400            mov ax,0x64
00000D39  50                push ax
00000D3A  E802F8            call word 0x53f
00000D3D  83C404            add sp,byte +0x4
00000D40  B8FFFF            mov ax,0xffff
00000D43  8946FE            mov [bp-0x2],ax
00000D46  EB0D              jmp short 0xd55
00000D48  31C0              xor ax,ax
00000D4A  50                push ax
00000D4B  B88000            mov ax,0x80
00000D4E  50                push ax
00000D4F  E8EDF7            call word 0x53f
00000D52  83C404            add sp,byte +0x4
00000D55  B86400            mov ax,0x64
00000D58  50                push ax
00000D59  E8CDF7            call word 0x529
00000D5C  44                inc sp
00000D5D  44                inc sp
00000D5E  2402              and al,0x2
00000D60  84C0              test al,al
00000D62  740B              jz 0xd6f
00000D64  8B46FE            mov ax,[bp-0x2]
00000D67  48                dec ax
00000D68  8946FE            mov [bp-0x2],ax
00000D6B  85C0              test ax,ax
00000D6D  75D9              jnz 0xd48
00000D6F  8B46FE            mov ax,[bp-0x2]
00000D72  85C0              test ax,ax
00000D74  7508              jnz 0xd7e
00000D76  31C0              xor ax,ax
00000D78  50                push ax
00000D79  E80804            call word 0x1184
00000D7C  44                inc sp
00000D7D  44                inc sp
00000D7E  B8FFFF            mov ax,0xffff
00000D81  8946FE            mov [bp-0x2],ax
00000D84  EB0E              jmp short 0xd94
00000D86  B80100            mov ax,0x1
00000D89  50                push ax
00000D8A  B88000            mov ax,0x80
00000D8D  50                push ax
00000D8E  E8AEF7            call word 0x53f
00000D91  83C404            add sp,byte +0x4
00000D94  B86400            mov ax,0x64
00000D97  50                push ax
00000D98  E88EF7            call word 0x529
00000D9B  44                inc sp
00000D9C  44                inc sp
00000D9D  2401              and al,0x1
00000D9F  84C0              test al,al
00000DA1  750B              jnz 0xdae
00000DA3  8B46FE            mov ax,[bp-0x2]
00000DA6  48                dec ax
00000DA7  8946FE            mov [bp-0x2],ax
00000DAA  85C0              test ax,ax
00000DAC  75D8              jnz 0xd86
00000DAE  8B46FE            mov ax,[bp-0x2]
00000DB1  85C0              test ax,ax
00000DB3  7509              jnz 0xdbe
00000DB5  B80100            mov ax,0x1
00000DB8  50                push ax
00000DB9  E8C803            call word 0x1184
00000DBC  44                inc sp
00000DBD  44                inc sp
00000DBE  B86000            mov ax,0x60
00000DC1  50                push ax
00000DC2  E864F7            call word 0x529
00000DC5  44                inc sp
00000DC6  44                inc sp
00000DC7  3C55              cmp al,0x55
00000DC9  7409              jz 0xdd4
00000DCB  B8DF03            mov ax,0x3df
00000DCE  50                push ax
00000DCF  E8B203            call word 0x1184
00000DD2  44                inc sp
00000DD3  44                inc sp
00000DD4  B8AB00            mov ax,0xab
00000DD7  50                push ax
00000DD8  B86400            mov ax,0x64
00000DDB  50                push ax
00000DDC  E860F7            call word 0x53f
00000DDF  83C404            add sp,byte +0x4
00000DE2  B8FFFF            mov ax,0xffff
00000DE5  8946FE            mov [bp-0x2],ax
00000DE8  EB0E              jmp short 0xdf8
00000DEA  B81000            mov ax,0x10
00000DED  50                push ax
00000DEE  B88000            mov ax,0x80
00000DF1  50                push ax
00000DF2  E84AF7            call word 0x53f
00000DF5  83C404            add sp,byte +0x4
00000DF8  B86400            mov ax,0x64
00000DFB  50                push ax
00000DFC  E82AF7            call word 0x529
00000DFF  44                inc sp
00000E00  44                inc sp
00000E01  2402              and al,0x2
00000E03  84C0              test al,al
00000E05  740B              jz 0xe12
00000E07  8B46FE            mov ax,[bp-0x2]
00000E0A  48                dec ax
00000E0B  8946FE            mov [bp-0x2],ax
00000E0E  85C0              test ax,ax
00000E10  75D8              jnz 0xdea
00000E12  8B46FE            mov ax,[bp-0x2]
00000E15  85C0              test ax,ax
00000E17  7509              jnz 0xe22
00000E19  B80A00            mov ax,0xa
00000E1C  50                push ax
00000E1D  E86403            call word 0x1184
00000E20  44                inc sp
00000E21  44                inc sp
00000E22  B8FFFF            mov ax,0xffff
00000E25  8946FE            mov [bp-0x2],ax
00000E28  EB0E              jmp short 0xe38
00000E2A  B81100            mov ax,0x11
00000E2D  50                push ax
00000E2E  B88000            mov ax,0x80
00000E31  50                push ax
00000E32  E80AF7            call word 0x53f
00000E35  83C404            add sp,byte +0x4
00000E38  B86400            mov ax,0x64
00000E3B  50                push ax
00000E3C  E8EAF6            call word 0x529
00000E3F  44                inc sp
00000E40  44                inc sp
00000E41  2401              and al,0x1
00000E43  84C0              test al,al
00000E45  750B              jnz 0xe52
00000E47  8B46FE            mov ax,[bp-0x2]
00000E4A  48                dec ax
00000E4B  8946FE            mov [bp-0x2],ax
00000E4E  85C0              test ax,ax
00000E50  75D8              jnz 0xe2a
00000E52  8B46FE            mov ax,[bp-0x2]
00000E55  85C0              test ax,ax
00000E57  7509              jnz 0xe62
00000E59  B80B00            mov ax,0xb
00000E5C  50                push ax
00000E5D  E82403            call word 0x1184
00000E60  44                inc sp
00000E61  44                inc sp
00000E62  B86000            mov ax,0x60
00000E65  50                push ax
00000E66  E8C0F6            call word 0x529
00000E69  44                inc sp
00000E6A  44                inc sp
00000E6B  84C0              test al,al
00000E6D  7409              jz 0xe78
00000E6F  B8E003            mov ax,0x3e0
00000E72  50                push ax
00000E73  E80E03            call word 0x1184
00000E76  44                inc sp
00000E77  44                inc sp
00000E78  B8AE00            mov ax,0xae
00000E7B  50                push ax
00000E7C  B86400            mov ax,0x64
00000E7F  50                push ax
00000E80  E8BCF6            call word 0x53f
00000E83  83C404            add sp,byte +0x4
00000E86  B8A800            mov ax,0xa8
00000E89  50                push ax
00000E8A  B86400            mov ax,0x64
00000E8D  50                push ax
00000E8E  E8AEF6            call word 0x53f
00000E91  83C404            add sp,byte +0x4
00000E94  B8FF00            mov ax,0xff
00000E97  50                push ax
00000E98  B86000            mov ax,0x60
00000E9B  50                push ax
00000E9C  E8A0F6            call word 0x53f
00000E9F  83C404            add sp,byte +0x4
00000EA2  B8FFFF            mov ax,0xffff
00000EA5  8946FE            mov [bp-0x2],ax
00000EA8  EB0E              jmp short 0xeb8
00000EAA  B82000            mov ax,0x20
00000EAD  50                push ax
00000EAE  B88000            mov ax,0x80
00000EB1  50                push ax
00000EB2  E88AF6            call word 0x53f
00000EB5  83C404            add sp,byte +0x4
00000EB8  B86400            mov ax,0x64
00000EBB  50                push ax
00000EBC  E86AF6            call word 0x529
00000EBF  44                inc sp
00000EC0  44                inc sp
00000EC1  2402              and al,0x2
00000EC3  84C0              test al,al
00000EC5  740B              jz 0xed2
00000EC7  8B46FE            mov ax,[bp-0x2]
00000ECA  48                dec ax
00000ECB  8946FE            mov [bp-0x2],ax
00000ECE  85C0              test ax,ax
00000ED0  75D8              jnz 0xeaa
00000ED2  8B46FE            mov ax,[bp-0x2]
00000ED5  85C0              test ax,ax
00000ED7  7509              jnz 0xee2
00000ED9  B81400            mov ax,0x14
00000EDC  50                push ax
00000EDD  E8A402            call word 0x1184
00000EE0  44                inc sp
00000EE1  44                inc sp
00000EE2  B8FFFF            mov ax,0xffff
00000EE5  8946FE            mov [bp-0x2],ax
00000EE8  EB0E              jmp short 0xef8
00000EEA  B82100            mov ax,0x21
00000EED  50                push ax
00000EEE  B88000            mov ax,0x80
00000EF1  50                push ax
00000EF2  E84AF6            call word 0x53f
00000EF5  83C404            add sp,byte +0x4
00000EF8  B86400            mov ax,0x64
00000EFB  50                push ax
00000EFC  E82AF6            call word 0x529
00000EFF  44                inc sp
00000F00  44                inc sp
00000F01  2401              and al,0x1
00000F03  84C0              test al,al
00000F05  750B              jnz 0xf12
00000F07  8B46FE            mov ax,[bp-0x2]
00000F0A  48                dec ax
00000F0B  8946FE            mov [bp-0x2],ax
00000F0E  85C0              test ax,ax
00000F10  75D8              jnz 0xeea
00000F12  8B46FE            mov ax,[bp-0x2]
00000F15  85C0              test ax,ax
00000F17  7509              jnz 0xf22
00000F19  B81500            mov ax,0x15
00000F1C  50                push ax
00000F1D  E86402            call word 0x1184
00000F20  44                inc sp
00000F21  44                inc sp
00000F22  B86000            mov ax,0x60
00000F25  50                push ax
00000F26  E800F6            call word 0x529
00000F29  44                inc sp
00000F2A  44                inc sp
00000F2B  3CFA              cmp al,0xfa
00000F2D  7409              jz 0xf38
00000F2F  B8E103            mov ax,0x3e1
00000F32  50                push ax
00000F33  E84E02            call word 0x1184
00000F36  44                inc sp
00000F37  44                inc sp
00000F38  B8FFFF            mov ax,0xffff
00000F3B  8946FE            mov [bp-0x2],ax
00000F3E  EB0E              jmp short 0xf4e
00000F40  B83100            mov ax,0x31
00000F43  50                push ax
00000F44  B88000            mov ax,0x80
00000F47  50                push ax
00000F48  E8F4F5            call word 0x53f
00000F4B  83C404            add sp,byte +0x4
00000F4E  B86400            mov ax,0x64
00000F51  50                push ax
00000F52  E8D4F5            call word 0x529
00000F55  44                inc sp
00000F56  44                inc sp
00000F57  2401              and al,0x1
00000F59  84C0              test al,al
00000F5B  750B              jnz 0xf68
00000F5D  8B46FE            mov ax,[bp-0x2]
00000F60  48                dec ax
00000F61  8946FE            mov [bp-0x2],ax
00000F64  85C0              test ax,ax
00000F66  75D8              jnz 0xf40
00000F68  8B46FE            mov ax,[bp-0x2]
00000F6B  85C0              test ax,ax
00000F6D  7509              jnz 0xf78
00000F6F  B81F00            mov ax,0x1f
00000F72  50                push ax
00000F73  E80E02            call word 0x1184
00000F76  44                inc sp
00000F77  44                inc sp
00000F78  B86000            mov ax,0x60
00000F7B  50                push ax
00000F7C  E8AAF5            call word 0x529
00000F7F  44                inc sp
00000F80  44                inc sp
00000F81  3CAA              cmp al,0xaa
00000F83  7409              jz 0xf8e
00000F85  B8E203            mov ax,0x3e2
00000F88  50                push ax
00000F89  E8F801            call word 0x1184
00000F8C  44                inc sp
00000F8D  44                inc sp
00000F8E  B8F500            mov ax,0xf5
00000F91  50                push ax
00000F92  B86000            mov ax,0x60
00000F95  50                push ax
00000F96  E8A6F5            call word 0x53f
00000F99  83C404            add sp,byte +0x4
00000F9C  B8FFFF            mov ax,0xffff
00000F9F  8946FE            mov [bp-0x2],ax
00000FA2  EB0E              jmp short 0xfb2
00000FA4  B84000            mov ax,0x40
00000FA7  50                push ax
00000FA8  B88000            mov ax,0x80
00000FAB  50                push ax
00000FAC  E890F5            call word 0x53f
00000FAF  83C404            add sp,byte +0x4
00000FB2  B86400            mov ax,0x64
00000FB5  50                push ax
00000FB6  E870F5            call word 0x529
00000FB9  44                inc sp
00000FBA  44                inc sp
00000FBB  2402              and al,0x2
00000FBD  84C0              test al,al
00000FBF  740B              jz 0xfcc
00000FC1  8B46FE            mov ax,[bp-0x2]
00000FC4  48                dec ax
00000FC5  8946FE            mov [bp-0x2],ax
00000FC8  85C0              test ax,ax
00000FCA  75D8              jnz 0xfa4
00000FCC  8B46FE            mov ax,[bp-0x2]
00000FCF  85C0              test ax,ax
00000FD1  7509              jnz 0xfdc
00000FD3  B82800            mov ax,0x28
00000FD6  50                push ax
00000FD7  E8AA01            call word 0x1184
00000FDA  44                inc sp
00000FDB  44                inc sp
00000FDC  B8FFFF            mov ax,0xffff
00000FDF  8946FE            mov [bp-0x2],ax
00000FE2  EB0E              jmp short 0xff2
00000FE4  B84100            mov ax,0x41
00000FE7  50                push ax
00000FE8  B88000            mov ax,0x80
00000FEB  50                push ax
00000FEC  E850F5            call word 0x53f
00000FEF  83C404            add sp,byte +0x4
00000FF2  B86400            mov ax,0x64
00000FF5  50                push ax
00000FF6  E830F5            call word 0x529
00000FF9  44                inc sp
00000FFA  44                inc sp
00000FFB  2401              and al,0x1
00000FFD  84C0              test al,al
00000FFF  750B              jnz 0x100c
00001001  8B46FE            mov ax,[bp-0x2]
00001004  48                dec ax
00001005  8946FE            mov [bp-0x2],ax
00001008  85C0              test ax,ax
0000100A  75D8              jnz 0xfe4
0000100C  8B46FE            mov ax,[bp-0x2]
0000100F  85C0              test ax,ax
00001011  7509              jnz 0x101c
00001013  B82900            mov ax,0x29
00001016  50                push ax
00001017  E86A01            call word 0x1184
0000101A  44                inc sp
0000101B  44                inc sp
0000101C  B86000            mov ax,0x60
0000101F  50                push ax
00001020  E806F5            call word 0x529
00001023  44                inc sp
00001024  44                inc sp
00001025  3CFA              cmp al,0xfa
00001027  7409              jz 0x1032
00001029  B8E303            mov ax,0x3e3
0000102C  50                push ax
0000102D  E85401            call word 0x1184
00001030  44                inc sp
00001031  44                inc sp
00001032  B86000            mov ax,0x60
00001035  50                push ax
00001036  B86400            mov ax,0x64
00001039  50                push ax
0000103A  E802F5            call word 0x53f
0000103D  83C404            add sp,byte +0x4
00001040  B8FFFF            mov ax,0xffff
00001043  8946FE            mov [bp-0x2],ax
00001046  EB0E              jmp short 0x1056
00001048  B85000            mov ax,0x50
0000104B  50                push ax
0000104C  B88000            mov ax,0x80
0000104F  50                push ax
00001050  E8ECF4            call word 0x53f
00001053  83C404            add sp,byte +0x4
00001056  B86400            mov ax,0x64
00001059  50                push ax
0000105A  E8CCF4            call word 0x529
0000105D  44                inc sp
0000105E  44                inc sp
0000105F  2402              and al,0x2
00001061  84C0              test al,al
00001063  740B              jz 0x1070
00001065  8B46FE            mov ax,[bp-0x2]
00001068  48                dec ax
00001069  8946FE            mov [bp-0x2],ax
0000106C  85C0              test ax,ax
0000106E  75D8              jnz 0x1048
00001070  8B46FE            mov ax,[bp-0x2]
00001073  85C0              test ax,ax
00001075  7509              jnz 0x1080
00001077  B83200            mov ax,0x32
0000107A  50                push ax
0000107B  E80601            call word 0x1184
0000107E  44                inc sp
0000107F  44                inc sp
00001080  B86100            mov ax,0x61
00001083  50                push ax
00001084  B86000            mov ax,0x60
00001087  50                push ax
00001088  E8B4F4            call word 0x53f
0000108B  83C404            add sp,byte +0x4
0000108E  B8FFFF            mov ax,0xffff
00001091  8946FE            mov [bp-0x2],ax
00001094  EB0E              jmp short 0x10a4
00001096  B86000            mov ax,0x60
00001099  50                push ax
0000109A  B88000            mov ax,0x80
0000109D  50                push ax
0000109E  E89EF4            call word 0x53f
000010A1  83C404            add sp,byte +0x4
000010A4  B86400            mov ax,0x64
000010A7  50                push ax
000010A8  E87EF4            call word 0x529
000010AB  44                inc sp
000010AC  44                inc sp
000010AD  2402              and al,0x2
000010AF  84C0              test al,al
000010B1  740B              jz 0x10be
000010B3  8B46FE            mov ax,[bp-0x2]
000010B6  48                dec ax
000010B7  8946FE            mov [bp-0x2],ax
000010BA  85C0              test ax,ax
000010BC  75D8              jnz 0x1096
000010BE  8B46FE            mov ax,[bp-0x2]
000010C1  85C0              test ax,ax
000010C3  7509              jnz 0x10ce
000010C5  B83C00            mov ax,0x3c
000010C8  50                push ax
000010C9  E8B800            call word 0x1184
000010CC  44                inc sp
000010CD  44                inc sp
000010CE  B8F400            mov ax,0xf4
000010D1  50                push ax
000010D2  B86000            mov ax,0x60
000010D5  50                push ax
000010D6  E866F4            call word 0x53f
000010D9  83C404            add sp,byte +0x4
000010DC  B8FFFF            mov ax,0xffff
000010DF  8946FE            mov [bp-0x2],ax
000010E2  EB0E              jmp short 0x10f2
000010E4  B87000            mov ax,0x70
000010E7  50                push ax
000010E8  B88000            mov ax,0x80
000010EB  50                push ax
000010EC  E850F4            call word 0x53f
000010EF  83C404            add sp,byte +0x4
000010F2  B86400            mov ax,0x64
000010F5  50                push ax
000010F6  E830F4            call word 0x529
000010F9  44                inc sp
000010FA  44                inc sp
000010FB  2402              and al,0x2
000010FD  84C0              test al,al
000010FF  740B              jz 0x110c
00001101  8B46FE            mov ax,[bp-0x2]
00001104  48                dec ax
00001105  8946FE            mov [bp-0x2],ax
00001108  85C0              test ax,ax
0000110A  75D8              jnz 0x10e4
0000110C  8B46FE            mov ax,[bp-0x2]
0000110F  85C0              test ax,ax
00001111  7509              jnz 0x111c
00001113  B84600            mov ax,0x46
00001116  50                push ax
00001117  E86A00            call word 0x1184
0000111A  44                inc sp
0000111B  44                inc sp
0000111C  B8FFFF            mov ax,0xffff
0000111F  8946FE            mov [bp-0x2],ax
00001122  EB0E              jmp short 0x1132
00001124  B87100            mov ax,0x71
00001127  50                push ax
00001128  B88000            mov ax,0x80
0000112B  50                push ax
0000112C  E810F4            call word 0x53f
0000112F  83C404            add sp,byte +0x4
00001132  B86400            mov ax,0x64
00001135  50                push ax
00001136  E8F0F3            call word 0x529
00001139  44                inc sp
0000113A  44                inc sp
0000113B  2401              and al,0x1
0000113D  84C0              test al,al
0000113F  750B              jnz 0x114c
00001141  8B46FE            mov ax,[bp-0x2]
00001144  48                dec ax
00001145  8946FE            mov [bp-0x2],ax
00001148  85C0              test ax,ax
0000114A  75D8              jnz 0x1124
0000114C  8B46FE            mov ax,[bp-0x2]
0000114F  85C0              test ax,ax
00001151  7509              jnz 0x115c
00001153  B84600            mov ax,0x46
00001156  50                push ax
00001157  E82A00            call word 0x1184
0000115A  44                inc sp
0000115B  44                inc sp
0000115C  B86000            mov ax,0x60
0000115F  50                push ax
00001160  E8C6F3            call word 0x529
00001163  44                inc sp
00001164  44                inc sp
00001165  3CFA              cmp al,0xfa
00001167  7409              jz 0x1172
00001169  B8E403            mov ax,0x3e4
0000116C  50                push ax
0000116D  E81400            call word 0x1184
00001170  44                inc sp
00001171  44                inc sp
00001172  B87700            mov ax,0x77
00001175  50                push ax
00001176  B88000            mov ax,0x80
00001179  50                push ax
0000117A  E8C2F3            call word 0x53f
0000117D  83C404            add sp,byte +0x4
00001180  89EC              mov sp,bp
00001182  5D                pop bp
00001183  C3                ret
00001184  55                push bp
00001185  89E5              mov bp,sp
00001187  FF7604            push word [bp+0x4]
0000118A  BBD7D9            mov bx,0xd9d7
0000118D  53                push bx
0000118E  B80700            mov ax,0x7
00001191  50                push ax
00001192  E895F7            call word 0x92a
00001195  89EC              mov sp,bp
00001197  5D                pop bp
00001198  C3                ret
00001199  55                push bp
0000119A  89E5              mov bp,sp
0000119C  8A4604            mov al,[bp+0x4]
0000119F  30E4              xor ah,ah
000011A1  50                push ax
000011A2  BBB2D9            mov bx,0xd9b2
000011A5  53                push bx
000011A6  B80700            mov ax,0x7
000011A9  50                push ax
000011AA  E87DF7            call word 0x92a
000011AD  89EC              mov sp,bp
000011AF  5D                pop bp
000011B0  C3                ret
000011B1  55                push bp
000011B2  89E5              mov bp,sp
000011B4  BB98D9            mov bx,0xd998
000011B7  53                push bx
000011B8  B80700            mov ax,0x7
000011BB  50                push ax
000011BC  E86BF7            call word 0x92a
000011BF  89EC              mov sp,bp
000011C1  5D                pop bp
000011C2  C3                ret
000011C3  55                push bp
000011C4  89E5              mov bp,sp
000011C6  BB6501            mov bx,0x165
000011C9  53                push bx
000011CA  BB6BD9            mov bx,0xd96b
000011CD  53                push bx
000011CE  BB74D9            mov bx,0xd974
000011D1  53                push bx
000011D2  B80200            mov ax,0x2
000011D5  50                push ax
000011D6  E851F7            call word 0x92a
000011D9  89EC              mov sp,bp
000011DB  BB3DD9            mov bx,0xd93d
000011DE  53                push bx
000011DF  B80200            mov ax,0x2
000011E2  50                push ax
000011E3  E844F7            call word 0x92a
000011E6  89EC              mov sp,bp
000011E8  5D                pop bp
000011E9  C3                ret
000011EA  0000              add [bx+si],al
000011EC  0000              add [bx+si],al
000011EE  0000              add [bx+si],al
000011F0  0000              add [bx+si],al
000011F2  0000              add [bx+si],al
000011F4  46                inc si
000011F5  6C                insb
000011F6  6F                outsw
000011F7  7070              jo 0x1269
000011F9  7900              jns 0x11fb
000011FB  0000              add [bx+si],al
000011FD  004861            add [bx+si+0x61],cl
00001200  7264              jc 0x1266
00001202  204469            and [si+0x69],al
00001205  736B              jnc 0x1272
00001207  004344            add [bp+di+0x44],al
0000120A  2D526F            sub ax,0x6f52
0000120D  6D                insw
0000120E  0000              add [bx+si],al
00001210  0000              add [bx+si],al
00001212  4E                dec si
00001213  657477            gs jz 0x128d
00001216  6F                outsw
00001217  726B              jc 0x1284
00001219  0000              add [bx+si],al
0000121B  005589            add [di-0x77],dl
0000121E  E583              in ax,0x83
00001220  C4                db 0xc4
00001221  EE                out dx,al
00001222  31C0              xor ax,ax
00001224  8946EE            mov [bp-0x12],ax
00001227  4C                dec sp
00001228  4C                dec sp
00001229  E82EF4            call word 0x65a
0000122C  8946EC            mov [bp-0x14],ax
0000122F  1E                push ds
00001230  B8F09F            mov ax,0x9ff0
00001233  50                push ax
00001234  E826F4            call word 0x65d
00001237  44                inc sp
00001238  44                inc sp
00001239  B88600            mov ax,0x86
0000123C  50                push ax
0000123D  B8F09F            mov ax,0x9ff0
00001240  50                push ax
00001241  31C0              xor ax,ax
00001243  50                push ax
00001244  31C0              xor ax,ax
00001246  50                push ax
00001247  E8B6ED            call word 0x0
0000124A  83C408            add sp,byte +0x8
0000124D  B8FFFF            mov ax,0xffff
00001250  A38400            mov [0x84],ax
00001253  B80100            mov ax,0x1
00001256  8946F0            mov [bp-0x10],ax
00001259  31C0              xor ax,ax
0000125B  8946F2            mov [bp-0xe],ax
0000125E  31C0              xor ax,ax
00001260  31DB              xor bx,bx
00001262  8946F4            mov [bp-0xc],ax
00001265  895EF6            mov [bp-0xa],bx
00001268  31C0              xor ax,ax
0000126A  31DB              xor bx,bx
0000126C  8946F8            mov [bp-0x8],ax
0000126F  895EFA            mov [bp-0x6],bx
00001272  31C0              xor ax,ax
00001274  31DB              xor bx,bx
00001276  8946FC            mov [bp-0x4],ax
00001279  895EFE            mov [bp-0x2],bx
0000127C  B81000            mov ax,0x10
0000127F  50                push ax
00001280  FF76EC            push word [bp-0x14]
00001283  8D5EF0            lea bx,[bp-0x10]
00001286  53                push bx
00001287  B8F09F            mov ax,0x9ff0
0000128A  50                push ax
0000128B  8B46EE            mov ax,[bp-0x12]
0000128E  B104              mov cl,0x4
00001290  D3E0              shl ax,cl
00001292  50                push ax
00001293  E885ED            call word 0x1b
00001296  83C40A            add sp,byte +0xa
00001299  8B46EE            mov ax,[bp-0x12]
0000129C  40                inc ax
0000129D  8946EE            mov [bp-0x12],ax
000012A0  B80200            mov ax,0x2
000012A3  8946F0            mov [bp-0x10],ax
000012A6  31C0              xor ax,ax
000012A8  8946F2            mov [bp-0xe],ax
000012AB  31C0              xor ax,ax
000012AD  31DB              xor bx,bx
000012AF  8946F4            mov [bp-0xc],ax
000012B2  895EF6            mov [bp-0xa],bx
000012B5  31C0              xor ax,ax
000012B7  31DB              xor bx,bx
000012B9  8946F8            mov [bp-0x8],ax
000012BC  895EFA            mov [bp-0x6],bx
000012BF  31C0              xor ax,ax
000012C1  31DB              xor bx,bx
000012C3  8946FC            mov [bp-0x4],ax
000012C6  895EFE            mov [bp-0x2],bx
000012C9  B81000            mov ax,0x10
000012CC  50                push ax
000012CD  FF76EC            push word [bp-0x14]
000012D0  8D5EF0            lea bx,[bp-0x10]
000012D3  53                push bx
000012D4  B8F09F            mov ax,0x9ff0
000012D7  50                push ax
000012D8  8B46EE            mov ax,[bp-0x12]
000012DB  B104              mov cl,0x4
000012DD  D3E0              shl ax,cl
000012DF  50                push ax
000012E0  E838ED            call word 0x1b
000012E3  83C40A            add sp,byte +0xa
000012E6  8B46EE            mov ax,[bp-0x12]
000012E9  40                inc ax
000012EA  8946EE            mov [bp-0x12],ax
000012ED  B80300            mov ax,0x3
000012F0  8946F0            mov [bp-0x10],ax
000012F3  31C0              xor ax,ax
000012F5  8946F2            mov [bp-0xe],ax
000012F8  31C0              xor ax,ax
000012FA  31DB              xor bx,bx
000012FC  8946F4            mov [bp-0xc],ax
000012FF  895EF6            mov [bp-0xa],bx
00001302  31C0              xor ax,ax
00001304  31DB              xor bx,bx
00001306  8946F8            mov [bp-0x8],ax
00001309  895EFA            mov [bp-0x6],bx
0000130C  31C0              xor ax,ax
0000130E  31DB              xor bx,bx
00001310  8946FC            mov [bp-0x4],ax
00001313  895EFE            mov [bp-0x2],bx
00001316  B81000            mov ax,0x10
00001319  50                push ax
0000131A  FF76EC            push word [bp-0x14]
0000131D  8D5EF0            lea bx,[bp-0x10]
00001320  53                push bx
00001321  B8F09F            mov ax,0x9ff0
00001324  50                push ax
00001325  8B46EE            mov ax,[bp-0x12]
00001328  B104              mov cl,0x4
0000132A  D3E0              shl ax,cl
0000132C  50                push ax
0000132D  E8EBEC            call word 0x1b
00001330  83C40A            add sp,byte +0xa
00001333  8B46EE            mov ax,[bp-0x12]
00001336  40                inc ax
00001337  8946EE            mov [bp-0x12],ax
0000133A  8B46EE            mov ax,[bp-0x12]
0000133D  A38000            mov [0x80],ax
00001340  B8FFFF            mov ax,0xffff
00001343  A38200            mov [0x82],ax
00001346  1F                pop ds
00001347  89EC              mov sp,bp
00001349  5D                pop bp
0000134A  C3                ret
0000134B  55                push bp
0000134C  89E5              mov bp,sp
0000134E  83C4FC            add sp,byte -0x4
00001351  E806F3            call word 0x65a
00001354  8946FC            mov [bp-0x4],ax
00001357  B8F09F            mov ax,0x9ff0
0000135A  50                push ax
0000135B  B88000            mov ax,0x80
0000135E  50                push ax
0000135F  E88BF2            call word 0x5ed
00001362  83C404            add sp,byte +0x4
00001365  8946FE            mov [bp-0x2],ax
00001368  8B4604            mov ax,[bp+0x4]
0000136B  3B46FE            cmp ax,[bp-0x2]
0000136E  7206              jc 0x1376
00001370  30C0              xor al,al
00001372  89EC              mov sp,bp
00001374  5D                pop bp
00001375  C3                ret
00001376  B81000            mov ax,0x10
00001379  50                push ax
0000137A  B8F09F            mov ax,0x9ff0
0000137D  50                push ax
0000137E  8B4604            mov ax,[bp+0x4]
00001381  B104              mov cl,0x4
00001383  D3E0              shl ax,cl
00001385  50                push ax
00001386  FF76FC            push word [bp-0x4]
00001389  FF7606            push word [bp+0x6]
0000138C  E88CEC            call word 0x1b
0000138F  83C40A            add sp,byte +0xa
00001392  B001              mov al,0x1
00001394  89EC              mov sp,bp
00001396  5D                pop bp
00001397  C3                ret
00001398  55                push bp
00001399  89E5              mov bp,sp
0000139B  83C4C8            add sp,byte -0x38
0000139E  E8B9F2            call word 0x65a
000013A1  8946C8            mov [bp-0x38],ax
000013A4  4C                dec sp
000013A5  4C                dec sp
000013A6  31C0              xor ax,ax
000013A8  8946C6            mov [bp-0x3a],ax
000013AB  EB03              jmp short 0x13b0
000013AD  E841F5            call word 0x8f1
000013B0  E830F5            call word 0x8e3
000013B3  84C0              test al,al
000013B5  75F6              jnz 0x13ad
000013B7  BB22D9            mov bx,0xd922
000013BA  53                push bx
000013BB  B80200            mov ax,0x2
000013BE  50                push ax
000013BF  E868F5            call word 0x92a
000013C2  83C404            add sp,byte +0x4
000013C5  B80500            mov ax,0x5
000013C8  50                push ax
000013C9  B80B00            mov ax,0xb
000013CC  50                push ax
000013CD  E829F5            call word 0x8f9
000013D0  83C404            add sp,byte +0x4
000013D3  E80DF5            call word 0x8e3
000013D6  84C0              test al,al
000013D8  0F84B101          jz word 0x158d
000013DC  E812F5            call word 0x8f1
000013DF  8846CC            mov [bp-0x34],al
000013E2  8A46CC            mov al,[bp-0x34]
000013E5  3C86              cmp al,0x86
000013E7  0F85A201          jnz word 0x158d
000013EB  EB03              jmp short 0x13f0
000013ED  E801F5            call word 0x8f1
000013F0  E8F0F4            call word 0x8e3
000013F3  84C0              test al,al
000013F5  75F6              jnz 0x13ed
000013F7  BB0CD9            mov bx,0xd90c
000013FA  53                push bx
000013FB  B80200            mov ax,0x2
000013FE  50                push ax
000013FF  E828F5            call word 0x92a
00001402  83C404            add sp,byte +0x4
00001405  B8F09F            mov ax,0x9ff0
00001408  50                push ax
00001409  B88000            mov ax,0x80
0000140C  50                push ax
0000140D  E8DDF1            call word 0x5ed
00001410  83C404            add sp,byte +0x4
00001413  8946EE            mov [bp-0x12],ax
00001416  30C0              xor al,al
00001418  8846CB            mov [bp-0x35],al
0000141B  E9FC00            jmp word 0x151a
0000141E  B81000            mov ax,0x10
00001421  50                push ax
00001422  B8F09F            mov ax,0x9ff0
00001425  50                push ax
00001426  8A46CB            mov al,[bp-0x35]
00001429  30E4              xor ah,ah
0000142B  B104              mov cl,0x4
0000142D  D3E0              shl ax,cl
0000142F  50                push ax
00001430  FF76C8            push word [bp-0x38]
00001433  8D5EF0            lea bx,[bp-0x10]
00001436  53                push bx
00001437  E8E1EB            call word 0x1b
0000143A  83C40A            add sp,byte +0xa
0000143D  8A46CB            mov al,[bp-0x35]
00001440  30E4              xor ah,ah
00001442  40                inc ax
00001443  50                push ax
00001444  BB07D9            mov bx,0xd907
00001447  53                push bx
00001448  B80200            mov ax,0x2
0000144B  50                push ax
0000144C  E8DBF4            call word 0x92a
0000144F  83C406            add sp,byte +0x6
00001452  8B46F0            mov ax,[bp-0x10]
00001455  E99F00            jmp word 0x14f7
00001458  8B5EF0            mov bx,[bp-0x10]
0000145B  89DA              mov dx,bx
0000145D  D1E3              shl bx,1
0000145F  D1E3              shl bx,1
00001461  01D3              add bx,dx
00001463  D1E3              shl bx,1
00001465  81C3EA11          add bx,0x11ea
00001469  53                push bx
0000146A  BB03D9            mov bx,0xd903
0000146D  53                push bx
0000146E  B80200            mov ax,0x2
00001471  50                push ax
00001472  E8B5F4            call word 0x92a
00001475  83C406            add sp,byte +0x6
00001478  E99800            jmp word 0x1513
0000147B  BB1212            mov bx,0x1212
0000147E  53                push bx
0000147F  BB00D9            mov bx,0xd900
00001482  53                push bx
00001483  B80200            mov ax,0x2
00001486  50                push ax
00001487  E8A0F4            call word 0x92a
0000148A  83C406            add sp,byte +0x6
0000148D  31C0              xor ax,ax
0000148F  31DB              xor bx,bx
00001491  53                push bx
00001492  50                push ax
00001493  8B46F8            mov ax,[bp-0x8]
00001496  8B5EFA            mov bx,[bp-0x6]
00001499  8D7EC2            lea di,[bp-0x3e]
0000149C  E8FDEB            call word 0x9c
0000149F  8D66C6            lea sp,[bp-0x3a]
000014A2  7441              jz 0x14e5
000014A4  B82000            mov ax,0x20
000014A7  50                push ax
000014A8  8B46F8            mov ax,[bp-0x8]
000014AB  8B5EFA            mov bx,[bp-0x6]
000014AE  93                xchg ax,bx
000014AF  31DB              xor bx,bx
000014B1  50                push ax
000014B2  B8FFFF            mov ax,0xffff
000014B5  31DB              xor bx,bx
000014B7  8D7EF8            lea di,[bp-0x8]
000014BA  E8CFEB            call word 0x8c
000014BD  50                push ax
000014BE  FF76C8            push word [bp-0x38]
000014C1  8D5ECD            lea bx,[bp-0x33]
000014C4  53                push bx
000014C5  E853EB            call word 0x1b
000014C8  83C40A            add sp,byte +0xa
000014CB  30C0              xor al,al
000014CD  8846ED            mov [bp-0x13],al
000014D0  8D5ECD            lea bx,[bp-0x33]
000014D3  53                push bx
000014D4  FF76C8            push word [bp-0x38]
000014D7  BBFAD8            mov bx,0xd8fa
000014DA  53                push bx
000014DB  B80200            mov ax,0x2
000014DE  50                push ax
000014DF  E848F4            call word 0x92a
000014E2  83C408            add sp,byte +0x8
000014E5  BBF8D8            mov bx,0xd8f8
000014E8  53                push bx
000014E9  B80200            mov ax,0x2
000014EC  50                push ax
000014ED  E83AF4            call word 0x92a
000014F0  83C404            add sp,byte +0x4
000014F3  EB1E              jmp short 0x1513
000014F5  EB1C              jmp short 0x1513
000014F7  2D0100            sub ax,0x1
000014FA  0F845AFF          jz word 0x1458
000014FE  2D0100            sub ax,0x1
00001501  0F8453FF          jz word 0x1458
00001505  2D0100            sub ax,0x1
00001508  0F844CFF          jz word 0x1458
0000150C  2D7D00            sub ax,0x7d
0000150F  0F8468FF          jz word 0x147b
00001513  8A46CB            mov al,[bp-0x35]
00001516  40                inc ax
00001517  8846CB            mov [bp-0x35],al
0000151A  8A46CB            mov al,[bp-0x35]
0000151D  30E4              xor ah,ah
0000151F  3B46EE            cmp ax,[bp-0x12]
00001522  0F82F8FE          jc word 0x141e
00001526  8B46EE            mov ax,[bp-0x12]
00001529  40                inc ax
0000152A  8946EE            mov [bp-0x12],ax
0000152D  EB49              jmp short 0x1578
0000152F  E8BFF3            call word 0x8f1
00001532  8846CC            mov [bp-0x34],al
00001535  8A46CC            mov al,[bp-0x34]
00001538  3C01              cmp al,0x1
0000153A  7407              jz 0x1543
0000153C  8A46CC            mov al,[bp-0x34]
0000153F  3C58              cmp al,0x58
00001541  7508              jnz 0x154b
00001543  B80100            mov ax,0x1
00001546  8946C6            mov [bp-0x3a],ax
00001549  EB2D              jmp short 0x1578
0000154B  8A46CC            mov al,[bp-0x34]
0000154E  30E4              xor ah,ah
00001550  3B46EE            cmp ax,[bp-0x12]
00001553  7723              ja 0x1578
00001555  B80100            mov ax,0x1
00001558  8946C6            mov [bp-0x3a],ax
0000155B  8A46CC            mov al,[bp-0x34]
0000155E  30E4              xor ah,ah
00001560  48                dec ax
00001561  8846CC            mov [bp-0x34],al
00001564  B8F09F            mov ax,0x9ff0
00001567  50                push ax
00001568  B88400            mov ax,0x84
0000156B  50                push ax
0000156C  8A46CC            mov al,[bp-0x34]
0000156F  30E4              xor ah,ah
00001571  50                push ax
00001572  E899F0            call word 0x60e
00001575  83C406            add sp,byte +0x6
00001578  8B46C6            mov ax,[bp-0x3a]
0000157B  85C0              test ax,ax
0000157D  74B0              jz 0x152f
0000157F  BBF6D8            mov bx,0xd8f6
00001582  53                push bx
00001583  B80200            mov ax,0x2
00001586  50                push ax
00001587  E8A0F3            call word 0x92a
0000158A  83C404            add sp,byte +0x4
0000158D  89EC              mov sp,bp
0000158F  5D                pop bp
00001590  C3                ret
00001591  55                push bp
00001592  89E5              mov bp,sp
00001594  83C4DA            add sp,byte -0x26
00001597  E8C0F0            call word 0x65a
0000159A  8946DA            mov [bp-0x26],ax
0000159D  8B5E04            mov bx,[bp+0x4]
000015A0  8B1F              mov bx,[bx]
000015A2  895EFE            mov [bp-0x2],bx
000015A5  8B46FE            mov ax,[bp-0x2]
000015A8  3D8000            cmp ax,0x80
000015AB  7506              jnz 0x15b3
000015AD  B80400            mov ax,0x4
000015B0  8946FE            mov [bp-0x2],ax
000015B3  8B46FE            mov ax,[bp-0x2]
000015B6  85C0              test ax,ax
000015B8  7408              jz 0x15c2
000015BA  8B46FE            mov ax,[bp-0x2]
000015BD  3D0400            cmp ax,0x4
000015C0  760E              jna 0x15d0
000015C2  BBE6D8            mov bx,0xd8e6
000015C5  53                push bx
000015C6  B80700            mov ax,0x7
000015C9  50                push ax
000015CA  E85DF3            call word 0x92a
000015CD  83C404            add sp,byte +0x4
000015D0  8B5EFE            mov bx,[bp-0x2]
000015D3  89DA              mov dx,bx
000015D5  D1E3              shl bx,1
000015D7  D1E3              shl bx,1
000015D9  01D3              add bx,dx
000015DB  D1E3              shl bx,1
000015DD  81C3EA11          add bx,0x11ea
000015E1  53                push bx
000015E2  BBD6D8            mov bx,0xd8d6
000015E5  53                push bx
000015E6  B80200            mov ax,0x2
000015E9  50                push ax
000015EA  E83DF3            call word 0x92a
000015ED  83C406            add sp,byte +0x6
000015F0  8B46FE            mov ax,[bp-0x2]
000015F3  3D0400            cmp ax,0x4
000015F6  756A              jnz 0x1662
000015F8  8B5E04            mov bx,[bp+0x4]
000015FB  31C0              xor ax,ax
000015FD  31F6              xor si,si
000015FF  56                push si
00001600  50                push ax
00001601  8B4708            mov ax,[bx+0x8]
00001604  8B5F0A            mov bx,[bx+0xa]
00001607  8D7ED6            lea di,[bp-0x2a]
0000160A  E88FEA            call word 0x9c
0000160D  8D66DA            lea sp,[bp-0x26]
00001610  7450              jz 0x1662
00001612  B82000            mov ax,0x20
00001615  50                push ax
00001616  8B5E04            mov bx,[bp+0x4]
00001619  8B4708            mov ax,[bx+0x8]
0000161C  8B5F0A            mov bx,[bx+0xa]
0000161F  93                xchg ax,bx
00001620  31DB              xor bx,bx
00001622  50                push ax
00001623  8B5E04            mov bx,[bp+0x4]
00001626  FF770A            push word [bx+0xa]
00001629  FF7708            push word [bx+0x8]
0000162C  B8FFFF            mov ax,0xffff
0000162F  31DB              xor bx,bx
00001631  8D7ED2            lea di,[bp-0x2e]
00001634  E855EA            call word 0x8c
00001637  83C404            add sp,byte +0x4
0000163A  50                push ax
0000163B  FF76DA            push word [bp-0x26]
0000163E  8D5EDD            lea bx,[bp-0x23]
00001641  53                push bx
00001642  E8D6E9            call word 0x1b
00001645  83C40A            add sp,byte +0xa
00001648  30C0              xor al,al
0000164A  8846FD            mov [bp-0x3],al
0000164D  8D5EDD            lea bx,[bp-0x23]
00001650  53                push bx
00001651  FF76DA            push word [bp-0x26]
00001654  BBD0D8            mov bx,0xd8d0
00001657  53                push bx
00001658  B80200            mov ax,0x2
0000165B  50                push ax
0000165C  E8CBF2            call word 0x92a
0000165F  83C408            add sp,byte +0x8
00001662  BBCBD8            mov bx,0xd8cb
00001665  53                push bx
00001666  B80200            mov ax,0x2
00001669  50                push ax
0000166A  E8BDF2            call word 0x92a
0000166D  83C404            add sp,byte +0x4
00001670  89EC              mov sp,bp
00001672  5D                pop bp
00001673  C3                ret
00001674  55                push bp
00001675  89E5              mov bp,sp
00001677  8B4604            mov ax,[bp+0x4]
0000167A  85C0              test ax,ax
0000167C  7408              jz 0x1686
0000167E  8B4604            mov ax,[bp+0x4]
00001681  3D0300            cmp ax,0x3
00001684  760D              jna 0x1693
00001686  BBBBD8            mov bx,0xd8bb
00001689  53                push bx
0000168A  B80700            mov ax,0x7
0000168D  50                push ax
0000168E  E899F2            call word 0x92a
00001691  89EC              mov sp,bp
00001693  BBAFD8            mov bx,0xd8af
00001696  53                push bx
00001697  B80200            mov ax,0x2
0000169A  50                push ax
0000169B  E88CF2            call word 0x92a
0000169E  89EC              mov sp,bp
000016A0  8B4604            mov ax,[bp+0x4]
000016A3  3D0400            cmp ax,0x4
000016A6  7323              jnc 0x16cb
000016A8  8A4606            mov al,[bp+0x6]
000016AB  84C0              test al,al
000016AD  750F              jnz 0x16be
000016AF  BB99D8            mov bx,0xd899
000016B2  53                push bx
000016B3  B80200            mov ax,0x2
000016B6  50                push ax
000016B7  E870F2            call word 0x92a
000016BA  89EC              mov sp,bp
000016BC  EB0D              jmp short 0x16cb
000016BE  BB7AD8            mov bx,0xd87a
000016C1  53                push bx
000016C2  B80200            mov ax,0x2
000016C5  50                push ax
000016C6  E861F2            call word 0x92a
000016C9  89EC              mov sp,bp
000016CB  BB77D8            mov bx,0xd877
000016CE  53                push bx
000016CF  B80200            mov ax,0x2
000016D2  50                push ax
000016D3  E854F2            call word 0x92a
000016D6  89EC              mov sp,bp
000016D8  5D                pop bp
000016D9  C3                ret
000016DA  55                push bp
000016DB  89E5              mov bp,sp
000016DD  FF7604            push word [bp+0x4]
000016E0  BB57D8            mov bx,0xd857
000016E3  53                push bx
000016E4  B80600            mov ax,0x6
000016E7  50                push ax
000016E8  E83FF2            call word 0x92a
000016EB  89EC              mov sp,bp
000016ED  5D                pop bp
000016EE  C3                ret
000016EF  55                push bp
000016F0  89E5              mov bp,sp
000016F2  BB43D8            mov bx,0xd843
000016F5  53                push bx
000016F6  B80700            mov ax,0x7
000016F9  50                push ax
000016FA  E82DF2            call word 0x92a
000016FD  89EC              mov sp,bp
000016FF  5D                pop bp
00001700  C3                ret
00001701  55                push bp
00001702  89E5              mov bp,sp
00001704  BB2ED8            mov bx,0xd82e
00001707  53                push bx
00001708  B80700            mov ax,0x7
0000170B  50                push ax
0000170C  E81BF2            call word 0x92a
0000170F  89EC              mov sp,bp
00001711  5D                pop bp
00001712  C3                ret
00001713  55                push bp
00001714  89E5              mov bp,sp
00001716  BB6501            mov bx,0x165
00001719  53                push bx
0000171A  BB2AD8            mov bx,0xd82a
0000171D  53                push bx
0000171E  B80400            mov ax,0x4
00001721  50                push ax
00001722  E805F2            call word 0x92a
00001725  89EC              mov sp,bp
00001727  5D                pop bp
00001728  C3                ret
00001729  55                push bp
0000172A  89E5              mov bp,sp
0000172C  4C                dec sp
0000172D  4C                dec sp
0000172E  B89200            mov ax,0x92
00001731  50                push ax
00001732  E8F4ED            call word 0x529
00001735  44                inc sp
00001736  44                inc sp
00001737  8846FF            mov [bp-0x1],al
0000173A  8B4604            mov ax,[bp+0x4]
0000173D  85C0              test ax,ax
0000173F  7414              jz 0x1755
00001741  8A46FF            mov al,[bp-0x1]
00001744  0C02              or al,0x2
00001746  30E4              xor ah,ah
00001748  50                push ax
00001749  B89200            mov ax,0x92
0000174C  50                push ax
0000174D  E8EFED            call word 0x53f
00001750  83C404            add sp,byte +0x4
00001753  EB12              jmp short 0x1767
00001755  8A46FF            mov al,[bp-0x1]
00001758  24FD              and al,0xfd
0000175A  30E4              xor ah,ah
0000175C  50                push ax
0000175D  B89200            mov ax,0x92
00001760  50                push ax
00001761  E8DBED            call word 0x53f
00001764  83C404            add sp,byte +0x4
00001767  8A46FF            mov al,[bp-0x1]
0000176A  2402              and al,0x2
0000176C  84C0              test al,al
0000176E  7404              jz 0x1774
00001770  B001              mov al,0x1
00001772  EB02              jmp short 0x1776
00001774  30C0              xor al,al
00001776  30E4              xor ah,ah
00001778  89EC              mov sp,bp
0000177A  5D                pop bp
0000177B  C3                ret
0000177C  55                push bp
0000177D  89E5              mov bp,sp
0000177F  B80100            mov ax,0x1
00001782  50                push ax
00001783  B8DCFE            mov ax,0xfedc
00001786  50                push ax
00001787  E8B5ED            call word 0x53f
0000178A  89EC              mov sp,bp
0000178C  5D                pop bp
0000178D  C3                ret
0000178E  55                push bp
0000178F  89E5              mov bp,sp
00001791  31C0              xor ax,ax
00001793  50                push ax
00001794  B8DCFE            mov ax,0xfedc
00001797  50                push ax
00001798  E8A4ED            call word 0x53f
0000179B  89EC              mov sp,bp
0000179D  5D                pop bp
0000179E  C3                ret
0000179F  55                push bp
000017A0  89E5              mov bp,sp
000017A2  83C4FA            add sp,byte -0x6
000017A5  A0B004            mov al,[0x4b0]
000017A8  8846FB            mov [bp-0x5],al
000017AB  A1B204            mov ax,[0x4b2]
000017AE  8B1EB404          mov bx,[0x4b4]
000017B2  8946FC            mov [bp-0x4],ax
000017B5  895EFE            mov [bp-0x2],bx
000017B8  FF76FE            push word [bp-0x2]
000017BB  FF76FC            push word [bp-0x4]
000017BE  8A46FB            mov al,[bp-0x5]
000017C1  30E4              xor ah,ah
000017C3  50                push ax
000017C4  BB0FD8            mov bx,0xd80f
000017C7  53                push bx
000017C8  B80400            mov ax,0x4
000017CB  50                push ax
000017CC  E85BF1            call word 0x92a
000017CF  83C40A            add sp,byte +0xa
000017D2  8A46FB            mov al,[bp-0x5]
000017D5  3CFE              cmp al,0xfe
000017D7  750B              jnz 0x17e4
000017D9  8B46FC            mov ax,[bp-0x4]
000017DC  8B5EFE            mov bx,[bp-0x2]
000017DF  E803E9            call word 0xe5
000017E2  7506              jnz 0x17ea
000017E4  31C0              xor ax,ax
000017E6  89EC              mov sp,bp
000017E8  5D                pop bp
000017E9  C3                ret
000017EA  30C0              xor al,al
000017EC  A2B004            mov [0x4b0],al
000017EF  B80F00            mov ax,0xf
000017F2  31DB              xor bx,bx
000017F4  8D7EFC            lea di,[bp-0x4]
000017F7  E892E8            call word 0x8c
000017FA  A3B604            mov [0x4b6],ax
000017FD  8B46FC            mov ax,[bp-0x4]
00001800  8B5EFE            mov bx,[bp-0x2]
00001803  BF0400            mov di,0x4
00001806  E8F1E8            call word 0xfa
00001809  A3B804            mov [0x4b8],ax
0000180C  B80F00            mov ax,0xf
0000180F  31DB              xor bx,bx
00001811  8D7EFC            lea di,[bp-0x4]
00001814  E875E8            call word 0x8c
00001817  53                push bx
00001818  50                push ax
00001819  8B46FC            mov ax,[bp-0x4]
0000181C  8B5EFE            mov bx,[bp-0x2]
0000181F  BF0400            mov di,0x4
00001822  E8D5E8            call word 0xfa
00001825  53                push bx
00001826  50                push ax
00001827  BBF6D7            mov bx,0xd7f6
0000182A  53                push bx
0000182B  B80400            mov ax,0x4
0000182E  50                push ax
0000182F  E8F8F0            call word 0x92a
00001832  83C40C            add sp,byte +0xc
00001835  FF2EB604          jmp word far [0x4b6]
00001839  B80100            mov ax,0x1
0000183C  89EC              mov sp,bp
0000183E  5D                pop bp
0000183F  C3                ret
00001840  55                push bp
00001841  89E5              mov bp,sp
00001843  83C4FC            add sp,byte -0x4
00001846  B84000            mov ax,0x40
00001849  50                push ax
0000184A  B80E00            mov ax,0xe
0000184D  50                push ax
0000184E  E89CED            call word 0x5ed
00001851  83C404            add sp,byte +0x4
00001854  50                push ax
00001855  E805EE            call word 0x65d
00001858  44                inc sp
00001859  44                inc sp
0000185A  8946FC            mov [bp-0x4],ax
0000185D  30C0              xor al,al
0000185F  8846FF            mov [bp-0x1],al
00001862  EB4B              jmp short 0x18af
00001864  8A46FF            mov al,[bp-0x1]
00001867  30E4              xor ah,ah
00001869  B103              mov cl,0x3
0000186B  D3E0              shl ax,cl
0000186D  89C3              mov bx,ax
0000186F  30C0              xor al,al
00001871  88872201          mov [bx+0x122],al
00001875  8A46FF            mov al,[bp-0x1]
00001878  30E4              xor ah,ah
0000187A  B103              mov cl,0x3
0000187C  D3E0              shl ax,cl
0000187E  89C3              mov bx,ax
00001880  31C0              xor ax,ax
00001882  89872401          mov [bx+0x124],ax
00001886  8A46FF            mov al,[bp-0x1]
00001889  30E4              xor ah,ah
0000188B  B103              mov cl,0x3
0000188D  D3E0              shl ax,cl
0000188F  89C3              mov bx,ax
00001891  31C0              xor ax,ax
00001893  89872601          mov [bx+0x126],ax
00001897  8A46FF            mov al,[bp-0x1]
0000189A  30E4              xor ah,ah
0000189C  B103              mov cl,0x3
0000189E  D3E0              shl ax,cl
000018A0  89C3              mov bx,ax
000018A2  30C0              xor al,al
000018A4  88872801          mov [bx+0x128],al
000018A8  8A46FF            mov al,[bp-0x1]
000018AB  40                inc ax
000018AC  8846FF            mov [bp-0x1],al
000018AF  8A46FF            mov al,[bp-0x1]
000018B2  3C04              cmp al,0x4
000018B4  72AE              jc 0x1864
000018B6  30C0              xor al,al
000018B8  8846FE            mov [bp-0x2],al
000018BB  E92101            jmp word 0x19df
000018BE  8A46FE            mov al,[bp-0x2]
000018C1  30E4              xor ah,ah
000018C3  B91E00            mov cx,0x1e
000018C6  F7E9              imul cx
000018C8  89C3              mov bx,ax
000018CA  30C0              xor al,al
000018CC  88874201          mov [bx+0x142],al
000018D0  8A46FE            mov al,[bp-0x2]
000018D3  30E4              xor ah,ah
000018D5  B91E00            mov cx,0x1e
000018D8  F7E9              imul cx
000018DA  89C3              mov bx,ax
000018DC  30C0              xor al,al
000018DE  88874301          mov [bx+0x143],al
000018E2  8A46FE            mov al,[bp-0x2]
000018E5  30E4              xor ah,ah
000018E7  B91E00            mov cx,0x1e
000018EA  F7E9              imul cx
000018EC  89C3              mov bx,ax
000018EE  30C0              xor al,al
000018F0  88874401          mov [bx+0x144],al
000018F4  8A46FE            mov al,[bp-0x2]
000018F7  30E4              xor ah,ah
000018F9  B91E00            mov cx,0x1e
000018FC  F7E9              imul cx
000018FE  89C3              mov bx,ax
00001900  30C0              xor al,al
00001902  88874501          mov [bx+0x145],al
00001906  8A46FE            mov al,[bp-0x2]
00001909  30E4              xor ah,ah
0000190B  B91E00            mov cx,0x1e
0000190E  F7E9              imul cx
00001910  89C3              mov bx,ax
00001912  30C0              xor al,al
00001914  88874601          mov [bx+0x146],al
00001918  8A46FE            mov al,[bp-0x2]
0000191B  30E4              xor ah,ah
0000191D  B91E00            mov cx,0x1e
00001920  F7E9              imul cx
00001922  89C3              mov bx,ax
00001924  31C0              xor ax,ax
00001926  89874801          mov [bx+0x148],ax
0000192A  8A46FE            mov al,[bp-0x2]
0000192D  30E4              xor ah,ah
0000192F  B91E00            mov cx,0x1e
00001932  F7E9              imul cx
00001934  89C3              mov bx,ax
00001936  30C0              xor al,al
00001938  88874A01          mov [bx+0x14a],al
0000193C  8A46FE            mov al,[bp-0x2]
0000193F  30E4              xor ah,ah
00001941  B91E00            mov cx,0x1e
00001944  F7E9              imul cx
00001946  89C3              mov bx,ax
00001948  31C0              xor ax,ax
0000194A  89874C01          mov [bx+0x14c],ax
0000194E  8A46FE            mov al,[bp-0x2]
00001951  30E4              xor ah,ah
00001953  B91E00            mov cx,0x1e
00001956  F7E9              imul cx
00001958  89C3              mov bx,ax
0000195A  31C0              xor ax,ax
0000195C  89874E01          mov [bx+0x14e],ax
00001960  8A46FE            mov al,[bp-0x2]
00001963  30E4              xor ah,ah
00001965  B91E00            mov cx,0x1e
00001968  F7E9              imul cx
0000196A  89C3              mov bx,ax
0000196C  31C0              xor ax,ax
0000196E  89875001          mov [bx+0x150],ax
00001972  8A46FE            mov al,[bp-0x2]
00001975  30E4              xor ah,ah
00001977  B91E00            mov cx,0x1e
0000197A  F7E9              imul cx
0000197C  89C3              mov bx,ax
0000197E  31C0              xor ax,ax
00001980  89875201          mov [bx+0x152],ax
00001984  8A46FE            mov al,[bp-0x2]
00001987  30E4              xor ah,ah
00001989  B91E00            mov cx,0x1e
0000198C  F7E9              imul cx
0000198E  89C3              mov bx,ax
00001990  31C0              xor ax,ax
00001992  89875401          mov [bx+0x154],ax
00001996  8A46FE            mov al,[bp-0x2]
00001999  30E4              xor ah,ah
0000199B  B91E00            mov cx,0x1e
0000199E  F7E9              imul cx
000019A0  89C3              mov bx,ax
000019A2  31C0              xor ax,ax
000019A4  89875601          mov [bx+0x156],ax
000019A8  8A46FE            mov al,[bp-0x2]
000019AB  30E4              xor ah,ah
000019AD  B91E00            mov cx,0x1e
000019B0  F7E9              imul cx
000019B2  89C3              mov bx,ax
000019B4  31C0              xor ax,ax
000019B6  31F6              xor si,si
000019B8  89875801          mov [bx+0x158],ax
000019BC  89B75A01          mov [bx+0x15a],si
000019C0  8A46FE            mov al,[bp-0x2]
000019C3  30E4              xor ah,ah
000019C5  B91E00            mov cx,0x1e
000019C8  F7E9              imul cx
000019CA  89C3              mov bx,ax
000019CC  31C0              xor ax,ax
000019CE  31F6              xor si,si
000019D0  89875C01          mov [bx+0x15c],ax
000019D4  89B75E01          mov [bx+0x15e],si
000019D8  8A46FE            mov al,[bp-0x2]
000019DB  40                inc ax
000019DC  8846FE            mov [bp-0x2],al
000019DF  8A46FE            mov al,[bp-0x2]
000019E2  3C08              cmp al,0x8
000019E4  0F82D6FE          jc word 0x18be
000019E8  30C0              xor al,al
000019EA  8846FE            mov [bp-0x2],al
000019ED  EB21              jmp short 0x1a10
000019EF  8A46FE            mov al,[bp-0x2]
000019F2  30E4              xor ah,ah
000019F4  89C3              mov bx,ax
000019F6  B008              mov al,0x8
000019F8  88873302          mov [bx+0x233],al
000019FC  8A46FE            mov al,[bp-0x2]
000019FF  30E4              xor ah,ah
00001A01  89C3              mov bx,ax
00001A03  B008              mov al,0x8
00001A05  88873C02          mov [bx+0x23c],al
00001A09  8A46FE            mov al,[bp-0x2]
00001A0C  40                inc ax
00001A0D  8846FE            mov [bp-0x2],al
00001A10  8A46FE            mov al,[bp-0x2]
00001A13  3C08              cmp al,0x8
00001A15  72D8              jc 0x19ef
00001A17  30C0              xor al,al
00001A19  A23202            mov [0x232],al
00001A1C  30C0              xor al,al
00001A1E  A23B02            mov [0x23b],al
00001A21  FF76FC            push word [bp-0x4]
00001A24  E836EC            call word 0x65d
00001A27  44                inc sp
00001A28  44                inc sp
00001A29  89EC              mov sp,bp
00001A2B  5D                pop bp
00001A2C  C3                ret
00001A2D  55                push bp
00001A2E  89E5              mov bp,sp
00001A30  83C4FC            add sp,byte -0x4
00001A33  31C0              xor ax,ax
00001A35  31DB              xor bx,bx
00001A37  8946FC            mov [bp-0x4],ax
00001A3A  895EFE            mov [bp-0x2],bx
00001A3D  83C4FC            add sp,byte -0x4
00001A40  31C0              xor ax,ax
00001A42  31DB              xor bx,bx
00001A44  8946F8            mov [bp-0x8],ax
00001A47  895EFA            mov [bp-0x6],bx
00001A4A  83C4FC            add sp,byte -0x4
00001A4D  8B4606            mov ax,[bp+0x6]
00001A50  050700            add ax,0x7
00001A53  50                push ax
00001A54  E8D2EA            call word 0x529
00001A57  44                inc sp
00001A58  44                inc sp
00001A59  30E4              xor ah,ah
00001A5B  8946F6            mov [bp-0xa],ax
00001A5E  8B4606            mov ax,[bp+0x6]
00001A61  050700            add ax,0x7
00001A64  50                push ax
00001A65  E8C1EA            call word 0x529
00001A68  44                inc sp
00001A69  44                inc sp
00001A6A  30E4              xor ah,ah
00001A6C  8946F6            mov [bp-0xa],ax
00001A6F  8B46FC            mov ax,[bp-0x4]
00001A72  8B76FE            mov si,[bp-0x2]
00001A75  8D5EFC            lea bx,[bp-0x4]
00001A78  E865E6            call word 0xe0
00001A7B  8A4604            mov al,[bp+0x4]
00001A7E  3C01              cmp al,0x1
00001A80  750B              jnz 0x1a8d
00001A82  8A46F6            mov al,[bp-0xa]
00001A85  2480              and al,0x80
00001A87  8846F5            mov [bp-0xb],al
00001A8A  E99400            jmp word 0x1b21
00001A8D  8A4604            mov al,[bp+0x4]
00001A90  3C02              cmp al,0x2
00001A92  7515              jnz 0x1aa9
00001A94  8A46F6            mov al,[bp-0xa]
00001A97  2480              and al,0x80
00001A99  84C0              test al,al
00001A9B  7504              jnz 0x1aa1
00001A9D  B001              mov al,0x1
00001A9F  EB02              jmp short 0x1aa3
00001AA1  30C0              xor al,al
00001AA3  8846F5            mov [bp-0xb],al
00001AA6  E97800            jmp word 0x1b21
00001AA9  8A4604            mov al,[bp+0x4]
00001AAC  3C03              cmp al,0x3
00001AAE  751D              jnz 0x1acd
00001AB0  8A46F6            mov al,[bp-0xa]
00001AB3  2480              and al,0x80
00001AB5  84C0              test al,al
00001AB7  750D              jnz 0x1ac6
00001AB9  8A46F6            mov al,[bp-0xa]
00001ABC  2408              and al,0x8
00001ABE  84C0              test al,al
00001AC0  7404              jz 0x1ac6
00001AC2  B001              mov al,0x1
00001AC4  EB02              jmp short 0x1ac8
00001AC6  30C0              xor al,al
00001AC8  8846F5            mov [bp-0xb],al
00001ACB  EB54              jmp short 0x1b21
00001ACD  8A4604            mov al,[bp+0x4]
00001AD0  3C04              cmp al,0x4
00001AD2  751D              jnz 0x1af1
00001AD4  8A46F6            mov al,[bp-0xa]
00001AD7  2480              and al,0x80
00001AD9  84C0              test al,al
00001ADB  750D              jnz 0x1aea
00001ADD  8A46F6            mov al,[bp-0xa]
00001AE0  2408              and al,0x8
00001AE2  84C0              test al,al
00001AE4  7504              jnz 0x1aea
00001AE6  B001              mov al,0x1
00001AE8  EB02              jmp short 0x1aec
00001AEA  30C0              xor al,al
00001AEC  8846F5            mov [bp-0xb],al
00001AEF  EB30              jmp short 0x1b21
00001AF1  8A4604            mov al,[bp+0x4]
00001AF4  3C05              cmp al,0x5
00001AF6  751D              jnz 0x1b15
00001AF8  8A46F6            mov al,[bp-0xa]
00001AFB  2480              and al,0x80
00001AFD  84C0              test al,al
00001AFF  750D              jnz 0x1b0e
00001B01  8A46F6            mov al,[bp-0xa]
00001B04  2440              and al,0x40
00001B06  84C0              test al,al
00001B08  7404              jz 0x1b0e
00001B0A  B001              mov al,0x1
00001B0C  EB02              jmp short 0x1b10
00001B0E  30C0              xor al,al
00001B10  8846F5            mov [bp-0xb],al
00001B13  EB0C              jmp short 0x1b21
00001B15  8A4604            mov al,[bp+0x4]
00001B18  84C0              test al,al
00001B1A  7505              jnz 0x1b21
00001B1C  30C0              xor al,al
00001B1E  8846F5            mov [bp-0xb],al
00001B21  8A46F5            mov al,[bp-0xb]
00001B24  84C0              test al,al
00001B26  7406              jz 0x1b2e
00001B28  31C0              xor ax,ax
00001B2A  89EC              mov sp,bp
00001B2C  5D                pop bp
00001B2D  C3                ret
00001B2E  8B46FC            mov ax,[bp-0x4]
00001B31  8B5EFE            mov bx,[bp-0x2]
00001B34  93                xchg ax,bx
00001B35  31DB              xor bx,bx
00001B37  8D7EF8            lea di,[bp-0x8]
00001B3A  E85FE5            call word 0x9c
00001B3D  740F              jz 0x1b4e
00001B3F  8B46FC            mov ax,[bp-0x4]
00001B42  8B5EFE            mov bx,[bp-0x2]
00001B45  93                xchg ax,bx
00001B46  31DB              xor bx,bx
00001B48  8946F8            mov [bp-0x8],ax
00001B4B  895EFA            mov [bp-0x6],bx
00001B4E  8A46F6            mov al,[bp-0xa]
00001B51  2401              and al,0x1
00001B53  84C0              test al,al
00001B55  7407              jz 0x1b5e
00001B57  B8FFFF            mov ax,0xffff
00001B5A  89EC              mov sp,bp
00001B5C  5D                pop bp
00001B5D  C3                ret
00001B5E  8B4608            mov ax,[bp+0x8]
00001B61  85C0              test ax,ax
00001B63  7426              jz 0x1b8b
00001B65  8B4608            mov ax,[bp+0x8]
00001B68  31DB              xor bx,bx
00001B6A  53                push bx
00001B6B  50                push ax
00001B6C  8B46FC            mov ax,[bp-0x4]
00001B6F  8B5EFE            mov bx,[bp-0x2]
00001B72  88E0              mov al,ah
00001B74  88DC              mov ah,bl
00001B76  88FB              mov bl,bh
00001B78  28FF              sub bh,bh
00001B7A  BF0300            mov di,0x3
00001B7D  E87AE5            call word 0xfa
00001B80  8D7EF0            lea di,[bp-0x10]
00001B83  E816E5            call word 0x9c
00001B86  8D66F4            lea sp,[bp-0xc]
00001B89  7602              jna 0x1b8d
00001B8B  EB03              jmp short 0x1b90
00001B8D  E9CEFE            jmp word 0x1a5e
00001B90  BBE8D7            mov bx,0xd7e8
00001B93  53                push bx
00001B94  B80400            mov ax,0x4
00001B97  50                push ax
00001B98  E88FED            call word 0x92a
00001B9B  83C404            add sp,byte +0x4
00001B9E  B8FFFF            mov ax,0xffff
00001BA1  89EC              mov sp,bp
00001BA3  5D                pop bp
00001BA4  C3                ret
00001BA5  55                push bp
00001BA6  89E5              mov bp,sp
00001BA8  81C4FAFD          add sp,0xfdfa
00001BAC  B84000            mov ax,0x40
00001BAF  50                push ax
00001BB0  B80E00            mov ax,0xe
00001BB3  50                push ax
00001BB4  E836EA            call word 0x5ed
00001BB7  83C404            add sp,byte +0x4
00001BBA  50                push ax
00001BBB  E89FEA            call word 0x65d
00001BBE  44                inc sp
00001BBF  44                inc sp
00001BC0  8986FAFD          mov [bp-0x206],ax
00001BC4  30C0              xor al,al
00001BC6  A22201            mov [0x122],al
00001BC9  B8F001            mov ax,0x1f0
00001BCC  A32401            mov [0x124],ax
00001BCF  B8F003            mov ax,0x3f0
00001BD2  A32601            mov [0x126],ax
00001BD5  B00E              mov al,0xe
00001BD7  A22801            mov [0x128],al
00001BDA  30C0              xor al,al
00001BDC  A22A01            mov [0x12a],al
00001BDF  B87001            mov ax,0x170
00001BE2  A32C01            mov [0x12c],ax
00001BE5  B87003            mov ax,0x370
00001BE8  A32E01            mov [0x12e],ax
00001BEB  B00F              mov al,0xf
00001BED  A23001            mov [0x130],al
00001BF0  30C0              xor al,al
00001BF2  A23201            mov [0x132],al
00001BF5  B8E801            mov ax,0x1e8
00001BF8  A33401            mov [0x134],ax
00001BFB  B8E003            mov ax,0x3e0
00001BFE  A33601            mov [0x136],ax
00001C01  B00C              mov al,0xc
00001C03  A23801            mov [0x138],al
00001C06  30C0              xor al,al
00001C08  A23A01            mov [0x13a],al
00001C0B  B86801            mov ax,0x168
00001C0E  A33C01            mov [0x13c],ax
00001C11  B86003            mov ax,0x360
00001C14  A33E01            mov [0x13e],ax
00001C17  B00B              mov al,0xb
00001C19  A24001            mov [0x140],al
00001C1C  30C0              xor al,al
00001C1E  8846FE            mov [bp-0x2],al
00001C21  8846FF            mov [bp-0x1],al
00001C24  30C0              xor al,al
00001C26  8846FD            mov [bp-0x3],al
00001C29  E9C40B            jmp word 0x27f0
00001C2C  83C4F4            add sp,byte -0xc
00001C2F  8A46FD            mov al,[bp-0x3]
00001C32  30E4              xor ah,ah
00001C34  D1E8              shr ax,1
00001C36  8886F5FD          mov [bp-0x20b],al
00001C3A  8A46FD            mov al,[bp-0x3]
00001C3D  30E4              xor ah,ah
00001C3F  2401              and al,0x1
00001C41  8886F4FD          mov [bp-0x20c],al
00001C45  8A86F5FD          mov al,[bp-0x20b]
00001C49  30E4              xor ah,ah
00001C4B  B103              mov cl,0x3
00001C4D  D3E0              shl ax,cl
00001C4F  89C3              mov bx,ax
00001C51  8B9F2401          mov bx,[bx+0x124]
00001C55  899EF8FD          mov [bp-0x208],bx
00001C59  8A86F5FD          mov al,[bp-0x20b]
00001C5D  30E4              xor ah,ah
00001C5F  B103              mov cl,0x3
00001C61  D3E0              shl ax,cl
00001C63  89C3              mov bx,ax
00001C65  8B9F2601          mov bx,[bx+0x126]
00001C69  899EF6FD          mov [bp-0x20a],bx
00001C6D  B80A00            mov ax,0xa
00001C70  50                push ax
00001C71  8B86F6FD          mov ax,[bp-0x20a]
00001C75  050600            add ax,0x6
00001C78  50                push ax
00001C79  E8C3E8            call word 0x53f
00001C7C  83C404            add sp,byte +0x4
00001C7F  8A86F4FD          mov al,[bp-0x20c]
00001C83  84C0              test al,al
00001C85  7404              jz 0x1c8b
00001C87  B0B0              mov al,0xb0
00001C89  EB02              jmp short 0x1c8d
00001C8B  B0A0              mov al,0xa0
00001C8D  30E4              xor ah,ah
00001C8F  50                push ax
00001C90  8B86F8FD          mov ax,[bp-0x208]
00001C94  050600            add ax,0x6
00001C97  50                push ax
00001C98  E8A4E8            call word 0x53f
00001C9B  83C404            add sp,byte +0x4
00001C9E  B85500            mov ax,0x55
00001CA1  50                push ax
00001CA2  8B86F8FD          mov ax,[bp-0x208]
00001CA6  40                inc ax
00001CA7  40                inc ax
00001CA8  50                push ax
00001CA9  E893E8            call word 0x53f
00001CAC  83C404            add sp,byte +0x4
00001CAF  B8AA00            mov ax,0xaa
00001CB2  50                push ax
00001CB3  8B86F8FD          mov ax,[bp-0x208]
00001CB7  050300            add ax,0x3
00001CBA  50                push ax
00001CBB  E881E8            call word 0x53f
00001CBE  83C404            add sp,byte +0x4
00001CC1  B8AA00            mov ax,0xaa
00001CC4  50                push ax
00001CC5  8B86F8FD          mov ax,[bp-0x208]
00001CC9  40                inc ax
00001CCA  40                inc ax
00001CCB  50                push ax
00001CCC  E870E8            call word 0x53f
00001CCF  83C404            add sp,byte +0x4
00001CD2  B85500            mov ax,0x55
00001CD5  50                push ax
00001CD6  8B86F8FD          mov ax,[bp-0x208]
00001CDA  050300            add ax,0x3
00001CDD  50                push ax
00001CDE  E85EE8            call word 0x53f
00001CE1  83C404            add sp,byte +0x4
00001CE4  B85500            mov ax,0x55
00001CE7  50                push ax
00001CE8  8B86F8FD          mov ax,[bp-0x208]
00001CEC  40                inc ax
00001CED  40                inc ax
00001CEE  50                push ax
00001CEF  E84DE8            call word 0x53f
00001CF2  83C404            add sp,byte +0x4
00001CF5  B8AA00            mov ax,0xaa
00001CF8  50                push ax
00001CF9  8B86F8FD          mov ax,[bp-0x208]
00001CFD  050300            add ax,0x3
00001D00  50                push ax
00001D01  E83BE8            call word 0x53f
00001D04  83C404            add sp,byte +0x4
00001D07  8B86F8FD          mov ax,[bp-0x208]
00001D0B  40                inc ax
00001D0C  40                inc ax
00001D0D  50                push ax
00001D0E  E818E8            call word 0x529
00001D11  44                inc sp
00001D12  44                inc sp
00001D13  8886F2FD          mov [bp-0x20e],al
00001D17  8B86F8FD          mov ax,[bp-0x208]
00001D1B  050300            add ax,0x3
00001D1E  50                push ax
00001D1F  E807E8            call word 0x529
00001D22  44                inc sp
00001D23  44                inc sp
00001D24  8886F1FD          mov [bp-0x20f],al
00001D28  8A86F2FD          mov al,[bp-0x20e]
00001D2C  3C55              cmp al,0x55
00001D2E  0F852001          jnz word 0x1e52
00001D32  8A86F1FD          mov al,[bp-0x20f]
00001D36  3CAA              cmp al,0xaa
00001D38  0F851601          jnz word 0x1e52
00001D3C  8A46FD            mov al,[bp-0x3]
00001D3F  30E4              xor ah,ah
00001D41  B91E00            mov cx,0x1e
00001D44  F7E9              imul cx
00001D46  89C3              mov bx,ax
00001D48  B001              mov al,0x1
00001D4A  88874201          mov [bx+0x142],al
00001D4E  8A46FD            mov al,[bp-0x3]
00001D51  30E4              xor ah,ah
00001D53  50                push ax
00001D54  E8DD0A            call word 0x2834
00001D57  44                inc sp
00001D58  44                inc sp
00001D59  8A86F4FD          mov al,[bp-0x20c]
00001D5D  84C0              test al,al
00001D5F  7404              jz 0x1d65
00001D61  B0B0              mov al,0xb0
00001D63  EB02              jmp short 0x1d67
00001D65  B0A0              mov al,0xa0
00001D67  30E4              xor ah,ah
00001D69  50                push ax
00001D6A  8B86F8FD          mov ax,[bp-0x208]
00001D6E  050600            add ax,0x6
00001D71  50                push ax
00001D72  E8CAE7            call word 0x53f
00001D75  83C404            add sp,byte +0x4
00001D78  8B86F8FD          mov ax,[bp-0x208]
00001D7C  40                inc ax
00001D7D  40                inc ax
00001D7E  50                push ax
00001D7F  E8A7E7            call word 0x529
00001D82  44                inc sp
00001D83  44                inc sp
00001D84  8886F2FD          mov [bp-0x20e],al
00001D88  8B86F8FD          mov ax,[bp-0x208]
00001D8C  050300            add ax,0x3
00001D8F  50                push ax
00001D90  E896E7            call word 0x529
00001D93  44                inc sp
00001D94  44                inc sp
00001D95  8886F1FD          mov [bp-0x20f],al
00001D99  8A86F2FD          mov al,[bp-0x20e]
00001D9D  3C01              cmp al,0x1
00001D9F  0F85AF00          jnz word 0x1e52
00001DA3  8A86F1FD          mov al,[bp-0x20f]
00001DA7  3C01              cmp al,0x1
00001DA9  0F85A500          jnz word 0x1e52
00001DAD  8B86F8FD          mov ax,[bp-0x208]
00001DB1  050400            add ax,0x4
00001DB4  50                push ax
00001DB5  E871E7            call word 0x529
00001DB8  44                inc sp
00001DB9  44                inc sp
00001DBA  8886F0FD          mov [bp-0x210],al
00001DBE  8B86F8FD          mov ax,[bp-0x208]
00001DC2  050500            add ax,0x5
00001DC5  50                push ax
00001DC6  E860E7            call word 0x529
00001DC9  44                inc sp
00001DCA  44                inc sp
00001DCB  8886EFFD          mov [bp-0x211],al
00001DCF  8B86F8FD          mov ax,[bp-0x208]
00001DD3  050700            add ax,0x7
00001DD6  50                push ax
00001DD7  E84FE7            call word 0x529
00001DDA  44                inc sp
00001DDB  44                inc sp
00001DDC  8886EEFD          mov [bp-0x212],al
00001DE0  8A86F0FD          mov al,[bp-0x210]
00001DE4  3C14              cmp al,0x14
00001DE6  751C              jnz 0x1e04
00001DE8  8A86EFFD          mov al,[bp-0x211]
00001DEC  3CEB              cmp al,0xeb
00001DEE  7514              jnz 0x1e04
00001DF0  8A46FD            mov al,[bp-0x3]
00001DF3  30E4              xor ah,ah
00001DF5  B91E00            mov cx,0x1e
00001DF8  F7E9              imul cx
00001DFA  89C3              mov bx,ax
00001DFC  B003              mov al,0x3
00001DFE  88874201          mov [bx+0x142],al
00001E02  EB4E              jmp short 0x1e52
00001E04  8A86F0FD          mov al,[bp-0x210]
00001E08  84C0              test al,al
00001E0A  7524              jnz 0x1e30
00001E0C  8A86EFFD          mov al,[bp-0x211]
00001E10  84C0              test al,al
00001E12  751C              jnz 0x1e30
00001E14  8A86EEFD          mov al,[bp-0x212]
00001E18  84C0              test al,al
00001E1A  7414              jz 0x1e30
00001E1C  8A46FD            mov al,[bp-0x3]
00001E1F  30E4              xor ah,ah
00001E21  B91E00            mov cx,0x1e
00001E24  F7E9              imul cx
00001E26  89C3              mov bx,ax
00001E28  B002              mov al,0x2
00001E2A  88874201          mov [bx+0x142],al
00001E2E  EB22              jmp short 0x1e52
00001E30  8A86F0FD          mov al,[bp-0x210]
00001E34  3CFF              cmp al,0xff
00001E36  751A              jnz 0x1e52
00001E38  8A86EFFD          mov al,[bp-0x211]
00001E3C  3CFF              cmp al,0xff
00001E3E  7512              jnz 0x1e52
00001E40  8A46FD            mov al,[bp-0x3]
00001E43  30E4              xor ah,ah
00001E45  B91E00            mov cx,0x1e
00001E48  F7E9              imul cx
00001E4A  89C3              mov bx,ax
00001E4C  30C0              xor al,al
00001E4E  88874201          mov [bx+0x142],al
00001E52  8A46FD            mov al,[bp-0x3]
00001E55  30E4              xor ah,ah
00001E57  B91E00            mov cx,0x1e
00001E5A  F7E9              imul cx
00001E5C  89C3              mov bx,ax
00001E5E  8A874201          mov al,[bx+0x142]
00001E62  8846FC            mov [bp-0x4],al
00001E65  8A46FC            mov al,[bp-0x4]
00001E68  3C02              cmp al,0x2
00001E6A  0F85CC04          jnz word 0x233a
00001E6E  83C4EC            add sp,byte -0x14
00001E71  8A46FD            mov al,[bp-0x3]
00001E74  30E4              xor ah,ah
00001E76  B91E00            mov cx,0x1e
00001E79  F7E9              imul cx
00001E7B  89C3              mov bx,ax
00001E7D  B0FF              mov al,0xff
00001E7F  88874301          mov [bx+0x143],al
00001E83  8A46FD            mov al,[bp-0x3]
00001E86  30E4              xor ah,ah
00001E88  B91E00            mov cx,0x1e
00001E8B  F7E9              imul cx
00001E8D  89C3              mov bx,ax
00001E8F  30C0              xor al,al
00001E91  88874601          mov [bx+0x146],al
00001E95  8D9EFCFD          lea bx,[bp-0x204]
00001E99  53                push bx
00001E9A  E8BDE7            call word 0x65a
00001E9D  50                push ax
00001E9E  31C0              xor ax,ax
00001EA0  31DB              xor bx,bx
00001EA2  53                push bx
00001EA3  50                push ax
00001EA4  31C0              xor ax,ax
00001EA6  31DB              xor bx,bx
00001EA8  53                push bx
00001EA9  50                push ax
00001EAA  31C0              xor ax,ax
00001EAC  50                push ax
00001EAD  31C0              xor ax,ax
00001EAF  50                push ax
00001EB0  31C0              xor ax,ax
00001EB2  50                push ax
00001EB3  B80100            mov ax,0x1
00001EB6  50                push ax
00001EB7  B8EC00            mov ax,0xec
00001EBA  50                push ax
00001EBB  8A46FD            mov al,[bp-0x3]
00001EBE  30E4              xor ah,ah
00001EC0  50                push ax
00001EC1  31C0              xor ax,ax
00001EC3  50                push ax
00001EC4  E8940A            call word 0x295b
00001EC7  83C41A            add sp,byte +0x1a
00001ECA  85C0              test ax,ax
00001ECC  740E              jz 0x1edc
00001ECE  BBBFD7            mov bx,0xd7bf
00001ED1  53                push bx
00001ED2  B80700            mov ax,0x7
00001ED5  50                push ax
00001ED6  E851EA            call word 0x92a
00001ED9  83C404            add sp,byte +0x4
00001EDC  8D9EFCFD          lea bx,[bp-0x204]
00001EE0  53                push bx
00001EE1  E83DE7            call word 0x621
00001EE4  44                inc sp
00001EE5  44                inc sp
00001EE6  2480              and al,0x80
00001EE8  30E4              xor ah,ah
00001EEA  B107              mov cl,0x7
00001EEC  D3E8              shr ax,cl
00001EEE  8886DCFD          mov [bp-0x224],al
00001EF2  8D9E5CFE          lea bx,[bp-0x1a4]
00001EF6  53                push bx
00001EF7  E827E7            call word 0x621
00001EFA  44                inc sp
00001EFB  44                inc sp
00001EFC  84C0              test al,al
00001EFE  7404              jz 0x1f04
00001F00  B001              mov al,0x1
00001F02  EB02              jmp short 0x1f06
00001F04  30C0              xor al,al
00001F06  8886DBFD          mov [bp-0x225],al
00001F0A  8D9E06FE          lea bx,[bp-0x1fa]
00001F0E  53                push bx
00001F0F  E81AE7            call word 0x62c
00001F12  44                inc sp
00001F13  44                inc sp
00001F14  8986DEFD          mov [bp-0x222],ax
00001F18  8D9EFEFD          lea bx,[bp-0x202]
00001F1C  53                push bx
00001F1D  E80CE7            call word 0x62c
00001F20  44                inc sp
00001F21  44                inc sp
00001F22  8986E4FD          mov [bp-0x21c],ax
00001F26  8D9E02FE          lea bx,[bp-0x1fe]
00001F2A  53                push bx
00001F2B  E8FEE6            call word 0x62c
00001F2E  44                inc sp
00001F2F  44                inc sp
00001F30  8986E2FD          mov [bp-0x21e],ax
00001F34  8D9E08FE          lea bx,[bp-0x1f8]
00001F38  53                push bx
00001F39  E8F0E6            call word 0x62c
00001F3C  44                inc sp
00001F3D  44                inc sp
00001F3E  8986E0FD          mov [bp-0x220],ax
00001F42  8D9EA2FE          lea bx,[bp-0x15e]
00001F46  53                push bx
00001F47  E8E2E6            call word 0x62c
00001F4A  44                inc sp
00001F4B  44                inc sp
00001F4C  250004            and ax,0x400
00001F4F  85C0              test ax,ax
00001F51  742A              jz 0x1f7d
00001F53  8D9EC4FE          lea bx,[bp-0x13c]
00001F57  53                push bx
00001F58  E823E1            call word 0x7e
00001F5B  89D3              mov bx,dx
00001F5D  44                inc sp
00001F5E  44                inc sp
00001F5F  8986EAFD          mov [bp-0x216],ax
00001F63  899EECFD          mov [bp-0x214],bx
00001F67  8D9EC8FE          lea bx,[bp-0x138]
00001F6B  53                push bx
00001F6C  E80FE1            call word 0x7e
00001F6F  89D3              mov bx,dx
00001F71  44                inc sp
00001F72  44                inc sp
00001F73  8986E6FD          mov [bp-0x21a],ax
00001F77  899EE8FD          mov [bp-0x218],bx
00001F7B  EB20              jmp short 0x1f9d
00001F7D  8D9E74FE          lea bx,[bp-0x18c]
00001F81  53                push bx
00001F82  E8F9E0            call word 0x7e
00001F85  89D3              mov bx,dx
00001F87  44                inc sp
00001F88  44                inc sp
00001F89  8986EAFD          mov [bp-0x216],ax
00001F8D  899EECFD          mov [bp-0x214],bx
00001F91  31C0              xor ax,ax
00001F93  31DB              xor bx,bx
00001F95  8986E6FD          mov [bp-0x21a],ax
00001F99  899EE8FD          mov [bp-0x218],bx
00001F9D  8A46FD            mov al,[bp-0x3]
00001FA0  30E4              xor ah,ah
00001FA2  B91E00            mov cx,0x1e
00001FA5  F7E9              imul cx
00001FA7  89C3              mov bx,ax
00001FA9  B0FF              mov al,0xff
00001FAB  88874301          mov [bx+0x143],al
00001FAF  8A46FD            mov al,[bp-0x3]
00001FB2  30E4              xor ah,ah
00001FB4  B91E00            mov cx,0x1e
00001FB7  F7E9              imul cx
00001FB9  89C3              mov bx,ax
00001FBB  8A86DCFD          mov al,[bp-0x224]
00001FBF  88874401          mov [bx+0x144],al
00001FC3  8A46FD            mov al,[bp-0x3]
00001FC6  30E4              xor ah,ah
00001FC8  B91E00            mov cx,0x1e
00001FCB  F7E9              imul cx
00001FCD  89C3              mov bx,ax
00001FCF  8A86DBFD          mov al,[bp-0x225]
00001FD3  88874601          mov [bx+0x146],al
00001FD7  8A46FD            mov al,[bp-0x3]
00001FDA  30E4              xor ah,ah
00001FDC  B91E00            mov cx,0x1e
00001FDF  F7E9              imul cx
00001FE1  89C3              mov bx,ax
00001FE3  8B86DEFD          mov ax,[bp-0x222]
00001FE7  89874801          mov [bx+0x148],ax
00001FEB  8A46FD            mov al,[bp-0x3]
00001FEE  30E4              xor ah,ah
00001FF0  B91E00            mov cx,0x1e
00001FF3  F7E9              imul cx
00001FF5  89C3              mov bx,ax
00001FF7  8B86E2FD          mov ax,[bp-0x21e]
00001FFB  89875201          mov [bx+0x152],ax
00001FFF  8A46FD            mov al,[bp-0x3]
00002002  30E4              xor ah,ah
00002004  B91E00            mov cx,0x1e
00002007  F7E9              imul cx
00002009  89C3              mov bx,ax
0000200B  8B86E4FD          mov ax,[bp-0x21c]
0000200F  89875401          mov [bx+0x154],ax
00002013  8A46FD            mov al,[bp-0x3]
00002016  30E4              xor ah,ah
00002018  B91E00            mov cx,0x1e
0000201B  F7E9              imul cx
0000201D  89C3              mov bx,ax
0000201F  8B86E0FD          mov ax,[bp-0x220]
00002023  89875601          mov [bx+0x156],ax
00002027  8A46FD            mov al,[bp-0x3]
0000202A  30E4              xor ah,ah
0000202C  B91E00            mov cx,0x1e
0000202F  F7E9              imul cx
00002031  89C3              mov bx,ax
00002033  8B86EAFD          mov ax,[bp-0x216]
00002037  8BB6ECFD          mov si,[bp-0x214]
0000203B  89875801          mov [bx+0x158],ax
0000203F  89B75A01          mov [bx+0x15a],si
00002043  8A46FD            mov al,[bp-0x3]
00002046  30E4              xor ah,ah
00002048  B91E00            mov cx,0x1e
0000204B  F7E9              imul cx
0000204D  89C3              mov bx,ax
0000204F  8B86E6FD          mov ax,[bp-0x21a]
00002053  8BB6E8FD          mov si,[bp-0x218]
00002057  89875C01          mov [bx+0x15c],ax
0000205B  89B75E01          mov [bx+0x15e],si
0000205F  FFB6E0FD          push word [bp-0x220]
00002063  FFB6E2FD          push word [bp-0x21e]
00002067  FFB6E4FD          push word [bp-0x21c]
0000206B  8A86F4FD          mov al,[bp-0x20c]
0000206F  30E4              xor ah,ah
00002071  50                push ax
00002072  8A86F5FD          mov al,[bp-0x20b]
00002076  30E4              xor ah,ah
00002078  50                push ax
00002079  BB9AD7            mov bx,0xd79a
0000207C  53                push bx
0000207D  B80400            mov ax,0x4
00002080  50                push ax
00002081  E8A6E8            call word 0x92a
00002084  83C40E            add sp,byte +0xe
00002087  8A86F5FD          mov al,[bp-0x20b]
0000208B  30E4              xor ah,ah
0000208D  D1E8              shr ax,1
0000208F  053900            add ax,0x39
00002092  50                push ax
00002093  E8D8E4            call word 0x56e
00002096  44                inc sp
00002097  44                inc sp
00002098  8886DDFD          mov [bp-0x223],al
0000209C  8A46FD            mov al,[bp-0x3]
0000209F  30E4              xor ah,ah
000020A1  2403              and al,0x3
000020A3  8886F3FD          mov [bp-0x20d],al
000020A7  EB17              jmp short 0x20c0
000020A9  8A86DDFD          mov al,[bp-0x223]
000020AD  30E4              xor ah,ah
000020AF  D1E8              shr ax,1
000020B1  D1E8              shr ax,1
000020B3  8886DDFD          mov [bp-0x223],al
000020B7  8A86F3FD          mov al,[bp-0x20d]
000020BB  48                dec ax
000020BC  8886F3FD          mov [bp-0x20d],al
000020C0  8A86F3FD          mov al,[bp-0x20d]
000020C4  84C0              test al,al
000020C6  75E1              jnz 0x20a9
000020C8  8A86DDFD          mov al,[bp-0x223]
000020CC  2403              and al,0x3
000020CE  8886DDFD          mov [bp-0x223],al
000020D2  8A46FD            mov al,[bp-0x3]
000020D5  30E4              xor ah,ah
000020D7  B91E00            mov cx,0x1e
000020DA  F7E9              imul cx
000020DC  89C3              mov bx,ax
000020DE  8A86DDFD          mov al,[bp-0x223]
000020E2  88874A01          mov [bx+0x14a],al
000020E6  8A86DDFD          mov al,[bp-0x223]
000020EA  EB42              jmp short 0x212e
000020EC  BB95D7            mov bx,0xd795
000020EF  53                push bx
000020F0  B80400            mov ax,0x4
000020F3  50                push ax
000020F4  E833E8            call word 0x92a
000020F7  83C404            add sp,byte +0x4
000020FA  EB42              jmp short 0x213e
000020FC  BB91D7            mov bx,0xd791
000020FF  53                push bx
00002100  B80400            mov ax,0x4
00002103  50                push ax
00002104  E823E8            call word 0x92a
00002107  83C404            add sp,byte +0x4
0000210A  EB32              jmp short 0x213e
0000210C  BB8BD7            mov bx,0xd78b
0000210F  53                push bx
00002110  B80400            mov ax,0x4
00002113  50                push ax
00002114  E813E8            call word 0x92a
00002117  83C404            add sp,byte +0x4
0000211A  EB22              jmp short 0x213e
0000211C  BB84D7            mov bx,0xd784
0000211F  53                push bx
00002120  B80400            mov ax,0x4
00002123  50                push ax
00002124  E803E8            call word 0x92a
00002127  83C404            add sp,byte +0x4
0000212A  EB12              jmp short 0x213e
0000212C  EB10              jmp short 0x213e
0000212E  2C00              sub al,0x0
00002130  74BA              jz 0x20ec
00002132  2C01              sub al,0x1
00002134  74C6              jz 0x20fc
00002136  2C01              sub al,0x1
00002138  74D2              jz 0x210c
0000213A  2C01              sub al,0x1
0000213C  74DE              jz 0x211c
0000213E  8A86DDFD          mov al,[bp-0x223]
00002142  E96101            jmp word 0x22a6
00002145  E97401            jmp word 0x22bc
00002148  B83F00            mov ax,0x3f
0000214B  8986E0FD          mov [bp-0x220],ax
0000214F  B83F00            mov ax,0x3f
00002152  31DB              xor bx,bx
00002154  53                push bx
00002155  50                push ax
00002156  8B86EAFD          mov ax,[bp-0x216]
0000215A  8B9EECFD          mov bx,[bp-0x214]
0000215E  8DBED6FD          lea di,[bp-0x22a]
00002162  E8DADF            call word 0x13f
00002165  8986EAFD          mov [bp-0x216],ax
00002169  899EECFD          mov [bp-0x214],bx
0000216D  83C404            add sp,byte +0x4
00002170  B80004            mov ax,0x400
00002173  31DB              xor bx,bx
00002175  53                push bx
00002176  50                push ax
00002177  8B86EAFD          mov ax,[bp-0x216]
0000217B  8B9EECFD          mov bx,[bp-0x214]
0000217F  8DBED6FD          lea di,[bp-0x22a]
00002183  E8B9DF            call word 0x13f
00002186  83C404            add sp,byte +0x4
00002189  8986E2FD          mov [bp-0x21e],ax
0000218D  8B86E2FD          mov ax,[bp-0x21e]
00002191  3D8000            cmp ax,0x80
00002194  7609              jna 0x219f
00002196  B8FF00            mov ax,0xff
00002199  8986E2FD          mov [bp-0x21e],ax
0000219D  EB3D              jmp short 0x21dc
0000219F  8B86E2FD          mov ax,[bp-0x21e]
000021A3  3D4000            cmp ax,0x40
000021A6  7609              jna 0x21b1
000021A8  B88000            mov ax,0x80
000021AB  8986E2FD          mov [bp-0x21e],ax
000021AF  EB2B              jmp short 0x21dc
000021B1  8B86E2FD          mov ax,[bp-0x21e]
000021B5  3D2000            cmp ax,0x20
000021B8  7609              jna 0x21c3
000021BA  B84000            mov ax,0x40
000021BD  8986E2FD          mov [bp-0x21e],ax
000021C1  EB19              jmp short 0x21dc
000021C3  8B86E2FD          mov ax,[bp-0x21e]
000021C7  3D1000            cmp ax,0x10
000021CA  7609              jna 0x21d5
000021CC  B82000            mov ax,0x20
000021CF  8986E2FD          mov [bp-0x21e],ax
000021D3  EB07              jmp short 0x21dc
000021D5  B81000            mov ax,0x10
000021D8  8986E2FD          mov [bp-0x21e],ax
000021DC  8B86E2FD          mov ax,[bp-0x21e]
000021E0  31DB              xor bx,bx
000021E2  53                push bx
000021E3  50                push ax
000021E4  8B86EAFD          mov ax,[bp-0x216]
000021E8  8B9EECFD          mov bx,[bp-0x214]
000021EC  8DBED6FD          lea di,[bp-0x22a]
000021F0  E84CDF            call word 0x13f
000021F3  83C404            add sp,byte +0x4
000021F6  8986E4FD          mov [bp-0x21c],ax
000021FA  E9BF00            jmp word 0x22bc
000021FD  8B86E2FD          mov ax,[bp-0x21e]
00002201  3D1000            cmp ax,0x10
00002204  7572              jnz 0x2278
00002206  8B86E4FD          mov ax,[bp-0x21c]
0000220A  31DB              xor bx,bx
0000220C  53                push bx
0000220D  50                push ax
0000220E  B8FFEF            mov ax,0xefff
00002211  31DB              xor bx,bx
00002213  53                push bx
00002214  50                push ax
00002215  8B86D6FD          mov ax,[bp-0x22a]
00002219  8B9ED8FD          mov bx,[bp-0x228]
0000221D  8DBED2FD          lea di,[bp-0x22e]
00002221  E878DE            call word 0x9c
00002224  8DA6DAFD          lea sp,[bp-0x226]
00002228  7607              jna 0x2231
0000222A  B8FFEF            mov ax,0xefff
0000222D  8986E4FD          mov [bp-0x21c],ax
00002231  B80F00            mov ax,0xf
00002234  8986E2FD          mov [bp-0x21e],ax
00002238  8B86E4FD          mov ax,[bp-0x21c]
0000223C  31DB              xor bx,bx
0000223E  53                push bx
0000223F  50                push ax
00002240  B81000            mov ax,0x10
00002243  31DB              xor bx,bx
00002245  53                push bx
00002246  50                push ax
00002247  8B86D6FD          mov ax,[bp-0x22a]
0000224B  8B9ED8FD          mov bx,[bp-0x228]
0000224F  8DBED2FD          lea di,[bp-0x22e]
00002253  E864DE            call word 0xba
00002256  83C408            add sp,byte +0x8
00002259  53                push bx
0000225A  50                push ax
0000225B  B80F00            mov ax,0xf
0000225E  31DB              xor bx,bx
00002260  53                push bx
00002261  50                push ax
00002262  8B86D6FD          mov ax,[bp-0x22a]
00002266  8B9ED8FD          mov bx,[bp-0x228]
0000226A  8DBED2FD          lea di,[bp-0x22e]
0000226E  E8CEDE            call word 0x13f
00002271  83C408            add sp,byte +0x8
00002274  8986E4FD          mov [bp-0x21c],ax
00002278  EB1F              jmp short 0x2299
0000227A  8B86E4FD          mov ax,[bp-0x21c]
0000227E  D1E8              shr ax,1
00002280  8986E4FD          mov [bp-0x21c],ax
00002284  8B86E2FD          mov ax,[bp-0x21e]
00002288  D1E0              shl ax,1
0000228A  8986E2FD          mov [bp-0x21e],ax
0000228E  8B86E2FD          mov ax,[bp-0x21e]
00002292  3D7F00            cmp ax,0x7f
00002295  7602              jna 0x2299
00002297  EB09              jmp short 0x22a2
00002299  8B86E4FD          mov ax,[bp-0x21c]
0000229D  3D0004            cmp ax,0x400
000022A0  77D8              ja 0x227a
000022A2  EB18              jmp short 0x22bc
000022A4  EB16              jmp short 0x22bc
000022A6  2C00              sub al,0x0
000022A8  0F8499FE          jz word 0x2145
000022AC  2C01              sub al,0x1
000022AE  0F8496FE          jz word 0x2148
000022B2  2C01              sub al,0x1
000022B4  74C2              jz 0x2278
000022B6  2C01              sub al,0x1
000022B8  0F8441FF          jz word 0x21fd
000022BC  8B86E4FD          mov ax,[bp-0x21c]
000022C0  3D0004            cmp ax,0x400
000022C3  7607              jna 0x22cc
000022C5  B80004            mov ax,0x400
000022C8  8986E4FD          mov [bp-0x21c],ax
000022CC  FFB6E0FD          push word [bp-0x220]
000022D0  FFB6E2FD          push word [bp-0x21e]
000022D4  FFB6E4FD          push word [bp-0x21c]
000022D8  BB74D7            mov bx,0xd774
000022DB  53                push bx
000022DC  B80400            mov ax,0x4
000022DF  50                push ax
000022E0  E847E6            call word 0x92a
000022E3  83C40A            add sp,byte +0xa
000022E6  8A46FD            mov al,[bp-0x3]
000022E9  30E4              xor ah,ah
000022EB  B91E00            mov cx,0x1e
000022EE  F7E9              imul cx
000022F0  89C3              mov bx,ax
000022F2  8B86E2FD          mov ax,[bp-0x21e]
000022F6  89874C01          mov [bx+0x14c],ax
000022FA  8A46FD            mov al,[bp-0x3]
000022FD  30E4              xor ah,ah
000022FF  B91E00            mov cx,0x1e
00002302  F7E9              imul cx
00002304  89C3              mov bx,ax
00002306  8B86E4FD          mov ax,[bp-0x21c]
0000230A  89874E01          mov [bx+0x14e],ax
0000230E  8A46FD            mov al,[bp-0x3]
00002311  30E4              xor ah,ah
00002313  B91E00            mov cx,0x1e
00002316  F7E9              imul cx
00002318  89C3              mov bx,ax
0000231A  8B86E0FD          mov ax,[bp-0x220]
0000231E  89875001          mov [bx+0x150],ax
00002322  8A46FF            mov al,[bp-0x1]
00002325  30E4              xor ah,ah
00002327  89C3              mov bx,ax
00002329  8A46FD            mov al,[bp-0x3]
0000232C  88873302          mov [bx+0x233],al
00002330  8A46FF            mov al,[bp-0x1]
00002333  40                inc ax
00002334  8846FF            mov [bp-0x1],al
00002337  83C414            add sp,byte +0x14
0000233A  8A46FC            mov al,[bp-0x4]
0000233D  3C03              cmp al,0x3
0000233F  0F851F01          jnz word 0x2462
00002343  83C4FA            add sp,byte -0x6
00002346  8A46FD            mov al,[bp-0x3]
00002349  30E4              xor ah,ah
0000234B  B91E00            mov cx,0x1e
0000234E  F7E9              imul cx
00002350  89C3              mov bx,ax
00002352  B005              mov al,0x5
00002354  88874301          mov [bx+0x143],al
00002358  8A46FD            mov al,[bp-0x3]
0000235B  30E4              xor ah,ah
0000235D  B91E00            mov cx,0x1e
00002360  F7E9              imul cx
00002362  89C3              mov bx,ax
00002364  30C0              xor al,al
00002366  88874601          mov [bx+0x146],al
0000236A  8D9EFCFD          lea bx,[bp-0x204]
0000236E  53                push bx
0000236F  E8E8E2            call word 0x65a
00002372  50                push ax
00002373  31C0              xor ax,ax
00002375  31DB              xor bx,bx
00002377  53                push bx
00002378  50                push ax
00002379  31C0              xor ax,ax
0000237B  31DB              xor bx,bx
0000237D  53                push bx
0000237E  50                push ax
0000237F  31C0              xor ax,ax
00002381  50                push ax
00002382  31C0              xor ax,ax
00002384  50                push ax
00002385  31C0              xor ax,ax
00002387  50                push ax
00002388  B80100            mov ax,0x1
0000238B  50                push ax
0000238C  B8A100            mov ax,0xa1
0000238F  50                push ax
00002390  8A46FD            mov al,[bp-0x3]
00002393  30E4              xor ah,ah
00002395  50                push ax
00002396  31C0              xor ax,ax
00002398  50                push ax
00002399  E8BF05            call word 0x295b
0000239C  83C41A            add sp,byte +0x1a
0000239F  85C0              test ax,ax
000023A1  740E              jz 0x23b1
000023A3  BB49D7            mov bx,0xd749
000023A6  53                push bx
000023A7  B80700            mov ax,0x7
000023AA  50                push ax
000023AB  E87CE5            call word 0x92a
000023AE  83C404            add sp,byte +0x4
000023B1  8D9EFDFD          lea bx,[bp-0x203]
000023B5  53                push bx
000023B6  E868E2            call word 0x621
000023B9  44                inc sp
000023BA  44                inc sp
000023BB  241F              and al,0x1f
000023BD  8886EDFD          mov [bp-0x213],al
000023C1  8D9EFCFD          lea bx,[bp-0x204]
000023C5  53                push bx
000023C6  E858E2            call word 0x621
000023C9  44                inc sp
000023CA  44                inc sp
000023CB  2480              and al,0x80
000023CD  84C0              test al,al
000023CF  7404              jz 0x23d5
000023D1  B001              mov al,0x1
000023D3  EB02              jmp short 0x23d7
000023D5  30C0              xor al,al
000023D7  8886ECFD          mov [bp-0x214],al
000023DB  8D9E5CFE          lea bx,[bp-0x1a4]
000023DF  53                push bx
000023E0  E83EE2            call word 0x621
000023E3  44                inc sp
000023E4  44                inc sp
000023E5  84C0              test al,al
000023E7  7404              jz 0x23ed
000023E9  B001              mov al,0x1
000023EB  EB02              jmp short 0x23ef
000023ED  30C0              xor al,al
000023EF  8886EBFD          mov [bp-0x215],al
000023F3  B80008            mov ax,0x800
000023F6  8986E8FD          mov [bp-0x218],ax
000023FA  8A46FD            mov al,[bp-0x3]
000023FD  30E4              xor ah,ah
000023FF  B91E00            mov cx,0x1e
00002402  F7E9              imul cx
00002404  89C3              mov bx,ax
00002406  8A86EDFD          mov al,[bp-0x213]
0000240A  88874301          mov [bx+0x143],al
0000240E  8A46FD            mov al,[bp-0x3]
00002411  30E4              xor ah,ah
00002413  B91E00            mov cx,0x1e
00002416  F7E9              imul cx
00002418  89C3              mov bx,ax
0000241A  8A86ECFD          mov al,[bp-0x214]
0000241E  88874401          mov [bx+0x144],al
00002422  8A46FD            mov al,[bp-0x3]
00002425  30E4              xor ah,ah
00002427  B91E00            mov cx,0x1e
0000242A  F7E9              imul cx
0000242C  89C3              mov bx,ax
0000242E  8A86EBFD          mov al,[bp-0x215]
00002432  88874601          mov [bx+0x146],al
00002436  8A46FD            mov al,[bp-0x3]
00002439  30E4              xor ah,ah
0000243B  B91E00            mov cx,0x1e
0000243E  F7E9              imul cx
00002440  89C3              mov bx,ax
00002442  8B86E8FD          mov ax,[bp-0x218]
00002446  89874801          mov [bx+0x148],ax
0000244A  8A46FE            mov al,[bp-0x2]
0000244D  30E4              xor ah,ah
0000244F  89C3              mov bx,ax
00002451  8A46FD            mov al,[bp-0x3]
00002454  88873C02          mov [bx+0x23c],al
00002458  8A46FE            mov al,[bp-0x2]
0000245B  40                inc ax
0000245C  8846FE            mov [bp-0x2],al
0000245F  83C406            add sp,byte +0x6
00002462  83C4CE            add sp,byte -0x32
00002465  8A46FC            mov al,[bp-0x4]
00002468  E9C801            jmp word 0x2633
0000246B  8A46FD            mov al,[bp-0x3]
0000246E  30E4              xor ah,ah
00002470  B91E00            mov cx,0x1e
00002473  F7E9              imul cx
00002475  89C3              mov bx,ax
00002477  8B875801          mov ax,[bx+0x158]
0000247B  8B9F5A01          mov bx,[bx+0x15a]
0000247F  88E0              mov al,ah
00002481  88DC              mov ah,bl
00002483  88FB              mov bl,bh
00002485  28FF              sub bh,bh
00002487  BF0300            mov di,0x3
0000248A  E86DDC            call word 0xfa
0000248D  53                push bx
0000248E  50                push ax
0000248F  8A46FD            mov al,[bp-0x3]
00002492  30E4              xor ah,ah
00002494  B91E00            mov cx,0x1e
00002497  F7E9              imul cx
00002499  89C3              mov bx,ax
0000249B  8B875C01          mov ax,[bx+0x15c]
0000249F  8B9F5E01          mov bx,[bx+0x15e]
000024A3  B105              mov cl,0x5
000024A5  D3E0              shl ax,cl
000024A7  93                xchg ax,bx
000024A8  31C0              xor ax,ax
000024AA  8DBEB8FD          lea di,[bp-0x248]
000024AE  E827DC            call word 0xd8
000024B1  83C404            add sp,byte +0x4
000024B4  8986EAFD          mov [bp-0x216],ax
000024B8  899EECFD          mov [bp-0x214],bx
000024BC  8D9E9CFE          lea bx,[bp-0x164]
000024C0  53                push bx
000024C1  E85DE1            call word 0x621
000024C4  44                inc sp
000024C5  44                inc sp
000024C6  50                push ax
000024C7  8D9E9DFE          lea bx,[bp-0x163]
000024CB  53                push bx
000024CC  E852E1            call word 0x621
000024CF  44                inc sp
000024D0  44                inc sp
000024D1  30E4              xor ah,ah
000024D3  88C4              mov ah,al
000024D5  30C0              xor al,al
000024D7  0A86BAFD          or al,[bp-0x246]
000024DB  44                inc sp
000024DC  44                inc sp
000024DD  8986E8FD          mov [bp-0x218],ax
000024E1  B00F              mov al,0xf
000024E3  8886E5FD          mov [bp-0x21b],al
000024E7  EB22              jmp short 0x250b
000024E9  8A86E5FD          mov al,[bp-0x21b]
000024ED  30E4              xor ah,ah
000024EF  89C3              mov bx,ax
000024F1  B80100            mov ax,0x1
000024F4  89D9              mov cx,bx
000024F6  D3E0              shl ax,cl
000024F8  2386E8FD          and ax,[bp-0x218]
000024FC  85C0              test ax,ax
000024FE  7402              jz 0x2502
00002500  EB11              jmp short 0x2513
00002502  8A86E5FD          mov al,[bp-0x21b]
00002506  48                dec ax
00002507  8886E5FD          mov [bp-0x21b],al
0000250B  8A86E5FD          mov al,[bp-0x21b]
0000250F  84C0              test al,al
00002511  75D6              jnz 0x24e9
00002513  30C0              xor al,al
00002515  8886E6FD          mov [bp-0x21a],al
00002519  EB69              jmp short 0x2584
0000251B  8A86E6FD          mov al,[bp-0x21a]
0000251F  30E4              xor ah,ah
00002521  D1E0              shl ax,1
00002523  89EB              mov bx,bp
00002525  01C3              add bx,ax
00002527  81C3BCFD          add bx,0xfdbc
0000252B  53                push bx
0000252C  8A86E6FD          mov al,[bp-0x21a]
00002530  30E4              xor ah,ah
00002532  D1E0              shl ax,1
00002534  89EB              mov bx,bp
00002536  01C3              add bx,ax
00002538  81C333FE          add bx,0xfe33
0000253C  53                push bx
0000253D  E8E1E0            call word 0x621
00002540  44                inc sp
00002541  44                inc sp
00002542  30E4              xor ah,ah
00002544  50                push ax
00002545  E8EFE0            call word 0x637
00002548  83C404            add sp,byte +0x4
0000254B  8A86E6FD          mov al,[bp-0x21a]
0000254F  30E4              xor ah,ah
00002551  D1E0              shl ax,1
00002553  89EB              mov bx,bp
00002555  01C3              add bx,ax
00002557  81C3BDFD          add bx,0xfdbd
0000255B  53                push bx
0000255C  8A86E6FD          mov al,[bp-0x21a]
00002560  30E4              xor ah,ah
00002562  D1E0              shl ax,1
00002564  89EB              mov bx,bp
00002566  01C3              add bx,ax
00002568  81C332FE          add bx,0xfe32
0000256C  53                push bx
0000256D  E8B1E0            call word 0x621
00002570  44                inc sp
00002571  44                inc sp
00002572  30E4              xor ah,ah
00002574  50                push ax
00002575  E8BFE0            call word 0x637
00002578  83C404            add sp,byte +0x4
0000257B  8A86E6FD          mov al,[bp-0x21a]
0000257F  40                inc ax
00002580  8886E6FD          mov [bp-0x21a],al
00002584  8A86E6FD          mov al,[bp-0x21a]
00002588  3C14              cmp al,0x14
0000258A  728F              jc 0x251b
0000258C  8D9EE4FD          lea bx,[bp-0x21c]
00002590  53                push bx
00002591  31C0              xor ax,ax
00002593  50                push ax
00002594  E8A0E0            call word 0x637
00002597  83C404            add sp,byte +0x4
0000259A  B027              mov al,0x27
0000259C  8886E6FD          mov [bp-0x21a],al
000025A0  EB3D              jmp short 0x25df
000025A2  8A86E6FD          mov al,[bp-0x21a]
000025A6  30E4              xor ah,ah
000025A8  89EB              mov bx,bp
000025AA  01C3              add bx,ax
000025AC  81C3BCFD          add bx,0xfdbc
000025B0  53                push bx
000025B1  E86DE0            call word 0x621
000025B4  44                inc sp
000025B5  44                inc sp
000025B6  3C20              cmp al,0x20
000025B8  751A              jnz 0x25d4
000025BA  8A86E6FD          mov al,[bp-0x21a]
000025BE  30E4              xor ah,ah
000025C0  89EB              mov bx,bp
000025C2  01C3              add bx,ax
000025C4  81C3BCFD          add bx,0xfdbc
000025C8  53                push bx
000025C9  31C0              xor ax,ax
000025CB  50                push ax
000025CC  E868E0            call word 0x637
000025CF  83C404            add sp,byte +0x4
000025D2  EB02              jmp short 0x25d6
000025D4  EB11              jmp short 0x25e7
000025D6  8A86E6FD          mov al,[bp-0x21a]
000025DA  48                dec ax
000025DB  8886E6FD          mov [bp-0x21a],al
000025DF  8A86E6FD          mov al,[bp-0x21a]
000025E3  84C0              test al,al
000025E5  75BB              jnz 0x25a2
000025E7  8A86E6FD          mov al,[bp-0x21a]
000025EB  3C24              cmp al,0x24
000025ED  7640              jna 0x262f
000025EF  8D9EE0FD          lea bx,[bp-0x220]
000025F3  53                push bx
000025F4  31C0              xor ax,ax
000025F6  50                push ax
000025F7  E83DE0            call word 0x637
000025FA  83C404            add sp,byte +0x4
000025FD  B023              mov al,0x23
000025FF  8886E6FD          mov [bp-0x21a],al
00002603  EB22              jmp short 0x2627
00002605  8A86E6FD          mov al,[bp-0x21a]
00002609  30E4              xor ah,ah
0000260B  89EB              mov bx,bp
0000260D  01C3              add bx,ax
0000260F  81C3BCFD          add bx,0xfdbc
00002613  53                push bx
00002614  B82E00            mov ax,0x2e
00002617  50                push ax
00002618  E81CE0            call word 0x637
0000261B  83C404            add sp,byte +0x4
0000261E  8A86E6FD          mov al,[bp-0x21a]
00002622  48                dec ax
00002623  8886E6FD          mov [bp-0x21a],al
00002627  8A86E6FD          mov al,[bp-0x21a]
0000262B  3C20              cmp al,0x20
0000262D  77D6              ja 0x2605
0000262F  EB0E              jmp short 0x263f
00002631  EB0C              jmp short 0x263f
00002633  2C02              sub al,0x2
00002635  0F8432FE          jz word 0x246b
00002639  2C01              sub al,0x1
0000263B  0F847DFE          jz word 0x24bc
0000263F  8A46FC            mov al,[bp-0x4]
00002642  E98E01            jmp word 0x27d3
00002645  8A86F4FD          mov al,[bp-0x20c]
00002649  84C0              test al,al
0000264B  7405              jz 0x2652
0000264D  BB37D7            mov bx,0xd737
00002650  EB03              jmp short 0x2655
00002652  BB30D7            mov bx,0xd730
00002655  53                push bx
00002656  8A86F5FD          mov al,[bp-0x20b]
0000265A  30E4              xor ah,ah
0000265C  50                push ax
0000265D  BB3ED7            mov bx,0xd73e
00002660  53                push bx
00002661  B80200            mov ax,0x2
00002664  50                push ax
00002665  E8C2E2            call word 0x92a
00002668  83C408            add sp,byte +0x8
0000266B  30C0              xor al,al
0000266D  8886E6FD          mov [bp-0x21a],al
00002671  EB15              jmp short 0x2688
00002673  8A86E7FD          mov al,[bp-0x219]
00002677  30E4              xor ah,ah
00002679  50                push ax
0000267A  BB2DD7            mov bx,0xd72d
0000267D  53                push bx
0000267E  B80200            mov ax,0x2
00002681  50                push ax
00002682  E8A5E2            call word 0x92a
00002685  83C406            add sp,byte +0x6
00002688  8A86E6FD          mov al,[bp-0x21a]
0000268C  40                inc ax
0000268D  8886E6FD          mov [bp-0x21a],al
00002691  48                dec ax
00002692  30E4              xor ah,ah
00002694  89EB              mov bx,bp
00002696  01C3              add bx,ax
00002698  81C3BCFD          add bx,0xfdbc
0000269C  53                push bx
0000269D  E881DF            call word 0x621
000026A0  44                inc sp
000026A1  44                inc sp
000026A2  8886E7FD          mov [bp-0x219],al
000026A6  84C0              test al,al
000026A8  75C9              jnz 0x2673
000026AA  31C0              xor ax,ax
000026AC  BB0100            mov bx,0x1
000026AF  8DBEEAFD          lea di,[bp-0x216]
000026B3  E8E6D9            call word 0x9c
000026B6  761B              jna 0x26d3
000026B8  FFB6EAFD          push word [bp-0x216]
000026BC  8A86E5FD          mov al,[bp-0x21b]
000026C0  30E4              xor ah,ah
000026C2  50                push ax
000026C3  BB0DD7            mov bx,0xd70d
000026C6  53                push bx
000026C7  B80200            mov ax,0x2
000026CA  50                push ax
000026CB  E85CE2            call word 0x92a
000026CE  83C408            add sp,byte +0x8
000026D1  EB2C              jmp short 0x26ff
000026D3  8B86EAFD          mov ax,[bp-0x216]
000026D7  8B9EECFD          mov bx,[bp-0x214]
000026DB  88E0              mov al,ah
000026DD  88DC              mov ah,bl
000026DF  88FB              mov bl,bh
000026E1  28FF              sub bh,bh
000026E3  BF0200            mov di,0x2
000026E6  E811DA            call word 0xfa
000026E9  50                push ax
000026EA  8A86E5FD          mov al,[bp-0x21b]
000026EE  30E4              xor ah,ah
000026F0  50                push ax
000026F1  BBEDD6            mov bx,0xd6ed
000026F4  53                push bx
000026F5  B80200            mov ax,0x2
000026F8  50                push ax
000026F9  E82EE2            call word 0x92a
000026FC  83C408            add sp,byte +0x8
000026FF  E9E100            jmp word 0x27e3
00002702  8A86F4FD          mov al,[bp-0x20c]
00002706  84C0              test al,al
00002708  7405              jz 0x270f
0000270A  BBDBD6            mov bx,0xd6db
0000270D  EB03              jmp short 0x2712
0000270F  BBD4D6            mov bx,0xd6d4
00002712  53                push bx
00002713  8A86F5FD          mov al,[bp-0x20b]
00002717  30E4              xor ah,ah
00002719  50                push ax
0000271A  BBE2D6            mov bx,0xd6e2
0000271D  53                push bx
0000271E  B80200            mov ax,0x2
00002721  50                push ax
00002722  E805E2            call word 0x92a
00002725  83C408            add sp,byte +0x8
00002728  30C0              xor al,al
0000272A  8886E6FD          mov [bp-0x21a],al
0000272E  EB15              jmp short 0x2745
00002730  8A86E7FD          mov al,[bp-0x219]
00002734  30E4              xor ah,ah
00002736  50                push ax
00002737  BBD1D6            mov bx,0xd6d1
0000273A  53                push bx
0000273B  B80200            mov ax,0x2
0000273E  50                push ax
0000273F  E8E8E1            call word 0x92a
00002742  83C406            add sp,byte +0x6
00002745  8A86E6FD          mov al,[bp-0x21a]
00002749  40                inc ax
0000274A  8886E6FD          mov [bp-0x21a],al
0000274E  48                dec ax
0000274F  30E4              xor ah,ah
00002751  89EB              mov bx,bp
00002753  01C3              add bx,ax
00002755  81C3BCFD          add bx,0xfdbc
00002759  53                push bx
0000275A  E8C4DE            call word 0x621
0000275D  44                inc sp
0000275E  44                inc sp
0000275F  8886E7FD          mov [bp-0x219],al
00002763  84C0              test al,al
00002765  75C9              jnz 0x2730
00002767  8A46FD            mov al,[bp-0x3]
0000276A  30E4              xor ah,ah
0000276C  B91E00            mov cx,0x1e
0000276F  F7E9              imul cx
00002771  89C3              mov bx,ax
00002773  8A874301          mov al,[bx+0x143]
00002777  3C05              cmp al,0x5
00002779  7517              jnz 0x2792
0000277B  8A86E5FD          mov al,[bp-0x21b]
0000277F  30E4              xor ah,ah
00002781  50                push ax
00002782  BBB7D6            mov bx,0xd6b7
00002785  53                push bx
00002786  B80200            mov ax,0x2
00002789  50                push ax
0000278A  E89DE1            call word 0x92a
0000278D  83C406            add sp,byte +0x6
00002790  EB15              jmp short 0x27a7
00002792  8A86E5FD          mov al,[bp-0x21b]
00002796  30E4              xor ah,ah
00002798  50                push ax
00002799  BBA5D6            mov bx,0xd6a5
0000279C  53                push bx
0000279D  B80200            mov ax,0x2
000027A0  50                push ax
000027A1  E886E1            call word 0x92a
000027A4  83C406            add sp,byte +0x6
000027A7  EB3A              jmp short 0x27e3
000027A9  8A86F4FD          mov al,[bp-0x20c]
000027AD  84C0              test al,al
000027AF  7405              jz 0x27b6
000027B1  BB84D6            mov bx,0xd684
000027B4  EB03              jmp short 0x27b9
000027B6  BB7DD6            mov bx,0xd67d
000027B9  53                push bx
000027BA  8A86F5FD          mov al,[bp-0x20b]
000027BE  30E4              xor ah,ah
000027C0  50                push ax
000027C1  BB8BD6            mov bx,0xd68b
000027C4  53                push bx
000027C5  B80200            mov ax,0x2
000027C8  50                push ax
000027C9  E85EE1            call word 0x92a
000027CC  83C408            add sp,byte +0x8
000027CF  EB12              jmp short 0x27e3
000027D1  EB10              jmp short 0x27e3
000027D3  2C01              sub al,0x1
000027D5  74D2              jz 0x27a9
000027D7  2C01              sub al,0x1
000027D9  0F8468FE          jz word 0x2645
000027DD  2C01              sub al,0x1
000027DF  0F841FFF          jz word 0x2702
000027E3  83C432            add sp,byte +0x32
000027E6  83C40C            add sp,byte +0xc
000027E9  8A46FD            mov al,[bp-0x3]
000027EC  40                inc ax
000027ED  8846FD            mov [bp-0x3],al
000027F0  8A46FD            mov al,[bp-0x3]
000027F3  3C08              cmp al,0x8
000027F5  0F8233F4          jc word 0x1c2c
000027F9  8A46FF            mov al,[bp-0x1]
000027FC  A23202            mov [0x232],al
000027FF  8A46FE            mov al,[bp-0x2]
00002802  A23B02            mov [0x23b],al
00002805  B84000            mov ax,0x40
00002808  50                push ax
00002809  B87500            mov ax,0x75
0000280C  50                push ax
0000280D  8A46FF            mov al,[bp-0x1]
00002810  30E4              xor ah,ah
00002812  50                push ax
00002813  E8E5DD            call word 0x5fb
00002816  83C406            add sp,byte +0x6
00002819  BB7BD6            mov bx,0xd67b
0000281C  53                push bx
0000281D  B80200            mov ax,0x2
00002820  50                push ax
00002821  E806E1            call word 0x92a
00002824  83C404            add sp,byte +0x4
00002827  FFB6FAFD          push word [bp-0x206]
0000282B  E82FDE            call word 0x65d
0000282E  44                inc sp
0000282F  44                inc sp
00002830  89EC              mov sp,bp
00002832  5D                pop bp
00002833  C3                ret
00002834  55                push bp
00002835  89E5              mov bp,sp
00002837  83C4F4            add sp,byte -0xc
0000283A  8B4604            mov ax,[bp+0x4]
0000283D  D1E8              shr ax,1
0000283F  8846FB            mov [bp-0x5],al
00002842  8B4604            mov ax,[bp+0x4]
00002845  2401              and al,0x1
00002847  8846FA            mov [bp-0x6],al
0000284A  8A46FB            mov al,[bp-0x5]
0000284D  30E4              xor ah,ah
0000284F  B103              mov cl,0x3
00002851  D3E0              shl ax,cl
00002853  89C3              mov bx,ax
00002855  8B9F2401          mov bx,[bx+0x124]
00002859  895EFE            mov [bp-0x2],bx
0000285C  8A46FB            mov al,[bp-0x5]
0000285F  30E4              xor ah,ah
00002861  B103              mov cl,0x3
00002863  D3E0              shl ax,cl
00002865  89C3              mov bx,ax
00002867  8B9F2601          mov bx,[bx+0x126]
0000286B  895EFC            mov [bp-0x4],bx
0000286E  B80E00            mov ax,0xe
00002871  50                push ax
00002872  8B46FC            mov ax,[bp-0x4]
00002875  050600            add ax,0x6
00002878  50                push ax
00002879  E8C3DC            call word 0x53f
0000287C  83C404            add sp,byte +0x4
0000287F  B81400            mov ax,0x14
00002882  50                push ax
00002883  FF76FE            push word [bp-0x2]
00002886  B80100            mov ax,0x1
00002889  50                push ax
0000288A  E8A0F1            call word 0x1a2d
0000288D  83C406            add sp,byte +0x6
00002890  B80A00            mov ax,0xa
00002893  50                push ax
00002894  8B46FC            mov ax,[bp-0x4]
00002897  050600            add ax,0x6
0000289A  50                push ax
0000289B  E8A1DC            call word 0x53f
0000289E  83C404            add sp,byte +0x4
000028A1  8B4604            mov ax,[bp+0x4]
000028A4  B91E00            mov cx,0x1e
000028A7  F7E9              imul cx
000028A9  89C3              mov bx,ax
000028AB  8A874201          mov al,[bx+0x142]
000028AF  8846F7            mov [bp-0x9],al
000028B2  8A46F7            mov al,[bp-0x9]
000028B5  84C0              test al,al
000028B7  0F848400          jz word 0x293f
000028BB  8A46FA            mov al,[bp-0x6]
000028BE  84C0              test al,al
000028C0  7404              jz 0x28c6
000028C2  B0B0              mov al,0xb0
000028C4  EB02              jmp short 0x28c8
000028C6  B0A0              mov al,0xa0
000028C8  30E4              xor ah,ah
000028CA  50                push ax
000028CB  8B46FE            mov ax,[bp-0x2]
000028CE  050600            add ax,0x6
000028D1  50                push ax
000028D2  E86ADC            call word 0x53f
000028D5  83C404            add sp,byte +0x4
000028D8  8B46FE            mov ax,[bp-0x2]
000028DB  40                inc ax
000028DC  40                inc ax
000028DD  50                push ax
000028DE  E848DC            call word 0x529
000028E1  44                inc sp
000028E2  44                inc sp
000028E3  8846F8            mov [bp-0x8],al
000028E6  8B46FE            mov ax,[bp-0x2]
000028E9  050300            add ax,0x3
000028EC  50                push ax
000028ED  E839DC            call word 0x529
000028F0  44                inc sp
000028F1  44                inc sp
000028F2  8846F9            mov [bp-0x7],al
000028F5  8A46F8            mov al,[bp-0x8]
000028F8  3C01              cmp al,0x1
000028FA  7532              jnz 0x292e
000028FC  8A46F9            mov al,[bp-0x7]
000028FF  3C01              cmp al,0x1
00002901  752B              jnz 0x292e
00002903  8A46F7            mov al,[bp-0x9]
00002906  3C02              cmp al,0x2
00002908  7513              jnz 0x291d
0000290A  B8007D            mov ax,0x7d00
0000290D  50                push ax
0000290E  FF76FE            push word [bp-0x2]
00002911  B80500            mov ax,0x5
00002914  50                push ax
00002915  E815F1            call word 0x1a2d
00002918  83C406            add sp,byte +0x6
0000291B  EB11              jmp short 0x292e
0000291D  B8007D            mov ax,0x7d00
00002920  50                push ax
00002921  FF76FE            push word [bp-0x2]
00002924  B80200            mov ax,0x2
00002927  50                push ax
00002928  E802F1            call word 0x1a2d
0000292B  83C406            add sp,byte +0x6
0000292E  B8007D            mov ax,0x7d00
00002931  50                push ax
00002932  FF76FE            push word [bp-0x2]
00002935  B80200            mov ax,0x2
00002938  50                push ax
00002939  E8F1F0            call word 0x1a2d
0000293C  83C406            add sp,byte +0x6
0000293F  B80800            mov ax,0x8
00002942  50                push ax
00002943  8B46FC            mov ax,[bp-0x4]
00002946  050600            add ax,0x6
00002949  50                push ax
0000294A  E8F2DB            call word 0x53f
0000294D  83C404            add sp,byte +0x4
00002950  89EC              mov sp,bp
00002952  5D                pop bp
00002953  C3                ret
00002954  55                push bp
00002955  89E5              mov bp,sp
00002957  31C0              xor ax,ax
00002959  5D                pop bp
0000295A  C3                ret
0000295B  55                push bp
0000295C  89E5              mov bp,sp
0000295E  83C4F4            add sp,byte -0xc
00002961  8B4606            mov ax,[bp+0x6]
00002964  D1E8              shr ax,1
00002966  8846F9            mov [bp-0x7],al
00002969  8B4606            mov ax,[bp+0x6]
0000296C  2401              and al,0x1
0000296E  8846F8            mov [bp-0x8],al
00002971  8A46F9            mov al,[bp-0x7]
00002974  30E4              xor ah,ah
00002976  B103              mov cl,0x3
00002978  D3E0              shl ax,cl
0000297A  89C3              mov bx,ax
0000297C  8B9F2401          mov bx,[bx+0x124]
00002980  895EFE            mov [bp-0x2],bx
00002983  8A46F9            mov al,[bp-0x7]
00002986  30E4              xor ah,ah
00002988  B103              mov cl,0x3
0000298A  D3E0              shl ax,cl
0000298C  89C3              mov bx,ax
0000298E  8B9F2601          mov bx,[bx+0x126]
00002992  895EFC            mov [bp-0x4],bx
00002995  8B4606            mov ax,[bp+0x6]
00002998  B91E00            mov cx,0x1e
0000299B  F7E9              imul cx
0000299D  89C3              mov bx,ax
0000299F  8A874601          mov al,[bx+0x146]
000029A3  8846F5            mov [bp-0xb],al
000029A6  B80002            mov ax,0x200
000029A9  8946FA            mov [bp-0x6],ax
000029AC  8A46F5            mov al,[bp-0xb]
000029AF  3C01              cmp al,0x1
000029B1  750C              jnz 0x29bf
000029B3  8B46FA            mov ax,[bp-0x6]
000029B6  D1E8              shr ax,1
000029B8  D1E8              shr ax,1
000029BA  8946FA            mov [bp-0x6],ax
000029BD  EB08              jmp short 0x29c7
000029BF  8B46FA            mov ax,[bp-0x6]
000029C2  D1E8              shr ax,1
000029C4  8946FA            mov [bp-0x6],ax
000029C7  31C0              xor ax,ax
000029C9  A35402            mov [0x254],ax
000029CC  31C0              xor ax,ax
000029CE  31DB              xor bx,bx
000029D0  A35602            mov [0x256],ax
000029D3  891E5802          mov [0x258],bx
000029D7  30C0              xor al,al
000029D9  8846F6            mov [bp-0xa],al
000029DC  8B46FE            mov ax,[bp-0x2]
000029DF  050700            add ax,0x7
000029E2  50                push ax
000029E3  E843DB            call word 0x529
000029E6  44                inc sp
000029E7  44                inc sp
000029E8  8846F7            mov [bp-0x9],al
000029EB  8A46F7            mov al,[bp-0x9]
000029EE  2480              and al,0x80
000029F0  84C0              test al,al
000029F2  7407              jz 0x29fb
000029F4  B80100            mov ax,0x1
000029F7  89EC              mov sp,bp
000029F9  5D                pop bp
000029FA  C3                ret
000029FB  B80A00            mov ax,0xa
000029FE  50                push ax
000029FF  8B46FC            mov ax,[bp-0x4]
00002A02  050600            add ax,0x6
00002A05  50                push ax
00002A06  E836DB            call word 0x53f
00002A09  83C404            add sp,byte +0x4
00002A0C  8B4610            mov ax,[bp+0x10]
00002A0F  85C0              test ax,ax
00002A11  0F855F01          jnz word 0x2b74
00002A15  8B460A            mov ax,[bp+0xa]
00002A18  3D0001            cmp ax,0x100
00002A1B  7204              jc 0x2a21
00002A1D  B001              mov al,0x1
00002A1F  EB02              jmp short 0x2a23
00002A21  30C0              xor al,al
00002A23  30E4              xor ah,ah
00002A25  99                cwd
00002A26  89D3              mov bx,dx
00002A28  E8BAD6            call word 0xe5
00002A2B  752A              jnz 0x2a57
00002A2D  8B4616            mov ax,[bp+0x16]
00002A30  8B5E18            mov bx,[bp+0x18]
00002A33  E8AFD6            call word 0xe5
00002A36  751F              jnz 0x2a57
00002A38  8B460A            mov ax,[bp+0xa]
00002A3B  31DB              xor bx,bx
00002A3D  53                push bx
00002A3E  50                push ax
00002A3F  31C0              xor ax,ax
00002A41  BB0010            mov bx,0x1000
00002A44  8D7EF0            lea di,[bp-0x10]
00002A47  E868D6            call word 0xb2
00002A4A  83C404            add sp,byte +0x4
00002A4D  8D7E12            lea di,[bp+0x12]
00002A50  E849D6            call word 0x9c
00002A53  0F87BC00          ja word 0x2b13
00002A57  31C0              xor ax,ax
00002A59  50                push ax
00002A5A  8B46FE            mov ax,[bp-0x2]
00002A5D  40                inc ax
00002A5E  50                push ax
00002A5F  E8DDDA            call word 0x53f
00002A62  83C404            add sp,byte +0x4
00002A65  8B460A            mov ax,[bp+0xa]
00002A68  88E0              mov al,ah
00002A6A  30E4              xor ah,ah
00002A6C  30E4              xor ah,ah
00002A6E  50                push ax
00002A6F  8B46FE            mov ax,[bp-0x2]
00002A72  40                inc ax
00002A73  40                inc ax
00002A74  50                push ax
00002A75  E8C7DA            call word 0x53f
00002A78  83C404            add sp,byte +0x4
00002A7B  8B4612            mov ax,[bp+0x12]
00002A7E  8B5E14            mov bx,[bp+0x14]
00002A81  93                xchg ax,bx
00002A82  88E0              mov al,ah
00002A84  30E4              xor ah,ah
00002A86  31DB              xor bx,bx
00002A88  53                push bx
00002A89  50                push ax
00002A8A  8B46FE            mov ax,[bp-0x2]
00002A8D  050300            add ax,0x3
00002A90  50                push ax
00002A91  E8ABDA            call word 0x53f
00002A94  83C406            add sp,byte +0x6
00002A97  B8FF00            mov ax,0xff
00002A9A  31DB              xor bx,bx
00002A9C  8D7E16            lea di,[bp+0x16]
00002A9F  E8EAD5            call word 0x8c
00002AA2  53                push bx
00002AA3  50                push ax
00002AA4  8B46FE            mov ax,[bp-0x2]
00002AA7  050400            add ax,0x4
00002AAA  50                push ax
00002AAB  E891DA            call word 0x53f
00002AAE  83C406            add sp,byte +0x6
00002AB1  8B4616            mov ax,[bp+0x16]
00002AB4  8B5E18            mov bx,[bp+0x18]
00002AB7  88E0              mov al,ah
00002AB9  88DC              mov ah,bl
00002ABB  88FB              mov bl,bh
00002ABD  28FF              sub bh,bh
00002ABF  53                push bx
00002AC0  50                push ax
00002AC1  8B46FE            mov ax,[bp-0x2]
00002AC4  050500            add ax,0x5
00002AC7  50                push ax
00002AC8  E874DA            call word 0x53f
00002ACB  83C406            add sp,byte +0x6
00002ACE  8B4608            mov ax,[bp+0x8]
00002AD1  0C04              or al,0x4
00002AD3  894608            mov [bp+0x8],ax
00002AD6  8B460A            mov ax,[bp+0xa]
00002AD9  31DB              xor bx,bx
00002ADB  53                push bx
00002ADC  50                push ax
00002ADD  B8FF00            mov ax,0xff
00002AE0  31DB              xor bx,bx
00002AE2  53                push bx
00002AE3  50                push ax
00002AE4  8B46F0            mov ax,[bp-0x10]
00002AE7  8B5EF2            mov bx,[bp-0xe]
00002AEA  8D7EEC            lea di,[bp-0x14]
00002AED  E89CD5            call word 0x8c
00002AF0  89460A            mov [bp+0xa],ax
00002AF3  83C408            add sp,byte +0x8
00002AF6  B8FFFF            mov ax,0xffff
00002AF9  BBFF00            mov bx,0xff
00002AFC  53                push bx
00002AFD  50                push ax
00002AFE  8B4612            mov ax,[bp+0x12]
00002B01  8B5E14            mov bx,[bp+0x14]
00002B04  8D7EF0            lea di,[bp-0x10]
00002B07  E882D5            call word 0x8c
00002B0A  894612            mov [bp+0x12],ax
00002B0D  895E14            mov [bp+0x14],bx
00002B10  83C404            add sp,byte +0x4
00002B13  B8FF00            mov ax,0xff
00002B16  31DB              xor bx,bx
00002B18  8D7E12            lea di,[bp+0x12]
00002B1B  E86ED5            call word 0x8c
00002B1E  894610            mov [bp+0x10],ax
00002B21  8B4612            mov ax,[bp+0x12]
00002B24  8B5E14            mov bx,[bp+0x14]
00002B27  88E0              mov al,ah
00002B29  88DC              mov ah,bl
00002B2B  88FB              mov bl,bh
00002B2D  28FF              sub bh,bh
00002B2F  53                push bx
00002B30  50                push ax
00002B31  B8FFFF            mov ax,0xffff
00002B34  31DB              xor bx,bx
00002B36  53                push bx
00002B37  50                push ax
00002B38  8B46F0            mov ax,[bp-0x10]
00002B3B  8B5EF2            mov bx,[bp-0xe]
00002B3E  8D7EEC            lea di,[bp-0x14]
00002B41  E848D5            call word 0x8c
00002B44  83C408            add sp,byte +0x8
00002B47  89460C            mov [bp+0xc],ax
00002B4A  8B4612            mov ax,[bp+0x12]
00002B4D  8B5E14            mov bx,[bp+0x14]
00002B50  93                xchg ax,bx
00002B51  88E0              mov al,ah
00002B53  30E4              xor ah,ah
00002B55  31DB              xor bx,bx
00002B57  53                push bx
00002B58  50                push ax
00002B59  B80F00            mov ax,0xf
00002B5C  31DB              xor bx,bx
00002B5E  53                push bx
00002B5F  50                push ax
00002B60  8B46F0            mov ax,[bp-0x10]
00002B63  8B5EF2            mov bx,[bp-0xe]
00002B66  8D7EEC            lea di,[bp-0x14]
00002B69  E820D5            call word 0x8c
00002B6C  83C408            add sp,byte +0x8
00002B6F  0C40              or al,0x40
00002B71  89460E            mov [bp+0xe],ax
00002B74  31C0              xor ax,ax
00002B76  50                push ax
00002B77  8B46FE            mov ax,[bp-0x2]
00002B7A  40                inc ax
00002B7B  50                push ax
00002B7C  E8C0D9            call word 0x53f
00002B7F  83C404            add sp,byte +0x4
00002B82  FF760A            push word [bp+0xa]
00002B85  8B46FE            mov ax,[bp-0x2]
00002B88  40                inc ax
00002B89  40                inc ax
00002B8A  50                push ax
00002B8B  E8B1D9            call word 0x53f
00002B8E  83C404            add sp,byte +0x4
00002B91  FF7610            push word [bp+0x10]
00002B94  8B46FE            mov ax,[bp-0x2]
00002B97  050300            add ax,0x3
00002B9A  50                push ax
00002B9B  E8A1D9            call word 0x53f
00002B9E  83C404            add sp,byte +0x4
00002BA1  8A460C            mov al,[bp+0xc]
00002BA4  30E4              xor ah,ah
00002BA6  50                push ax
00002BA7  8B46FE            mov ax,[bp-0x2]
00002BAA  050400            add ax,0x4
00002BAD  50                push ax
00002BAE  E88ED9            call word 0x53f
00002BB1  83C404            add sp,byte +0x4
00002BB4  8B460C            mov ax,[bp+0xc]
00002BB7  88E0              mov al,ah
00002BB9  30E4              xor ah,ah
00002BBB  50                push ax
00002BBC  8B46FE            mov ax,[bp-0x2]
00002BBF  050500            add ax,0x5
00002BC2  50                push ax
00002BC3  E879D9            call word 0x53f
00002BC6  83C404            add sp,byte +0x4
00002BC9  8A46F8            mov al,[bp-0x8]
00002BCC  84C0              test al,al
00002BCE  7404              jz 0x2bd4
00002BD0  B0B0              mov al,0xb0
00002BD2  EB02              jmp short 0x2bd6
00002BD4  B0A0              mov al,0xa0
00002BD6  0A460E            or al,[bp+0xe]
00002BD9  30E4              xor ah,ah
00002BDB  50                push ax
00002BDC  8B46FE            mov ax,[bp-0x2]
00002BDF  050600            add ax,0x6
00002BE2  50                push ax
00002BE3  E859D9            call word 0x53f
00002BE6  83C404            add sp,byte +0x4
00002BE9  FF7608            push word [bp+0x8]
00002BEC  8B46FE            mov ax,[bp-0x2]
00002BEF  050700            add ax,0x7
00002BF2  50                push ax
00002BF3  E849D9            call word 0x53f
00002BF6  83C404            add sp,byte +0x4
00002BF9  B8007D            mov ax,0x7d00
00002BFC  50                push ax
00002BFD  FF76FE            push word [bp-0x2]
00002C00  B80300            mov ax,0x3
00002C03  50                push ax
00002C04  E826EE            call word 0x1a2d
00002C07  83C406            add sp,byte +0x6
00002C0A  8B46FE            mov ax,[bp-0x2]
00002C0D  050700            add ax,0x7
00002C10  50                push ax
00002C11  E815D9            call word 0x529
00002C14  44                inc sp
00002C15  44                inc sp
00002C16  8846F7            mov [bp-0x9],al
00002C19  8A46F7            mov al,[bp-0x9]
00002C1C  2401              and al,0x1
00002C1E  84C0              test al,al
00002C20  7409              jz 0x2c2b
00002C22  B80200            mov ax,0x2
00002C25  89EC              mov sp,bp
00002C27  5D                pop bp
00002C28  C3                ret
00002C29  EB12              jmp short 0x2c3d
00002C2B  8A46F7            mov al,[bp-0x9]
00002C2E  2408              and al,0x8
00002C30  84C0              test al,al
00002C32  0F850700          jnz word 0x2c3d
00002C36  B80300            mov ax,0x3
00002C39  89EC              mov sp,bp
00002C3B  5D                pop bp
00002C3C  C3                ret
00002C3D  FB                sti
00002C3E  8B4604            mov ax,[bp+0x4]
00002C41  85C0              test ax,ax
00002C43  7537              jnz 0x2c7c
00002C45  55                push bp
00002C46  89E5              mov bp,sp
00002C48  8B7E2A            mov di,[bp+0x2a]
00002C4B  8B4628            mov ax,[bp+0x28]
00002C4E  8B4E08            mov cx,[bp+0x8]
00002C51  81FF00F8          cmp di,0xf800
00002C55  7607              jna 0x2c5e
00002C57  81EF0008          sub di,0x800
00002C5B  058000            add ax,0x80
00002C5E  8EC0              mov es,ax
00002C60  8B560C            mov dx,[bp+0xc]
00002C63  8A6603            mov ah,[bp+0x3]
00002C66  80FC01            cmp ah,0x1
00002C69  7404              jz 0x2c6f
00002C6B  F36D              rep insw
00002C6D  EB03              jmp short 0x2c72
00002C6F  F3666D            rep insd
00002C72  897E2A            mov [bp+0x2a],di
00002C75  8C4628            mov [bp+0x28],es
00002C78  5D                pop bp
00002C79  E93600            jmp word 0x2cb2
00002C7C  55                push bp
00002C7D  89E5              mov bp,sp
00002C7F  8B762A            mov si,[bp+0x2a]
00002C82  8B4628            mov ax,[bp+0x28]
00002C85  8B4E08            mov cx,[bp+0x8]
00002C88  81FE00F8          cmp si,0xf800
00002C8C  7607              jna 0x2c95
00002C8E  81EE0008          sub si,0x800
00002C92  058000            add ax,0x80
00002C95  8EC0              mov es,ax
00002C97  8B560C            mov dx,[bp+0xc]
00002C9A  8A6603            mov ah,[bp+0x3]
00002C9D  80FC01            cmp ah,0x1
00002CA0  7405              jz 0x2ca7
00002CA2  26F36F            es rep outsw
00002CA5  EB04              jmp short 0x2cab
00002CA7  26F3666F          es rep outsd
00002CAB  89762A            mov [bp+0x2a],si
00002CAE  8C4628            mov [bp+0x28],es
00002CB1  5D                pop bp
00002CB2  8A46F6            mov al,[bp-0xa]
00002CB5  40                inc ax
00002CB6  8846F6            mov [bp-0xa],al
00002CB9  8A46F6            mov al,[bp-0xa]
00002CBC  30E4              xor ah,ah
00002CBE  A35402            mov [0x254],ax
00002CC1  8B460A            mov ax,[bp+0xa]
00002CC4  48                dec ax
00002CC5  89460A            mov [bp+0xa],ax
00002CC8  8B4604            mov ax,[bp+0x4]
00002CCB  85C0              test ax,ax
00002CCD  7511              jnz 0x2ce0
00002CCF  B8007D            mov ax,0x7d00
00002CD2  50                push ax
00002CD3  FF76FE            push word [bp-0x2]
00002CD6  B80200            mov ax,0x2
00002CD9  50                push ax
00002CDA  E850ED            call word 0x1a2d
00002CDD  83C406            add sp,byte +0x6
00002CE0  8B46FE            mov ax,[bp-0x2]
00002CE3  050700            add ax,0x7
00002CE6  50                push ax
00002CE7  E83FD8            call word 0x529
00002CEA  44                inc sp
00002CEB  44                inc sp
00002CEC  8846F7            mov [bp-0x9],al
00002CEF  8B4604            mov ax,[bp+0x4]
00002CF2  85C0              test ax,ax
00002CF4  752F              jnz 0x2d25
00002CF6  8B460A            mov ax,[bp+0xa]
00002CF9  85C0              test ax,ax
00002CFB  7514              jnz 0x2d11
00002CFD  8A46F7            mov al,[bp-0x9]
00002D00  24C9              and al,0xc9
00002D02  3C40              cmp al,0x40
00002D04  7407              jz 0x2d0d
00002D06  B80400            mov ax,0x4
00002D09  89EC              mov sp,bp
00002D0B  5D                pop bp
00002D0C  C3                ret
00002D0D  EB46              jmp short 0x2d55
00002D0F  EB12              jmp short 0x2d23
00002D11  8A46F7            mov al,[bp-0x9]
00002D14  24C9              and al,0xc9
00002D16  3C48              cmp al,0x48
00002D18  7407              jz 0x2d21
00002D1A  B80500            mov ax,0x5
00002D1D  89EC              mov sp,bp
00002D1F  5D                pop bp
00002D20  C3                ret
00002D21  EB2F              jmp short 0x2d52
00002D23  EB2D              jmp short 0x2d52
00002D25  8B460A            mov ax,[bp+0xa]
00002D28  85C0              test ax,ax
00002D2A  7514              jnz 0x2d40
00002D2C  8A46F7            mov al,[bp-0x9]
00002D2F  24E9              and al,0xe9
00002D31  3C40              cmp al,0x40
00002D33  7407              jz 0x2d3c
00002D35  B80600            mov ax,0x6
00002D38  89EC              mov sp,bp
00002D3A  5D                pop bp
00002D3B  C3                ret
00002D3C  EB17              jmp short 0x2d55
00002D3E  EB12              jmp short 0x2d52
00002D40  8A46F7            mov al,[bp-0x9]
00002D43  24C9              and al,0xc9
00002D45  3C48              cmp al,0x48
00002D47  7407              jz 0x2d50
00002D49  B80700            mov ax,0x7
00002D4C  89EC              mov sp,bp
00002D4E  5D                pop bp
00002D4F  C3                ret
00002D50  EB00              jmp short 0x2d52
00002D52  E9E9FE            jmp word 0x2c3e
00002D55  B80800            mov ax,0x8
00002D58  50                push ax
00002D59  8B46FC            mov ax,[bp-0x4]
00002D5C  050600            add ax,0x6
00002D5F  50                push ax
00002D60  E8DCD7            call word 0x53f
00002D63  83C404            add sp,byte +0x4
00002D66  31C0              xor ax,ax
00002D68  89EC              mov sp,bp
00002D6A  5D                pop bp
00002D6B  C3                ret
00002D6C  55                push bp
00002D6D  89E5              mov bp,sp
00002D6F  4C                dec sp
00002D70  4C                dec sp
00002D71  B84000            mov ax,0x40
00002D74  50                push ax
00002D75  B80E00            mov ax,0xe
00002D78  50                push ax
00002D79  E871D8            call word 0x5ed
00002D7C  83C404            add sp,byte +0x4
00002D7F  8946FE            mov [bp-0x2],ax
00002D82  83C4E4            add sp,byte -0x1c
00002D85  8B4604            mov ax,[bp+0x4]
00002D88  D1E8              shr ax,1
00002D8A  8846EF            mov [bp-0x11],al
00002D8D  8B4604            mov ax,[bp+0x4]
00002D90  2401              and al,0x1
00002D92  8846EE            mov [bp-0x12],al
00002D95  8A4612            mov al,[bp+0x12]
00002D98  3C02              cmp al,0x2
00002D9A  7515              jnz 0x2db1
00002D9C  BB4FD6            mov bx,0xd64f
00002D9F  53                push bx
00002DA0  B80400            mov ax,0x4
00002DA3  50                push ax
00002DA4  E883DB            call word 0x92a
00002DA7  83C404            add sp,byte +0x4
00002DAA  B80100            mov ax,0x1
00002DAD  89EC              mov sp,bp
00002DAF  5D                pop bp
00002DB0  C3                ret
00002DB1  8A460C            mov al,[bp+0xc]
00002DB4  2401              and al,0x1
00002DB6  84C0              test al,al
00002DB8  7407              jz 0x2dc1
00002DBA  B80100            mov ax,0x1
00002DBD  89EC              mov sp,bp
00002DBF  5D                pop bp
00002DC0  C3                ret
00002DC1  FF76FE            push word [bp-0x2]
00002DC4  E896D8            call word 0x65d
00002DC7  44                inc sp
00002DC8  44                inc sp
00002DC9  8946FC            mov [bp-0x4],ax
00002DCC  8A46EF            mov al,[bp-0x11]
00002DCF  30E4              xor ah,ah
00002DD1  B103              mov cl,0x3
00002DD3  D3E0              shl ax,cl
00002DD5  89C3              mov bx,ax
00002DD7  8B9F2401          mov bx,[bx+0x124]
00002DDB  895EFA            mov [bp-0x6],bx
00002DDE  8A46EF            mov al,[bp-0x11]
00002DE1  30E4              xor ah,ah
00002DE3  B103              mov cl,0x3
00002DE5  D3E0              shl ax,cl
00002DE7  89C3              mov bx,ax
00002DE9  8B9F2601          mov bx,[bx+0x126]
00002DED  895EF8            mov [bp-0x8],bx
00002DF0  8B4604            mov ax,[bp+0x4]
00002DF3  B91E00            mov cx,0x1e
00002DF6  F7E9              imul cx
00002DF8  89C3              mov bx,ax
00002DFA  8A874601          mov al,[bx+0x146]
00002DFE  8846EC            mov [bp-0x14],al
00002E01  31C0              xor ax,ax
00002E03  31DB              xor bx,bx
00002E05  8946E2            mov [bp-0x1e],ax
00002E08  895EE4            mov [bp-0x1c],bx
00002E0B  8A4606            mov al,[bp+0x6]
00002E0E  3C0C              cmp al,0xc
00002E10  7305              jnc 0x2e17
00002E12  B00C              mov al,0xc
00002E14  884606            mov [bp+0x6],al
00002E17  8A4606            mov al,[bp+0x6]
00002E1A  3C0C              cmp al,0xc
00002E1C  7605              jna 0x2e23
00002E1E  B010              mov al,0x10
00002E20  884606            mov [bp+0x6],al
00002E23  8A4606            mov al,[bp+0x6]
00002E26  30E4              xor ah,ah
00002E28  D1E8              shr ax,1
00002E2A  884606            mov [bp+0x6],al
00002E2D  31C0              xor ax,ax
00002E2F  A35402            mov [0x254],ax
00002E32  31C0              xor ax,ax
00002E34  31DB              xor bx,bx
00002E36  A35602            mov [0x256],ax
00002E39  891E5802          mov [0x258],bx
00002E3D  FF76FC            push word [bp-0x4]
00002E40  E81AD8            call word 0x65d
00002E43  44                inc sp
00002E44  44                inc sp
00002E45  8B46FA            mov ax,[bp-0x6]
00002E48  050700            add ax,0x7
00002E4B  50                push ax
00002E4C  E8DAD6            call word 0x529
00002E4F  44                inc sp
00002E50  44                inc sp
00002E51  8846ED            mov [bp-0x13],al
00002E54  8A46ED            mov al,[bp-0x13]
00002E57  2480              and al,0x80
00002E59  84C0              test al,al
00002E5B  7407              jz 0x2e64
00002E5D  B80200            mov ax,0x2
00002E60  89EC              mov sp,bp
00002E62  5D                pop bp
00002E63  C3                ret
00002E64  B80A00            mov ax,0xa
00002E67  50                push ax
00002E68  8B46F8            mov ax,[bp-0x8]
00002E6B  050600            add ax,0x6
00002E6E  50                push ax
00002E6F  E8CDD6            call word 0x53f
00002E72  83C404            add sp,byte +0x4
00002E75  31C0              xor ax,ax
00002E77  50                push ax
00002E78  8B46FA            mov ax,[bp-0x6]
00002E7B  40                inc ax
00002E7C  50                push ax
00002E7D  E8BFD6            call word 0x53f
00002E80  83C404            add sp,byte +0x4
00002E83  31C0              xor ax,ax
00002E85  50                push ax
00002E86  8B46FA            mov ax,[bp-0x6]
00002E89  40                inc ax
00002E8A  40                inc ax
00002E8B  50                push ax
00002E8C  E8B0D6            call word 0x53f
00002E8F  83C404            add sp,byte +0x4
00002E92  31C0              xor ax,ax
00002E94  50                push ax
00002E95  8B46FA            mov ax,[bp-0x6]
00002E98  050300            add ax,0x3
00002E9B  50                push ax
00002E9C  E8A0D6            call word 0x53f
00002E9F  83C404            add sp,byte +0x4
00002EA2  B8F000            mov ax,0xf0
00002EA5  50                push ax
00002EA6  8B46FA            mov ax,[bp-0x6]
00002EA9  050400            add ax,0x4
00002EAC  50                push ax
00002EAD  E88FD6            call word 0x53f
00002EB0  83C404            add sp,byte +0x4
00002EB3  B8FF00            mov ax,0xff
00002EB6  50                push ax
00002EB7  8B46FA            mov ax,[bp-0x6]
00002EBA  050500            add ax,0x5
00002EBD  50                push ax
00002EBE  E87ED6            call word 0x53f
00002EC1  83C404            add sp,byte +0x4
00002EC4  8A46EE            mov al,[bp-0x12]
00002EC7  84C0              test al,al
00002EC9  7404              jz 0x2ecf
00002ECB  B0B0              mov al,0xb0
00002ECD  EB02              jmp short 0x2ed1
00002ECF  B0A0              mov al,0xa0
00002ED1  30E4              xor ah,ah
00002ED3  50                push ax
00002ED4  8B46FA            mov ax,[bp-0x6]
00002ED7  050600            add ax,0x6
00002EDA  50                push ax
00002EDB  E861D6            call word 0x53f
00002EDE  83C404            add sp,byte +0x4
00002EE1  B8A000            mov ax,0xa0
00002EE4  50                push ax
00002EE5  8B46FA            mov ax,[bp-0x6]
00002EE8  050700            add ax,0x7
00002EEB  50                push ax
00002EEC  E850D6            call word 0x53f
00002EEF  83C404            add sp,byte +0x4
00002EF2  B8007D            mov ax,0x7d00
00002EF5  50                push ax
00002EF6  FF76FA            push word [bp-0x6]
00002EF9  B80300            mov ax,0x3
00002EFC  50                push ax
00002EFD  E82DEB            call word 0x1a2d
00002F00  83C406            add sp,byte +0x6
00002F03  8B46FA            mov ax,[bp-0x6]
00002F06  050700            add ax,0x7
00002F09  50                push ax
00002F0A  E81CD6            call word 0x529
00002F0D  44                inc sp
00002F0E  44                inc sp
00002F0F  8846ED            mov [bp-0x13],al
00002F12  8A46ED            mov al,[bp-0x13]
00002F15  2401              and al,0x1
00002F17  84C0              test al,al
00002F19  7409              jz 0x2f24
00002F1B  B80300            mov ax,0x3
00002F1E  89EC              mov sp,bp
00002F20  5D                pop bp
00002F21  C3                ret
00002F22  EB10              jmp short 0x2f34
00002F24  8A46ED            mov al,[bp-0x13]
00002F27  2408              and al,0x8
00002F29  84C0              test al,al
00002F2B  7507              jnz 0x2f34
00002F2D  B80400            mov ax,0x4
00002F30  89EC              mov sp,bp
00002F32  5D                pop bp
00002F33  C3                ret
00002F34  8B460A            mov ax,[bp+0xa]
00002F37  B104              mov cl,0x4
00002F39  D3E8              shr ax,cl
00002F3B  034608            add ax,[bp+0x8]
00002F3E  894608            mov [bp+0x8],ax
00002F41  8B460A            mov ax,[bp+0xa]
00002F44  240F              and al,0xf
00002F46  30E4              xor ah,ah
00002F48  89460A            mov [bp+0xa],ax
00002F4B  FB                sti
00002F4C  55                push bp
00002F4D  89E5              mov bp,sp
00002F4F  8B762A            mov si,[bp+0x2a]
00002F52  8B4628            mov ax,[bp+0x28]
00002F55  8B4E26            mov cx,[bp+0x26]
00002F58  8EC0              mov es,ax
00002F5A  8B561A            mov dx,[bp+0x1a]
00002F5D  26F36F            es rep outsw
00002F60  5D                pop bp
00002F61  8A4612            mov al,[bp+0x12]
00002F64  84C0              test al,al
00002F66  7523              jnz 0x2f8b
00002F68  B8007D            mov ax,0x7d00
00002F6B  50                push ax
00002F6C  FF76FA            push word [bp-0x6]
00002F6F  B80200            mov ax,0x2
00002F72  50                push ax
00002F73  E8B7EA            call word 0x1a2d
00002F76  83C406            add sp,byte +0x6
00002F79  8B46FA            mov ax,[bp-0x6]
00002F7C  050700            add ax,0x7
00002F7F  50                push ax
00002F80  E8A6D5            call word 0x529
00002F83  44                inc sp
00002F84  44                inc sp
00002F85  8846ED            mov [bp-0x13],al
00002F88  E97B02            jmp word 0x3206
00002F8B  4C                dec sp
00002F8C  4C                dec sp
00002F8D  31C0              xor ax,ax
00002F8F  8946E0            mov [bp-0x20],ax
00002F92  4C                dec sp
00002F93  4C                dec sp
00002F94  8B46E0            mov ax,[bp-0x20]
00002F97  85C0              test ax,ax
00002F99  7522              jnz 0x2fbd
00002F9B  8B46F8            mov ax,[bp-0x8]
00002F9E  050600            add ax,0x6
00002FA1  50                push ax
00002FA2  E884D5            call word 0x529
00002FA5  44                inc sp
00002FA6  44                inc sp
00002FA7  8846ED            mov [bp-0x13],al
00002FAA  B8007D            mov ax,0x7d00
00002FAD  50                push ax
00002FAE  FF76FA            push word [bp-0x6]
00002FB1  B80300            mov ax,0x3
00002FB4  50                push ax
00002FB5  E875EA            call word 0x1a2d
00002FB8  83C406            add sp,byte +0x6
00002FBB  EB11              jmp short 0x2fce
00002FBD  B8007D            mov ax,0x7d00
00002FC0  50                push ax
00002FC1  FF76FA            push word [bp-0x6]
00002FC4  B80200            mov ax,0x2
00002FC7  50                push ax
00002FC8  E862EA            call word 0x1a2d
00002FCB  83C406            add sp,byte +0x6
00002FCE  8B46E0            mov ax,[bp-0x20]
00002FD1  40                inc ax
00002FD2  8946E0            mov [bp-0x20],ax
00002FD5  8B46FA            mov ax,[bp-0x6]
00002FD8  050700            add ax,0x7
00002FDB  50                push ax
00002FDC  E84AD5            call word 0x529
00002FDF  44                inc sp
00002FE0  44                inc sp
00002FE1  8846ED            mov [bp-0x13],al
00002FE4  8B46FA            mov ax,[bp-0x6]
00002FE7  40                inc ax
00002FE8  40                inc ax
00002FE9  50                push ax
00002FEA  E83CD5            call word 0x529
00002FED  44                inc sp
00002FEE  44                inc sp
00002FEF  8846DF            mov [bp-0x21],al
00002FF2  8B46FA            mov ax,[bp-0x6]
00002FF5  40                inc ax
00002FF6  40                inc ax
00002FF7  50                push ax
00002FF8  E82ED5            call word 0x529
00002FFB  44                inc sp
00002FFC  44                inc sp
00002FFD  2407              and al,0x7
00002FFF  3C03              cmp al,0x3
00003001  750C              jnz 0x300f
00003003  8A46ED            mov al,[bp-0x13]
00003006  2441              and al,0x41
00003008  3C40              cmp al,0x40
0000300A  7503              jnz 0x300f
0000300C  E9F401            jmp word 0x3203
0000300F  8A46ED            mov al,[bp-0x13]
00003012  2401              and al,0x1
00003014  84C0              test al,al
00003016  7407              jz 0x301f
00003018  B80300            mov ax,0x3
0000301B  89EC              mov sp,bp
0000301D  5D                pop bp
0000301E  C3                ret
0000301F  8B4616            mov ax,[bp+0x16]
00003022  B104              mov cl,0x4
00003024  D3E8              shr ax,cl
00003026  034614            add ax,[bp+0x14]
00003029  894614            mov [bp+0x14],ax
0000302C  8B4616            mov ax,[bp+0x16]
0000302F  240F              and al,0xf
00003031  30E4              xor ah,ah
00003033  894616            mov [bp+0x16],ax
00003036  8B46FA            mov ax,[bp-0x6]
00003039  050400            add ax,0x4
0000303C  50                push ax
0000303D  E8E9D4            call word 0x529
00003040  44                inc sp
00003041  44                inc sp
00003042  50                push ax
00003043  8B46FA            mov ax,[bp-0x6]
00003046  050500            add ax,0x5
00003049  50                push ax
0000304A  E8DCD4            call word 0x529
0000304D  44                inc sp
0000304E  44                inc sp
0000304F  30E4              xor ah,ah
00003051  88C4              mov ah,al
00003053  30C0              xor al,al
00003055  0246DC            add al,[bp-0x24]
00003058  80D400            adc ah,0x0
0000305B  44                inc sp
0000305C  44                inc sp
0000305D  8946F6            mov [bp-0xa],ax
00003060  8B460C            mov ax,[bp+0xc]
00003063  3B46F6            cmp ax,[bp-0xa]
00003066  7616              jna 0x307e
00003068  8B46F6            mov ax,[bp-0xa]
0000306B  8946F4            mov [bp-0xc],ax
0000306E  8B460C            mov ax,[bp+0xc]
00003071  2B46F6            sub ax,[bp-0xa]
00003074  89460C            mov [bp+0xc],ax
00003077  31C0              xor ax,ax
00003079  8946F6            mov [bp-0xa],ax
0000307C  EB14              jmp short 0x3092
0000307E  8B460C            mov ax,[bp+0xc]
00003081  8946F4            mov [bp-0xc],ax
00003084  31C0              xor ax,ax
00003086  89460C            mov [bp+0xc],ax
00003089  8B46F6            mov ax,[bp-0xa]
0000308C  2B46F4            sub ax,[bp-0xc]
0000308F  8946F6            mov [bp-0xa],ax
00003092  8B46F6            mov ax,[bp-0xa]
00003095  31DB              xor bx,bx
00003097  8D7E0E            lea di,[bp+0xe]
0000309A  E8FFCF            call word 0x9c
0000309D  7620              jna 0x30bf
0000309F  8B46F6            mov ax,[bp-0xa]
000030A2  31DB              xor bx,bx
000030A4  8D7E0E            lea di,[bp+0xe]
000030A7  E808D0            call word 0xb2
000030AA  8946F2            mov [bp-0xe],ax
000030AD  8B460E            mov ax,[bp+0xe]
000030B0  8946F6            mov [bp-0xa],ax
000030B3  31C0              xor ax,ax
000030B5  31DB              xor bx,bx
000030B7  89460E            mov [bp+0xe],ax
000030BA  895E10            mov [bp+0x10],bx
000030BD  EB21              jmp short 0x30e0
000030BF  31C0              xor ax,ax
000030C1  8946F2            mov [bp-0xe],ax
000030C4  8B46F6            mov ax,[bp-0xa]
000030C7  31DB              xor bx,bx
000030C9  53                push bx
000030CA  50                push ax
000030CB  8B460E            mov ax,[bp+0xe]
000030CE  8B5E10            mov bx,[bp+0x10]
000030D1  8D7EDA            lea di,[bp-0x26]
000030D4  E8DBCF            call word 0xb2
000030D7  89460E            mov [bp+0xe],ax
000030DA  895E10            mov [bp+0x10],bx
000030DD  83C404            add sp,byte +0x4
000030E0  8B46F6            mov ax,[bp-0xa]
000030E3  8946F0            mov [bp-0x10],ax
000030E6  8A46EC            mov al,[bp-0x14]
000030E9  8846EB            mov [bp-0x15],al
000030EC  8A46F4            mov al,[bp-0xc]
000030EF  2403              and al,0x3
000030F1  84C0              test al,al
000030F3  7405              jz 0x30fa
000030F5  30C0              xor al,al
000030F7  8846EB            mov [bp-0x15],al
000030FA  8A46F6            mov al,[bp-0xa]
000030FD  2403              and al,0x3
000030FF  84C0              test al,al
00003101  7405              jz 0x3108
00003103  30C0              xor al,al
00003105  8846EB            mov [bp-0x15],al
00003108  8A46F2            mov al,[bp-0xe]
0000310B  2403              and al,0x3
0000310D  84C0              test al,al
0000310F  7405              jz 0x3116
00003111  30C0              xor al,al
00003113  8846EB            mov [bp-0x15],al
00003116  8A46F6            mov al,[bp-0xa]
00003119  2401              and al,0x1
0000311B  84C0              test al,al
0000311D  741E              jz 0x313d
0000311F  8B46F6            mov ax,[bp-0xa]
00003122  40                inc ax
00003123  8946F6            mov [bp-0xa],ax
00003126  8B46F2            mov ax,[bp-0xe]
00003129  85C0              test ax,ax
0000312B  7410              jz 0x313d
0000312D  8A46F2            mov al,[bp-0xe]
00003130  2401              and al,0x1
00003132  84C0              test al,al
00003134  7407              jz 0x313d
00003136  8B46F2            mov ax,[bp-0xe]
00003139  48                dec ax
0000313A  8946F2            mov [bp-0xe],ax
0000313D  8A46EB            mov al,[bp-0x15]
00003140  3C01              cmp al,0x1
00003142  7520              jnz 0x3164
00003144  8B46F6            mov ax,[bp-0xa]
00003147  D1E8              shr ax,1
00003149  D1E8              shr ax,1
0000314B  8946F6            mov [bp-0xa],ax
0000314E  8B46F4            mov ax,[bp-0xc]
00003151  D1E8              shr ax,1
00003153  D1E8              shr ax,1
00003155  8946F4            mov [bp-0xc],ax
00003158  8B46F2            mov ax,[bp-0xe]
0000315B  D1E8              shr ax,1
0000315D  D1E8              shr ax,1
0000315F  8946F2            mov [bp-0xe],ax
00003162  EB18              jmp short 0x317c
00003164  8B46F6            mov ax,[bp-0xa]
00003167  D1E8              shr ax,1
00003169  8946F6            mov [bp-0xa],ax
0000316C  8B46F4            mov ax,[bp-0xc]
0000316F  D1E8              shr ax,1
00003171  8946F4            mov [bp-0xc],ax
00003174  8B46F2            mov ax,[bp-0xe]
00003177  D1E8              shr ax,1
00003179  8946F2            mov [bp-0xe],ax
0000317C  55                push bp
0000317D  89E5              mov bp,sp
0000317F  8B561E            mov dx,[bp+0x1e]
00003182  8B4E18            mov cx,[bp+0x18]
00003185  E315              jcxz 0x319c
00003187  8A660F            mov ah,[bp+0xf]
0000318A  80FC01            cmp ah,0x1
0000318D  7405              jz 0x3194
0000318F  ED                in ax,dx
00003190  E2FD              loop 0x318f
00003192  EB08              jmp short 0x319c
00003194  6650              push eax
00003196  66ED              in eax,dx
00003198  E2FC              loop 0x3196
0000319A  6658              pop eax
0000319C  8B4E1A            mov cx,[bp+0x1a]
0000319F  E317              jcxz 0x31b8
000031A1  8B7E3A            mov di,[bp+0x3a]
000031A4  8B4638            mov ax,[bp+0x38]
000031A7  8EC0              mov es,ax
000031A9  8A660F            mov ah,[bp+0xf]
000031AC  80FC01            cmp ah,0x1
000031AF  7404              jz 0x31b5
000031B1  F36D              rep insw
000031B3  EB03              jmp short 0x31b8
000031B5  F3666D            rep insd
000031B8  8B4E16            mov cx,[bp+0x16]
000031BB  E315              jcxz 0x31d2
000031BD  8A660F            mov ah,[bp+0xf]
000031C0  80FC01            cmp ah,0x1
000031C3  7405              jz 0x31ca
000031C5  ED                in ax,dx
000031C6  E2FD              loop 0x31c5
000031C8  EB08              jmp short 0x31d2
000031CA  6650              push eax
000031CC  66ED              in eax,dx
000031CE  E2FC              loop 0x31cc
000031D0  6658              pop eax
000031D2  5D                pop bp
000031D3  8B4616            mov ax,[bp+0x16]
000031D6  0346F0            add ax,[bp-0x10]
000031D9  894616            mov [bp+0x16],ax
000031DC  8B46F0            mov ax,[bp-0x10]
000031DF  31DB              xor bx,bx
000031E1  8D7EE2            lea di,[bp-0x1e]
000031E4  E8ADCE            call word 0x94
000031E7  8946E2            mov [bp-0x1e],ax
000031EA  895EE4            mov [bp-0x1c],bx
000031ED  FF76FE            push word [bp-0x2]
000031F0  B85602            mov ax,0x256
000031F3  50                push ax
000031F4  FF76E4            push word [bp-0x1c]
000031F7  FF76E2            push word [bp-0x1e]
000031FA  E86ACE            call word 0x67
000031FD  83C408            add sp,byte +0x8
00003200  E991FD            jmp word 0x2f94
00003203  83C404            add sp,byte +0x4
00003206  8A46ED            mov al,[bp-0x13]
00003209  24E9              and al,0xe9
0000320B  3C40              cmp al,0x40
0000320D  7407              jz 0x3216
0000320F  B80400            mov ax,0x4
00003212  89EC              mov sp,bp
00003214  5D                pop bp
00003215  C3                ret
00003216  B80800            mov ax,0x8
00003219  50                push ax
0000321A  8B46F8            mov ax,[bp-0x8]
0000321D  050600            add ax,0x6
00003220  50                push ax
00003221  E81BD3            call word 0x53f
00003224  83C404            add sp,byte +0x4
00003227  31C0              xor ax,ax
00003229  89EC              mov sp,bp
0000322B  5D                pop bp
0000322C  C3                ret
0000322D  55                push bp
0000322E  89E5              mov bp,sp
00003230  83C4E0            add sp,byte -0x20
00003233  B80C00            mov ax,0xc
00003236  50                push ax
00003237  E820D4            call word 0x65a
0000323A  50                push ax
0000323B  8D5EF4            lea bx,[bp-0xc]
0000323E  53                push bx
0000323F  31C0              xor ax,ax
00003241  50                push ax
00003242  E8BBCD            call word 0x0
00003245  83C408            add sp,byte +0x8
00003248  B003              mov al,0x3
0000324A  8846F4            mov [bp-0xc],al
0000324D  B012              mov al,0x12
0000324F  8846F8            mov [bp-0x8],al
00003252  8D5EE2            lea bx,[bp-0x1e]
00003255  53                push bx
00003256  E801D4            call word 0x65a
00003259  50                push ax
0000325A  B80100            mov ax,0x1
0000325D  50                push ax
0000325E  B81200            mov ax,0x12
00003261  31DB              xor bx,bx
00003263  53                push bx
00003264  50                push ax
00003265  31C0              xor ax,ax
00003267  50                push ax
00003268  8D5EF4            lea bx,[bp-0xc]
0000326B  53                push bx
0000326C  E8EBD3            call word 0x65a
0000326F  50                push ax
00003270  B80C00            mov ax,0xc
00003273  50                push ax
00003274  FF7604            push word [bp+0x4]
00003277  E8F2FA            call word 0x2d6c
0000327A  83C414            add sp,byte +0x14
0000327D  85C0              test ax,ax
0000327F  7407              jz 0x3288
00003281  B80200            mov ax,0x2
00003284  89EC              mov sp,bp
00003286  5D                pop bp
00003287  C3                ret
00003288  FF7606            push word [bp+0x6]
0000328B  FF7608            push word [bp+0x8]
0000328E  8A46EE            mov al,[bp-0x12]
00003291  30E4              xor ah,ah
00003293  50                push ax
00003294  E864D3            call word 0x5fb
00003297  83C406            add sp,byte +0x6
0000329A  FF7606            push word [bp+0x6]
0000329D  FF760A            push word [bp+0xa]
000032A0  8A46EF            mov al,[bp-0x11]
000032A3  30E4              xor ah,ah
000032A5  50                push ax
000032A6  E852D3            call word 0x5fb
000032A9  83C406            add sp,byte +0x6
000032AC  31C0              xor ax,ax
000032AE  89EC              mov sp,bp
000032B0  5D                pop bp
000032B1  C3                ret
000032B2  55                push bp
000032B3  89E5              mov bp,sp
000032B5  83C4D6            add sp,byte -0x2a
000032B8  B84000            mov ax,0x40
000032BB  50                push ax
000032BC  B80E00            mov ax,0xe
000032BF  50                push ax
000032C0  E82AD3            call word 0x5ed
000032C3  83C404            add sp,byte +0x4
000032C6  8946D6            mov [bp-0x2a],ax
000032C9  FF76D6            push word [bp-0x2a]
000032CC  8B4604            mov ax,[bp+0x4]
000032CF  B91E00            mov cx,0x1e
000032D2  F7E9              imul cx
000032D4  89C3              mov bx,ax
000032D6  81C34201          add bx,0x142
000032DA  53                push bx
000032DB  E801D3            call word 0x5df
000032DE  83C404            add sp,byte +0x4
000032E1  3C03              cmp al,0x3
000032E3  7415              jz 0x32fa
000032E5  BB29D6            mov bx,0xd629
000032E8  53                push bx
000032E9  B80200            mov ax,0x2
000032EC  50                push ax
000032ED  E83AD6            call word 0x92a
000032F0  83C404            add sp,byte +0x4
000032F3  B8FFFF            mov ax,0xffff
000032F6  89EC              mov sp,bp
000032F8  5D                pop bp
000032F9  C3                ret
000032FA  B80C00            mov ax,0xc
000032FD  50                push ax
000032FE  E859D3            call word 0x65a
00003301  50                push ax
00003302  8D5EF4            lea bx,[bp-0xc]
00003305  53                push bx
00003306  31C0              xor ax,ax
00003308  50                push ax
00003309  E8F4CC            call word 0x0
0000330C  83C408            add sp,byte +0x8
0000330F  B025              mov al,0x25
00003311  8846F4            mov [bp-0xc],al
00003314  B88813            mov ax,0x1388
00003317  31DB              xor bx,bx
00003319  8946E0            mov [bp-0x20],ax
0000331C  895EE2            mov [bp-0x1e],bx
0000331F  31C0              xor ax,ax
00003321  31DB              xor bx,bx
00003323  8946DC            mov [bp-0x24],ax
00003326  895EDE            mov [bp-0x22],bx
00003329  30C0              xor al,al
0000332B  8846D9            mov [bp-0x27],al
0000332E  E9AB00            jmp word 0x33dc
00003331  8D5EEC            lea bx,[bp-0x14]
00003334  53                push bx
00003335  E822D3            call word 0x65a
00003338  50                push ax
00003339  B80100            mov ax,0x1
0000333C  50                push ax
0000333D  B80800            mov ax,0x8
00003340  31DB              xor bx,bx
00003342  53                push bx
00003343  50                push ax
00003344  31C0              xor ax,ax
00003346  50                push ax
00003347  8D5EF4            lea bx,[bp-0xc]
0000334A  53                push bx
0000334B  E80CD3            call word 0x65a
0000334E  50                push ax
0000334F  B80C00            mov ax,0xc
00003352  50                push ax
00003353  FF7604            push word [bp+0x4]
00003356  E813FA            call word 0x2d6c
00003359  83C414            add sp,byte +0x14
0000335C  85C0              test ax,ax
0000335E  7506              jnz 0x3366
00003360  83C400            add sp,byte +0x0
00003363  E98D00            jmp word 0x33f3
00003366  8D5EDA            lea bx,[bp-0x26]
00003369  53                push bx
0000336A  8D5EDB            lea bx,[bp-0x25]
0000336D  53                push bx
0000336E  E8E9D2            call word 0x65a
00003371  50                push ax
00003372  FF7604            push word [bp+0x4]
00003375  E8B5FE            call word 0x322d
00003378  83C408            add sp,byte +0x8
0000337B  85C0              test ax,ax
0000337D  7541              jnz 0x33c0
0000337F  8A46DB            mov al,[bp-0x25]
00003382  3C3A              cmp al,0x3a
00003384  7507              jnz 0x338d
00003386  B8FFFF            mov ax,0xffff
00003389  89EC              mov sp,bp
0000338B  5D                pop bp
0000338C  C3                ret
0000338D  8A46DB            mov al,[bp-0x25]
00003390  3C04              cmp al,0x4
00003392  752C              jnz 0x33c0
00003394  8A46DA            mov al,[bp-0x26]
00003397  3C01              cmp al,0x1
00003399  7525              jnz 0x33c0
0000339B  8A46D9            mov al,[bp-0x27]
0000339E  84C0              test al,al
000033A0  751E              jnz 0x33c0
000033A2  BB01D6            mov bx,0xd601
000033A5  53                push bx
000033A6  B80200            mov ax,0x2
000033A9  50                push ax
000033AA  E87DD5            call word 0x92a
000033AD  83C404            add sp,byte +0x4
000033B0  B83075            mov ax,0x7530
000033B3  31DB              xor bx,bx
000033B5  8946E0            mov [bp-0x20],ax
000033B8  895EE2            mov [bp-0x1e],bx
000033BB  B001              mov al,0x1
000033BD  8846D9            mov [bp-0x27],al
000033C0  B86400            mov ax,0x64
000033C3  31DB              xor bx,bx
000033C5  53                push bx
000033C6  50                push ax
000033C7  8B46DC            mov ax,[bp-0x24]
000033CA  8B5EDE            mov bx,[bp-0x22]
000033CD  8D7ED2            lea di,[bp-0x2e]
000033D0  E8C1CC            call word 0x94
000033D3  8946DC            mov [bp-0x24],ax
000033D6  895EDE            mov [bp-0x22],bx
000033D9  83C404            add sp,byte +0x4
000033DC  8B46E0            mov ax,[bp-0x20]
000033DF  8B5EE2            mov bx,[bp-0x1e]
000033E2  8D7EDC            lea di,[bp-0x24]
000033E5  E8B4CC            call word 0x9c
000033E8  0F8745FF          ja word 0x3331
000033EC  B8FFFF            mov ax,0xffff
000033EF  89EC              mov sp,bp
000033F1  5D                pop bp
000033F2  C3                ret
000033F3  8A46F3            mov al,[bp-0xd]
000033F6  30E4              xor ah,ah
000033F8  31DB              xor bx,bx
000033FA  53                push bx
000033FB  50                push ax
000033FC  8A46F2            mov al,[bp-0xe]
000033FF  30E4              xor ah,ah
00003401  31DB              xor bx,bx
00003403  88DF              mov bh,bl
00003405  88E3              mov bl,ah
00003407  88C4              mov ah,al
00003409  30C0              xor al,al
0000340B  53                push bx
0000340C  50                push ax
0000340D  8A46F1            mov al,[bp-0xf]
00003410  30E4              xor ah,ah
00003412  31DB              xor bx,bx
00003414  93                xchg ax,bx
00003415  31C0              xor ax,ax
00003417  53                push bx
00003418  50                push ax
00003419  8A46F0            mov al,[bp-0x10]
0000341C  30E4              xor ah,ah
0000341E  31DB              xor bx,bx
00003420  88C4              mov ah,al
00003422  30C0              xor al,al
00003424  93                xchg ax,bx
00003425  31C0              xor ax,ax
00003427  8D7ECA            lea di,[bp-0x36]
0000342A  E8ABCC            call word 0xd8
0000342D  83C404            add sp,byte +0x4
00003430  8D7ECE            lea di,[bp-0x32]
00003433  E8A2CC            call word 0xd8
00003436  83C404            add sp,byte +0x4
00003439  8D7ED2            lea di,[bp-0x2e]
0000343C  E899CC            call word 0xd8
0000343F  83C404            add sp,byte +0x4
00003442  8946E8            mov [bp-0x18],ax
00003445  895EEA            mov [bp-0x16],bx
00003448  B80008            mov ax,0x800
0000344B  31DB              xor bx,bx
0000344D  53                push bx
0000344E  50                push ax
0000344F  8B46E8            mov ax,[bp-0x18]
00003452  8B5EEA            mov bx,[bp-0x16]
00003455  8D7ED2            lea di,[bp-0x2e]
00003458  E841CC            call word 0x9c
0000345B  8D66D6            lea sp,[bp-0x2a]
0000345E  7433              jz 0x3493
00003460  B80002            mov ax,0x200
00003463  31DB              xor bx,bx
00003465  53                push bx
00003466  50                push ax
00003467  8B46E8            mov ax,[bp-0x18]
0000346A  8B5EEA            mov bx,[bp-0x16]
0000346D  8D7ED2            lea di,[bp-0x2e]
00003470  E829CC            call word 0x9c
00003473  8D66D6            lea sp,[bp-0x2a]
00003476  741B              jz 0x3493
00003478  FF76EA            push word [bp-0x16]
0000347B  FF76E8            push word [bp-0x18]
0000347E  BBE5D5            mov bx,0xd5e5
00003481  53                push bx
00003482  B80200            mov ax,0x2
00003485  50                push ax
00003486  E8A1D4            call word 0x92a
00003489  83C408            add sp,byte +0x8
0000348C  B8FFFF            mov ax,0xffff
0000348F  89EC              mov sp,bp
00003491  5D                pop bp
00003492  C3                ret
00003493  FF76D6            push word [bp-0x2a]
00003496  8B4604            mov ax,[bp+0x4]
00003499  B91E00            mov cx,0x1e
0000349C  F7E9              imul cx
0000349E  89C3              mov bx,ax
000034A0  81C34801          add bx,0x148
000034A4  53                push bx
000034A5  FF76EA            push word [bp-0x16]
000034A8  FF76E8            push word [bp-0x18]
000034AB  E8B9CB            call word 0x67
000034AE  83C408            add sp,byte +0x8
000034B1  8A46EF            mov al,[bp-0x11]
000034B4  30E4              xor ah,ah
000034B6  31DB              xor bx,bx
000034B8  53                push bx
000034B9  50                push ax
000034BA  8A46EE            mov al,[bp-0x12]
000034BD  30E4              xor ah,ah
000034BF  31DB              xor bx,bx
000034C1  88DF              mov bh,bl
000034C3  88E3              mov bl,ah
000034C5  88C4              mov ah,al
000034C7  30C0              xor al,al
000034C9  53                push bx
000034CA  50                push ax
000034CB  8A46ED            mov al,[bp-0x13]
000034CE  30E4              xor ah,ah
000034D0  31DB              xor bx,bx
000034D2  93                xchg ax,bx
000034D3  31C0              xor ax,ax
000034D5  53                push bx
000034D6  50                push ax
000034D7  8A46EC            mov al,[bp-0x14]
000034DA  30E4              xor ah,ah
000034DC  31DB              xor bx,bx
000034DE  88C4              mov ah,al
000034E0  30C0              xor al,al
000034E2  93                xchg ax,bx
000034E3  31C0              xor ax,ax
000034E5  8D7ECA            lea di,[bp-0x36]
000034E8  E8EDCB            call word 0xd8
000034EB  83C404            add sp,byte +0x4
000034EE  8D7ECE            lea di,[bp-0x32]
000034F1  E8E4CB            call word 0xd8
000034F4  83C404            add sp,byte +0x4
000034F7  8D7ED2            lea di,[bp-0x2e]
000034FA  E8DBCB            call word 0xd8
000034FD  83C404            add sp,byte +0x4
00003500  8946E4            mov [bp-0x1c],ax
00003503  895EE6            mov [bp-0x1a],bx
00003506  B80008            mov ax,0x800
00003509  31DB              xor bx,bx
0000350B  53                push bx
0000350C  50                push ax
0000350D  8B46E8            mov ax,[bp-0x18]
00003510  8B5EEA            mov bx,[bp-0x16]
00003513  8D7ED2            lea di,[bp-0x2e]
00003516  E883CB            call word 0x9c
00003519  8D66D6            lea sp,[bp-0x2a]
0000351C  7512              jnz 0x3530
0000351E  8B46E4            mov ax,[bp-0x1c]
00003521  8B5EE6            mov bx,[bp-0x1a]
00003524  BF0200            mov di,0x2
00003527  E8EECB            call word 0x118
0000352A  8946E4            mov [bp-0x1c],ax
0000352D  895EE6            mov [bp-0x1a],bx
00003530  FF76D6            push word [bp-0x2a]
00003533  8B4604            mov ax,[bp+0x4]
00003536  B91E00            mov cx,0x1e
00003539  F7E9              imul cx
0000353B  89C3              mov bx,ax
0000353D  81C35801          add bx,0x158
00003541  53                push bx
00003542  E811CB            call word 0x56
00003545  89D3              mov bx,dx
00003547  83C404            add sp,byte +0x4
0000354A  8D7EE4            lea di,[bp-0x1c]
0000354D  E84CCB            call word 0x9c
00003550  7424              jz 0x3576
00003552  8B46E4            mov ax,[bp-0x1c]
00003555  8B5EE6            mov bx,[bp-0x1a]
00003558  88E0              mov al,ah
0000355A  88DC              mov ah,bl
0000355C  88FB              mov bl,bh
0000355E  28FF              sub bh,bh
00003560  BF0300            mov di,0x3
00003563  E894CB            call word 0xfa
00003566  53                push bx
00003567  50                push ax
00003568  BBCFD5            mov bx,0xd5cf
0000356B  53                push bx
0000356C  B80200            mov ax,0x2
0000356F  50                push ax
00003570  E8B7D3            call word 0x92a
00003573  83C408            add sp,byte +0x8
00003576  FF76D6            push word [bp-0x2a]
00003579  8B4604            mov ax,[bp+0x4]
0000357C  B91E00            mov cx,0x1e
0000357F  F7E9              imul cx
00003581  89C3              mov bx,ax
00003583  81C35801          add bx,0x158
00003587  53                push bx
00003588  FF76E6            push word [bp-0x1a]
0000358B  FF76E4            push word [bp-0x1c]
0000358E  E8D6CA            call word 0x67
00003591  83C408            add sp,byte +0x8
00003594  31C0              xor ax,ax
00003596  89EC              mov sp,bp
00003598  5D                pop bp
00003599  C3                ret
0000359A  55                push bp
0000359B  89E5              mov bp,sp
0000359D  4C                dec sp
0000359E  4C                dec sp
0000359F  B84000            mov ax,0x40
000035A2  50                push ax
000035A3  B80E00            mov ax,0xe
000035A6  50                push ax
000035A7  E843D0            call word 0x5ed
000035AA  83C404            add sp,byte +0x4
000035AD  8946FE            mov [bp-0x2],ax
000035B0  8A4604            mov al,[bp+0x4]
000035B3  3C08              cmp al,0x8
000035B5  7206              jc 0x35bd
000035B7  31C0              xor ax,ax
000035B9  89EC              mov sp,bp
000035BB  5D                pop bp
000035BC  C3                ret
000035BD  FF76FE            push word [bp-0x2]
000035C0  8A4604            mov al,[bp+0x4]
000035C3  30E4              xor ah,ah
000035C5  B91E00            mov cx,0x1e
000035C8  F7E9              imul cx
000035CA  89C3              mov bx,ax
000035CC  81C34201          add bx,0x142
000035D0  53                push bx
000035D1  E80BD0            call word 0x5df
000035D4  83C404            add sp,byte +0x4
000035D7  3C03              cmp al,0x3
000035D9  7406              jz 0x35e1
000035DB  31C0              xor ax,ax
000035DD  89EC              mov sp,bp
000035DF  5D                pop bp
000035E0  C3                ret
000035E1  FF76FE            push word [bp-0x2]
000035E4  8A4604            mov al,[bp+0x4]
000035E7  30E4              xor ah,ah
000035E9  B91E00            mov cx,0x1e
000035EC  F7E9              imul cx
000035EE  89C3              mov bx,ax
000035F0  81C34301          add bx,0x143
000035F4  53                push bx
000035F5  E8E7CF            call word 0x5df
000035F8  83C404            add sp,byte +0x4
000035FB  3C05              cmp al,0x5
000035FD  7406              jz 0x3605
000035FF  31C0              xor ax,ax
00003601  89EC              mov sp,bp
00003603  5D                pop bp
00003604  C3                ret
00003605  B80100            mov ax,0x1
00003608  89EC              mov sp,bp
0000360A  5D                pop bp
0000360B  C3                ret
0000360C  55                push bp
0000360D  89E5              mov bp,sp
0000360F  4C                dec sp
00003610  4C                dec sp
00003611  B84000            mov ax,0x40
00003614  50                push ax
00003615  B80E00            mov ax,0xe
00003618  50                push ax
00003619  E8D1CF            call word 0x5ed
0000361C  83C404            add sp,byte +0x4
0000361F  8946FE            mov [bp-0x2],ax
00003622  FF76FE            push word [bp-0x2]
00003625  B85A02            mov ax,0x25a
00003628  50                push ax
00003629  31C0              xor ax,ax
0000362B  50                push ax
0000362C  E8CCCF            call word 0x5fb
0000362F  83C406            add sp,byte +0x6
00003632  89EC              mov sp,bp
00003634  5D                pop bp
00003635  C3                ret
00003636  55                push bp
00003637  89E5              mov bp,sp
00003639  4C                dec sp
0000363A  4C                dec sp
0000363B  B84000            mov ax,0x40
0000363E  50                push ax
0000363F  B80E00            mov ax,0xe
00003642  50                push ax
00003643  E8A7CF            call word 0x5ed
00003646  83C404            add sp,byte +0x4
00003649  8946FE            mov [bp-0x2],ax
0000364C  FF76FE            push word [bp-0x2]
0000364F  B85A02            mov ax,0x25a
00003652  50                push ax
00003653  E889CF            call word 0x5df
00003656  83C404            add sp,byte +0x4
00003659  89EC              mov sp,bp
0000365B  5D                pop bp
0000365C  C3                ret
0000365D  55                push bp
0000365E  89E5              mov bp,sp
00003660  4C                dec sp
00003661  4C                dec sp
00003662  B84000            mov ax,0x40
00003665  50                push ax
00003666  B80E00            mov ax,0xe
00003669  50                push ax
0000366A  E880CF            call word 0x5ed
0000366D  83C404            add sp,byte +0x4
00003670  8946FE            mov [bp-0x2],ax
00003673  FF76FE            push word [bp-0x2]
00003676  B85C02            mov ax,0x25c
00003679  50                push ax
0000367A  E862CF            call word 0x5df
0000367D  83C404            add sp,byte +0x4
00003680  89EC              mov sp,bp
00003682  5D                pop bp
00003683  C3                ret
00003684  43                inc bx
00003685  44                inc sp
00003686  3030              xor [bx+si],dh
00003688  3100              xor [bx+si],ax
0000368A  45                inc bp
0000368B  4C                dec sp
0000368C  20544F            and [si+0x4f],dl
0000368F  52                push dx
00003690  49                dec cx
00003691  54                push sp
00003692  4F                dec di
00003693  205350            and [bp+di+0x50],dl
00003696  45                inc bp
00003697  43                inc bx
00003698  49                dec cx
00003699  46                inc si
0000369A  49                dec cx
0000369B  43                inc bx
0000369C  41                inc cx
0000369D  54                push sp
0000369E  49                dec cx
0000369F  4F                dec di
000036A0  4E                dec si
000036A1  005589            add [di-0x77],dl
000036A4  E54C              in ax,0x4c
000036A6  4C                dec sp
000036A7  B84000            mov ax,0x40
000036AA  50                push ax
000036AB  B80E00            mov ax,0xe
000036AE  50                push ax
000036AF  E83BCF            call word 0x5ed
000036B2  83C404            add sp,byte +0x4
000036B5  8946FE            mov [bp-0x2],ax
000036B8  81C4E4F7          add sp,0xf7e4
000036BC  30C0              xor al,al
000036BE  8886E3F7          mov [bp-0x81d],al
000036C2  EB1B              jmp short 0x36df
000036C4  8A86E3F7          mov al,[bp-0x81d]
000036C8  30E4              xor ah,ah
000036CA  50                push ax
000036CB  E8CCFE            call word 0x359a
000036CE  44                inc sp
000036CF  44                inc sp
000036D0  85C0              test ax,ax
000036D2  7402              jz 0x36d6
000036D4  EB11              jmp short 0x36e7
000036D6  8A86E3F7          mov al,[bp-0x81d]
000036DA  40                inc ax
000036DB  8886E3F7          mov [bp-0x81d],al
000036DF  8A86E3F7          mov al,[bp-0x81d]
000036E3  3C08              cmp al,0x8
000036E5  72DD              jc 0x36c4
000036E7  8A86E3F7          mov al,[bp-0x81d]
000036EB  3C08              cmp al,0x8
000036ED  7207              jc 0x36f6
000036EF  B80200            mov ax,0x2
000036F2  89EC              mov sp,bp
000036F4  5D                pop bp
000036F5  C3                ret
000036F6  8A86E3F7          mov al,[bp-0x81d]
000036FA  30E4              xor ah,ah
000036FC  50                push ax
000036FD  E8B2FB            call word 0x32b2
00003700  44                inc sp
00003701  44                inc sp
00003702  85C0              test ax,ax
00003704  7404              jz 0x370a
00003706  B001              mov al,0x1
00003708  EB02              jmp short 0x370c
0000370A  30C0              xor al,al
0000370C  30E4              xor ah,ah
0000370E  8986E4F7          mov [bp-0x81c],ax
00003712  85C0              test ax,ax
00003714  7412              jz 0x3728
00003716  FFB6E4F7          push word [bp-0x81c]
0000371A  BBB5D5            mov bx,0xd5b5
0000371D  53                push bx
0000371E  B80400            mov ax,0x4
00003721  50                push ax
00003722  E805D2            call word 0x92a
00003725  83C406            add sp,byte +0x6
00003728  B80C00            mov ax,0xc
0000372B  50                push ax
0000372C  E82BCF            call word 0x65a
0000372F  50                push ax
00003730  8D5EF0            lea bx,[bp-0x10]
00003733  53                push bx
00003734  31C0              xor ax,ax
00003736  50                push ax
00003737  E8C6C8            call word 0x0
0000373A  83C408            add sp,byte +0x8
0000373D  B028              mov al,0x28
0000373F  8846F0            mov [bp-0x10],al
00003742  30C0              xor al,al
00003744  8846F7            mov [bp-0x9],al
00003747  B001              mov al,0x1
00003749  8846F8            mov [bp-0x8],al
0000374C  30C0              xor al,al
0000374E  8846F2            mov [bp-0xe],al
00003751  30C0              xor al,al
00003753  8846F3            mov [bp-0xd],al
00003756  30C0              xor al,al
00003758  8846F4            mov [bp-0xc],al
0000375B  B011              mov al,0x11
0000375D  8846F5            mov [bp-0xb],al
00003760  8D9EF0F7          lea bx,[bp-0x810]
00003764  53                push bx
00003765  E8F2CE            call word 0x65a
00003768  50                push ax
00003769  B80100            mov ax,0x1
0000376C  50                push ax
0000376D  B80008            mov ax,0x800
00003770  31DB              xor bx,bx
00003772  53                push bx
00003773  50                push ax
00003774  31C0              xor ax,ax
00003776  50                push ax
00003777  8D5EF0            lea bx,[bp-0x10]
0000377A  53                push bx
0000377B  E8DCCE            call word 0x65a
0000377E  50                push ax
0000377F  B80C00            mov ax,0xc
00003782  50                push ax
00003783  8A86E3F7          mov al,[bp-0x81d]
00003787  30E4              xor ah,ah
00003789  50                push ax
0000378A  E8DFF5            call word 0x2d6c
0000378D  83C414            add sp,byte +0x14
00003790  8986E4F7          mov [bp-0x81c],ax
00003794  85C0              test ax,ax
00003796  7407              jz 0x379f
00003798  B80300            mov ax,0x3
0000379B  89EC              mov sp,bp
0000379D  5D                pop bp
0000379E  C3                ret
0000379F  8A86F0F7          mov al,[bp-0x810]
000037A3  84C0              test al,al
000037A5  7407              jz 0x37ae
000037A7  B80400            mov ax,0x4
000037AA  89EC              mov sp,bp
000037AC  5D                pop bp
000037AD  C3                ret
000037AE  31C0              xor ax,ax
000037B0  8986E6F7          mov [bp-0x81a],ax
000037B4  EB3B              jmp short 0x37f1
000037B6  B800F0            mov ax,0xf000
000037B9  50                push ax
000037BA  8B9EE6F7          mov bx,[bp-0x81a]
000037BE  81C38436          add bx,0x3684
000037C2  53                push bx
000037C3  E819CE            call word 0x5df
000037C6  83C404            add sp,byte +0x4
000037C9  50                push ax
000037CA  8B86E6F7          mov ax,[bp-0x81a]
000037CE  40                inc ax
000037CF  89EB              mov bx,bp
000037D1  01C3              add bx,ax
000037D3  8A87F0F7          mov al,[bx-0x810]
000037D7  3A86E0F7          cmp al,[bp-0x820]
000037DB  8DA6E2F7          lea sp,[bp-0x81e]
000037DF  7407              jz 0x37e8
000037E1  B80500            mov ax,0x5
000037E4  89EC              mov sp,bp
000037E6  5D                pop bp
000037E7  C3                ret
000037E8  8B86E6F7          mov ax,[bp-0x81a]
000037EC  40                inc ax
000037ED  8986E6F7          mov [bp-0x81a],ax
000037F1  8B86E6F7          mov ax,[bp-0x81a]
000037F5  3D0500            cmp ax,0x5
000037F8  72BC              jc 0x37b6
000037FA  31C0              xor ax,ax
000037FC  8986E6F7          mov [bp-0x81a],ax
00003800  EB3D              jmp short 0x383f
00003802  B800F0            mov ax,0xf000
00003805  50                push ax
00003806  8B9EE6F7          mov bx,[bp-0x81a]
0000380A  81C38A36          add bx,0x368a
0000380E  53                push bx
0000380F  E8CDCD            call word 0x5df
00003812  83C404            add sp,byte +0x4
00003815  50                push ax
00003816  8B86E6F7          mov ax,[bp-0x81a]
0000381A  050700            add ax,0x7
0000381D  89EB              mov bx,bp
0000381F  01C3              add bx,ax
00003821  8A87F0F7          mov al,[bx-0x810]
00003825  3A86E0F7          cmp al,[bp-0x820]
00003829  8DA6E2F7          lea sp,[bp-0x81e]
0000382D  7407              jz 0x3836
0000382F  B80600            mov ax,0x6
00003832  89EC              mov sp,bp
00003834  5D                pop bp
00003835  C3                ret
00003836  8B86E6F7          mov ax,[bp-0x81a]
0000383A  40                inc ax
0000383B  8986E6F7          mov [bp-0x81a],ax
0000383F  8B86E6F7          mov ax,[bp-0x81a]
00003843  3D1700            cmp ax,0x17
00003846  72BA              jc 0x3802
00003848  8B8637F8          mov ax,[bp-0x7c9]
0000384C  8B9E39F8          mov bx,[bp-0x7c7]
00003850  8986ECF7          mov [bp-0x814],ax
00003854  899EEEF7          mov [bp-0x812],bx
00003858  B80C00            mov ax,0xc
0000385B  50                push ax
0000385C  E8FBCD            call word 0x65a
0000385F  50                push ax
00003860  8D5EF0            lea bx,[bp-0x10]
00003863  53                push bx
00003864  31C0              xor ax,ax
00003866  50                push ax
00003867  E896C7            call word 0x0
0000386A  83C408            add sp,byte +0x8
0000386D  B028              mov al,0x28
0000386F  8846F0            mov [bp-0x10],al
00003872  30C0              xor al,al
00003874  8846F7            mov [bp-0x9],al
00003877  B001              mov al,0x1
00003879  8846F8            mov [bp-0x8],al
0000387C  31C0              xor ax,ax
0000387E  BB00FF            mov bx,0xff00
00003881  8DBEECF7          lea di,[bp-0x814]
00003885  E804C8            call word 0x8c
00003888  93                xchg ax,bx
00003889  88E0              mov al,ah
0000388B  30E4              xor ah,ah
0000388D  31DB              xor bx,bx
0000388F  8846F2            mov [bp-0xe],al
00003892  31C0              xor ax,ax
00003894  BBFF00            mov bx,0xff
00003897  8DBEECF7          lea di,[bp-0x814]
0000389B  E8EEC7            call word 0x8c
0000389E  93                xchg ax,bx
0000389F  31DB              xor bx,bx
000038A1  8846F3            mov [bp-0xd],al
000038A4  B800FF            mov ax,0xff00
000038A7  31DB              xor bx,bx
000038A9  8DBEECF7          lea di,[bp-0x814]
000038AD  E8DCC7            call word 0x8c
000038B0  88E0              mov al,ah
000038B2  88DC              mov ah,bl
000038B4  88FB              mov bl,bh
000038B6  28FF              sub bh,bh
000038B8  8846F4            mov [bp-0xc],al
000038BB  B8FF00            mov ax,0xff
000038BE  31DB              xor bx,bx
000038C0  8DBEECF7          lea di,[bp-0x814]
000038C4  E8C5C7            call word 0x8c
000038C7  8846F5            mov [bp-0xb],al
000038CA  8D9EF0F7          lea bx,[bp-0x810]
000038CE  53                push bx
000038CF  E888CD            call word 0x65a
000038D2  50                push ax
000038D3  B80100            mov ax,0x1
000038D6  50                push ax
000038D7  B80008            mov ax,0x800
000038DA  31DB              xor bx,bx
000038DC  53                push bx
000038DD  50                push ax
000038DE  31C0              xor ax,ax
000038E0  50                push ax
000038E1  8D5EF0            lea bx,[bp-0x10]
000038E4  53                push bx
000038E5  E872CD            call word 0x65a
000038E8  50                push ax
000038E9  B80C00            mov ax,0xc
000038EC  50                push ax
000038ED  8A86E3F7          mov al,[bp-0x81d]
000038F1  30E4              xor ah,ah
000038F3  50                push ax
000038F4  E875F4            call word 0x2d6c
000038F7  83C414            add sp,byte +0x14
000038FA  8986E4F7          mov [bp-0x81c],ax
000038FE  85C0              test ax,ax
00003900  7407              jz 0x3909
00003902  B80700            mov ax,0x7
00003905  89EC              mov sp,bp
00003907  5D                pop bp
00003908  C3                ret
00003909  8A86F0F7          mov al,[bp-0x810]
0000390D  3C01              cmp al,0x1
0000390F  7407              jz 0x3918
00003911  B80800            mov ax,0x8
00003914  89EC              mov sp,bp
00003916  5D                pop bp
00003917  C3                ret
00003918  8A86F1F7          mov al,[bp-0x80f]
0000391C  84C0              test al,al
0000391E  7407              jz 0x3927
00003920  B80900            mov ax,0x9
00003923  89EC              mov sp,bp
00003925  5D                pop bp
00003926  C3                ret
00003927  8A860EF8          mov al,[bp-0x7f2]
0000392B  3C55              cmp al,0x55
0000392D  7407              jz 0x3936
0000392F  B80A00            mov ax,0xa
00003932  89EC              mov sp,bp
00003934  5D                pop bp
00003935  C3                ret
00003936  8A860FF8          mov al,[bp-0x7f1]
0000393A  3CAA              cmp al,0xaa
0000393C  7407              jz 0x3945
0000393E  B80A00            mov ax,0xa
00003941  89EC              mov sp,bp
00003943  5D                pop bp
00003944  C3                ret
00003945  8A8610F8          mov al,[bp-0x7f0]
00003949  3C88              cmp al,0x88
0000394B  7407              jz 0x3954
0000394D  B80B00            mov ax,0xb
00003950  89EC              mov sp,bp
00003952  5D                pop bp
00003953  C3                ret
00003954  FF76FE            push word [bp-0x2]
00003957  E803CD            call word 0x65d
0000395A  44                inc sp
0000395B  44                inc sp
0000395C  8946FC            mov [bp-0x4],ax
0000395F  8A8611F8          mov al,[bp-0x7ef]
00003963  A25B02            mov [0x25b],al
00003966  8A8611F8          mov al,[bp-0x7ef]
0000396A  84C0              test al,al
0000396C  7507              jnz 0x3975
0000396E  B0E0              mov al,0xe0
00003970  A25C02            mov [0x25c],al
00003973  EB14              jmp short 0x3989
00003975  8A8611F8          mov al,[bp-0x7ef]
00003979  3C04              cmp al,0x4
0000397B  7307              jnc 0x3984
0000397D  30C0              xor al,al
0000397F  A25C02            mov [0x25c],al
00003982  EB05              jmp short 0x3989
00003984  B080              mov al,0x80
00003986  A25C02            mov [0x25c],al
00003989  8A86E3F7          mov al,[bp-0x81d]
0000398D  30E4              xor ah,ah
0000398F  D1E8              shr ax,1
00003991  A25D02            mov [0x25d],al
00003994  8A86E3F7          mov al,[bp-0x81d]
00003998  30E4              xor ah,ah
0000399A  2401              and al,0x1
0000399C  A25E02            mov [0x25e],al
0000399F  8B8612F8          mov ax,[bp-0x7ee]
000039A3  8986EAF7          mov [bp-0x816],ax
000039A7  8B86EAF7          mov ax,[bp-0x816]
000039AB  85C0              test ax,ax
000039AD  7507              jnz 0x39b6
000039AF  B8C007            mov ax,0x7c0
000039B2  8986EAF7          mov [bp-0x816],ax
000039B6  8B86EAF7          mov ax,[bp-0x816]
000039BA  A36602            mov [0x266],ax
000039BD  31C0              xor ax,ax
000039BF  A36402            mov [0x264],ax
000039C2  8B8616F8          mov ax,[bp-0x7ea]
000039C6  8986E8F7          mov [bp-0x818],ax
000039CA  8B86E8F7          mov ax,[bp-0x818]
000039CE  A36802            mov [0x268],ax
000039D1  8B8618F8          mov ax,[bp-0x7e8]
000039D5  8B9E1AF8          mov bx,[bp-0x7e6]
000039D9  8986ECF7          mov [bp-0x814],ax
000039DD  899EEEF7          mov [bp-0x812],bx
000039E1  8B86ECF7          mov ax,[bp-0x814]
000039E5  8B9EEEF7          mov bx,[bp-0x812]
000039E9  A36002            mov [0x260],ax
000039EC  891E6202          mov [0x262],bx
000039F0  B80C00            mov ax,0xc
000039F3  50                push ax
000039F4  E863CC            call word 0x65a
000039F7  50                push ax
000039F8  8D5EF0            lea bx,[bp-0x10]
000039FB  53                push bx
000039FC  31C0              xor ax,ax
000039FE  50                push ax
000039FF  E8FEC5            call word 0x0
00003A02  83C408            add sp,byte +0x8
00003A05  B028              mov al,0x28
00003A07  8846F0            mov [bp-0x10],al
00003A0A  8B86E8F7          mov ax,[bp-0x818]
00003A0E  48                dec ax
00003A0F  D1E8              shr ax,1
00003A11  D1E8              shr ax,1
00003A13  40                inc ax
00003A14  30C0              xor al,al
00003A16  88E0              mov al,ah
00003A18  30E4              xor ah,ah
00003A1A  8846F7            mov [bp-0x9],al
00003A1D  8B86E8F7          mov ax,[bp-0x818]
00003A21  48                dec ax
00003A22  D1E8              shr ax,1
00003A24  D1E8              shr ax,1
00003A26  40                inc ax
00003A27  8846F8            mov [bp-0x8],al
00003A2A  31C0              xor ax,ax
00003A2C  BB00FF            mov bx,0xff00
00003A2F  8DBEECF7          lea di,[bp-0x814]
00003A33  E856C6            call word 0x8c
00003A36  93                xchg ax,bx
00003A37  88E0              mov al,ah
00003A39  30E4              xor ah,ah
00003A3B  31DB              xor bx,bx
00003A3D  8846F2            mov [bp-0xe],al
00003A40  31C0              xor ax,ax
00003A42  BBFF00            mov bx,0xff
00003A45  8DBEECF7          lea di,[bp-0x814]
00003A49  E840C6            call word 0x8c
00003A4C  93                xchg ax,bx
00003A4D  31DB              xor bx,bx
00003A4F  8846F3            mov [bp-0xd],al
00003A52  B800FF            mov ax,0xff00
00003A55  31DB              xor bx,bx
00003A57  8DBEECF7          lea di,[bp-0x814]
00003A5B  E82EC6            call word 0x8c
00003A5E  88E0              mov al,ah
00003A60  88DC              mov ah,bl
00003A62  88FB              mov bl,bh
00003A64  28FF              sub bh,bh
00003A66  8846F4            mov [bp-0xc],al
00003A69  B8FF00            mov ax,0xff
00003A6C  31DB              xor bx,bx
00003A6E  8DBEECF7          lea di,[bp-0x814]
00003A72  E817C6            call word 0x8c
00003A75  8846F5            mov [bp-0xb],al
00003A78  31C0              xor ax,ax
00003A7A  50                push ax
00003A7B  FFB6EAF7          push word [bp-0x816]
00003A7F  B80100            mov ax,0x1
00003A82  50                push ax
00003A83  8B86E8F7          mov ax,[bp-0x818]
00003A87  31DB              xor bx,bx
00003A89  53                push bx
00003A8A  50                push ax
00003A8B  B80002            mov ax,0x200
00003A8E  31DB              xor bx,bx
00003A90  53                push bx
00003A91  50                push ax
00003A92  8B86D8F7          mov ax,[bp-0x828]
00003A96  8B9EDAF7          mov bx,[bp-0x826]
00003A9A  8DBED4F7          lea di,[bp-0x82c]
00003A9E  E819C6            call word 0xba
00003AA1  83C408            add sp,byte +0x8
00003AA4  53                push bx
00003AA5  50                push ax
00003AA6  31C0              xor ax,ax
00003AA8  50                push ax
00003AA9  8D5EF0            lea bx,[bp-0x10]
00003AAC  53                push bx
00003AAD  E8AACB            call word 0x65a
00003AB0  50                push ax
00003AB1  B80C00            mov ax,0xc
00003AB4  50                push ax
00003AB5  8A86E3F7          mov al,[bp-0x81d]
00003AB9  30E4              xor ah,ah
00003ABB  50                push ax
00003ABC  E8ADF2            call word 0x2d6c
00003ABF  83C414            add sp,byte +0x14
00003AC2  8986E4F7          mov [bp-0x81c],ax
00003AC6  85C0              test ax,ax
00003AC8  740F              jz 0x3ad9
00003ACA  FF76FC            push word [bp-0x4]
00003ACD  E88DCB            call word 0x65d
00003AD0  44                inc sp
00003AD1  44                inc sp
00003AD2  B80C00            mov ax,0xc
00003AD5  89EC              mov sp,bp
00003AD7  5D                pop bp
00003AD8  C3                ret
00003AD9  A05B02            mov al,[0x25b]
00003ADC  E99C00            jmp word 0x3b7b
00003ADF  B80F00            mov ax,0xf
00003AE2  A36E02            mov [0x26e],ax
00003AE5  B85000            mov ax,0x50
00003AE8  A36C02            mov [0x26c],ax
00003AEB  B80200            mov ax,0x2
00003AEE  A36A02            mov [0x26a],ax
00003AF1  E99D00            jmp word 0x3b91
00003AF4  B81200            mov ax,0x12
00003AF7  A36E02            mov [0x26e],ax
00003AFA  B85000            mov ax,0x50
00003AFD  A36C02            mov [0x26c],ax
00003B00  B80200            mov ax,0x2
00003B03  A36A02            mov [0x26a],ax
00003B06  E98800            jmp word 0x3b91
00003B09  B82400            mov ax,0x24
00003B0C  A36E02            mov [0x26e],ax
00003B0F  B85000            mov ax,0x50
00003B12  A36C02            mov [0x26c],ax
00003B15  B80200            mov ax,0x2
00003B18  A36A02            mov [0x26a],ax
00003B1B  E97300            jmp word 0x3b91
00003B1E  FFB6EAF7          push word [bp-0x816]
00003B22  B8C401            mov ax,0x1c4
00003B25  50                push ax
00003B26  E8B6CA            call word 0x5df
00003B29  83C404            add sp,byte +0x4
00003B2C  243F              and al,0x3f
00003B2E  30E4              xor ah,ah
00003B30  A36E02            mov [0x26e],ax
00003B33  FFB6EAF7          push word [bp-0x816]
00003B37  B8C501            mov ax,0x1c5
00003B3A  50                push ax
00003B3B  E8A1CA            call word 0x5df
00003B3E  83C404            add sp,byte +0x4
00003B41  50                push ax
00003B42  FFB6EAF7          push word [bp-0x816]
00003B46  B8C401            mov ax,0x1c4
00003B49  50                push ax
00003B4A  E892CA            call word 0x5df
00003B4D  83C404            add sp,byte +0x4
00003B50  30E4              xor ah,ah
00003B52  D1E0              shl ax,1
00003B54  D1E0              shl ax,1
00003B56  0286E0F7          add al,[bp-0x820]
00003B5A  80D400            adc ah,0x0
00003B5D  44                inc sp
00003B5E  44                inc sp
00003B5F  40                inc ax
00003B60  A36C02            mov [0x26c],ax
00003B63  FFB6EAF7          push word [bp-0x816]
00003B67  B8C301            mov ax,0x1c3
00003B6A  50                push ax
00003B6B  E871CA            call word 0x5df
00003B6E  83C404            add sp,byte +0x4
00003B71  30E4              xor ah,ah
00003B73  40                inc ax
00003B74  A36A02            mov [0x26a],ax
00003B77  EB18              jmp short 0x3b91
00003B79  EB16              jmp short 0x3b91
00003B7B  2C01              sub al,0x1
00003B7D  0F845EFF          jz word 0x3adf
00003B81  2C01              sub al,0x1
00003B83  0F846DFF          jz word 0x3af4
00003B87  2C01              sub al,0x1
00003B89  0F847CFF          jz word 0x3b09
00003B8D  2C01              sub al,0x1
00003B8F  748D              jz 0x3b1e
00003B91  A05B02            mov al,[0x25b]
00003B94  84C0              test al,al
00003B96  7433              jz 0x3bcb
00003B98  A05C02            mov al,[0x25c]
00003B9B  84C0              test al,al
00003B9D  7523              jnz 0x3bc2
00003B9F  B84000            mov ax,0x40
00003BA2  50                push ax
00003BA3  B81000            mov ax,0x10
00003BA6  50                push ax
00003BA7  B84000            mov ax,0x40
00003BAA  50                push ax
00003BAB  B81000            mov ax,0x10
00003BAE  50                push ax
00003BAF  E82DCA            call word 0x5df
00003BB2  83C404            add sp,byte +0x4
00003BB5  0C41              or al,0x41
00003BB7  30E4              xor ah,ah
00003BB9  50                push ax
00003BBA  E83ECA            call word 0x5fb
00003BBD  83C406            add sp,byte +0x6
00003BC0  EB09              jmp short 0x3bcb
00003BC2  A03202            mov al,[0x232]
00003BC5  30E4              xor ah,ah
00003BC7  40                inc ax
00003BC8  A23202            mov [0x232],al
00003BCB  A05B02            mov al,[0x25b]
00003BCE  84C0              test al,al
00003BD0  7405              jz 0x3bd7
00003BD2  B001              mov al,0x1
00003BD4  A25A02            mov [0x25a],al
00003BD7  A05C02            mov al,[0x25c]
00003BDA  30E4              xor ah,ah
00003BDC  B90001            mov cx,0x100
00003BDF  F7E9              imul cx
00003BE1  8986E6F7          mov [bp-0x81a],ax
00003BE5  FF76FC            push word [bp-0x4]
00003BE8  E872CA            call word 0x65d
00003BEB  44                inc sp
00003BEC  44                inc sp
00003BED  8B86E6F7          mov ax,[bp-0x81a]
00003BF1  89EC              mov sp,bp
00003BF3  5D                pop bp
00003BF4  C3                ret
00003BF5  55                push bp
00003BF6  89E5              mov bp,sp
00003BF8  83C4F8            add sp,byte -0x8
00003BFB  FB                sti
00003BFC  8B460E            mov ax,[bp+0xe]
00003BFF  D1E0              shl ax,1
00003C01  89C3              mov bx,ax
00003C03  8B9F0004          mov bx,[bx+0x400]
00003C07  895EFE            mov [bp-0x2],bx
00003C0A  8B460E            mov ax,[bp+0xe]
00003C0D  89C3              mov bx,ax
00003C0F  8A877C04          mov al,[bx+0x47c]
00003C13  8846F9            mov [bp-0x7],al
00003C16  8B460E            mov ax,[bp+0xe]
00003C19  3D0400            cmp ax,0x4
00003C1C  0F83F801          jnc word 0x3e18
00003C20  8B46FE            mov ax,[bp-0x2]
00003C23  85C0              test ax,ax
00003C25  0F84EF01          jz word 0x3e18
00003C29  8A4613            mov al,[bp+0x13]
00003C2C  E9CF01            jmp word 0x3dfe
00003C2F  8B46FE            mov ax,[bp-0x2]
00003C32  050300            add ax,0x3
00003C35  50                push ax
00003C36  E8F0C8            call word 0x529
00003C39  44                inc sp
00003C3A  44                inc sp
00003C3B  0C80              or al,0x80
00003C3D  30E4              xor ah,ah
00003C3F  50                push ax
00003C40  8B46FE            mov ax,[bp-0x2]
00003C43  050300            add ax,0x3
00003C46  50                push ax
00003C47  E8F5C8            call word 0x53f
00003C4A  83C404            add sp,byte +0x4
00003C4D  8A4612            mov al,[bp+0x12]
00003C50  30C0              xor al,al
00003C52  84C0              test al,al
00003C54  741E              jz 0x3c74
00003C56  B81700            mov ax,0x17
00003C59  50                push ax
00003C5A  FF76FE            push word [bp-0x2]
00003C5D  E8DFC8            call word 0x53f
00003C60  83C404            add sp,byte +0x4
00003C63  B80400            mov ax,0x4
00003C66  50                push ax
00003C67  8B46FE            mov ax,[bp-0x2]
00003C6A  40                inc ax
00003C6B  50                push ax
00003C6C  E8D0C8            call word 0x53f
00003C6F  83C404            add sp,byte +0x4
00003C72  EB39              jmp short 0x3cad
00003C74  8A4612            mov al,[bp+0x12]
00003C77  24E0              and al,0xe0
00003C79  30E4              xor ah,ah
00003C7B  B105              mov cl,0x5
00003C7D  D3E8              shr ax,cl
00003C7F  89C3              mov bx,ax
00003C81  B80006            mov ax,0x600
00003C84  89D9              mov cx,bx
00003C86  D3F8              sar ax,cl
00003C88  8946FA            mov [bp-0x6],ax
00003C8B  8A46FA            mov al,[bp-0x6]
00003C8E  30E4              xor ah,ah
00003C90  50                push ax
00003C91  FF76FE            push word [bp-0x2]
00003C94  E8A8C8            call word 0x53f
00003C97  83C404            add sp,byte +0x4
00003C9A  8B46FA            mov ax,[bp-0x6]
00003C9D  88E0              mov al,ah
00003C9F  30E4              xor ah,ah
00003CA1  50                push ax
00003CA2  8B46FE            mov ax,[bp-0x2]
00003CA5  40                inc ax
00003CA6  50                push ax
00003CA7  E895C8            call word 0x53f
00003CAA  83C404            add sp,byte +0x4
00003CAD  8A4612            mov al,[bp+0x12]
00003CB0  241F              and al,0x1f
00003CB2  30E4              xor ah,ah
00003CB4  50                push ax
00003CB5  8B46FE            mov ax,[bp-0x2]
00003CB8  050300            add ax,0x3
00003CBB  50                push ax
00003CBC  E880C8            call word 0x53f
00003CBF  83C404            add sp,byte +0x4
00003CC2  8B46FE            mov ax,[bp-0x2]
00003CC5  050500            add ax,0x5
00003CC8  50                push ax
00003CC9  E85DC8            call word 0x529
00003CCC  44                inc sp
00003CCD  44                inc sp
00003CCE  884613            mov [bp+0x13],al
00003CD1  8B46FE            mov ax,[bp-0x2]
00003CD4  050600            add ax,0x6
00003CD7  50                push ax
00003CD8  E84EC8            call word 0x529
00003CDB  44                inc sp
00003CDC  44                inc sp
00003CDD  884612            mov [bp+0x12],al
00003CE0  8A461A            mov al,[bp+0x1a]
00003CE3  24FE              and al,0xfe
00003CE5  88461A            mov [bp+0x1a],al
00003CE8  E92B01            jmp word 0x3e16
00003CEB  A16C04            mov ax,[0x46c]
00003CEE  8946FC            mov [bp-0x4],ax
00003CF1  EB1B              jmp short 0x3d0e
00003CF3  A16C04            mov ax,[0x46c]
00003CF6  8946FA            mov [bp-0x6],ax
00003CF9  8B46FA            mov ax,[bp-0x6]
00003CFC  3B46FC            cmp ax,[bp-0x4]
00003CFF  740D              jz 0x3d0e
00003D01  8B46FA            mov ax,[bp-0x6]
00003D04  8946FC            mov [bp-0x4],ax
00003D07  8A46F9            mov al,[bp-0x7]
00003D0A  48                dec ax
00003D0B  8846F9            mov [bp-0x7],al
00003D0E  8B46FE            mov ax,[bp-0x2]
00003D11  050500            add ax,0x5
00003D14  50                push ax
00003D15  E811C8            call word 0x529
00003D18  44                inc sp
00003D19  44                inc sp
00003D1A  2460              and al,0x60
00003D1C  3C60              cmp al,0x60
00003D1E  7407              jz 0x3d27
00003D20  8A46F9            mov al,[bp-0x7]
00003D23  84C0              test al,al
00003D25  75CC              jnz 0x3cf3
00003D27  8A46F9            mov al,[bp-0x7]
00003D2A  84C0              test al,al
00003D2C  7420              jz 0x3d4e
00003D2E  8A4612            mov al,[bp+0x12]
00003D31  30E4              xor ah,ah
00003D33  50                push ax
00003D34  FF76FE            push word [bp-0x2]
00003D37  E805C8            call word 0x53f
00003D3A  83C404            add sp,byte +0x4
00003D3D  8B46FE            mov ax,[bp-0x2]
00003D40  050500            add ax,0x5
00003D43  50                push ax
00003D44  E8E2C7            call word 0x529
00003D47  44                inc sp
00003D48  44                inc sp
00003D49  884613            mov [bp+0x13],al
00003D4C  EB05              jmp short 0x3d53
00003D4E  B080              mov al,0x80
00003D50  884613            mov [bp+0x13],al
00003D53  8A461A            mov al,[bp+0x1a]
00003D56  24FE              and al,0xfe
00003D58  88461A            mov [bp+0x1a],al
00003D5B  E9B800            jmp word 0x3e16
00003D5E  A16C04            mov ax,[0x46c]
00003D61  8946FC            mov [bp-0x4],ax
00003D64  EB1B              jmp short 0x3d81
00003D66  A16C04            mov ax,[0x46c]
00003D69  8946FA            mov [bp-0x6],ax
00003D6C  8B46FA            mov ax,[bp-0x6]
00003D6F  3B46FC            cmp ax,[bp-0x4]
00003D72  740D              jz 0x3d81
00003D74  8B46FA            mov ax,[bp-0x6]
00003D77  8946FC            mov [bp-0x4],ax
00003D7A  8A46F9            mov al,[bp-0x7]
00003D7D  48                dec ax
00003D7E  8846F9            mov [bp-0x7],al
00003D81  8B46FE            mov ax,[bp-0x2]
00003D84  050500            add ax,0x5
00003D87  50                push ax
00003D88  E89EC7            call word 0x529
00003D8B  44                inc sp
00003D8C  44                inc sp
00003D8D  2401              and al,0x1
00003D8F  84C0              test al,al
00003D91  7507              jnz 0x3d9a
00003D93  8A46F9            mov al,[bp-0x7]
00003D96  84C0              test al,al
00003D98  75CC              jnz 0x3d66
00003D9A  8A46F9            mov al,[bp-0x7]
00003D9D  84C0              test al,al
00003D9F  741C              jz 0x3dbd
00003DA1  8B46FE            mov ax,[bp-0x2]
00003DA4  050500            add ax,0x5
00003DA7  50                push ax
00003DA8  E87EC7            call word 0x529
00003DAB  44                inc sp
00003DAC  44                inc sp
00003DAD  884613            mov [bp+0x13],al
00003DB0  FF76FE            push word [bp-0x2]
00003DB3  E873C7            call word 0x529
00003DB6  44                inc sp
00003DB7  44                inc sp
00003DB8  884612            mov [bp+0x12],al
00003DBB  EB05              jmp short 0x3dc2
00003DBD  B080              mov al,0x80
00003DBF  884613            mov [bp+0x13],al
00003DC2  8A461A            mov al,[bp+0x1a]
00003DC5  24FE              and al,0xfe
00003DC7  88461A            mov [bp+0x1a],al
00003DCA  EB4A              jmp short 0x3e16
00003DCC  8B46FE            mov ax,[bp-0x2]
00003DCF  050500            add ax,0x5
00003DD2  50                push ax
00003DD3  E853C7            call word 0x529
00003DD6  44                inc sp
00003DD7  44                inc sp
00003DD8  884613            mov [bp+0x13],al
00003DDB  8B46FE            mov ax,[bp-0x2]
00003DDE  050600            add ax,0x6
00003DE1  50                push ax
00003DE2  E844C7            call word 0x529
00003DE5  44                inc sp
00003DE6  44                inc sp
00003DE7  884612            mov [bp+0x12],al
00003DEA  8A461A            mov al,[bp+0x1a]
00003DED  24FE              and al,0xfe
00003DEF  88461A            mov [bp+0x1a],al
00003DF2  EB22              jmp short 0x3e16
00003DF4  8A461A            mov al,[bp+0x1a]
00003DF7  0C01              or al,0x1
00003DF9  88461A            mov [bp+0x1a],al
00003DFC  EB18              jmp short 0x3e16
00003DFE  2C00              sub al,0x0
00003E00  0F842BFE          jz word 0x3c2f
00003E04  2C01              sub al,0x1
00003E06  0F84E1FE          jz word 0x3ceb
00003E0A  2C01              sub al,0x1
00003E0C  0F844EFF          jz word 0x3d5e
00003E10  2C01              sub al,0x1
00003E12  74B8              jz 0x3dcc
00003E14  EBDE              jmp short 0x3df4
00003E16  EB08              jmp short 0x3e20
00003E18  8A461A            mov al,[bp+0x1a]
00003E1B  0C01              or al,0x1
00003E1D  88461A            mov [bp+0x1a],al
00003E20  89EC              mov sp,bp
00003E22  5D                pop bp
00003E23  C3                ret
00003E24  55                push bp
00003E25  89E5              mov bp,sp
00003E27  4C                dec sp
00003E28  4C                dec sp
00003E29  B84000            mov ax,0x40
00003E2C  50                push ax
00003E2D  B80E00            mov ax,0xe
00003E30  50                push ax
00003E31  E8B9C7            call word 0x5ed
00003E34  83C404            add sp,byte +0x4
00003E37  8946FE            mov [bp-0x2],ax
00003E3A  83C4EE            add sp,byte -0x12
00003E3D  8A4613            mov al,[bp+0x13]
00003E40  E99504            jmp word 0x42d8
00003E43  8A4612            mov al,[bp+0x12]
00003E46  EB73              jmp short 0x3ebb
00003E48  8A4612            mov al,[bp+0x12]
00003E4B  30E4              xor ah,ah
00003E4D  50                push ax
00003E4E  E8D8D8            call word 0x1729
00003E51  44                inc sp
00003E52  44                inc sp
00003E53  8B4618            mov ax,[bp+0x18]
00003E56  24FE              and al,0xfe
00003E58  894618            mov [bp+0x18],ax
00003E5B  30C0              xor al,al
00003E5D  884613            mov [bp+0x13],al
00003E60  EB6B              jmp short 0x3ecd
00003E62  B89200            mov ax,0x92
00003E65  50                push ax
00003E66  E8C0C6            call word 0x529
00003E69  44                inc sp
00003E6A  44                inc sp
00003E6B  30E4              xor ah,ah
00003E6D  D1E8              shr ax,1
00003E6F  2401              and al,0x1
00003E71  884612            mov [bp+0x12],al
00003E74  8B4618            mov ax,[bp+0x18]
00003E77  24FE              and al,0xfe
00003E79  894618            mov [bp+0x18],ax
00003E7C  30C0              xor al,al
00003E7E  884613            mov [bp+0x13],al
00003E81  EB4A              jmp short 0x3ecd
00003E83  8B4618            mov ax,[bp+0x18]
00003E86  24FE              and al,0xfe
00003E88  894618            mov [bp+0x18],ax
00003E8B  30C0              xor al,al
00003E8D  884613            mov [bp+0x13],al
00003E90  B80300            mov ax,0x3
00003E93  89460C            mov [bp+0xc],ax
00003E96  EB35              jmp short 0x3ecd
00003E98  8A4612            mov al,[bp+0x12]
00003E9B  30E4              xor ah,ah
00003E9D  50                push ax
00003E9E  BB75D5            mov bx,0xd575
00003EA1  53                push bx
00003EA2  B80400            mov ax,0x4
00003EA5  50                push ax
00003EA6  E881CA            call word 0x92a
00003EA9  83C406            add sp,byte +0x6
00003EAC  8B4618            mov ax,[bp+0x18]
00003EAF  0C01              or al,0x1
00003EB1  894618            mov [bp+0x18],ax
00003EB4  B086              mov al,0x86
00003EB6  884613            mov [bp+0x13],al
00003EB9  EB12              jmp short 0x3ecd
00003EBB  2C00              sub al,0x0
00003EBD  7489              jz 0x3e48
00003EBF  2C01              sub al,0x1
00003EC1  7485              jz 0x3e48
00003EC3  2C01              sub al,0x1
00003EC5  749B              jz 0x3e62
00003EC7  2C01              sub al,0x1
00003EC9  74B8              jz 0x3e83
00003ECB  EBCB              jmp short 0x3e98
00003ECD  E97204            jmp word 0x4342
00003ED0  8B4618            mov ax,[bp+0x18]
00003ED3  0C01              or al,0x1
00003ED5  894618            mov [bp+0x18],ax
00003ED8  B086              mov al,0x86
00003EDA  884613            mov [bp+0x13],al
00003EDD  E96204            jmp word 0x4342
00003EE0  8B4618            mov ax,[bp+0x18]
00003EE3  0C01              or al,0x1
00003EE5  894618            mov [bp+0x18],ax
00003EE8  E95704            jmp word 0x4342
00003EEB  8B4618            mov ax,[bp+0x18]
00003EEE  24FE              and al,0xfe
00003EF0  894618            mov [bp+0x18],ax
00003EF3  30C0              xor al,al
00003EF5  884613            mov [bp+0x13],al
00003EF8  E94704            jmp word 0x4342
00003EFB  8B4618            mov ax,[bp+0x18]
00003EFE  24FE              and al,0xfe
00003F00  894618            mov [bp+0x18],ax
00003F03  30C0              xor al,al
00003F05  884613            mov [bp+0x13],al
00003F08  E93704            jmp word 0x4342
00003F0B  B84000            mov ax,0x40
00003F0E  50                push ax
00003F0F  E84BC7            call word 0x65d
00003F12  44                inc sp
00003F13  44                inc sp
00003F14  8A4612            mov al,[bp+0x12]
00003F17  84C0              test al,al
00003F19  0F857B00          jnz word 0x3f98
00003F1D  A0A000            mov al,[0xa0]
00003F20  2401              and al,0x1
00003F22  84C0              test al,al
00003F24  7563              jnz 0x3f89
00003F26  B001              mov al,0x1
00003F28  A2A000            mov [0xa0],al
00003F2B  8B4614            mov ax,[bp+0x14]
00003F2E  A39800            mov [0x98],ax
00003F31  8B460C            mov ax,[bp+0xc]
00003F34  A39A00            mov [0x9a],ax
00003F37  8B460E            mov ax,[bp+0xe]
00003F3A  A39C00            mov [0x9c],ax
00003F3D  8B4610            mov ax,[bp+0x10]
00003F40  A39E00            mov [0x9e],ax
00003F43  8B4618            mov ax,[bp+0x18]
00003F46  24FE              and al,0xfe
00003F48  894618            mov [bp+0x18],ax
00003F4B  B8A100            mov ax,0xa1
00003F4E  50                push ax
00003F4F  E8D7C5            call word 0x529
00003F52  44                inc sp
00003F53  44                inc sp
00003F54  8846ED            mov [bp-0x13],al
00003F57  8A46ED            mov al,[bp-0x13]
00003F5A  24FE              and al,0xfe
00003F5C  30E4              xor ah,ah
00003F5E  50                push ax
00003F5F  B8A100            mov ax,0xa1
00003F62  50                push ax
00003F63  E8D9C5            call word 0x53f
00003F66  83C404            add sp,byte +0x4
00003F69  B80B00            mov ax,0xb
00003F6C  50                push ax
00003F6D  E8FEC5            call word 0x56e
00003F70  44                inc sp
00003F71  44                inc sp
00003F72  30E4              xor ah,ah
00003F74  8946EE            mov [bp-0x12],ax
00003F77  8B46EE            mov ax,[bp-0x12]
00003F7A  0C40              or al,0x40
00003F7C  50                push ax
00003F7D  B80B00            mov ax,0xb
00003F80  50                push ax
00003F81  E8DBC5            call word 0x55f
00003F84  83C404            add sp,byte +0x4
00003F87  EB0D              jmp short 0x3f96
00003F89  8B4618            mov ax,[bp+0x18]
00003F8C  0C01              or al,0x1
00003F8E  894618            mov [bp+0x18],ax
00003F91  B086              mov al,0x86
00003F93  884613            mov [bp+0x13],al
00003F96  EB48              jmp short 0x3fe0
00003F98  8A4612            mov al,[bp+0x12]
00003F9B  3C01              cmp al,0x1
00003F9D  752D              jnz 0x3fcc
00003F9F  30C0              xor al,al
00003FA1  A2A000            mov [0xa0],al
00003FA4  8B4618            mov ax,[bp+0x18]
00003FA7  24FE              and al,0xfe
00003FA9  894618            mov [bp+0x18],ax
00003FAC  B80B00            mov ax,0xb
00003FAF  50                push ax
00003FB0  E8BBC5            call word 0x56e
00003FB3  44                inc sp
00003FB4  44                inc sp
00003FB5  30E4              xor ah,ah
00003FB7  8946EE            mov [bp-0x12],ax
00003FBA  8B46EE            mov ax,[bp-0x12]
00003FBD  24BF              and al,0xbf
00003FBF  50                push ax
00003FC0  B80B00            mov ax,0xb
00003FC3  50                push ax
00003FC4  E898C5            call word 0x55f
00003FC7  83C404            add sp,byte +0x4
00003FCA  EB14              jmp short 0x3fe0
00003FCC  8B4618            mov ax,[bp+0x18]
00003FCF  0C01              or al,0x1
00003FD1  894618            mov [bp+0x18],ax
00003FD4  B086              mov al,0x86
00003FD6  884613            mov [bp+0x13],al
00003FD9  8A4612            mov al,[bp+0x12]
00003FDC  48                dec ax
00003FDD  884612            mov [bp+0x12],al
00003FE0  E95F03            jmp word 0x4342
00003FE3  FA                cli
00003FE4  B80100            mov ax,0x1
00003FE7  50                push ax
00003FE8  E83ED7            call word 0x1729
00003FEB  44                inc sp
00003FEC  44                inc sp
00003FED  8946FC            mov [bp-0x4],ax
00003FF0  8B4614            mov ax,[bp+0x14]
00003FF3  B104              mov cl,0x4
00003FF5  D3E0              shl ax,cl
00003FF7  034606            add ax,[bp+0x6]
00003FFA  8946FA            mov [bp-0x6],ax
00003FFD  8B4614            mov ax,[bp+0x14]
00004000  88E0              mov al,ah
00004002  30E4              xor ah,ah
00004004  B104              mov cl,0x4
00004006  D3E8              shr ax,cl
00004008  8846F9            mov [bp-0x7],al
0000400B  8B4614            mov ax,[bp+0x14]
0000400E  B104              mov cl,0x4
00004010  D3E0              shl ax,cl
00004012  3B46FA            cmp ax,[bp-0x6]
00004015  7607              jna 0x401e
00004017  8A46F9            mov al,[bp-0x7]
0000401A  40                inc ax
0000401B  8846F9            mov [bp-0x7],al
0000401E  FF7614            push word [bp+0x14]
00004021  E839C6            call word 0x65d
00004024  44                inc sp
00004025  44                inc sp
00004026  8B4606            mov ax,[bp+0x6]
00004029  89C3              mov bx,ax
0000402B  B82F00            mov ax,0x2f
0000402E  894708            mov [bx+0x8],ax
00004031  8B4606            mov ax,[bp+0x6]
00004034  89C3              mov bx,ax
00004036  8B46FA            mov ax,[bp-0x6]
00004039  89470A            mov [bx+0xa],ax
0000403C  8B4606            mov ax,[bp+0x6]
0000403F  89C3              mov bx,ax
00004041  8A46F9            mov al,[bp-0x7]
00004044  88470C            mov [bx+0xc],al
00004047  8B4606            mov ax,[bp+0x6]
0000404A  89C3              mov bx,ax
0000404C  B093              mov al,0x93
0000404E  88470D            mov [bx+0xd],al
00004051  8B4606            mov ax,[bp+0x6]
00004054  89C3              mov bx,ax
00004056  31C0              xor ax,ax
00004058  89470E            mov [bx+0xe],ax
0000405B  8B4606            mov ax,[bp+0x6]
0000405E  89C3              mov bx,ax
00004060  B8FFFF            mov ax,0xffff
00004063  894720            mov [bx+0x20],ax
00004066  8B4606            mov ax,[bp+0x6]
00004069  89C3              mov bx,ax
0000406B  31C0              xor ax,ax
0000406D  894722            mov [bx+0x22],ax
00004070  8B4606            mov ax,[bp+0x6]
00004073  89C3              mov bx,ax
00004075  B00F              mov al,0xf
00004077  884724            mov [bx+0x24],al
0000407A  8B4606            mov ax,[bp+0x6]
0000407D  89C3              mov bx,ax
0000407F  B09B              mov al,0x9b
00004081  884725            mov [bx+0x25],al
00004084  8B4606            mov ax,[bp+0x6]
00004087  89C3              mov bx,ax
00004089  31C0              xor ax,ax
0000408B  894726            mov [bx+0x26],ax
0000408E  E8C9C5            call word 0x65a
00004091  8946F6            mov [bp-0xa],ax
00004094  8B46F6            mov ax,[bp-0xa]
00004097  B104              mov cl,0x4
00004099  D3E0              shl ax,cl
0000409B  8946FA            mov [bp-0x6],ax
0000409E  8B46F6            mov ax,[bp-0xa]
000040A1  88E0              mov al,ah
000040A3  30E4              xor ah,ah
000040A5  B104              mov cl,0x4
000040A7  D3E8              shr ax,cl
000040A9  8846F9            mov [bp-0x7],al
000040AC  8B4606            mov ax,[bp+0x6]
000040AF  89C3              mov bx,ax
000040B1  B8FFFF            mov ax,0xffff
000040B4  894728            mov [bx+0x28],ax
000040B7  8B4606            mov ax,[bp+0x6]
000040BA  89C3              mov bx,ax
000040BC  8B46FA            mov ax,[bp-0x6]
000040BF  89472A            mov [bx+0x2a],ax
000040C2  8B4606            mov ax,[bp+0x6]
000040C5  89C3              mov bx,ax
000040C7  8A46F9            mov al,[bp-0x7]
000040CA  88472C            mov [bx+0x2c],al
000040CD  8B4606            mov ax,[bp+0x6]
000040D0  89C3              mov bx,ax
000040D2  B093              mov al,0x93
000040D4  88472D            mov [bx+0x2d],al
000040D7  8B4606            mov ax,[bp+0x6]
000040DA  89C3              mov bx,ax
000040DC  31C0              xor ax,ax
000040DE  89472E            mov [bx+0x2e],ax
000040E1  8B4610            mov ax,[bp+0x10]
000040E4  8946F2            mov [bp-0xe],ax
000040E7  89E3              mov bx,sp
000040E9  368B4F06          mov cx,[ss:bx+0x6]
000040ED  6650              push eax
000040EF  6631C0            xor eax,eax
000040F2  8ED8              mov ds,ax
000040F4  8C166904          mov [0x469],ss
000040F8  89266704          mov [0x467],sp
000040FC  260F015408        lgdt [es:si+0x8]
00004101  2E0F011E8CF8      lidt [cs:0xf88c]
00004107  0F20C0            mov eax,cr0
0000410A  0C01              or al,0x1
0000410C  0F22C0            mov cr0,eax
0000410F  EA14412000        jmp word 0x20:0x4114
00004114  B82800            mov ax,0x28
00004117  8ED0              mov ss,ax
00004119  B81000            mov ax,0x10
0000411C  8ED8              mov ds,ax
0000411E  B81800            mov ax,0x18
00004121  8EC0              mov es,ax
00004123  31F6              xor si,si
00004125  31FF              xor di,di
00004127  FC                cld
00004128  F3A5              rep movsw
0000412A  B82800            mov ax,0x28
0000412D  8ED8              mov ds,ax
0000412F  8EC0              mov es,ax
00004131  0F20C0            mov eax,cr0
00004134  24FE              and al,0xfe
00004136  0F22C0            mov cr0,eax
00004139  EA3E4100F0        jmp word 0xf000:0x413e
0000413E  2E0F011E92F8      lidt [cs:0xf892]
00004144  31C0              xor ax,ax
00004146  8ED8              mov ds,ax
00004148  8E166904          mov ss,[0x469]
0000414C  8B266704          mov sp,[0x467]
00004150  6658              pop eax
00004152  FF76FC            push word [bp-0x4]
00004155  E8D1D5            call word 0x1729
00004158  44                inc sp
00004159  44                inc sp
0000415A  FB                sti
0000415B  30C0              xor al,al
0000415D  884613            mov [bp+0x13],al
00004160  8B4618            mov ax,[bp+0x18]
00004163  24FE              and al,0xfe
00004165  894618            mov [bp+0x18],ax
00004168  E9D701            jmp word 0x4342
0000416B  B83000            mov ax,0x30
0000416E  50                push ax
0000416F  E8FCC3            call word 0x56e
00004172  44                inc sp
00004173  44                inc sp
00004174  884612            mov [bp+0x12],al
00004177  B83100            mov ax,0x31
0000417A  50                push ax
0000417B  E8F0C3            call word 0x56e
0000417E  44                inc sp
0000417F  44                inc sp
00004180  884613            mov [bp+0x13],al
00004183  8B4612            mov ax,[bp+0x12]
00004186  3DC0FF            cmp ax,0xffc0
00004189  7606              jna 0x4191
0000418B  B8C0FF            mov ax,0xffc0
0000418E  894612            mov [bp+0x12],ax
00004191  8B4618            mov ax,[bp+0x18]
00004194  24FE              and al,0xfe
00004196  894618            mov [bp+0x18],ax
00004199  E9A601            jmp word 0x4342
0000419C  FA                cli
0000419D  B80100            mov ax,0x1
000041A0  50                push ax
000041A1  E885D5            call word 0x1729
000041A4  44                inc sp
000041A5  44                inc sp
000041A6  FF7614            push word [bp+0x14]
000041A9  E8B1C4            call word 0x65d
000041AC  44                inc sp
000041AD  44                inc sp
000041AE  8B4606            mov ax,[bp+0x6]
000041B1  89C3              mov bx,ax
000041B3  B8FFFF            mov ax,0xffff
000041B6  894738            mov [bx+0x38],ax
000041B9  8B4606            mov ax,[bp+0x6]
000041BC  89C3              mov bx,ax
000041BE  31C0              xor ax,ax
000041C0  89473A            mov [bx+0x3a],ax
000041C3  8B4606            mov ax,[bp+0x6]
000041C6  89C3              mov bx,ax
000041C8  B00F              mov al,0xf
000041CA  88473C            mov [bx+0x3c],al
000041CD  8B4606            mov ax,[bp+0x6]
000041D0  89C3              mov bx,ax
000041D2  B09B              mov al,0x9b
000041D4  88473D            mov [bx+0x3d],al
000041D7  8B4606            mov ax,[bp+0x6]
000041DA  89C3              mov bx,ax
000041DC  31C0              xor ax,ax
000041DE  89473E            mov [bx+0x3e],ax
000041E1  8B460C            mov ax,[bp+0xc]
000041E4  8946F4            mov [bp-0xc],ax
000041E7  89E3              mov bx,sp
000041E9  368B5F08          mov bx,[ss:bx+0x8]
000041ED  B011              mov al,0x11
000041EF  E620              out 0x20,al
000041F1  E6A0              out 0xa0,al
000041F3  88F8              mov al,bh
000041F5  E621              out 0x21,al
000041F7  88D8              mov al,bl
000041F9  E6A1              out 0xa1,al
000041FB  B004              mov al,0x4
000041FD  E621              out 0x21,al
000041FF  B002              mov al,0x2
00004201  E6A1              out 0xa1,al
00004203  B001              mov al,0x1
00004205  E621              out 0x21,al
00004207  E6A1              out 0xa1,al
00004209  B0FF              mov al,0xff
0000420B  E621              out 0x21,al
0000420D  E6A1              out 0xa1,al
0000420F  260F015408        lgdt [es:si+0x8]
00004214  260F015C10        lidt [es:si+0x10]
00004219  0F20C0            mov eax,cr0
0000421C  0C01              or al,0x1
0000421E  0F22C0            mov cr0,eax
00004221  EA26423800        jmp word 0x38:0x4226
00004226  B82800            mov ax,0x28
00004229  8ED0              mov ss,ax
0000422B  B81800            mov ax,0x18
0000422E  8ED8              mov ds,ax
00004230  B82000            mov ax,0x20
00004233  8EC0              mov es,ax
00004235  89EC              mov sp,bp
00004237  83C404            add sp,byte +0x4
0000423A  61                popaw
0000423B  58                pop ax
0000423C  58                pop ax
0000423D  58                pop ax
0000423E  59                pop cx
0000423F  58                pop ax
00004240  58                pop ax
00004241  B83000            mov ax,0x30
00004244  50                push ax
00004245  51                push cx
00004246  CB                retf
00004247  E9F800            jmp word 0x4342
0000424A  BB46D5            mov bx,0xd546
0000424D  53                push bx
0000424E  B80400            mov ax,0x4
00004251  50                push ax
00004252  E8D5C6            call word 0x92a
00004255  83C404            add sp,byte +0x4
00004258  8B4618            mov ax,[bp+0x18]
0000425B  0C01              or al,0x1
0000425D  894618            mov [bp+0x18],ax
00004260  B086              mov al,0x86
00004262  884613            mov [bp+0x13],al
00004265  E9DA00            jmp word 0x4342
00004268  8B4618            mov ax,[bp+0x18]
0000426B  24FE              and al,0xfe
0000426D  894618            mov [bp+0x18],ax
00004270  30C0              xor al,al
00004272  884613            mov [bp+0x13],al
00004275  B8F5E6            mov ax,0xe6f5
00004278  89460C            mov [bp+0xc],ax
0000427B  B800F0            mov ax,0xf000
0000427E  894614            mov [bp+0x14],ax
00004281  E9BE00            jmp word 0x4342
00004284  8B46FE            mov ax,[bp-0x2]
00004287  894614            mov [bp+0x14],ax
0000428A  8B4618            mov ax,[bp+0x18]
0000428D  24FE              and al,0xfe
0000428F  894618            mov [bp+0x18],ax
00004292  E9AD00            jmp word 0x4342
00004295  BB2FD5            mov bx,0xd52f
00004298  53                push bx
00004299  B80800            mov ax,0x8
0000429C  50                push ax
0000429D  E88AC6            call word 0x92a
000042A0  83C404            add sp,byte +0x4
000042A3  8B4618            mov ax,[bp+0x18]
000042A6  0C01              or al,0x1
000042A8  894618            mov [bp+0x18],ax
000042AB  B086              mov al,0x86
000042AD  884613            mov [bp+0x13],al
000042B0  E98F00            jmp word 0x4342
000042B3  FF760C            push word [bp+0xc]
000042B6  FF7612            push word [bp+0x12]
000042B9  BBF5D4            mov bx,0xd4f5
000042BC  53                push bx
000042BD  B80400            mov ax,0x4
000042C0  50                push ax
000042C1  E866C6            call word 0x92a
000042C4  83C408            add sp,byte +0x8
000042C7  8B4618            mov ax,[bp+0x18]
000042CA  0C01              or al,0x1
000042CC  894618            mov [bp+0x18],ax
000042CF  B086              mov al,0x86
000042D1  884613            mov [bp+0x13],al
000042D4  EB6C              jmp short 0x4342
000042D6  EB6A              jmp short 0x4342
000042D8  2C24              sub al,0x24
000042DA  0F8465FB          jz word 0x3e43
000042DE  2C1D              sub al,0x1d
000042E0  0F84ECFB          jz word 0x3ed0
000042E4  2C0E              sub al,0xe
000042E6  0F84F6FB          jz word 0x3ee0
000042EA  2C03              sub al,0x3
000042EC  0F84FBFB          jz word 0x3eeb
000042F0  2C2E              sub al,0x2e
000042F2  72BF              jc 0x42b3
000042F4  3C11              cmp al,0x11
000042F6  772F              ja 0x4327
000042F8  30E4              xor ah,ah
000042FA  D1E0              shl ax,1
000042FC  89C3              mov bx,ax
000042FE  2EFFA70343        jmp word [cs:bx+0x4303]
00004303  FB                sti
00004304  3EFB              ds sti
00004306  3EFB              ds sti
00004308  3E0B3F            or di,[ds:bx]
0000430B  B342              mov bl,0x42
0000430D  B342              mov bl,0x42
0000430F  B342              mov bl,0x42
00004311  E33F              jcxz 0x4352
00004313  6B419C41          imul ax,[bx+di-0x64],byte +0x41
00004317  B342              mov bl,0x42
00004319  B342              mov bl,0x42
0000431B  B342              mov bl,0x42
0000431D  B342              mov bl,0x42
0000431F  B342              mov bl,0x42
00004321  B342              mov bl,0x42
00004323  FB                sti
00004324  3EFB              ds sti
00004326  3E2C3F            ds sub al,0x3f
00004329  0F841DFF          jz word 0x424a
0000432D  2C01              sub al,0x1
0000432F  0F8435FF          jz word 0x4268
00004333  2C01              sub al,0x1
00004335  0F844BFF          jz word 0x4284
00004339  2C17              sub al,0x17
0000433B  0F8456FF          jz word 0x4295
0000433F  E971FF            jmp word 0x42b3
00004342  89EC              mov sp,bp
00004344  5D                pop bp
00004345  C3                ret
00004346  55                push bp
00004347  89E5              mov bp,sp
00004349  4C                dec sp
0000434A  4C                dec sp
0000434B  B84000            mov ax,0x40
0000434E  50                push ax
0000434F  B80E00            mov ax,0xe
00004352  50                push ax
00004353  E897C2            call word 0x5ed
00004356  83C404            add sp,byte +0x4
00004359  8946FE            mov [bp-0x2],ax
0000435C  83C4F4            add sp,byte -0xc
0000435F  8A4613            mov al,[bp+0x13]
00004362  E96406            jmp word 0x49c9
00004365  8A4612            mov al,[bp+0x12]
00004368  E91206            jmp word 0x497d
0000436B  8A460D            mov al,[bp+0xd]
0000436E  E9E900            jmp word 0x445a
00004371  E83311            call word 0x54a7
00004374  B8F500            mov ax,0xf5
00004377  50                push ax
00004378  E87D12            call word 0x55f8
0000437B  44                inc sp
0000437C  44                inc sp
0000437D  8846F5            mov [bp-0xb],al
00004380  8A46F5            mov al,[bp-0xb]
00004383  84C0              test al,al
00004385  752B              jnz 0x43b2
00004387  8D5EF4            lea bx,[bp-0xc]
0000438A  53                push bx
0000438B  E8B412            call word 0x5642
0000438E  44                inc sp
0000438F  44                inc sp
00004390  8846F5            mov [bp-0xb],al
00004393  8A46F5            mov al,[bp-0xb]
00004396  84C0              test al,al
00004398  7407              jz 0x43a1
0000439A  8A46F4            mov al,[bp-0xc]
0000439D  3CFA              cmp al,0xfa
0000439F  7511              jnz 0x43b2
000043A1  8B4618            mov ax,[bp+0x18]
000043A4  24FE              and al,0xfe
000043A6  894618            mov [bp+0x18],ax
000043A9  30C0              xor al,al
000043AB  884613            mov [bp+0x13],al
000043AE  89EC              mov sp,bp
000043B0  5D                pop bp
000043B1  C3                ret
000043B2  8B4618            mov ax,[bp+0x18]
000043B5  0C01              or al,0x1
000043B7  894618            mov [bp+0x18],ax
000043BA  8A46F5            mov al,[bp-0xb]
000043BD  884613            mov [bp+0x13],al
000043C0  89EC              mov sp,bp
000043C2  5D                pop bp
000043C3  C3                ret
000043C4  E9A100            jmp word 0x4468
000043C7  FF76FE            push word [bp-0x2]
000043CA  B82700            mov ax,0x27
000043CD  50                push ax
000043CE  E80EC2            call word 0x5df
000043D1  83C404            add sp,byte +0x4
000043D4  8846FC            mov [bp-0x4],al
000043D7  8A46FC            mov al,[bp-0x4]
000043DA  2480              and al,0x80
000043DC  84C0              test al,al
000043DE  7511              jnz 0x43f1
000043E0  8B4618            mov ax,[bp+0x18]
000043E3  0C01              or al,0x1
000043E5  894618            mov [bp+0x18],ax
000043E8  B005              mov al,0x5
000043EA  884613            mov [bp+0x13],al
000043ED  89EC              mov sp,bp
000043EF  5D                pop bp
000043F0  C3                ret
000043F1  E8B310            call word 0x54a7
000043F4  B8F400            mov ax,0xf4
000043F7  50                push ax
000043F8  E8FD11            call word 0x55f8
000043FB  44                inc sp
000043FC  44                inc sp
000043FD  8846F5            mov [bp-0xb],al
00004400  8A46F5            mov al,[bp-0xb]
00004403  84C0              test al,al
00004405  752E              jnz 0x4435
00004407  8D5EF4            lea bx,[bp-0xc]
0000440A  53                push bx
0000440B  E83412            call word 0x5642
0000440E  44                inc sp
0000440F  44                inc sp
00004410  8846F5            mov [bp-0xb],al
00004413  8A46F5            mov al,[bp-0xb]
00004416  84C0              test al,al
00004418  751B              jnz 0x4435
0000441A  8A46F4            mov al,[bp-0xc]
0000441D  3CFA              cmp al,0xfa
0000441F  7514              jnz 0x4435
00004421  E83011            call word 0x5554
00004424  8B4618            mov ax,[bp+0x18]
00004427  24FE              and al,0xfe
00004429  894618            mov [bp+0x18],ax
0000442C  30C0              xor al,al
0000442E  884613            mov [bp+0x13],al
00004431  89EC              mov sp,bp
00004433  5D                pop bp
00004434  C3                ret
00004435  8B4618            mov ax,[bp+0x18]
00004438  0C01              or al,0x1
0000443A  894618            mov [bp+0x18],ax
0000443D  8A46F5            mov al,[bp-0xb]
00004440  884613            mov [bp+0x13],al
00004443  89EC              mov sp,bp
00004445  5D                pop bp
00004446  C3                ret
00004447  8B4618            mov ax,[bp+0x18]
0000444A  0C01              or al,0x1
0000444C  894618            mov [bp+0x18],ax
0000444F  B001              mov al,0x1
00004451  884613            mov [bp+0x13],al
00004454  89EC              mov sp,bp
00004456  5D                pop bp
00004457  C3                ret
00004458  EB0E              jmp short 0x4468
0000445A  2C00              sub al,0x0
0000445C  0F8411FF          jz word 0x4371
00004460  2C01              sub al,0x1
00004462  0F8461FF          jz word 0x43c7
00004466  EBDF              jmp short 0x4447
00004468  E93705            jmp word 0x49a2
0000446B  8A4612            mov al,[bp+0x12]
0000446E  3C05              cmp al,0x5
00004470  0F857000          jnz word 0x44e4
00004474  8A460D            mov al,[bp+0xd]
00004477  3C03              cmp al,0x3
00004479  7418              jz 0x4493
0000447B  8A460D            mov al,[bp+0xd]
0000447E  3C04              cmp al,0x4
00004480  7411              jz 0x4493
00004482  8B4618            mov ax,[bp+0x18]
00004485  0C01              or al,0x1
00004487  894618            mov [bp+0x18],ax
0000448A  B002              mov al,0x2
0000448C  884613            mov [bp+0x13],al
0000448F  89EC              mov sp,bp
00004491  5D                pop bp
00004492  C3                ret
00004493  FF76FE            push word [bp-0x2]
00004496  B82700            mov ax,0x27
00004499  50                push ax
0000449A  E842C1            call word 0x5df
0000449D  83C404            add sp,byte +0x4
000044A0  8846FC            mov [bp-0x4],al
000044A3  8A460D            mov al,[bp+0xd]
000044A6  30E4              xor ah,ah
000044A8  48                dec ax
000044A9  50                push ax
000044AA  8A46FC            mov al,[bp-0x4]
000044AD  24F8              and al,0xf8
000044AF  30E4              xor ah,ah
000044B1  0B46F0            or ax,[bp-0x10]
000044B4  44                inc sp
000044B5  44                inc sp
000044B6  8846FC            mov [bp-0x4],al
000044B9  30C0              xor al,al
000044BB  8846FD            mov [bp-0x3],al
000044BE  FF76FE            push word [bp-0x2]
000044C1  B82600            mov ax,0x26
000044C4  50                push ax
000044C5  8A46FD            mov al,[bp-0x3]
000044C8  30E4              xor ah,ah
000044CA  50                push ax
000044CB  E82DC1            call word 0x5fb
000044CE  83C406            add sp,byte +0x6
000044D1  FF76FE            push word [bp-0x2]
000044D4  B82700            mov ax,0x27
000044D7  50                push ax
000044D8  8A46FC            mov al,[bp-0x4]
000044DB  30E4              xor ah,ah
000044DD  50                push ax
000044DE  E81AC1            call word 0x5fb
000044E1  83C406            add sp,byte +0x6
000044E4  E8C00F            call word 0x54a7
000044E7  B8FF00            mov ax,0xff
000044EA  50                push ax
000044EB  E80A11            call word 0x55f8
000044EE  44                inc sp
000044EF  44                inc sp
000044F0  8846F5            mov [bp-0xb],al
000044F3  8A46F5            mov al,[bp-0xb]
000044F6  84C0              test al,al
000044F8  0F858700          jnz word 0x4583
000044FC  8D5EF2            lea bx,[bp-0xe]
000044FF  53                push bx
00004500  E83F11            call word 0x5642
00004503  44                inc sp
00004504  44                inc sp
00004505  8846F5            mov [bp-0xb],al
00004508  8A46F2            mov al,[bp-0xe]
0000450B  3CFE              cmp al,0xfe
0000450D  750C              jnz 0x451b
0000450F  8B4618            mov ax,[bp+0x18]
00004512  0C01              or al,0x1
00004514  894618            mov [bp+0x18],ax
00004517  89EC              mov sp,bp
00004519  5D                pop bp
0000451A  C3                ret
0000451B  8A46F2            mov al,[bp-0xe]
0000451E  3CFA              cmp al,0xfa
00004520  7414              jz 0x4536
00004522  8A46F2            mov al,[bp-0xe]
00004525  30E4              xor ah,ah
00004527  50                push ax
00004528  BBCAD4            mov bx,0xd4ca
0000452B  53                push bx
0000452C  B80700            mov ax,0x7
0000452F  50                push ax
00004530  E8F7C3            call word 0x92a
00004533  83C406            add sp,byte +0x6
00004536  8A46F5            mov al,[bp-0xb]
00004539  84C0              test al,al
0000453B  7546              jnz 0x4583
0000453D  8D5EF4            lea bx,[bp-0xc]
00004540  53                push bx
00004541  E8FE10            call word 0x5642
00004544  44                inc sp
00004545  44                inc sp
00004546  8846F5            mov [bp-0xb],al
00004549  8A46F5            mov al,[bp-0xb]
0000454C  84C0              test al,al
0000454E  7533              jnz 0x4583
00004550  8D5EF3            lea bx,[bp-0xd]
00004553  53                push bx
00004554  E8EB10            call word 0x5642
00004557  44                inc sp
00004558  44                inc sp
00004559  8846F5            mov [bp-0xb],al
0000455C  8A46F5            mov al,[bp-0xb]
0000455F  84C0              test al,al
00004561  7520              jnz 0x4583
00004563  E8EE0F            call word 0x5554
00004566  8B4618            mov ax,[bp+0x18]
00004569  24FE              and al,0xfe
0000456B  894618            mov [bp+0x18],ax
0000456E  30C0              xor al,al
00004570  884613            mov [bp+0x13],al
00004573  8A46F4            mov al,[bp-0xc]
00004576  88460C            mov [bp+0xc],al
00004579  8A46F3            mov al,[bp-0xd]
0000457C  88460D            mov [bp+0xd],al
0000457F  89EC              mov sp,bp
00004581  5D                pop bp
00004582  C3                ret
00004583  8B4618            mov ax,[bp+0x18]
00004586  0C01              or al,0x1
00004588  894618            mov [bp+0x18],ax
0000458B  8A46F5            mov al,[bp-0xb]
0000458E  884613            mov [bp+0x13],al
00004591  89EC              mov sp,bp
00004593  5D                pop bp
00004594  C3                ret
00004595  8A460D            mov al,[bp+0xd]
00004598  EB38              jmp short 0x45d2
0000459A  B00A              mov al,0xa
0000459C  8846F4            mov [bp-0xc],al
0000459F  EB54              jmp short 0x45f5
000045A1  B014              mov al,0x14
000045A3  8846F4            mov [bp-0xc],al
000045A6  EB4D              jmp short 0x45f5
000045A8  B028              mov al,0x28
000045AA  8846F4            mov [bp-0xc],al
000045AD  EB46              jmp short 0x45f5
000045AF  B03C              mov al,0x3c
000045B1  8846F4            mov [bp-0xc],al
000045B4  EB3F              jmp short 0x45f5
000045B6  B050              mov al,0x50
000045B8  8846F4            mov [bp-0xc],al
000045BB  EB38              jmp short 0x45f5
000045BD  B064              mov al,0x64
000045BF  8846F4            mov [bp-0xc],al
000045C2  EB31              jmp short 0x45f5
000045C4  B0C8              mov al,0xc8
000045C6  8846F4            mov [bp-0xc],al
000045C9  EB2A              jmp short 0x45f5
000045CB  30C0              xor al,al
000045CD  8846F4            mov [bp-0xc],al
000045D0  EB23              jmp short 0x45f5
000045D2  2C00              sub al,0x0
000045D4  72F5              jc 0x45cb
000045D6  3C06              cmp al,0x6
000045D8  7719              ja 0x45f3
000045DA  30E4              xor ah,ah
000045DC  D1E0              shl ax,1
000045DE  89C3              mov bx,ax
000045E0  2EFFA7E545        jmp word [cs:bx+0x45e5]
000045E5  9A45A145A8        call word 0xa845:0xa145
000045EA  45                inc bp
000045EB  AF                scasw
000045EC  45                inc bp
000045ED  B645              mov dh,0x45
000045EF  BD45C4            mov bp,0xc445
000045F2  45                inc bp
000045F3  EBD6              jmp short 0x45cb
000045F5  8A46F4            mov al,[bp-0xc]
000045F8  84C0              test al,al
000045FA  7457              jz 0x4653
000045FC  B8F300            mov ax,0xf3
000045FF  50                push ax
00004600  E8F50F            call word 0x55f8
00004603  44                inc sp
00004604  44                inc sp
00004605  8846F5            mov [bp-0xb],al
00004608  8A46F5            mov al,[bp-0xb]
0000460B  84C0              test al,al
0000460D  7535              jnz 0x4644
0000460F  8D5EF3            lea bx,[bp-0xd]
00004612  53                push bx
00004613  E82C10            call word 0x5642
00004616  44                inc sp
00004617  44                inc sp
00004618  8846F5            mov [bp-0xb],al
0000461B  8A46F4            mov al,[bp-0xc]
0000461E  30E4              xor ah,ah
00004620  50                push ax
00004621  E8D40F            call word 0x55f8
00004624  44                inc sp
00004625  44                inc sp
00004626  8846F5            mov [bp-0xb],al
00004629  8D5EF3            lea bx,[bp-0xd]
0000462C  53                push bx
0000462D  E81210            call word 0x5642
00004630  44                inc sp
00004631  44                inc sp
00004632  8846F5            mov [bp-0xb],al
00004635  8B4618            mov ax,[bp+0x18]
00004638  24FE              and al,0xfe
0000463A  894618            mov [bp+0x18],ax
0000463D  30C0              xor al,al
0000463F  884613            mov [bp+0x13],al
00004642  EB0D              jmp short 0x4651
00004644  8B4618            mov ax,[bp+0x18]
00004647  0C01              or al,0x1
00004649  894618            mov [bp+0x18],ax
0000464C  B086              mov al,0x86
0000464E  884613            mov [bp+0x13],al
00004651  EB0D              jmp short 0x4660
00004653  8B4618            mov ax,[bp+0x18]
00004656  0C01              or al,0x1
00004658  894618            mov [bp+0x18],ax
0000465B  B086              mov al,0x86
0000465D  884613            mov [bp+0x13],al
00004660  E93F03            jmp word 0x49a2
00004663  E8410E            call word 0x54a7
00004666  8846F7            mov [bp-0x9],al
00004669  8A460D            mov al,[bp+0xd]
0000466C  3C04              cmp al,0x4
0000466E  0F838D00          jnc word 0x46ff
00004672  B8E800            mov ax,0xe8
00004675  50                push ax
00004676  E87F0F            call word 0x55f8
00004679  44                inc sp
0000467A  44                inc sp
0000467B  8846F5            mov [bp-0xb],al
0000467E  8A46F5            mov al,[bp-0xb]
00004681  84C0              test al,al
00004683  756B              jnz 0x46f0
00004685  8D5EF4            lea bx,[bp-0xc]
00004688  53                push bx
00004689  E8B60F            call word 0x5642
0000468C  44                inc sp
0000468D  44                inc sp
0000468E  8846F5            mov [bp-0xb],al
00004691  8A46F4            mov al,[bp-0xc]
00004694  3CFA              cmp al,0xfa
00004696  7414              jz 0x46ac
00004698  8A46F4            mov al,[bp-0xc]
0000469B  30E4              xor ah,ah
0000469D  50                push ax
0000469E  BB9ED4            mov bx,0xd49e
000046A1  53                push bx
000046A2  B80700            mov ax,0x7
000046A5  50                push ax
000046A6  E881C2            call word 0x92a
000046A9  83C406            add sp,byte +0x6
000046AC  8A460D            mov al,[bp+0xd]
000046AF  30E4              xor ah,ah
000046B1  50                push ax
000046B2  E8430F            call word 0x55f8
000046B5  44                inc sp
000046B6  44                inc sp
000046B7  8846F5            mov [bp-0xb],al
000046BA  8D5EF4            lea bx,[bp-0xc]
000046BD  53                push bx
000046BE  E8810F            call word 0x5642
000046C1  44                inc sp
000046C2  44                inc sp
000046C3  8846F5            mov [bp-0xb],al
000046C6  8A46F4            mov al,[bp-0xc]
000046C9  3CFA              cmp al,0xfa
000046CB  7414              jz 0x46e1
000046CD  8A46F4            mov al,[bp-0xc]
000046D0  30E4              xor ah,ah
000046D2  50                push ax
000046D3  BB72D4            mov bx,0xd472
000046D6  53                push bx
000046D7  B80700            mov ax,0x7
000046DA  50                push ax
000046DB  E84CC2            call word 0x92a
000046DE  83C406            add sp,byte +0x6
000046E1  8B4618            mov ax,[bp+0x18]
000046E4  24FE              and al,0xfe
000046E6  894618            mov [bp+0x18],ax
000046E9  30C0              xor al,al
000046EB  884613            mov [bp+0x13],al
000046EE  EB0D              jmp short 0x46fd
000046F0  8B4618            mov ax,[bp+0x18]
000046F3  0C01              or al,0x1
000046F5  894618            mov [bp+0x18],ax
000046F8  B086              mov al,0x86
000046FA  884613            mov [bp+0x13],al
000046FD  EB0D              jmp short 0x470c
000046FF  8B4618            mov ax,[bp+0x18]
00004702  0C01              or al,0x1
00004704  894618            mov [bp+0x18],ax
00004707  B086              mov al,0x86
00004709  884613            mov [bp+0x13],al
0000470C  8A46F7            mov al,[bp-0x9]
0000470F  30E4              xor ah,ah
00004711  50                push ax
00004712  E8640F            call word 0x5679
00004715  44                inc sp
00004716  44                inc sp
00004717  E98802            jmp word 0x49a2
0000471A  E88A0D            call word 0x54a7
0000471D  B8F200            mov ax,0xf2
00004720  50                push ax
00004721  E8D40E            call word 0x55f8
00004724  44                inc sp
00004725  44                inc sp
00004726  8846F5            mov [bp-0xb],al
00004729  8A46F5            mov al,[bp-0xb]
0000472C  84C0              test al,al
0000472E  752D              jnz 0x475d
00004730  8D5EF4            lea bx,[bp-0xc]
00004733  53                push bx
00004734  E80B0F            call word 0x5642
00004737  44                inc sp
00004738  44                inc sp
00004739  8846F5            mov [bp-0xb],al
0000473C  8D5EF3            lea bx,[bp-0xd]
0000473F  53                push bx
00004740  E8FF0E            call word 0x5642
00004743  44                inc sp
00004744  44                inc sp
00004745  8846F5            mov [bp-0xb],al
00004748  8B4618            mov ax,[bp+0x18]
0000474B  24FE              and al,0xfe
0000474D  894618            mov [bp+0x18],ax
00004750  30C0              xor al,al
00004752  884613            mov [bp+0x13],al
00004755  8A46F3            mov al,[bp-0xd]
00004758  88460D            mov [bp+0xd],al
0000475B  EB0D              jmp short 0x476a
0000475D  8B4618            mov ax,[bp+0x18]
00004760  0C01              or al,0x1
00004762  894618            mov [bp+0x18],ax
00004765  B086              mov al,0x86
00004767  884613            mov [bp+0x13],al
0000476A  E93502            jmp word 0x49a2
0000476D  8A460D            mov al,[bp+0xd]
00004770  E95A01            jmp word 0x48cd
00004773  E8310D            call word 0x54a7
00004776  8846F7            mov [bp-0x9],al
00004779  B8E900            mov ax,0xe9
0000477C  50                push ax
0000477D  E8780E            call word 0x55f8
00004780  44                inc sp
00004781  44                inc sp
00004782  8846F5            mov [bp-0xb],al
00004785  8A46F5            mov al,[bp-0xb]
00004788  84C0              test al,al
0000478A  0F859500          jnz word 0x4823
0000478E  8D5EF4            lea bx,[bp-0xc]
00004791  53                push bx
00004792  E8AD0E            call word 0x5642
00004795  44                inc sp
00004796  44                inc sp
00004797  8846F5            mov [bp-0xb],al
0000479A  8A46F4            mov al,[bp-0xc]
0000479D  3CFA              cmp al,0xfa
0000479F  7414              jz 0x47b5
000047A1  8A46F4            mov al,[bp-0xc]
000047A4  30E4              xor ah,ah
000047A6  50                push ax
000047A7  BB46D4            mov bx,0xd446
000047AA  53                push bx
000047AB  B80700            mov ax,0x7
000047AE  50                push ax
000047AF  E878C1            call word 0x92a
000047B2  83C406            add sp,byte +0x6
000047B5  8A46F5            mov al,[bp-0xb]
000047B8  84C0              test al,al
000047BA  7567              jnz 0x4823
000047BC  8D5EF4            lea bx,[bp-0xc]
000047BF  53                push bx
000047C0  E87F0E            call word 0x5642
000047C3  44                inc sp
000047C4  44                inc sp
000047C5  8846F5            mov [bp-0xb],al
000047C8  8A46F5            mov al,[bp-0xb]
000047CB  84C0              test al,al
000047CD  7554              jnz 0x4823
000047CF  8D5EF3            lea bx,[bp-0xd]
000047D2  53                push bx
000047D3  E86C0E            call word 0x5642
000047D6  44                inc sp
000047D7  44                inc sp
000047D8  8846F5            mov [bp-0xb],al
000047DB  8A46F5            mov al,[bp-0xb]
000047DE  84C0              test al,al
000047E0  7541              jnz 0x4823
000047E2  8D5EF2            lea bx,[bp-0xe]
000047E5  53                push bx
000047E6  E8590E            call word 0x5642
000047E9  44                inc sp
000047EA  44                inc sp
000047EB  8846F5            mov [bp-0xb],al
000047EE  8A46F5            mov al,[bp-0xb]
000047F1  84C0              test al,al
000047F3  752E              jnz 0x4823
000047F5  8B4618            mov ax,[bp+0x18]
000047F8  24FE              and al,0xfe
000047FA  894618            mov [bp+0x18],ax
000047FD  30C0              xor al,al
000047FF  884613            mov [bp+0x13],al
00004802  8A46F4            mov al,[bp-0xc]
00004805  88460C            mov [bp+0xc],al
00004808  8A46F3            mov al,[bp-0xd]
0000480B  884610            mov [bp+0x10],al
0000480E  8A46F2            mov al,[bp-0xe]
00004811  88460E            mov [bp+0xe],al
00004814  8A46F7            mov al,[bp-0x9]
00004817  30E4              xor ah,ah
00004819  50                push ax
0000481A  E85C0E            call word 0x5679
0000481D  44                inc sp
0000481E  44                inc sp
0000481F  89EC              mov sp,bp
00004821  5D                pop bp
00004822  C3                ret
00004823  8B4618            mov ax,[bp+0x18]
00004826  0C01              or al,0x1
00004828  894618            mov [bp+0x18],ax
0000482B  8A46F5            mov al,[bp-0xb]
0000482E  884613            mov [bp+0x13],al
00004831  8A46F7            mov al,[bp-0x9]
00004834  30E4              xor ah,ah
00004836  50                push ax
00004837  E83F0E            call word 0x5679
0000483A  44                inc sp
0000483B  44                inc sp
0000483C  89EC              mov sp,bp
0000483E  5D                pop bp
0000483F  C3                ret
00004840  E8640C            call word 0x54a7
00004843  8846F7            mov [bp-0x9],al
00004846  8A460D            mov al,[bp+0xd]
00004849  3C01              cmp al,0x1
0000484B  750E              jnz 0x485b
0000484D  B8E600            mov ax,0xe6
00004850  50                push ax
00004851  E8A40D            call word 0x55f8
00004854  44                inc sp
00004855  44                inc sp
00004856  8846F5            mov [bp-0xb],al
00004859  EB0C              jmp short 0x4867
0000485B  B8E700            mov ax,0xe7
0000485E  50                push ax
0000485F  E8960D            call word 0x55f8
00004862  44                inc sp
00004863  44                inc sp
00004864  8846F5            mov [bp-0xb],al
00004867  8A46F5            mov al,[bp-0xb]
0000486A  84C0              test al,al
0000486C  7519              jnz 0x4887
0000486E  8D5EF4            lea bx,[bp-0xc]
00004871  53                push bx
00004872  E8CD0D            call word 0x5642
00004875  44                inc sp
00004876  44                inc sp
00004877  8A46F4            mov al,[bp-0xc]
0000487A  3CFA              cmp al,0xfa
0000487C  7404              jz 0x4882
0000487E  B001              mov al,0x1
00004880  EB02              jmp short 0x4884
00004882  30C0              xor al,al
00004884  8846F5            mov [bp-0xb],al
00004887  8A46F5            mov al,[bp-0xb]
0000488A  84C0              test al,al
0000488C  750F              jnz 0x489d
0000488E  8B4618            mov ax,[bp+0x18]
00004891  24FE              and al,0xfe
00004893  894618            mov [bp+0x18],ax
00004896  30C0              xor al,al
00004898  884613            mov [bp+0x13],al
0000489B  EB0D              jmp short 0x48aa
0000489D  8B4618            mov ax,[bp+0x18]
000048A0  0C01              or al,0x1
000048A2  894618            mov [bp+0x18],ax
000048A5  B086              mov al,0x86
000048A7  884613            mov [bp+0x13],al
000048AA  8A46F7            mov al,[bp-0x9]
000048AD  30E4              xor ah,ah
000048AF  50                push ax
000048B0  E8C60D            call word 0x5679
000048B3  44                inc sp
000048B4  44                inc sp
000048B5  EB2A              jmp short 0x48e1
000048B7  8A460D            mov al,[bp+0xd]
000048BA  30E4              xor ah,ah
000048BC  50                push ax
000048BD  BB2CD4            mov bx,0xd42c
000048C0  53                push bx
000048C1  B80700            mov ax,0x7
000048C4  50                push ax
000048C5  E862C0            call word 0x92a
000048C8  83C406            add sp,byte +0x6
000048CB  EB14              jmp short 0x48e1
000048CD  2C00              sub al,0x0
000048CF  0F84A0FE          jz word 0x4773
000048D3  2C01              sub al,0x1
000048D5  0F8467FF          jz word 0x4840
000048D9  2C01              sub al,0x1
000048DB  0F8461FF          jz word 0x4840
000048DF  EBD6              jmp short 0x48b7
000048E1  E9BE00            jmp word 0x49a2
000048E4  8B4614            mov ax,[bp+0x14]
000048E7  8946FA            mov [bp-0x6],ax
000048EA  8B460C            mov ax,[bp+0xc]
000048ED  8946F8            mov [bp-0x8],ax
000048F0  FF76FE            push word [bp-0x2]
000048F3  B82200            mov ax,0x22
000048F6  50                push ax
000048F7  FF76F8            push word [bp-0x8]
000048FA  E811BD            call word 0x60e
000048FD  83C406            add sp,byte +0x6
00004900  FF76FE            push word [bp-0x2]
00004903  B82400            mov ax,0x24
00004906  50                push ax
00004907  FF76FA            push word [bp-0x6]
0000490A  E801BD            call word 0x60e
0000490D  83C406            add sp,byte +0x6
00004910  FF76FE            push word [bp-0x2]
00004913  B82700            mov ax,0x27
00004916  50                push ax
00004917  E8C5BC            call word 0x5df
0000491A  83C404            add sp,byte +0x4
0000491D  8846FC            mov [bp-0x4],al
00004920  8B46F8            mov ax,[bp-0x8]
00004923  85C0              test ax,ax
00004925  751D              jnz 0x4944
00004927  8B46FA            mov ax,[bp-0x6]
0000492A  85C0              test ax,ax
0000492C  7516              jnz 0x4944
0000492E  8A46FC            mov al,[bp-0x4]
00004931  2480              and al,0x80
00004933  84C0              test al,al
00004935  740B              jz 0x4942
00004937  8A46FC            mov al,[bp-0x4]
0000493A  247F              and al,0x7f
0000493C  8846FC            mov [bp-0x4],al
0000493F  E8650B            call word 0x54a7
00004942  EB08              jmp short 0x494c
00004944  8A46FC            mov al,[bp-0x4]
00004947  0C80              or al,0x80
00004949  8846FC            mov [bp-0x4],al
0000494C  FF76FE            push word [bp-0x2]
0000494F  B82700            mov ax,0x27
00004952  50                push ax
00004953  8A46FC            mov al,[bp-0x4]
00004956  30E4              xor ah,ah
00004958  50                push ax
00004959  E89FBC            call word 0x5fb
0000495C  83C406            add sp,byte +0x6
0000495F  8B4618            mov ax,[bp+0x18]
00004962  24FE              and al,0xfe
00004964  894618            mov [bp+0x18],ax
00004967  30C0              xor al,al
00004969  884613            mov [bp+0x13],al
0000496C  EB34              jmp short 0x49a2
0000496E  B001              mov al,0x1
00004970  884613            mov [bp+0x13],al
00004973  8B4618            mov ax,[bp+0x18]
00004976  0C01              or al,0x1
00004978  894618            mov [bp+0x18],ax
0000497B  EB25              jmp short 0x49a2
0000497D  2C00              sub al,0x0
0000497F  72ED              jc 0x496e
00004981  3C07              cmp al,0x7
00004983  771B              ja 0x49a0
00004985  30E4              xor ah,ah
00004987  D1E0              shl ax,1
00004989  89C3              mov bx,ax
0000498B  2EFFA79049        jmp word [cs:bx+0x4990]
00004990  6B436B44          imul ax,[bp+di+0x6b],byte +0x44
00004994  95                xchg ax,bp
00004995  45                inc bp
00004996  63461A            arpl [bp+0x1a],ax
00004999  47                inc di
0000499A  6B446D47          imul ax,[si+0x6d],byte +0x47
0000499E  E448              in al,0x48
000049A0  EBCC              jmp short 0x496e
000049A2  EB2D              jmp short 0x49d1
000049A4  FF760C            push word [bp+0xc]
000049A7  FF7612            push word [bp+0x12]
000049AA  BBF2D3            mov bx,0xd3f2
000049AD  53                push bx
000049AE  B80400            mov ax,0x4
000049B1  50                push ax
000049B2  E875BF            call word 0x92a
000049B5  83C408            add sp,byte +0x8
000049B8  8B4618            mov ax,[bp+0x18]
000049BB  0C01              or al,0x1
000049BD  894618            mov [bp+0x18],ax
000049C0  B086              mov al,0x86
000049C2  884613            mov [bp+0x13],al
000049C5  EB0A              jmp short 0x49d1
000049C7  EB08              jmp short 0x49d1
000049C9  2CC2              sub al,0xc2
000049CB  0F8496F9          jz word 0x4365
000049CF  EBD3              jmp short 0x49a4
000049D1  89EC              mov sp,bp
000049D3  5D                pop bp
000049D4  C3                ret
000049D5  55                push bp
000049D6  89E5              mov bp,sp
000049D8  4C                dec sp
000049D9  4C                dec sp
000049DA  FF7604            push word [bp+0x4]
000049DD  E87DBC            call word 0x65d
000049E0  44                inc sp
000049E1  44                inc sp
000049E2  8946FE            mov [bp-0x2],ax
000049E5  8B5E06            mov bx,[bp+0x6]
000049E8  8B4608            mov ax,[bp+0x8]
000049EB  8B760A            mov si,[bp+0xa]
000049EE  8907              mov [bx],ax
000049F0  897702            mov [bx+0x2],si
000049F3  8B4606            mov ax,[bp+0x6]
000049F6  89C3              mov bx,ax
000049F8  8A4610            mov al,[bp+0x10]
000049FB  30E4              xor ah,ah
000049FD  894704            mov [bx+0x4],ax
00004A00  8B4606            mov ax,[bp+0x6]
00004A03  89C3              mov bx,ax
00004A05  31C0              xor ax,ax
00004A07  894706            mov [bx+0x6],ax
00004A0A  8B460C            mov ax,[bp+0xc]
00004A0D  8B5E0E            mov bx,[bp+0xe]
00004A10  8D7E08            lea di,[bp+0x8]
00004A13  E89CB6            call word 0xb2
00004A16  89460C            mov [bp+0xc],ax
00004A19  895E0E            mov [bp+0xe],bx
00004A1C  8A4612            mov al,[bp+0x12]
00004A1F  30E4              xor ah,ah
00004A21  2A4610            sub al,[bp+0x10]
00004A24  80DC00            sbb ah,0x0
00004A27  884612            mov [bp+0x12],al
00004A2A  8B4606            mov ax,[bp+0x6]
00004A2D  89C3              mov bx,ax
00004A2F  8B460C            mov ax,[bp+0xc]
00004A32  8B760E            mov si,[bp+0xe]
00004A35  894708            mov [bx+0x8],ax
00004A38  89770A            mov [bx+0xa],si
00004A3B  8B4606            mov ax,[bp+0x6]
00004A3E  89C3              mov bx,ax
00004A40  8A4612            mov al,[bp+0x12]
00004A43  30E4              xor ah,ah
00004A45  89470C            mov [bx+0xc],ax
00004A48  8B4606            mov ax,[bp+0x6]
00004A4B  89C3              mov bx,ax
00004A4D  31C0              xor ax,ax
00004A4F  89470E            mov [bx+0xe],ax
00004A52  8B4606            mov ax,[bp+0x6]
00004A55  89C3              mov bx,ax
00004A57  8B4614            mov ax,[bp+0x14]
00004A5A  894710            mov [bx+0x10],ax
00004A5D  8B4606            mov ax,[bp+0x6]
00004A60  89C3              mov bx,ax
00004A62  31C0              xor ax,ax
00004A64  894712            mov [bx+0x12],ax
00004A67  FF76FE            push word [bp-0x2]
00004A6A  E8F0BB            call word 0x65d
00004A6D  44                inc sp
00004A6E  44                inc sp
00004A6F  89EC              mov sp,bp
00004A71  5D                pop bp
00004A72  C3                ret
00004A73  55                push bp
00004A74  89E5              mov bp,sp
00004A76  83C4FC            add sp,byte -0x4
00004A79  31C0              xor ax,ax
00004A7B  31DB              xor bx,bx
00004A7D  8946FC            mov [bp-0x4],ax
00004A80  895EFE            mov [bp-0x2],bx
00004A83  83C4FC            add sp,byte -0x4
00004A86  31C0              xor ax,ax
00004A88  31DB              xor bx,bx
00004A8A  8946F8            mov [bp-0x8],ax
00004A8D  895EFA            mov [bp-0x6],bx
00004A90  83C4FB            add sp,byte -0x5
00004A93  30C0              xor al,al
00004A95  8846F3            mov [bp-0xd],al
00004A98  4C                dec sp
00004A99  8A4621            mov al,[bp+0x21]
00004A9C  E95705            jmp word 0x4ff6
00004A9F  8B461C            mov ax,[bp+0x1c]
00004AA2  8946F6            mov [bp-0xa],ax
00004AA5  8B4618            mov ax,[bp+0x18]
00004AA8  8946F4            mov [bp-0xc],ax
00004AAB  FB                sti
00004AAC  89E3              mov bx,sp
00004AAE  368B4704          mov ax,[ss:bx+0x4]
00004AB2  66C1E010          shl eax,byte 0x10
00004AB6  368B4702          mov ax,[ss:bx+0x2]
00004ABA  66BB0F000000      mov ebx,0xf
00004AC0  6631D2            xor edx,edx
00004AC3  66F7F3            div ebx
00004AC6  6689C1            mov ecx,eax
00004AC9  E461              in al,0x61
00004ACB  2410              and al,0x10
00004ACD  88C4              mov ah,al
00004ACF  6609C9            or ecx,ecx
00004AD2  740E              jz 0x4ae2
00004AD4  E461              in al,0x61
00004AD6  2410              and al,0x10
00004AD8  38E0              cmp al,ah
00004ADA  74F8              jz 0x4ad4
00004ADC  88C4              mov ah,al
00004ADE  6649              dec ecx
00004AE0  75F2              jnz 0x4ad4
00004AE2  E91F05            jmp word 0x5004
00004AE5  8A4620            mov al,[bp+0x20]
00004AE8  E9D804            jmp word 0x4fc3
00004AEB  B85041            mov ax,0x4150
00004AEE  BB4D53            mov bx,0x534d
00004AF1  53                push bx
00004AF2  50                push ax
00004AF3  8B4618            mov ax,[bp+0x18]
00004AF6  8B5E1A            mov bx,[bp+0x1a]
00004AF9  8D7EEE            lea di,[bp-0x12]
00004AFC  E89DB5            call word 0x9c
00004AFF  8D66F2            lea sp,[bp-0xe]
00004B02  0F855904          jnz word 0x4f5f
00004B06  B83500            mov ax,0x35
00004B09  50                push ax
00004B0A  E861BA            call word 0x56e
00004B0D  44                inc sp
00004B0E  44                inc sp
00004B0F  30E4              xor ah,ah
00004B11  31DB              xor bx,bx
00004B13  8946FC            mov [bp-0x4],ax
00004B16  895EFE            mov [bp-0x2],bx
00004B19  8B46FC            mov ax,[bp-0x4]
00004B1C  8B5EFE            mov bx,[bp-0x2]
00004B1F  88DF              mov bh,bl
00004B21  88E3              mov bl,ah
00004B23  88C4              mov ah,al
00004B25  30C0              xor al,al
00004B27  8946FC            mov [bp-0x4],ax
00004B2A  895EFE            mov [bp-0x2],bx
00004B2D  B83400            mov ax,0x34
00004B30  50                push ax
00004B31  E83ABA            call word 0x56e
00004B34  44                inc sp
00004B35  44                inc sp
00004B36  30E4              xor ah,ah
00004B38  31DB              xor bx,bx
00004B3A  53                push bx
00004B3B  50                push ax
00004B3C  8B46FC            mov ax,[bp-0x4]
00004B3F  8B5EFE            mov bx,[bp-0x2]
00004B42  8D7EEE            lea di,[bp-0x12]
00004B45  E890B5            call word 0xd8
00004B48  8946FC            mov [bp-0x4],ax
00004B4B  895EFE            mov [bp-0x2],bx
00004B4E  83C404            add sp,byte +0x4
00004B51  B84000            mov ax,0x40
00004B54  31DB              xor bx,bx
00004B56  53                push bx
00004B57  50                push ax
00004B58  8B46FC            mov ax,[bp-0x4]
00004B5B  8B5EFE            mov bx,[bp-0x2]
00004B5E  8D7EEE            lea di,[bp-0x12]
00004B61  E856B5            call word 0xba
00004B64  8946FC            mov [bp-0x4],ax
00004B67  895EFE            mov [bp-0x2],bx
00004B6A  83C404            add sp,byte +0x4
00004B6D  B800C0            mov ax,0xc000
00004B70  BB2F00            mov bx,0x2f
00004B73  8D7EFC            lea di,[bp-0x4]
00004B76  E823B5            call word 0x9c
00004B79  730C              jnc 0x4b87
00004B7B  B800C0            mov ax,0xc000
00004B7E  BB2F00            mov bx,0x2f
00004B81  8946FC            mov [bp-0x4],ax
00004B84  895EFE            mov [bp-0x2],bx
00004B87  B80004            mov ax,0x400
00004B8A  31DB              xor bx,bx
00004B8C  53                push bx
00004B8D  50                push ax
00004B8E  8B46FC            mov ax,[bp-0x4]
00004B91  8B5EFE            mov bx,[bp-0x2]
00004B94  8D7EEE            lea di,[bp-0x12]
00004B97  E820B5            call word 0xba
00004B9A  8946FC            mov [bp-0x4],ax
00004B9D  895EFE            mov [bp-0x2],bx
00004BA0  83C404            add sp,byte +0x4
00004BA3  31C0              xor ax,ax
00004BA5  BB0001            mov bx,0x100
00004BA8  53                push bx
00004BA9  50                push ax
00004BAA  8B46FC            mov ax,[bp-0x4]
00004BAD  8B5EFE            mov bx,[bp-0x2]
00004BB0  8D7EEE            lea di,[bp-0x12]
00004BB3  E8DEB4            call word 0x94
00004BB6  8946FC            mov [bp-0x4],ax
00004BB9  895EFE            mov [bp-0x2],bx
00004BBC  83C404            add sp,byte +0x4
00004BBF  31C0              xor ax,ax
00004BC1  BB0001            mov bx,0x100
00004BC4  8D7EFC            lea di,[bp-0x4]
00004BC7  E8D2B4            call word 0x9c
00004BCA  0F828300          jc word 0x4c51
00004BCE  B83100            mov ax,0x31
00004BD1  50                push ax
00004BD2  E899B9            call word 0x56e
00004BD5  44                inc sp
00004BD6  44                inc sp
00004BD7  30E4              xor ah,ah
00004BD9  31DB              xor bx,bx
00004BDB  8946FC            mov [bp-0x4],ax
00004BDE  895EFE            mov [bp-0x2],bx
00004BE1  8B46FC            mov ax,[bp-0x4]
00004BE4  8B5EFE            mov bx,[bp-0x2]
00004BE7  88DF              mov bh,bl
00004BE9  88E3              mov bl,ah
00004BEB  88C4              mov ah,al
00004BED  30C0              xor al,al
00004BEF  8946FC            mov [bp-0x4],ax
00004BF2  895EFE            mov [bp-0x2],bx
00004BF5  B83000            mov ax,0x30
00004BF8  50                push ax
00004BF9  E872B9            call word 0x56e
00004BFC  44                inc sp
00004BFD  44                inc sp
00004BFE  30E4              xor ah,ah
00004C00  31DB              xor bx,bx
00004C02  53                push bx
00004C03  50                push ax
00004C04  8B46FC            mov ax,[bp-0x4]
00004C07  8B5EFE            mov bx,[bp-0x2]
00004C0A  8D7EEE            lea di,[bp-0x12]
00004C0D  E8C8B4            call word 0xd8
00004C10  8946FC            mov [bp-0x4],ax
00004C13  895EFE            mov [bp-0x2],bx
00004C16  83C404            add sp,byte +0x4
00004C19  B80004            mov ax,0x400
00004C1C  31DB              xor bx,bx
00004C1E  53                push bx
00004C1F  50                push ax
00004C20  8B46FC            mov ax,[bp-0x4]
00004C23  8B5EFE            mov bx,[bp-0x2]
00004C26  8D7EEE            lea di,[bp-0x12]
00004C29  E88EB4            call word 0xba
00004C2C  8946FC            mov [bp-0x4],ax
00004C2F  895EFE            mov [bp-0x2],bx
00004C32  83C404            add sp,byte +0x4
00004C35  31C0              xor ax,ax
00004C37  BB1000            mov bx,0x10
00004C3A  53                push bx
00004C3B  50                push ax
00004C3C  8B46FC            mov ax,[bp-0x4]
00004C3F  8B5EFE            mov bx,[bp-0x2]
00004C42  8D7EEE            lea di,[bp-0x12]
00004C45  E84CB4            call word 0x94
00004C48  8946FC            mov [bp-0x4],ax
00004C4B  895EFE            mov [bp-0x2],bx
00004C4E  83C404            add sp,byte +0x4
00004C51  B85C00            mov ax,0x5c
00004C54  50                push ax
00004C55  E816B9            call word 0x56e
00004C58  44                inc sp
00004C59  44                inc sp
00004C5A  30E4              xor ah,ah
00004C5C  31DB              xor bx,bx
00004C5E  8946F8            mov [bp-0x8],ax
00004C61  895EFA            mov [bp-0x6],bx
00004C64  8B46F8            mov ax,[bp-0x8]
00004C67  8B5EFA            mov bx,[bp-0x6]
00004C6A  88DF              mov bh,bl
00004C6C  88E3              mov bl,ah
00004C6E  88C4              mov ah,al
00004C70  30C0              xor al,al
00004C72  8946F8            mov [bp-0x8],ax
00004C75  895EFA            mov [bp-0x6],bx
00004C78  B85B00            mov ax,0x5b
00004C7B  50                push ax
00004C7C  E8EFB8            call word 0x56e
00004C7F  44                inc sp
00004C80  44                inc sp
00004C81  30E4              xor ah,ah
00004C83  31DB              xor bx,bx
00004C85  53                push bx
00004C86  50                push ax
00004C87  8B46F8            mov ax,[bp-0x8]
00004C8A  8B5EFA            mov bx,[bp-0x6]
00004C8D  8D7EEE            lea di,[bp-0x12]
00004C90  E845B4            call word 0xd8
00004C93  8946F8            mov [bp-0x8],ax
00004C96  895EFA            mov [bp-0x6],bx
00004C99  83C404            add sp,byte +0x4
00004C9C  B84000            mov ax,0x40
00004C9F  31DB              xor bx,bx
00004CA1  53                push bx
00004CA2  50                push ax
00004CA3  8B46F8            mov ax,[bp-0x8]
00004CA6  8B5EFA            mov bx,[bp-0x6]
00004CA9  8D7EEE            lea di,[bp-0x12]
00004CAC  E80BB4            call word 0xba
00004CAF  8946F8            mov [bp-0x8],ax
00004CB2  895EFA            mov [bp-0x6],bx
00004CB5  83C404            add sp,byte +0x4
00004CB8  B80004            mov ax,0x400
00004CBB  31DB              xor bx,bx
00004CBD  53                push bx
00004CBE  50                push ax
00004CBF  8B46F8            mov ax,[bp-0x8]
00004CC2  8B5EFA            mov bx,[bp-0x6]
00004CC5  8D7EEE            lea di,[bp-0x12]
00004CC8  E8EFB3            call word 0xba
00004CCB  8946F8            mov [bp-0x8],ax
00004CCE  895EFA            mov [bp-0x6],bx
00004CD1  83C404            add sp,byte +0x4
00004CD4  B85D00            mov ax,0x5d
00004CD7  50                push ax
00004CD8  E893B8            call word 0x56e
00004CDB  44                inc sp
00004CDC  44                inc sp
00004CDD  8846F3            mov [bp-0xd],al
00004CE0  8B4614            mov ax,[bp+0x14]
00004CE3  E93302            jmp word 0x4f19
00004CE6  B80100            mov ax,0x1
00004CE9  50                push ax
00004CEA  31C0              xor ax,ax
00004CEC  50                push ax
00004CED  31C0              xor ax,ax
00004CEF  50                push ax
00004CF0  B800F0            mov ax,0xf000
00004CF3  BB0900            mov bx,0x9
00004CF6  53                push bx
00004CF7  50                push ax
00004CF8  31C0              xor ax,ax
00004CFA  31DB              xor bx,bx
00004CFC  53                push bx
00004CFD  50                push ax
00004CFE  FF7604            push word [bp+0x4]
00004D01  FF7624            push word [bp+0x24]
00004D04  E8CEFC            call word 0x49d5
00004D07  83C412            add sp,byte +0x12
00004D0A  B80100            mov ax,0x1
00004D0D  31DB              xor bx,bx
00004D0F  894614            mov [bp+0x14],ax
00004D12  895E16            mov [bp+0x16],bx
00004D15  E92602            jmp word 0x4f3e
00004D18  B80200            mov ax,0x2
00004D1B  50                push ax
00004D1C  31C0              xor ax,ax
00004D1E  50                push ax
00004D1F  31C0              xor ax,ax
00004D21  50                push ax
00004D22  31C0              xor ax,ax
00004D24  BB0A00            mov bx,0xa
00004D27  53                push bx
00004D28  50                push ax
00004D29  B800F0            mov ax,0xf000
00004D2C  BB0900            mov bx,0x9
00004D2F  53                push bx
00004D30  50                push ax
00004D31  FF7604            push word [bp+0x4]
00004D34  FF7624            push word [bp+0x24]
00004D37  E89BFC            call word 0x49d5
00004D3A  83C412            add sp,byte +0x12
00004D3D  B80200            mov ax,0x2
00004D40  31DB              xor bx,bx
00004D42  894614            mov [bp+0x14],ax
00004D45  895E16            mov [bp+0x16],bx
00004D48  E9F301            jmp word 0x4f3e
00004D4B  B80200            mov ax,0x2
00004D4E  50                push ax
00004D4F  31C0              xor ax,ax
00004D51  50                push ax
00004D52  31C0              xor ax,ax
00004D54  50                push ax
00004D55  31C0              xor ax,ax
00004D57  BB1000            mov bx,0x10
00004D5A  53                push bx
00004D5B  50                push ax
00004D5C  B80080            mov ax,0x8000
00004D5F  BB0E00            mov bx,0xe
00004D62  53                push bx
00004D63  50                push ax
00004D64  FF7604            push word [bp+0x4]
00004D67  FF7624            push word [bp+0x24]
00004D6A  E868FC            call word 0x49d5
00004D6D  83C412            add sp,byte +0x12
00004D70  31C0              xor ax,ax
00004D72  BB1000            mov bx,0x10
00004D75  8D7EFC            lea di,[bp-0x4]
00004D78  E821B3            call word 0x9c
00004D7B  720D              jc 0x4d8a
00004D7D  B80600            mov ax,0x6
00004D80  31DB              xor bx,bx
00004D82  894614            mov [bp+0x14],ax
00004D85  895E16            mov [bp+0x16],bx
00004D88  EB0B              jmp short 0x4d95
00004D8A  B80300            mov ax,0x3
00004D8D  31DB              xor bx,bx
00004D8F  894614            mov [bp+0x14],ax
00004D92  895E16            mov [bp+0x16],bx
00004D95  E9A601            jmp word 0x4f3e
00004D98  B80100            mov ax,0x1
00004D9B  50                push ax
00004D9C  31C0              xor ax,ax
00004D9E  50                push ax
00004D9F  31C0              xor ax,ax
00004DA1  50                push ax
00004DA2  31C0              xor ax,ax
00004DA4  BB0100            mov bx,0x1
00004DA7  53                push bx
00004DA8  50                push ax
00004DA9  8B46FC            mov ax,[bp-0x4]
00004DAC  8B5EFE            mov bx,[bp-0x2]
00004DAF  8D7EE8            lea di,[bp-0x18]
00004DB2  E8FDB2            call word 0xb2
00004DB5  83C404            add sp,byte +0x4
00004DB8  53                push bx
00004DB9  50                push ax
00004DBA  31C0              xor ax,ax
00004DBC  BB1000            mov bx,0x10
00004DBF  53                push bx
00004DC0  50                push ax
00004DC1  FF7604            push word [bp+0x4]
00004DC4  FF7624            push word [bp+0x24]
00004DC7  E80BFC            call word 0x49d5
00004DCA  83C412            add sp,byte +0x12
00004DCD  B80500            mov ax,0x5
00004DD0  31DB              xor bx,bx
00004DD2  894614            mov [bp+0x14],ax
00004DD5  895E16            mov [bp+0x16],bx
00004DD8  E96301            jmp word 0x4f3e
00004DDB  B80200            mov ax,0x2
00004DDE  50                push ax
00004DDF  31C0              xor ax,ax
00004DE1  50                push ax
00004DE2  31C0              xor ax,ax
00004DE4  50                push ax
00004DE5  31C0              xor ax,ax
00004DE7  BB0100            mov bx,0x1
00004DEA  53                push bx
00004DEB  50                push ax
00004DEC  8B46FC            mov ax,[bp-0x4]
00004DEF  8B5EFE            mov bx,[bp-0x2]
00004DF2  8D7EE8            lea di,[bp-0x18]
00004DF5  E8BAB2            call word 0xb2
00004DF8  83C404            add sp,byte +0x4
00004DFB  53                push bx
00004DFC  50                push ax
00004DFD  31C0              xor ax,ax
00004DFF  BB0100            mov bx,0x1
00004E02  53                push bx
00004E03  50                push ax
00004E04  8B46FC            mov ax,[bp-0x4]
00004E07  8B5EFE            mov bx,[bp-0x2]
00004E0A  8D7EE4            lea di,[bp-0x1c]
00004E0D  E8A2B2            call word 0xb2
00004E10  83C404            add sp,byte +0x4
00004E13  53                push bx
00004E14  50                push ax
00004E15  B80020            mov ax,0x2000
00004E18  31DB              xor bx,bx
00004E1A  53                push bx
00004E1B  50                push ax
00004E1C  8B46E4            mov ax,[bp-0x1c]
00004E1F  8B5EE6            mov bx,[bp-0x1a]
00004E22  8D7EE0            lea di,[bp-0x20]
00004E25  E88AB2            call word 0xb2
00004E28  83C408            add sp,byte +0x8
00004E2B  53                push bx
00004E2C  50                push ax
00004E2D  FF7604            push word [bp+0x4]
00004E30  FF7624            push word [bp+0x24]
00004E33  E89FFB            call word 0x49d5
00004E36  83C412            add sp,byte +0x12
00004E39  B80500            mov ax,0x5
00004E3C  31DB              xor bx,bx
00004E3E  894614            mov [bp+0x14],ax
00004E41  895E16            mov [bp+0x16],bx
00004E44  E9F700            jmp word 0x4f3e
00004E47  B80300            mov ax,0x3
00004E4A  50                push ax
00004E4B  31C0              xor ax,ax
00004E4D  50                push ax
00004E4E  31C0              xor ax,ax
00004E50  50                push ax
00004E51  FF76FE            push word [bp-0x2]
00004E54  FF76FC            push word [bp-0x4]
00004E57  31C0              xor ax,ax
00004E59  BB0100            mov bx,0x1
00004E5C  53                push bx
00004E5D  50                push ax
00004E5E  8B46FC            mov ax,[bp-0x4]
00004E61  8B5EFE            mov bx,[bp-0x2]
00004E64  8D7EE4            lea di,[bp-0x1c]
00004E67  E848B2            call word 0xb2
00004E6A  83C404            add sp,byte +0x4
00004E6D  53                push bx
00004E6E  50                push ax
00004E6F  FF7604            push word [bp+0x4]
00004E72  FF7624            push word [bp+0x24]
00004E75  E85DFB            call word 0x49d5
00004E78  83C412            add sp,byte +0x12
00004E7B  B80600            mov ax,0x6
00004E7E  31DB              xor bx,bx
00004E80  894614            mov [bp+0x14],ax
00004E83  895E16            mov [bp+0x16],bx
00004E86  E9B500            jmp word 0x4f3e
00004E89  B80200            mov ax,0x2
00004E8C  50                push ax
00004E8D  31C0              xor ax,ax
00004E8F  50                push ax
00004E90  31C0              xor ax,ax
00004E92  50                push ax
00004E93  31C0              xor ax,ax
00004E95  31DB              xor bx,bx
00004E97  53                push bx
00004E98  50                push ax
00004E99  31C0              xor ax,ax
00004E9B  BBFCFF            mov bx,0xfffc
00004E9E  53                push bx
00004E9F  50                push ax
00004EA0  FF7604            push word [bp+0x4]
00004EA3  FF7624            push word [bp+0x24]
00004EA6  E82CFB            call word 0x49d5
00004EA9  83C412            add sp,byte +0x12
00004EAC  8A46F3            mov al,[bp-0xd]
00004EAF  30E4              xor ah,ah
00004EB1  31DB              xor bx,bx
00004EB3  E82FB2            call word 0xe5
00004EB6  750B              jnz 0x4ec3
00004EB8  8B46F8            mov ax,[bp-0x8]
00004EBB  8B5EFA            mov bx,[bp-0x6]
00004EBE  E824B2            call word 0xe5
00004EC1  740D              jz 0x4ed0
00004EC3  B80700            mov ax,0x7
00004EC6  31DB              xor bx,bx
00004EC8  894614            mov [bp+0x14],ax
00004ECB  895E16            mov [bp+0x16],bx
00004ECE  EB0A              jmp short 0x4eda
00004ED0  31C0              xor ax,ax
00004ED2  31DB              xor bx,bx
00004ED4  894614            mov [bp+0x14],ax
00004ED7  895E16            mov [bp+0x16],bx
00004EDA  EB62              jmp short 0x4f3e
00004EDC  B80100            mov ax,0x1
00004EDF  50                push ax
00004EE0  8A46F3            mov al,[bp-0xd]
00004EE3  30E4              xor ah,ah
00004EE5  40                inc ax
00004EE6  50                push ax
00004EE7  B80100            mov ax,0x1
00004EEA  50                push ax
00004EEB  FF76FA            push word [bp-0x6]
00004EEE  FF76F8            push word [bp-0x8]
00004EF1  31C0              xor ax,ax
00004EF3  31DB              xor bx,bx
00004EF5  53                push bx
00004EF6  50                push ax
00004EF7  FF7604            push word [bp+0x4]
00004EFA  FF7624            push word [bp+0x24]
00004EFD  E8D5FA            call word 0x49d5
00004F00  83C412            add sp,byte +0x12
00004F03  31C0              xor ax,ax
00004F05  31DB              xor bx,bx
00004F07  894614            mov [bp+0x14],ax
00004F0A  895E16            mov [bp+0x16],bx
00004F0D  EB2F              jmp short 0x4f3e
00004F0F  83C400            add sp,byte +0x0
00004F12  E9BC00            jmp word 0x4fd1
00004F15  EB27              jmp short 0x4f3e
00004F17  EB25              jmp short 0x4f3e
00004F19  2D0000            sub ax,0x0
00004F1C  7CF1              jl 0x4f0f
00004F1E  3D0700            cmp ax,0x7
00004F21  7719              ja 0x4f3c
00004F23  D1E0              shl ax,1
00004F25  89C3              mov bx,ax
00004F27  2EFFA72C4F        jmp word [cs:bx+0x4f2c]
00004F2C  E64C              out 0x4c,al
00004F2E  184D4B            sbb [di+0x4b],cl
00004F31  4D                dec bp
00004F32  98                cbw
00004F33  4D                dec bp
00004F34  DB4D47            fisttp dword [di+0x47]
00004F37  4E                dec si
00004F38  894EDC            mov [bp-0x24],cx
00004F3B  4E                dec si
00004F3C  EBD1              jmp short 0x4f0f
00004F3E  B85041            mov ax,0x4150
00004F41  BB4D53            mov bx,0x534d
00004F44  894620            mov [bp+0x20],ax
00004F47  895E22            mov [bp+0x22],bx
00004F4A  B81400            mov ax,0x14
00004F4D  31DB              xor bx,bx
00004F4F  89461C            mov [bp+0x1c],ax
00004F52  895E1E            mov [bp+0x1e],bx
00004F55  8B4628            mov ax,[bp+0x28]
00004F58  24FE              and al,0xfe
00004F5A  894628            mov [bp+0x28],ax
00004F5D  EB06              jmp short 0x4f65
00004F5F  83C400            add sp,byte +0x0
00004F62  E96C00            jmp word 0x4fd1
00004F65  E96700            jmp word 0x4fcf
00004F68  8B4628            mov ax,[bp+0x28]
00004F6B  24FE              and al,0xfe
00004F6D  894628            mov [bp+0x28],ax
00004F70  B83000            mov ax,0x30
00004F73  50                push ax
00004F74  E8F7B5            call word 0x56e
00004F77  44                inc sp
00004F78  44                inc sp
00004F79  88461C            mov [bp+0x1c],al
00004F7C  B83100            mov ax,0x31
00004F7F  50                push ax
00004F80  E8EBB5            call word 0x56e
00004F83  44                inc sp
00004F84  44                inc sp
00004F85  88461D            mov [bp+0x1d],al
00004F88  8B461C            mov ax,[bp+0x1c]
00004F8B  3D003C            cmp ax,0x3c00
00004F8E  7606              jna 0x4f96
00004F90  B8003C            mov ax,0x3c00
00004F93  89461C            mov [bp+0x1c],ax
00004F96  B83400            mov ax,0x34
00004F99  50                push ax
00004F9A  E8D1B5            call word 0x56e
00004F9D  44                inc sp
00004F9E  44                inc sp
00004F9F  884618            mov [bp+0x18],al
00004FA2  B83500            mov ax,0x35
00004FA5  50                push ax
00004FA6  E8C5B5            call word 0x56e
00004FA9  44                inc sp
00004FAA  44                inc sp
00004FAB  884619            mov [bp+0x19],al
00004FAE  8B461C            mov ax,[bp+0x1c]
00004FB1  894620            mov [bp+0x20],ax
00004FB4  8B4618            mov ax,[bp+0x18]
00004FB7  894614            mov [bp+0x14],ax
00004FBA  EB13              jmp short 0x4fcf
00004FBC  83C400            add sp,byte +0x0
00004FBF  EB10              jmp short 0x4fd1
00004FC1  EB0C              jmp short 0x4fcf
00004FC3  2C01              sub al,0x1
00004FC5  74A1              jz 0x4f68
00004FC7  2C1F              sub al,0x1f
00004FC9  0F841EFB          jz word 0x4aeb
00004FCD  EBED              jmp short 0x4fbc
00004FCF  EB33              jmp short 0x5004
00004FD1  FF7614            push word [bp+0x14]
00004FD4  FF7620            push word [bp+0x20]
00004FD7  BBB8D3            mov bx,0xd3b8
00004FDA  53                push bx
00004FDB  B80400            mov ax,0x4
00004FDE  50                push ax
00004FDF  E848B9            call word 0x92a
00004FE2  83C408            add sp,byte +0x8
00004FE5  8B4628            mov ax,[bp+0x28]
00004FE8  0C01              or al,0x1
00004FEA  894628            mov [bp+0x28],ax
00004FED  B086              mov al,0x86
00004FEF  884621            mov [bp+0x21],al
00004FF2  EB10              jmp short 0x5004
00004FF4  EB0E              jmp short 0x5004
00004FF6  2C86              sub al,0x86
00004FF8  0F84A3FA          jz word 0x4a9f
00004FFC  2C62              sub al,0x62
00004FFE  0F84E3FA          jz word 0x4ae5
00005002  EBCD              jmp short 0x4fd1
00005004  89EC              mov sp,bp
00005006  5D                pop bp
00005007  C3                ret
00005008  55                push bp
00005009  89E5              mov bp,sp
0000500B  83C4F6            add sp,byte -0xa
0000500E  A01700            mov al,[0x17]
00005011  8846FD            mov [bp-0x3],al
00005014  A09700            mov al,[0x97]
00005017  8846FC            mov [bp-0x4],al
0000501A  8A46FC            mov al,[bp-0x4]
0000501D  2407              and al,0x7
0000501F  50                push ax
00005020  8A46FD            mov al,[bp-0x3]
00005023  30E4              xor ah,ah
00005025  B104              mov cl,0x4
00005027  D3E8              shr ax,cl
00005029  2407              and al,0x7
0000502B  3246F4            xor al,[bp-0xc]
0000502E  44                inc sp
0000502F  44                inc sp
00005030  84C0              test al,al
00005032  0F849500          jz word 0x50cb
00005036  FA                cli
00005037  B8ED00            mov ax,0xed
0000503A  50                push ax
0000503B  B86000            mov ax,0x60
0000503E  50                push ax
0000503F  E8FDB4            call word 0x53f
00005042  83C404            add sp,byte +0x4
00005045  EB0E              jmp short 0x5055
00005047  B82100            mov ax,0x21
0000504A  50                push ax
0000504B  B88000            mov ax,0x80
0000504E  50                push ax
0000504F  E8EDB4            call word 0x53f
00005052  83C404            add sp,byte +0x4
00005055  B86400            mov ax,0x64
00005058  50                push ax
00005059  E8CDB4            call word 0x529
0000505C  44                inc sp
0000505D  44                inc sp
0000505E  2401              and al,0x1
00005060  84C0              test al,al
00005062  74E3              jz 0x5047
00005064  B86000            mov ax,0x60
00005067  50                push ax
00005068  E8BEB4            call word 0x529
0000506B  44                inc sp
0000506C  44                inc sp
0000506D  3CFA              cmp al,0xfa
0000506F  7559              jnz 0x50ca
00005071  8A46FC            mov al,[bp-0x4]
00005074  24F8              and al,0xf8
00005076  8846FC            mov [bp-0x4],al
00005079  8A46FD            mov al,[bp-0x3]
0000507C  30E4              xor ah,ah
0000507E  B104              mov cl,0x4
00005080  D3E8              shr ax,cl
00005082  2407              and al,0x7
00005084  0A46FC            or al,[bp-0x4]
00005087  8846FC            mov [bp-0x4],al
0000508A  8A46FC            mov al,[bp-0x4]
0000508D  2407              and al,0x7
0000508F  30E4              xor ah,ah
00005091  50                push ax
00005092  B86000            mov ax,0x60
00005095  50                push ax
00005096  E8A6B4            call word 0x53f
00005099  83C404            add sp,byte +0x4
0000509C  EB0E              jmp short 0x50ac
0000509E  B82100            mov ax,0x21
000050A1  50                push ax
000050A2  B88000            mov ax,0x80
000050A5  50                push ax
000050A6  E896B4            call word 0x53f
000050A9  83C404            add sp,byte +0x4
000050AC  B86400            mov ax,0x64
000050AF  50                push ax
000050B0  E876B4            call word 0x529
000050B3  44                inc sp
000050B4  44                inc sp
000050B5  2401              and al,0x1
000050B7  84C0              test al,al
000050B9  74E3              jz 0x509e
000050BB  B86000            mov ax,0x60
000050BE  50                push ax
000050BF  E867B4            call word 0x529
000050C2  44                inc sp
000050C3  44                inc sp
000050C4  8A46FC            mov al,[bp-0x4]
000050C7  A29700            mov [0x97],al
000050CA  FB                sti
000050CB  8B4612            mov ax,[bp+0x12]
000050CE  88E0              mov al,ah
000050D0  30E4              xor ah,ah
000050D2  E9D702            jmp word 0x53ac
000050D5  B80100            mov ax,0x1
000050D8  50                push ax
000050D9  8D5EFE            lea bx,[bp-0x2]
000050DC  53                push bx
000050DD  8D5EFF            lea bx,[bp-0x1]
000050E0  53                push bx
000050E1  E81603            call word 0x53fa
000050E4  83C406            add sp,byte +0x6
000050E7  85C0              test ax,ax
000050E9  750E              jnz 0x50f9
000050EB  BB94D3            mov bx,0xd394
000050EE  53                push bx
000050EF  B80700            mov ax,0x7
000050F2  50                push ax
000050F3  E834B8            call word 0x92a
000050F6  83C404            add sp,byte +0x4
000050F9  8A46FF            mov al,[bp-0x1]
000050FC  84C0              test al,al
000050FE  740E              jz 0x510e
00005100  8A46FE            mov al,[bp-0x2]
00005103  3CF0              cmp al,0xf0
00005105  7507              jnz 0x510e
00005107  30C0              xor al,al
00005109  8846FE            mov [bp-0x2],al
0000510C  EB0C              jmp short 0x511a
0000510E  8A46FE            mov al,[bp-0x2]
00005111  3CE0              cmp al,0xe0
00005113  7505              jnz 0x511a
00005115  30C0              xor al,al
00005117  8846FE            mov [bp-0x2],al
0000511A  8A46FF            mov al,[bp-0x1]
0000511D  30E4              xor ah,ah
0000511F  88C4              mov ah,al
00005121  30C0              xor al,al
00005123  0A46FE            or al,[bp-0x2]
00005126  894612            mov [bp+0x12],ax
00005129  E9CA02            jmp word 0x53f6
0000512C  31C0              xor ax,ax
0000512E  50                push ax
0000512F  8D5EFE            lea bx,[bp-0x2]
00005132  53                push bx
00005133  8D5EFF            lea bx,[bp-0x1]
00005136  53                push bx
00005137  E8C002            call word 0x53fa
0000513A  83C406            add sp,byte +0x6
0000513D  85C0              test ax,ax
0000513F  750C              jnz 0x514d
00005141  8B4614            mov ax,[bp+0x14]
00005144  0C40              or al,0x40
00005146  894614            mov [bp+0x14],ax
00005149  89EC              mov sp,bp
0000514B  5D                pop bp
0000514C  C3                ret
0000514D  8A46FF            mov al,[bp-0x1]
00005150  84C0              test al,al
00005152  740E              jz 0x5162
00005154  8A46FE            mov al,[bp-0x2]
00005157  3CF0              cmp al,0xf0
00005159  7507              jnz 0x5162
0000515B  30C0              xor al,al
0000515D  8846FE            mov [bp-0x2],al
00005160  EB0C              jmp short 0x516e
00005162  8A46FE            mov al,[bp-0x2]
00005165  3CE0              cmp al,0xe0
00005167  7505              jnz 0x516e
00005169  30C0              xor al,al
0000516B  8846FE            mov [bp-0x2],al
0000516E  8A46FF            mov al,[bp-0x1]
00005171  30E4              xor ah,ah
00005173  88C4              mov ah,al
00005175  30C0              xor al,al
00005177  0A46FE            or al,[bp-0x2]
0000517A  894612            mov [bp+0x12],ax
0000517D  8B4614            mov ax,[bp+0x14]
00005180  24BF              and al,0xbf
00005182  894614            mov [bp+0x14],ax
00005185  E96E02            jmp word 0x53f6
00005188  A01700            mov al,[0x17]
0000518B  8846FD            mov [bp-0x3],al
0000518E  8B4612            mov ax,[bp+0x12]
00005191  30C0              xor al,al
00005193  0A46FD            or al,[bp-0x3]
00005196  894612            mov [bp+0x12],ax
00005199  E95A02            jmp word 0x53f6
0000519C  8A4610            mov al,[bp+0x10]
0000519F  30E4              xor ah,ah
000051A1  50                push ax
000051A2  8B4610            mov ax,[bp+0x10]
000051A5  88E0              mov al,ah
000051A7  30E4              xor ah,ah
000051A9  50                push ax
000051AA  E8900A            call word 0x5c3d
000051AD  83C404            add sp,byte +0x4
000051B0  85C0              test ax,ax
000051B2  750C              jnz 0x51c0
000051B4  8B4612            mov ax,[bp+0x12]
000051B7  30C0              xor al,al
000051B9  0C01              or al,0x1
000051BB  894612            mov [bp+0x12],ax
000051BE  EB0A              jmp short 0x51ca
000051C0  8B4612            mov ax,[bp+0x12]
000051C3  30C0              xor al,al
000051C5  0C00              or al,0x0
000051C7  894612            mov [bp+0x12],ax
000051CA  E92902            jmp word 0x53f6
000051CD  8B4612            mov ax,[bp+0x12]
000051D0  30C0              xor al,al
000051D2  0C30              or al,0x30
000051D4  894612            mov [bp+0x12],ax
000051D7  E91C02            jmp word 0x53f6
000051DA  B002              mov al,0x2
000051DC  8846FB            mov [bp-0x5],al
000051DF  31C0              xor ax,ax
000051E1  8946F8            mov [bp-0x8],ax
000051E4  B8F200            mov ax,0xf2
000051E7  50                push ax
000051E8  B86000            mov ax,0x60
000051EB  50                push ax
000051EC  E850B3            call word 0x53f
000051EF  83C404            add sp,byte +0x4
000051F2  B8FFFF            mov ax,0xffff
000051F5  8946F6            mov [bp-0xa],ax
000051F8  EB0D              jmp short 0x5207
000051FA  31C0              xor ax,ax
000051FC  50                push ax
000051FD  B88000            mov ax,0x80
00005200  50                push ax
00005201  E83BB3            call word 0x53f
00005204  83C404            add sp,byte +0x4
00005207  B86400            mov ax,0x64
0000520A  50                push ax
0000520B  E81BB3            call word 0x529
0000520E  44                inc sp
0000520F  44                inc sp
00005210  2401              and al,0x1
00005212  84C0              test al,al
00005214  750B              jnz 0x5221
00005216  8B46F6            mov ax,[bp-0xa]
00005219  48                dec ax
0000521A  8946F6            mov [bp-0xa],ax
0000521D  85C0              test ax,ax
0000521F  75D9              jnz 0x51fa
00005221  8B46F6            mov ax,[bp-0xa]
00005224  85C0              test ax,ax
00005226  746D              jz 0x5295
00005228  B86000            mov ax,0x60
0000522B  50                push ax
0000522C  E8FAB2            call word 0x529
0000522F  44                inc sp
00005230  44                inc sp
00005231  3CFA              cmp al,0xfa
00005233  7560              jnz 0x5295
00005235  B8FFFF            mov ax,0xffff
00005238  8946F6            mov [bp-0xa],ax
0000523B  EB0D              jmp short 0x524a
0000523D  31C0              xor ax,ax
0000523F  50                push ax
00005240  B88000            mov ax,0x80
00005243  50                push ax
00005244  E8F8B2            call word 0x53f
00005247  83C404            add sp,byte +0x4
0000524A  B86400            mov ax,0x64
0000524D  50                push ax
0000524E  E8D8B2            call word 0x529
00005251  44                inc sp
00005252  44                inc sp
00005253  2401              and al,0x1
00005255  84C0              test al,al
00005257  750B              jnz 0x5264
00005259  8B46F6            mov ax,[bp-0xa]
0000525C  48                dec ax
0000525D  8946F6            mov [bp-0xa],ax
00005260  85C0              test ax,ax
00005262  75D9              jnz 0x523d
00005264  8B46F6            mov ax,[bp-0xa]
00005267  85C0              test ax,ax
00005269  741F              jz 0x528a
0000526B  8B46F8            mov ax,[bp-0x8]
0000526E  88E0              mov al,ah
00005270  30E4              xor ah,ah
00005272  8946F8            mov [bp-0x8],ax
00005275  B86000            mov ax,0x60
00005278  50                push ax
00005279  E8ADB2            call word 0x529
0000527C  44                inc sp
0000527D  44                inc sp
0000527E  30E4              xor ah,ah
00005280  88C4              mov ah,al
00005282  30C0              xor al,al
00005284  0B46F8            or ax,[bp-0x8]
00005287  8946F8            mov [bp-0x8],ax
0000528A  8A46FB            mov al,[bp-0x5]
0000528D  48                dec ax
0000528E  8846FB            mov [bp-0x5],al
00005291  84C0              test al,al
00005293  75A0              jnz 0x5235
00005295  8B46F8            mov ax,[bp-0x8]
00005298  89460C            mov [bp+0xc],ax
0000529B  E95801            jmp word 0x53f6
0000529E  B80100            mov ax,0x1
000052A1  50                push ax
000052A2  8D5EFE            lea bx,[bp-0x2]
000052A5  53                push bx
000052A6  8D5EFF            lea bx,[bp-0x1]
000052A9  53                push bx
000052AA  E84D01            call word 0x53fa
000052AD  83C406            add sp,byte +0x6
000052B0  85C0              test ax,ax
000052B2  750E              jnz 0x52c2
000052B4  BB70D3            mov bx,0xd370
000052B7  53                push bx
000052B8  B80700            mov ax,0x7
000052BB  50                push ax
000052BC  E86BB6            call word 0x92a
000052BF  83C404            add sp,byte +0x4
000052C2  8A46FF            mov al,[bp-0x1]
000052C5  84C0              test al,al
000052C7  740C              jz 0x52d5
000052C9  8A46FE            mov al,[bp-0x2]
000052CC  3CF0              cmp al,0xf0
000052CE  7505              jnz 0x52d5
000052D0  30C0              xor al,al
000052D2  8846FE            mov [bp-0x2],al
000052D5  8A46FF            mov al,[bp-0x1]
000052D8  30E4              xor ah,ah
000052DA  88C4              mov ah,al
000052DC  30C0              xor al,al
000052DE  0A46FE            or al,[bp-0x2]
000052E1  894612            mov [bp+0x12],ax
000052E4  E90F01            jmp word 0x53f6
000052E7  31C0              xor ax,ax
000052E9  50                push ax
000052EA  8D5EFE            lea bx,[bp-0x2]
000052ED  53                push bx
000052EE  8D5EFF            lea bx,[bp-0x1]
000052F1  53                push bx
000052F2  E80501            call word 0x53fa
000052F5  83C406            add sp,byte +0x6
000052F8  85C0              test ax,ax
000052FA  750C              jnz 0x5308
000052FC  8B4614            mov ax,[bp+0x14]
000052FF  0C40              or al,0x40
00005301  894614            mov [bp+0x14],ax
00005304  89EC              mov sp,bp
00005306  5D                pop bp
00005307  C3                ret
00005308  8A46FF            mov al,[bp-0x1]
0000530B  84C0              test al,al
0000530D  740C              jz 0x531b
0000530F  8A46FE            mov al,[bp-0x2]
00005312  3CF0              cmp al,0xf0
00005314  7505              jnz 0x531b
00005316  30C0              xor al,al
00005318  8846FE            mov [bp-0x2],al
0000531B  8A46FF            mov al,[bp-0x1]
0000531E  30E4              xor ah,ah
00005320  88C4              mov ah,al
00005322  30C0              xor al,al
00005324  0A46FE            or al,[bp-0x2]
00005327  894612            mov [bp+0x12],ax
0000532A  8B4614            mov ax,[bp+0x14]
0000532D  24BF              and al,0xbf
0000532F  894614            mov [bp+0x14],ax
00005332  E9C100            jmp word 0x53f6
00005335  A01700            mov al,[0x17]
00005338  8846FD            mov [bp-0x3],al
0000533B  8B4612            mov ax,[bp+0x12]
0000533E  30C0              xor al,al
00005340  0A46FD            or al,[bp-0x3]
00005343  894612            mov [bp+0x12],ax
00005346  A01800            mov al,[0x18]
00005349  2473              and al,0x73
0000534B  8846FD            mov [bp-0x3],al
0000534E  A09600            mov al,[0x96]
00005351  240C              and al,0xc
00005353  0A46FD            or al,[bp-0x3]
00005356  8846FD            mov [bp-0x3],al
00005359  8A46FD            mov al,[bp-0x3]
0000535C  30E4              xor ah,ah
0000535E  88C4              mov ah,al
00005360  30C0              xor al,al
00005362  50                push ax
00005363  8A4612            mov al,[bp+0x12]
00005366  30E4              xor ah,ah
00005368  0B46F4            or ax,[bp-0xc]
0000536B  44                inc sp
0000536C  44                inc sp
0000536D  894612            mov [bp+0x12],ax
00005370  E98300            jmp word 0x53f6
00005373  8A4612            mov al,[bp+0x12]
00005376  30E4              xor ah,ah
00005378  0D0080            or ax,0x8000
0000537B  894612            mov [bp+0x12],ax
0000537E  EB76              jmp short 0x53f6
00005380  EB74              jmp short 0x53f6
00005382  8A4612            mov al,[bp+0x12]
00005385  3C08              cmp al,0x8
00005387  750B              jnz 0x5394
00005389  8A4612            mov al,[bp+0x12]
0000538C  30E4              xor ah,ah
0000538E  0D0002            or ax,0x200
00005391  894612            mov [bp+0x12],ax
00005394  8B4612            mov ax,[bp+0x12]
00005397  88E0              mov al,ah
00005399  30E4              xor ah,ah
0000539B  50                push ax
0000539C  BB48D3            mov bx,0xd348
0000539F  53                push bx
000053A0  B80400            mov ax,0x4
000053A3  50                push ax
000053A4  E883B5            call word 0x92a
000053A7  83C406            add sp,byte +0x6
000053AA  EB4A              jmp short 0x53f6
000053AC  2D0000            sub ax,0x0
000053AF  7CE3              jl 0x5394
000053B1  3D1200            cmp ax,0x12
000053B4  772F              ja 0x53e5
000053B6  D1E0              shl ax,1
000053B8  89C3              mov bx,ax
000053BA  2EFFA7BF53        jmp word [cs:bx+0x53bf]
000053BF  D550              aad 0x50
000053C1  2C51              sub al,0x51
000053C3  885194            mov [bx+di-0x6c],dl
000053C6  53                push bx
000053C7  94                xchg ax,sp
000053C8  53                push bx
000053C9  9C                pushfw
000053CA  51                push cx
000053CB  94                xchg ax,sp
000053CC  53                push bx
000053CD  94                xchg ax,sp
000053CE  53                push bx
000053CF  94                xchg ax,sp
000053D0  53                push bx
000053D1  CD51              int 0x51
000053D3  DA5194            ficom dword [bx+di-0x6c]
000053D6  53                push bx
000053D7  94                xchg ax,sp
000053D8  53                push bx
000053D9  94                xchg ax,sp
000053DA  53                push bx
000053DB  94                xchg ax,sp
000053DC  53                push bx
000053DD  94                xchg ax,sp
000053DE  53                push bx
000053DF  9E                sahf
000053E0  52                push dx
000053E1  E752              out 0x52,ax
000053E3  35532D            xor ax,0x2d53
000053E6  6F                outsw
000053E7  007498            add [si-0x68],dh
000053EA  2D2300            sub ax,0x23
000053ED  7484              jz 0x5373
000053EF  2D1000            sub ax,0x10
000053F2  748C              jz 0x5380
000053F4  EB9E              jmp short 0x5394
000053F6  89EC              mov sp,bp
000053F8  5D                pop bp
000053F9  C3                ret
000053FA  55                push bp
000053FB  89E5              mov bp,sp
000053FD  83C4F6            add sp,byte -0xa
00005400  A18000            mov ax,[0x80]
00005403  8946FE            mov [bp-0x2],ax
00005406  A18200            mov ax,[0x82]
00005409  8946FC            mov [bp-0x4],ax
0000540C  A11A00            mov ax,[0x1a]
0000540F  8946FA            mov [bp-0x6],ax
00005412  A11C00            mov ax,[0x1c]
00005415  8946F8            mov [bp-0x8],ax
00005418  8B46FA            mov ax,[bp-0x6]
0000541B  3B46F8            cmp ax,[bp-0x8]
0000541E  745D              jz 0x547d
00005420  8B5EFA            mov bx,[bp-0x6]
00005423  8A07              mov al,[bx]
00005425  8846F7            mov [bp-0x9],al
00005428  8B46FA            mov ax,[bp-0x6]
0000542B  89C3              mov bx,ax
0000542D  8A4701            mov al,[bx+0x1]
00005430  8846F6            mov [bp-0xa],al
00005433  FF7606            push word [bp+0x6]
00005436  8A46F7            mov al,[bp-0x9]
00005439  30E4              xor ah,ah
0000543B  50                push ax
0000543C  E8F8B1            call word 0x637
0000543F  83C404            add sp,byte +0x4
00005442  FF7604            push word [bp+0x4]
00005445  8A46F6            mov al,[bp-0xa]
00005448  30E4              xor ah,ah
0000544A  50                push ax
0000544B  E8E9B1            call word 0x637
0000544E  83C404            add sp,byte +0x4
00005451  8B4608            mov ax,[bp+0x8]
00005454  85C0              test ax,ax
00005456  741C              jz 0x5474
00005458  8B46FA            mov ax,[bp-0x6]
0000545B  40                inc ax
0000545C  40                inc ax
0000545D  8946FA            mov [bp-0x6],ax
00005460  8B46FA            mov ax,[bp-0x6]
00005463  3B46FC            cmp ax,[bp-0x4]
00005466  7206              jc 0x546e
00005468  8B46FE            mov ax,[bp-0x2]
0000546B  8946FA            mov [bp-0x6],ax
0000546E  8B46FA            mov ax,[bp-0x6]
00005471  A31A00            mov [0x1a],ax
00005474  B80100            mov ax,0x1
00005477  89EC              mov sp,bp
00005479  5D                pop bp
0000547A  C3                ret
0000547B  EB06              jmp short 0x5483
0000547D  31C0              xor ax,ax
0000547F  89EC              mov sp,bp
00005481  5D                pop bp
00005482  C3                ret
00005483  89EC              mov sp,bp
00005485  5D                pop bp
00005486  C3                ret
00005487  25733A            and ax,0x3a73
0000548A  206B65            and [bp+di+0x65],ch
0000548D  7962              jns 0x54f1
0000548F  6F                outsw
00005490  61                popaw
00005491  7264              jc 0x54f7
00005493  20696E            and [bx+di+0x6e],ch
00005496  7075              jo 0x550d
00005498  7420              jz 0x54ba
0000549A  627566            bound si,[di+0x66]
0000549D  66657220          gs o32 jc 0x54c1
000054A1  66756C            o32 jnz 0x5510
000054A4  6C                insb
000054A5  0A00              or al,[bx+si]
000054A7  55                push bp
000054A8  89E5              mov bp,sp
000054AA  4C                dec sp
000054AB  4C                dec sp
000054AC  B86400            mov ax,0x64
000054AF  50                push ax
000054B0  E876B0            call word 0x529
000054B3  44                inc sp
000054B4  44                inc sp
000054B5  2402              and al,0x2
000054B7  84C0              test al,al
000054B9  7412              jz 0x54cd
000054BB  BB3DD3            mov bx,0xd33d
000054BE  53                push bx
000054BF  BB8754            mov bx,0x5487
000054C2  53                push bx
000054C3  B80700            mov ax,0x7
000054C6  50                push ax
000054C7  E860B4            call word 0x92a
000054CA  83C406            add sp,byte +0x6
000054CD  B82000            mov ax,0x20
000054D0  50                push ax
000054D1  B86400            mov ax,0x64
000054D4  50                push ax
000054D5  E867B0            call word 0x53f
000054D8  83C404            add sp,byte +0x4
000054DB  EB00              jmp short 0x54dd
000054DD  B86400            mov ax,0x64
000054E0  50                push ax
000054E1  E845B0            call word 0x529
000054E4  44                inc sp
000054E5  44                inc sp
000054E6  2401              and al,0x1
000054E8  3C01              cmp al,0x1
000054EA  75F1              jnz 0x54dd
000054EC  B86000            mov ax,0x60
000054EF  50                push ax
000054F0  E836B0            call word 0x529
000054F3  44                inc sp
000054F4  44                inc sp
000054F5  8846FE            mov [bp-0x2],al
000054F8  8A46FE            mov al,[bp-0x2]
000054FB  8846FF            mov [bp-0x1],al
000054FE  B86400            mov ax,0x64
00005501  50                push ax
00005502  E824B0            call word 0x529
00005505  44                inc sp
00005506  44                inc sp
00005507  2402              and al,0x2
00005509  84C0              test al,al
0000550B  7412              jz 0x551f
0000550D  BB32D3            mov bx,0xd332
00005510  53                push bx
00005511  BB8754            mov bx,0x5487
00005514  53                push bx
00005515  B80700            mov ax,0x7
00005518  50                push ax
00005519  E80EB4            call word 0x92a
0000551C  83C406            add sp,byte +0x6
0000551F  8A46FF            mov al,[bp-0x1]
00005522  24FD              and al,0xfd
00005524  8846FF            mov [bp-0x1],al
00005527  8A46FF            mov al,[bp-0x1]
0000552A  0C20              or al,0x20
0000552C  8846FF            mov [bp-0x1],al
0000552F  B86000            mov ax,0x60
00005532  50                push ax
00005533  B86400            mov ax,0x64
00005536  50                push ax
00005537  E805B0            call word 0x53f
0000553A  83C404            add sp,byte +0x4
0000553D  8A46FF            mov al,[bp-0x1]
00005540  30E4              xor ah,ah
00005542  50                push ax
00005543  B86000            mov ax,0x60
00005546  50                push ax
00005547  E8F5AF            call word 0x53f
0000554A  83C404            add sp,byte +0x4
0000554D  8A46FE            mov al,[bp-0x2]
00005550  89EC              mov sp,bp
00005552  5D                pop bp
00005553  C3                ret
00005554  55                push bp
00005555  89E5              mov bp,sp
00005557  4C                dec sp
00005558  4C                dec sp
00005559  B86400            mov ax,0x64
0000555C  50                push ax
0000555D  E8C9AF            call word 0x529
00005560  44                inc sp
00005561  44                inc sp
00005562  2402              and al,0x2
00005564  84C0              test al,al
00005566  7412              jz 0x557a
00005568  BB28D3            mov bx,0xd328
0000556B  53                push bx
0000556C  BB8754            mov bx,0x5487
0000556F  53                push bx
00005570  B80700            mov ax,0x7
00005573  50                push ax
00005574  E8B3B3            call word 0x92a
00005577  83C406            add sp,byte +0x6
0000557A  B82000            mov ax,0x20
0000557D  50                push ax
0000557E  B86400            mov ax,0x64
00005581  50                push ax
00005582  E8BAAF            call word 0x53f
00005585  83C404            add sp,byte +0x4
00005588  EB00              jmp short 0x558a
0000558A  B86400            mov ax,0x64
0000558D  50                push ax
0000558E  E898AF            call word 0x529
00005591  44                inc sp
00005592  44                inc sp
00005593  2401              and al,0x1
00005595  3C01              cmp al,0x1
00005597  75F1              jnz 0x558a
00005599  B86000            mov ax,0x60
0000559C  50                push ax
0000559D  E889AF            call word 0x529
000055A0  44                inc sp
000055A1  44                inc sp
000055A2  8846FF            mov [bp-0x1],al
000055A5  B86400            mov ax,0x64
000055A8  50                push ax
000055A9  E87DAF            call word 0x529
000055AC  44                inc sp
000055AD  44                inc sp
000055AE  2402              and al,0x2
000055B0  84C0              test al,al
000055B2  7412              jz 0x55c6
000055B4  BB1ED3            mov bx,0xd31e
000055B7  53                push bx
000055B8  BB8754            mov bx,0x5487
000055BB  53                push bx
000055BC  B80700            mov ax,0x7
000055BF  50                push ax
000055C0  E867B3            call word 0x92a
000055C3  83C406            add sp,byte +0x6
000055C6  8A46FF            mov al,[bp-0x1]
000055C9  0C02              or al,0x2
000055CB  8846FF            mov [bp-0x1],al
000055CE  8A46FF            mov al,[bp-0x1]
000055D1  24DF              and al,0xdf
000055D3  8846FF            mov [bp-0x1],al
000055D6  B86000            mov ax,0x60
000055D9  50                push ax
000055DA  B86400            mov ax,0x64
000055DD  50                push ax
000055DE  E85EAF            call word 0x53f
000055E1  83C404            add sp,byte +0x4
000055E4  8A46FF            mov al,[bp-0x1]
000055E7  30E4              xor ah,ah
000055E9  50                push ax
000055EA  B86000            mov ax,0x60
000055ED  50                push ax
000055EE  E84EAF            call word 0x53f
000055F1  83C404            add sp,byte +0x4
000055F4  89EC              mov sp,bp
000055F6  5D                pop bp
000055F7  C3                ret
000055F8  55                push bp
000055F9  89E5              mov bp,sp
000055FB  4C                dec sp
000055FC  4C                dec sp
000055FD  B86400            mov ax,0x64
00005600  50                push ax
00005601  E825AF            call word 0x529
00005604  44                inc sp
00005605  44                inc sp
00005606  2402              and al,0x2
00005608  84C0              test al,al
0000560A  7412              jz 0x561e
0000560C  BB14D3            mov bx,0xd314
0000560F  53                push bx
00005610  BB8754            mov bx,0x5487
00005613  53                push bx
00005614  B80700            mov ax,0x7
00005617  50                push ax
00005618  E80FB3            call word 0x92a
0000561B  83C406            add sp,byte +0x6
0000561E  B8D400            mov ax,0xd4
00005621  50                push ax
00005622  B86400            mov ax,0x64
00005625  50                push ax
00005626  E816AF            call word 0x53f
00005629  83C404            add sp,byte +0x4
0000562C  8A4604            mov al,[bp+0x4]
0000562F  30E4              xor ah,ah
00005631  50                push ax
00005632  B86000            mov ax,0x60
00005635  50                push ax
00005636  E806AF            call word 0x53f
00005639  83C404            add sp,byte +0x4
0000563C  30C0              xor al,al
0000563E  89EC              mov sp,bp
00005640  5D                pop bp
00005641  C3                ret
00005642  55                push bp
00005643  89E5              mov bp,sp
00005645  4C                dec sp
00005646  4C                dec sp
00005647  EB00              jmp short 0x5649
00005649  B86400            mov ax,0x64
0000564C  50                push ax
0000564D  E8D9AE            call word 0x529
00005650  44                inc sp
00005651  44                inc sp
00005652  2421              and al,0x21
00005654  3C21              cmp al,0x21
00005656  75F1              jnz 0x5649
00005658  B86000            mov ax,0x60
0000565B  50                push ax
0000565C  E8CAAE            call word 0x529
0000565F  44                inc sp
00005660  44                inc sp
00005661  8846FF            mov [bp-0x1],al
00005664  FF7604            push word [bp+0x4]
00005667  8A46FF            mov al,[bp-0x1]
0000566A  30E4              xor ah,ah
0000566C  50                push ax
0000566D  E8C7AF            call word 0x637
00005670  83C404            add sp,byte +0x4
00005673  30C0              xor al,al
00005675  89EC              mov sp,bp
00005677  5D                pop bp
00005678  C3                ret
00005679  55                push bp
0000567A  89E5              mov bp,sp
0000567C  B86400            mov ax,0x64
0000567F  50                push ax
00005680  E8A6AE            call word 0x529
00005683  89EC              mov sp,bp
00005685  2402              and al,0x2
00005687  84C0              test al,al
00005689  7411              jz 0x569c
0000568B  BB09D3            mov bx,0xd309
0000568E  53                push bx
0000568F  BB8754            mov bx,0x5487
00005692  53                push bx
00005693  B80700            mov ax,0x7
00005696  50                push ax
00005697  E890B2            call word 0x92a
0000569A  89EC              mov sp,bp
0000569C  B8D400            mov ax,0xd4
0000569F  50                push ax
000056A0  B86400            mov ax,0x64
000056A3  50                push ax
000056A4  E898AE            call word 0x53f
000056A7  89EC              mov sp,bp
000056A9  B86000            mov ax,0x60
000056AC  50                push ax
000056AD  B86400            mov ax,0x64
000056B0  50                push ax
000056B1  E88BAE            call word 0x53f
000056B4  89EC              mov sp,bp
000056B6  8A4604            mov al,[bp+0x4]
000056B9  30E4              xor ah,ah
000056BB  50                push ax
000056BC  B86000            mov ax,0x60
000056BF  50                push ax
000056C0  E87CAE            call word 0x53f
000056C3  89EC              mov sp,bp
000056C5  5D                pop bp
000056C6  C3                ret
000056C7  55                push bp
000056C8  89E5              mov bp,sp
000056CA  83C4FA            add sp,byte -0x6
000056CD  8A4612            mov al,[bp+0x12]
000056D0  8846FF            mov [bp-0x1],al
000056D3  8A46FF            mov al,[bp-0x1]
000056D6  84C0              test al,al
000056D8  7512              jnz 0x56ec
000056DA  BBEFD2            mov bx,0xd2ef
000056DD  53                push bx
000056DE  B80400            mov ax,0x4
000056E1  50                push ax
000056E2  E845B2            call word 0x92a
000056E5  83C404            add sp,byte +0x4
000056E8  89EC              mov sp,bp
000056EA  5D                pop bp
000056EB  C3                ret
000056EC  A01700            mov al,[0x17]
000056EF  8846FD            mov [bp-0x3],al
000056F2  A01800            mov al,[0x18]
000056F5  8846FC            mov [bp-0x4],al
000056F8  A09600            mov al,[0x96]
000056FB  8846FB            mov [bp-0x5],al
000056FE  30C0              xor al,al
00005700  8846FE            mov [bp-0x2],al
00005703  8A46FF            mov al,[bp-0x1]
00005706  E9BA04            jmp word 0x5bc3
00005709  8A46FD            mov al,[bp-0x3]
0000570C  3440              xor al,0x40
0000570E  8846FD            mov [bp-0x3],al
00005711  8A46FD            mov al,[bp-0x3]
00005714  A21700            mov [0x17],al
00005717  8A46FC            mov al,[bp-0x4]
0000571A  0C40              or al,0x40
0000571C  8846FC            mov [bp-0x4],al
0000571F  8A46FC            mov al,[bp-0x4]
00005722  A21800            mov [0x18],al
00005725  E9F204            jmp word 0x5c1a
00005728  8A46FC            mov al,[bp-0x4]
0000572B  24BF              and al,0xbf
0000572D  8846FC            mov [bp-0x4],al
00005730  8A46FC            mov al,[bp-0x4]
00005733  A21800            mov [0x18],al
00005736  E9E104            jmp word 0x5c1a
00005739  8A46FD            mov al,[bp-0x3]
0000573C  0C02              or al,0x2
0000573E  8846FD            mov [bp-0x3],al
00005741  8A46FD            mov al,[bp-0x3]
00005744  A21700            mov [0x17],al
00005747  E9D004            jmp word 0x5c1a
0000574A  8A46FD            mov al,[bp-0x3]
0000574D  24FD              and al,0xfd
0000574F  8846FD            mov [bp-0x3],al
00005752  8A46FD            mov al,[bp-0x3]
00005755  A21700            mov [0x17],al
00005758  E9BF04            jmp word 0x5c1a
0000575B  8A46FD            mov al,[bp-0x3]
0000575E  0C01              or al,0x1
00005760  8846FD            mov [bp-0x3],al
00005763  8A46FD            mov al,[bp-0x3]
00005766  A21700            mov [0x17],al
00005769  E9AE04            jmp word 0x5c1a
0000576C  8A46FD            mov al,[bp-0x3]
0000576F  24FE              and al,0xfe
00005771  8846FD            mov [bp-0x3],al
00005774  8A46FD            mov al,[bp-0x3]
00005777  A21700            mov [0x17],al
0000577A  E99D04            jmp word 0x5c1a
0000577D  8A46FB            mov al,[bp-0x5]
00005780  2401              and al,0x1
00005782  84C0              test al,al
00005784  7535              jnz 0x57bb
00005786  8A46FD            mov al,[bp-0x3]
00005789  0C04              or al,0x4
0000578B  8846FD            mov [bp-0x3],al
0000578E  8A46FD            mov al,[bp-0x3]
00005791  A21700            mov [0x17],al
00005794  8A46FB            mov al,[bp-0x5]
00005797  2402              and al,0x2
00005799  84C0              test al,al
0000579B  7410              jz 0x57ad
0000579D  8A46FB            mov al,[bp-0x5]
000057A0  0C04              or al,0x4
000057A2  8846FB            mov [bp-0x5],al
000057A5  8A46FB            mov al,[bp-0x5]
000057A8  A29600            mov [0x96],al
000057AB  EB0E              jmp short 0x57bb
000057AD  8A46FC            mov al,[bp-0x4]
000057B0  0C01              or al,0x1
000057B2  8846FC            mov [bp-0x4],al
000057B5  8A46FC            mov al,[bp-0x4]
000057B8  A21800            mov [0x18],al
000057BB  E95C04            jmp word 0x5c1a
000057BE  8A46FB            mov al,[bp-0x5]
000057C1  2401              and al,0x1
000057C3  84C0              test al,al
000057C5  7535              jnz 0x57fc
000057C7  8A46FD            mov al,[bp-0x3]
000057CA  24FB              and al,0xfb
000057CC  8846FD            mov [bp-0x3],al
000057CF  8A46FD            mov al,[bp-0x3]
000057D2  A21700            mov [0x17],al
000057D5  8A46FB            mov al,[bp-0x5]
000057D8  2402              and al,0x2
000057DA  84C0              test al,al
000057DC  7410              jz 0x57ee
000057DE  8A46FB            mov al,[bp-0x5]
000057E1  24FB              and al,0xfb
000057E3  8846FB            mov [bp-0x5],al
000057E6  8A46FB            mov al,[bp-0x5]
000057E9  A29600            mov [0x96],al
000057EC  EB0E              jmp short 0x57fc
000057EE  8A46FC            mov al,[bp-0x4]
000057F1  24FE              and al,0xfe
000057F3  8846FC            mov [bp-0x4],al
000057F6  8A46FC            mov al,[bp-0x4]
000057F9  A21800            mov [0x18],al
000057FC  E91B04            jmp word 0x5c1a
000057FF  8A46FD            mov al,[bp-0x3]
00005802  0C08              or al,0x8
00005804  8846FD            mov [bp-0x3],al
00005807  8A46FD            mov al,[bp-0x3]
0000580A  A21700            mov [0x17],al
0000580D  8A46FB            mov al,[bp-0x5]
00005810  2402              and al,0x2
00005812  84C0              test al,al
00005814  7410              jz 0x5826
00005816  8A46FB            mov al,[bp-0x5]
00005819  0C08              or al,0x8
0000581B  8846FB            mov [bp-0x5],al
0000581E  8A46FB            mov al,[bp-0x5]
00005821  A29600            mov [0x96],al
00005824  EB0E              jmp short 0x5834
00005826  8A46FC            mov al,[bp-0x4]
00005829  0C02              or al,0x2
0000582B  8846FC            mov [bp-0x4],al
0000582E  8A46FC            mov al,[bp-0x4]
00005831  A21800            mov [0x18],al
00005834  E9E303            jmp word 0x5c1a
00005837  8A46FD            mov al,[bp-0x3]
0000583A  24F7              and al,0xf7
0000583C  8846FD            mov [bp-0x3],al
0000583F  8A46FD            mov al,[bp-0x3]
00005842  A21700            mov [0x17],al
00005845  8A46FB            mov al,[bp-0x5]
00005848  2402              and al,0x2
0000584A  84C0              test al,al
0000584C  7410              jz 0x585e
0000584E  8A46FB            mov al,[bp-0x5]
00005851  24F7              and al,0xf7
00005853  8846FB            mov [bp-0x5],al
00005856  8A46FB            mov al,[bp-0x5]
00005859  A29600            mov [0x96],al
0000585C  EB0E              jmp short 0x586c
0000585E  8A46FC            mov al,[bp-0x4]
00005861  24FD              and al,0xfd
00005863  8846FC            mov [bp-0x4],al
00005866  8A46FC            mov al,[bp-0x4]
00005869  A21800            mov [0x18],al
0000586C  E9AB03            jmp word 0x5c1a
0000586F  8A46FB            mov al,[bp-0x5]
00005872  2403              and al,0x3
00005874  84C0              test al,al
00005876  751C              jnz 0x5894
00005878  8A46FC            mov al,[bp-0x4]
0000587B  0C20              or al,0x20
0000587D  8846FC            mov [bp-0x4],al
00005880  8A46FC            mov al,[bp-0x4]
00005883  A21800            mov [0x18],al
00005886  8A46FD            mov al,[bp-0x3]
00005889  3420              xor al,0x20
0000588B  8846FD            mov [bp-0x3],al
0000588E  8A46FD            mov al,[bp-0x3]
00005891  A21700            mov [0x17],al
00005894  E98303            jmp word 0x5c1a
00005897  8A46FB            mov al,[bp-0x5]
0000589A  2403              and al,0x3
0000589C  84C0              test al,al
0000589E  750E              jnz 0x58ae
000058A0  8A46FC            mov al,[bp-0x4]
000058A3  24DF              and al,0xdf
000058A5  8846FC            mov [bp-0x4],al
000058A8  8A46FC            mov al,[bp-0x4]
000058AB  A21800            mov [0x18],al
000058AE  E96903            jmp word 0x5c1a
000058B1  8A46FB            mov al,[bp-0x5]
000058B4  2402              and al,0x2
000058B6  84C0              test al,al
000058B8  7512              jnz 0x58cc
000058BA  8A46FB            mov al,[bp-0x5]
000058BD  2410              and al,0x10
000058BF  84C0              test al,al
000058C1  7532              jnz 0x58f5
000058C3  8A46FD            mov al,[bp-0x3]
000058C6  2404              and al,0x4
000058C8  84C0              test al,al
000058CA  7429              jz 0x58f5
000058CC  8A46FB            mov al,[bp-0x5]
000058CF  24FD              and al,0xfd
000058D1  8846FB            mov [bp-0x5],al
000058D4  8A46FB            mov al,[bp-0x5]
000058D7  A29600            mov [0x96],al
000058DA  B080              mov al,0x80
000058DC  A27100            mov [0x71],al
000058DF  A11A00            mov ax,[0x1a]
000058E2  A31C00            mov [0x1c],ax
000058E5  CD1B              int 0x1b
000058E7  31C0              xor ax,ax
000058E9  50                push ax
000058EA  31C0              xor ax,ax
000058EC  50                push ax
000058ED  E84D03            call word 0x5c3d
000058F0  83C404            add sp,byte +0x4
000058F3  EB1C              jmp short 0x5911
000058F5  8A46FC            mov al,[bp-0x4]
000058F8  0C10              or al,0x10
000058FA  8846FC            mov [bp-0x4],al
000058FD  8A46FC            mov al,[bp-0x4]
00005900  A21800            mov [0x18],al
00005903  8A46FD            mov al,[bp-0x3]
00005906  3410              xor al,0x10
00005908  8846FD            mov [bp-0x3],al
0000590B  8A46FD            mov al,[bp-0x3]
0000590E  A21700            mov [0x17],al
00005911  E90603            jmp word 0x5c1a
00005914  8A46FB            mov al,[bp-0x5]
00005917  2402              and al,0x2
00005919  84C0              test al,al
0000591B  7512              jnz 0x592f
0000591D  8A46FB            mov al,[bp-0x5]
00005920  2410              and al,0x10
00005922  84C0              test al,al
00005924  750B              jnz 0x5931
00005926  8A46FD            mov al,[bp-0x3]
00005929  2404              and al,0x4
0000592B  84C0              test al,al
0000592D  7402              jz 0x5931
0000592F  EB0E              jmp short 0x593f
00005931  8A46FC            mov al,[bp-0x4]
00005934  24EF              and al,0xef
00005936  8846FC            mov [bp-0x4],al
00005939  8A46FC            mov al,[bp-0x4]
0000593C  A21800            mov [0x18],al
0000593F  E9D802            jmp word 0x5c1a
00005942  8A46FF            mov al,[bp-0x1]
00005945  2480              and al,0x80
00005947  84C0              test al,al
00005949  7403              jz 0x594e
0000594B  E9CC02            jmp word 0x5c1a
0000594E  8A46FF            mov al,[bp-0x1]
00005951  3C58              cmp al,0x58
00005953  7618              jna 0x596d
00005955  8A46FF            mov al,[bp-0x1]
00005958  30E4              xor ah,ah
0000595A  50                push ax
0000595B  BBB8D2            mov bx,0xd2b8
0000595E  53                push bx
0000595F  B80400            mov ax,0x4
00005962  50                push ax
00005963  E8C4AF            call word 0x92a
00005966  83C406            add sp,byte +0x6
00005969  89EC              mov sp,bp
0000596B  5D                pop bp
0000596C  C3                ret
0000596D  8A46FF            mov al,[bp-0x1]
00005970  3C53              cmp al,0x53
00005972  0F851400          jnz word 0x598a
00005976  8A46FD            mov al,[bp-0x3]
00005979  240F              and al,0xf
0000597B  3C0C              cmp al,0xc
0000597D  750B              jnz 0x598a
0000597F  B83412            mov ax,0x1234
00005982  A37200            mov [0x72],ax
00005985  EA5BE000F0        jmp word 0xf000:0xe05b
0000598A  E8CAAC            call word 0x657
0000598D  50                push ax
0000598E  E8CCAC            call word 0x65d
00005991  44                inc sp
00005992  44                inc sp
00005993  8A46FD            mov al,[bp-0x3]
00005996  2408              and al,0x8
00005998  84C0              test al,al
0000599A  743D              jz 0x59d9
0000599C  8A46FF            mov al,[bp-0x1]
0000599F  30E4              xor ah,ah
000059A1  89C2              mov dx,ax
000059A3  D1E0              shl ax,1
000059A5  D1E0              shl ax,1
000059A7  01D0              add ax,dx
000059A9  D1E0              shl ax,1
000059AB  89C3              mov bx,ax
000059AD  81C3AF01          add bx,0x1af
000059B1  8A4706            mov al,[bx+0x6]
000059B4  8846FE            mov [bp-0x2],al
000059B7  8A46FF            mov al,[bp-0x1]
000059BA  30E4              xor ah,ah
000059BC  89C2              mov dx,ax
000059BE  D1E0              shl ax,1
000059C0  D1E0              shl ax,1
000059C2  01D0              add ax,dx
000059C4  D1E0              shl ax,1
000059C6  89C3              mov bx,ax
000059C8  81C3AF01          add bx,0x1af
000059CC  8B4706            mov ax,[bx+0x6]
000059CF  88E0              mov al,ah
000059D1  30E4              xor ah,ah
000059D3  8846FF            mov [bp-0x1],al
000059D6  E9AF01            jmp word 0x5b88
000059D9  8A46FD            mov al,[bp-0x3]
000059DC  2404              and al,0x4
000059DE  84C0              test al,al
000059E0  743D              jz 0x5a1f
000059E2  8A46FF            mov al,[bp-0x1]
000059E5  30E4              xor ah,ah
000059E7  89C2              mov dx,ax
000059E9  D1E0              shl ax,1
000059EB  D1E0              shl ax,1
000059ED  01D0              add ax,dx
000059EF  D1E0              shl ax,1
000059F1  89C3              mov bx,ax
000059F3  81C3AF01          add bx,0x1af
000059F7  8A4704            mov al,[bx+0x4]
000059FA  8846FE            mov [bp-0x2],al
000059FD  8A46FF            mov al,[bp-0x1]
00005A00  30E4              xor ah,ah
00005A02  89C2              mov dx,ax
00005A04  D1E0              shl ax,1
00005A06  D1E0              shl ax,1
00005A08  01D0              add ax,dx
00005A0A  D1E0              shl ax,1
00005A0C  89C3              mov bx,ax
00005A0E  81C3AF01          add bx,0x1af
00005A12  8B4704            mov ax,[bx+0x4]
00005A15  88E0              mov al,ah
00005A17  30E4              xor ah,ah
00005A19  8846FF            mov [bp-0x1],al
00005A1C  E96901            jmp word 0x5b88
00005A1F  8A46FB            mov al,[bp-0x5]
00005A22  2402              and al,0x2
00005A24  84C0              test al,al
00005A26  7434              jz 0x5a5c
00005A28  8A46FF            mov al,[bp-0x1]
00005A2B  3C47              cmp al,0x47
00005A2D  0F822B00          jc word 0x5a5c
00005A31  8A46FF            mov al,[bp-0x1]
00005A34  3C53              cmp al,0x53
00005A36  7724              ja 0x5a5c
00005A38  B0E0              mov al,0xe0
00005A3A  8846FE            mov [bp-0x2],al
00005A3D  8A46FF            mov al,[bp-0x1]
00005A40  30E4              xor ah,ah
00005A42  89C2              mov dx,ax
00005A44  D1E0              shl ax,1
00005A46  D1E0              shl ax,1
00005A48  01D0              add ax,dx
00005A4A  D1E0              shl ax,1
00005A4C  89C3              mov bx,ax
00005A4E  8B87AF01          mov ax,[bx+0x1af]
00005A52  88E0              mov al,ah
00005A54  30E4              xor ah,ah
00005A56  8846FF            mov [bp-0x1],al
00005A59  E92C01            jmp word 0x5b88
00005A5C  8A46FD            mov al,[bp-0x3]
00005A5F  2403              and al,0x3
00005A61  84C0              test al,al
00005A63  0F849200          jz word 0x5af9
00005A67  8A46FF            mov al,[bp-0x1]
00005A6A  30E4              xor ah,ah
00005A6C  89C2              mov dx,ax
00005A6E  D1E0              shl ax,1
00005A70  D1E0              shl ax,1
00005A72  01D0              add ax,dx
00005A74  D1E0              shl ax,1
00005A76  89C3              mov bx,ax
00005A78  81C3AF01          add bx,0x1af
00005A7C  8A46FD            mov al,[bp-0x3]
00005A7F  224708            and al,[bx+0x8]
00005A82  84C0              test al,al
00005A84  7436              jz 0x5abc
00005A86  8A46FF            mov al,[bp-0x1]
00005A89  30E4              xor ah,ah
00005A8B  89C2              mov dx,ax
00005A8D  D1E0              shl ax,1
00005A8F  D1E0              shl ax,1
00005A91  01D0              add ax,dx
00005A93  D1E0              shl ax,1
00005A95  89C3              mov bx,ax
00005A97  8A87AF01          mov al,[bx+0x1af]
00005A9B  8846FE            mov [bp-0x2],al
00005A9E  8A46FF            mov al,[bp-0x1]
00005AA1  30E4              xor ah,ah
00005AA3  89C2              mov dx,ax
00005AA5  D1E0              shl ax,1
00005AA7  D1E0              shl ax,1
00005AA9  01D0              add ax,dx
00005AAB  D1E0              shl ax,1
00005AAD  89C3              mov bx,ax
00005AAF  8B87AF01          mov ax,[bx+0x1af]
00005AB3  88E0              mov al,ah
00005AB5  30E4              xor ah,ah
00005AB7  8846FF            mov [bp-0x1],al
00005ABA  EB3A              jmp short 0x5af6
00005ABC  8A46FF            mov al,[bp-0x1]
00005ABF  30E4              xor ah,ah
00005AC1  89C2              mov dx,ax
00005AC3  D1E0              shl ax,1
00005AC5  D1E0              shl ax,1
00005AC7  01D0              add ax,dx
00005AC9  D1E0              shl ax,1
00005ACB  89C3              mov bx,ax
00005ACD  81C3AF01          add bx,0x1af
00005AD1  8A4702            mov al,[bx+0x2]
00005AD4  8846FE            mov [bp-0x2],al
00005AD7  8A46FF            mov al,[bp-0x1]
00005ADA  30E4              xor ah,ah
00005ADC  89C2              mov dx,ax
00005ADE  D1E0              shl ax,1
00005AE0  D1E0              shl ax,1
00005AE2  01D0              add ax,dx
00005AE4  D1E0              shl ax,1
00005AE6  89C3              mov bx,ax
00005AE8  81C3AF01          add bx,0x1af
00005AEC  8B4702            mov ax,[bx+0x2]
00005AEF  88E0              mov al,ah
00005AF1  30E4              xor ah,ah
00005AF3  8846FF            mov [bp-0x1],al
00005AF6  E98F00            jmp word 0x5b88
00005AF9  8A46FF            mov al,[bp-0x1]
00005AFC  30E4              xor ah,ah
00005AFE  89C2              mov dx,ax
00005B00  D1E0              shl ax,1
00005B02  D1E0              shl ax,1
00005B04  01D0              add ax,dx
00005B06  D1E0              shl ax,1
00005B08  89C3              mov bx,ax
00005B0A  81C3AF01          add bx,0x1af
00005B0E  8A46FD            mov al,[bp-0x3]
00005B11  224708            and al,[bx+0x8]
00005B14  84C0              test al,al
00005B16  743C              jz 0x5b54
00005B18  8A46FF            mov al,[bp-0x1]
00005B1B  30E4              xor ah,ah
00005B1D  89C2              mov dx,ax
00005B1F  D1E0              shl ax,1
00005B21  D1E0              shl ax,1
00005B23  01D0              add ax,dx
00005B25  D1E0              shl ax,1
00005B27  89C3              mov bx,ax
00005B29  81C3AF01          add bx,0x1af
00005B2D  8A4702            mov al,[bx+0x2]
00005B30  8846FE            mov [bp-0x2],al
00005B33  8A46FF            mov al,[bp-0x1]
00005B36  30E4              xor ah,ah
00005B38  89C2              mov dx,ax
00005B3A  D1E0              shl ax,1
00005B3C  D1E0              shl ax,1
00005B3E  01D0              add ax,dx
00005B40  D1E0              shl ax,1
00005B42  89C3              mov bx,ax
00005B44  81C3AF01          add bx,0x1af
00005B48  8B4702            mov ax,[bx+0x2]
00005B4B  88E0              mov al,ah
00005B4D  30E4              xor ah,ah
00005B4F  8846FF            mov [bp-0x1],al
00005B52  EB34              jmp short 0x5b88
00005B54  8A46FF            mov al,[bp-0x1]
00005B57  30E4              xor ah,ah
00005B59  89C2              mov dx,ax
00005B5B  D1E0              shl ax,1
00005B5D  D1E0              shl ax,1
00005B5F  01D0              add ax,dx
00005B61  D1E0              shl ax,1
00005B63  89C3              mov bx,ax
00005B65  8A87AF01          mov al,[bx+0x1af]
00005B69  8846FE            mov [bp-0x2],al
00005B6C  8A46FF            mov al,[bp-0x1]
00005B6F  30E4              xor ah,ah
00005B71  89C2              mov dx,ax
00005B73  D1E0              shl ax,1
00005B75  D1E0              shl ax,1
00005B77  01D0              add ax,dx
00005B79  D1E0              shl ax,1
00005B7B  89C3              mov bx,ax
00005B7D  8B87AF01          mov ax,[bx+0x1af]
00005B81  88E0              mov al,ah
00005B83  30E4              xor ah,ah
00005B85  8846FF            mov [bp-0x1],al
00005B88  B84000            mov ax,0x40
00005B8B  50                push ax
00005B8C  E8CEAA            call word 0x65d
00005B8F  44                inc sp
00005B90  44                inc sp
00005B91  8A46FF            mov al,[bp-0x1]
00005B94  84C0              test al,al
00005B96  7515              jnz 0x5bad
00005B98  8A46FE            mov al,[bp-0x2]
00005B9B  84C0              test al,al
00005B9D  750E              jnz 0x5bad
00005B9F  BB81D2            mov bx,0xd281
00005BA2  53                push bx
00005BA3  B80400            mov ax,0x4
00005BA6  50                push ax
00005BA7  E880AD            call word 0x92a
00005BAA  83C404            add sp,byte +0x4
00005BAD  8A46FE            mov al,[bp-0x2]
00005BB0  30E4              xor ah,ah
00005BB2  50                push ax
00005BB3  8A46FF            mov al,[bp-0x1]
00005BB6  30E4              xor ah,ah
00005BB8  50                push ax
00005BB9  E88100            call word 0x5c3d
00005BBC  83C404            add sp,byte +0x4
00005BBF  EB59              jmp short 0x5c1a
00005BC1  EB57              jmp short 0x5c1a
00005BC3  2C1D              sub al,0x1d
00005BC5  0F84B4FB          jz word 0x577d
00005BC9  2C0D              sub al,0xd
00005BCB  0F846AFB          jz word 0x5739
00005BCF  2C0C              sub al,0xc
00005BD1  0F8486FB          jz word 0x575b
00005BD5  2C02              sub al,0x2
00005BD7  0F8424FC          jz word 0x57ff
00005BDB  2C02              sub al,0x2
00005BDD  0F8428FB          jz word 0x5709
00005BE1  2C0B              sub al,0xb
00005BE3  0F8488FC          jz word 0x586f
00005BE7  2C01              sub al,0x1
00005BE9  0F84C4FC          jz word 0x58b1
00005BED  2C57              sub al,0x57
00005BEF  0F84CBFB          jz word 0x57be
00005BF3  2C0D              sub al,0xd
00005BF5  0F8451FB          jz word 0x574a
00005BF9  2C0C              sub al,0xc
00005BFB  0F846DFB          jz word 0x576c
00005BFF  2C02              sub al,0x2
00005C01  0F8432FC          jz word 0x5837
00005C05  2C02              sub al,0x2
00005C07  0F841DFB          jz word 0x5728
00005C0B  2C0B              sub al,0xb
00005C0D  0F8486FC          jz word 0x5897
00005C11  2C01              sub al,0x1
00005C13  0F84FDFC          jz word 0x5914
00005C17  E928FD            jmp word 0x5942
00005C1A  8A46FF            mov al,[bp-0x1]
00005C1D  247F              and al,0x7f
00005C1F  3C1D              cmp al,0x1d
00005C21  7408              jz 0x5c2b
00005C23  8A46FB            mov al,[bp-0x5]
00005C26  24FE              and al,0xfe
00005C28  8846FB            mov [bp-0x5],al
00005C2B  8A46FB            mov al,[bp-0x5]
00005C2E  24FD              and al,0xfd
00005C30  8846FB            mov [bp-0x5],al
00005C33  8A46FB            mov al,[bp-0x5]
00005C36  A29600            mov [0x96],al
00005C39  89EC              mov sp,bp
00005C3B  5D                pop bp
00005C3C  C3                ret
00005C3D  55                push bp
00005C3E  89E5              mov bp,sp
00005C40  83C4F4            add sp,byte -0xc
00005C43  B84000            mov ax,0x40
00005C46  50                push ax
00005C47  E813AA            call word 0x65d
00005C4A  44                inc sp
00005C4B  44                inc sp
00005C4C  8946F4            mov [bp-0xc],ax
00005C4F  A18000            mov ax,[0x80]
00005C52  8946FE            mov [bp-0x2],ax
00005C55  A18200            mov ax,[0x82]
00005C58  8946FC            mov [bp-0x4],ax
00005C5B  A11A00            mov ax,[0x1a]
00005C5E  8946FA            mov [bp-0x6],ax
00005C61  A11C00            mov ax,[0x1c]
00005C64  8946F8            mov [bp-0x8],ax
00005C67  8B46F8            mov ax,[bp-0x8]
00005C6A  8946F6            mov [bp-0xa],ax
00005C6D  8B46F8            mov ax,[bp-0x8]
00005C70  40                inc ax
00005C71  40                inc ax
00005C72  8946F8            mov [bp-0x8],ax
00005C75  8B46F8            mov ax,[bp-0x8]
00005C78  3B46FC            cmp ax,[bp-0x4]
00005C7B  7206              jc 0x5c83
00005C7D  8B46FE            mov ax,[bp-0x2]
00005C80  8946F8            mov [bp-0x8],ax
00005C83  8B46F8            mov ax,[bp-0x8]
00005C86  3B46FA            cmp ax,[bp-0x6]
00005C89  750E              jnz 0x5c99
00005C8B  FF76F4            push word [bp-0xc]
00005C8E  E8CCA9            call word 0x65d
00005C91  44                inc sp
00005C92  44                inc sp
00005C93  31C0              xor ax,ax
00005C95  89EC              mov sp,bp
00005C97  5D                pop bp
00005C98  C3                ret
00005C99  8B5EF6            mov bx,[bp-0xa]
00005C9C  8A4606            mov al,[bp+0x6]
00005C9F  8807              mov [bx],al
00005CA1  8B46F6            mov ax,[bp-0xa]
00005CA4  89C3              mov bx,ax
00005CA6  8A4604            mov al,[bp+0x4]
00005CA9  884701            mov [bx+0x1],al
00005CAC  8B46F8            mov ax,[bp-0x8]
00005CAF  A31C00            mov [0x1c],ax
00005CB2  FF76F4            push word [bp-0xc]
00005CB5  E8A5A9            call word 0x65d
00005CB8  44                inc sp
00005CB9  44                inc sp
00005CBA  B80100            mov ax,0x1
00005CBD  89EC              mov sp,bp
00005CBF  5D                pop bp
00005CC0  C3                ret
00005CC1  55                push bp
00005CC2  89E5              mov bp,sp
00005CC4  83C4FA            add sp,byte -0x6
00005CC7  31C0              xor ax,ax
00005CC9  894604            mov [bp+0x4],ax
00005CCC  B86400            mov ax,0x64
00005CCF  50                push ax
00005CD0  E856A8            call word 0x529
00005CD3  44                inc sp
00005CD4  44                inc sp
00005CD5  8846FF            mov [bp-0x1],al
00005CD8  8A46FF            mov al,[bp-0x1]
00005CDB  2421              and al,0x21
00005CDD  3C21              cmp al,0x21
00005CDF  7404              jz 0x5ce5
00005CE1  89EC              mov sp,bp
00005CE3  5D                pop bp
00005CE4  C3                ret
00005CE5  B86000            mov ax,0x60
00005CE8  50                push ax
00005CE9  E83DA8            call word 0x529
00005CEC  44                inc sp
00005CED  44                inc sp
00005CEE  8846FF            mov [bp-0x1],al
00005CF1  A02600            mov al,[0x26]
00005CF4  8846FC            mov [bp-0x4],al
00005CF7  A02700            mov al,[0x27]
00005CFA  8846FB            mov [bp-0x5],al
00005CFD  8A46FB            mov al,[bp-0x5]
00005D00  2480              and al,0x80
00005D02  3C80              cmp al,0x80
00005D04  7404              jz 0x5d0a
00005D06  89EC              mov sp,bp
00005D08  5D                pop bp
00005D09  C3                ret
00005D0A  8A46FB            mov al,[bp-0x5]
00005D0D  2407              and al,0x7
00005D0F  8846FD            mov [bp-0x3],al
00005D12  8A46FC            mov al,[bp-0x4]
00005D15  2407              and al,0x7
00005D17  8846FE            mov [bp-0x2],al
00005D1A  8A46FE            mov al,[bp-0x2]
00005D1D  30E4              xor ah,ah
00005D1F  89C3              mov bx,ax
00005D21  8A46FF            mov al,[bp-0x1]
00005D24  884728            mov [bx+0x28],al
00005D27  8A46FE            mov al,[bp-0x2]
00005D2A  3A46FD            cmp al,[bp-0x3]
00005D2D  7263              jc 0x5d92
00005D2F  8A46FD            mov al,[bp-0x3]
00005D32  3C03              cmp al,0x3
00005D34  7529              jnz 0x5d5f
00005D36  A02800            mov al,[0x28]
00005D39  30E4              xor ah,ah
00005D3B  89460C            mov [bp+0xc],ax
00005D3E  A02900            mov al,[0x29]
00005D41  30E4              xor ah,ah
00005D43  88C4              mov ah,al
00005D45  30C0              xor al,al
00005D47  0B460C            or ax,[bp+0xc]
00005D4A  89460C            mov [bp+0xc],ax
00005D4D  A02A00            mov al,[0x2a]
00005D50  30E4              xor ah,ah
00005D52  89460A            mov [bp+0xa],ax
00005D55  A02B00            mov al,[0x2b]
00005D58  30E4              xor ah,ah
00005D5A  894608            mov [bp+0x8],ax
00005D5D  EB18              jmp short 0x5d77
00005D5F  A02800            mov al,[0x28]
00005D62  30E4              xor ah,ah
00005D64  89460C            mov [bp+0xc],ax
00005D67  A02900            mov al,[0x29]
00005D6A  30E4              xor ah,ah
00005D6C  89460A            mov [bp+0xa],ax
00005D6F  A02A00            mov al,[0x2a]
00005D72  30E4              xor ah,ah
00005D74  894608            mov [bp+0x8],ax
00005D77  31C0              xor ax,ax
00005D79  894606            mov [bp+0x6],ax
00005D7C  30C0              xor al,al
00005D7E  8846FC            mov [bp-0x4],al
00005D81  8A46FB            mov al,[bp-0x5]
00005D84  2480              and al,0x80
00005D86  84C0              test al,al
00005D88  7406              jz 0x5d90
00005D8A  B80100            mov ax,0x1
00005D8D  894604            mov [bp+0x4],ax
00005D90  EB07              jmp short 0x5d99
00005D92  8A46FC            mov al,[bp-0x4]
00005D95  40                inc ax
00005D96  8846FC            mov [bp-0x4],al
00005D99  8A46FC            mov al,[bp-0x4]
00005D9C  A22600            mov [0x26],al
00005D9F  89EC              mov sp,bp
00005DA1  5D                pop bp
00005DA2  C3                ret
00005DA3  55                push bp
00005DA4  89E5              mov bp,sp
00005DA6  83C4EC            add sp,byte -0x14
00005DA9  B84000            mov ax,0x40
00005DAC  50                push ax
00005DAD  B80E00            mov ax,0xe
00005DB0  50                push ax
00005DB1  E839A8            call word 0x5ed
00005DB4  83C404            add sp,byte +0x4
00005DB7  8946EC            mov [bp-0x14],ax
00005DBA  4C                dec sp
00005DBB  8A4608            mov al,[bp+0x8]
00005DBE  30E4              xor ah,ah
00005DC0  B91E00            mov cx,0x1e
00005DC3  F7E9              imul cx
00005DC5  89C3              mov bx,ax
00005DC7  8A874201          mov al,[bx+0x142]
00005DCB  8846EB            mov [bp-0x15],al
00005DCE  4C                dec sp
00005DCF  FF7604            push word [bp+0x4]
00005DD2  8B4606            mov ax,[bp+0x6]
00005DD5  50                push ax
00005DD6  E814A8            call word 0x5ed
00005DD9  83C404            add sp,byte +0x4
00005DDC  8946F0            mov [bp-0x10],ax
00005DDF  8B46F0            mov ax,[bp-0x10]
00005DE2  3D4A00            cmp ax,0x4a
00005DE5  7504              jnz 0x5deb
00005DE7  B001              mov al,0x1
00005DE9  EB02              jmp short 0x5ded
00005DEB  30C0              xor al,al
00005DED  30E4              xor ah,ah
00005DEF  8946EE            mov [bp-0x12],ax
00005DF2  8B46F0            mov ax,[bp-0x10]
00005DF5  3D1A00            cmp ax,0x1a
00005DF8  7307              jnc 0x5e01
00005DFA  B80100            mov ax,0x1
00005DFD  89EC              mov sp,bp
00005DFF  5D                pop bp
00005E00  C3                ret
00005E01  8B46F0            mov ax,[bp-0x10]
00005E04  3D1A00            cmp ax,0x1a
00005E07  0F82DB01          jc word 0x5fe6
00005E0B  83C4FC            add sp,byte -0x4
00005E0E  FF7604            push word [bp+0x4]
00005E11  8B4606            mov ax,[bp+0x6]
00005E14  50                push ax
00005E15  B81A00            mov ax,0x1a
00005E18  50                push ax
00005E19  E8F2A7            call word 0x60e
00005E1C  83C406            add sp,byte +0x6
00005E1F  8A4608            mov al,[bp+0x8]
00005E22  30E4              xor ah,ah
00005E24  B91E00            mov cx,0x1e
00005E27  F7E9              imul cx
00005E29  89C3              mov bx,ax
00005E2B  8B9F4801          mov bx,[bx+0x148]
00005E2F  895EE8            mov [bp-0x18],bx
00005E32  8A46EB            mov al,[bp-0x15]
00005E35  3C02              cmp al,0x2
00005E37  0F85DB00          jnz word 0x5f16
00005E3B  8A4608            mov al,[bp+0x8]
00005E3E  30E4              xor ah,ah
00005E40  B91E00            mov cx,0x1e
00005E43  F7E9              imul cx
00005E45  89C3              mov bx,ax
00005E47  8B9F5401          mov bx,[bx+0x154]
00005E4B  895EF6            mov [bp-0xa],bx
00005E4E  8A4608            mov al,[bp+0x8]
00005E51  30E4              xor ah,ah
00005E53  B91E00            mov cx,0x1e
00005E56  F7E9              imul cx
00005E58  89C3              mov bx,ax
00005E5A  8B9F5201          mov bx,[bx+0x152]
00005E5E  895EF4            mov [bp-0xc],bx
00005E61  8A4608            mov al,[bp+0x8]
00005E64  30E4              xor ah,ah
00005E66  B91E00            mov cx,0x1e
00005E69  F7E9              imul cx
00005E6B  89C3              mov bx,ax
00005E6D  8B9F5601          mov bx,[bx+0x156]
00005E71  895EF2            mov [bp-0xe],bx
00005E74  8A4608            mov al,[bp+0x8]
00005E77  30E4              xor ah,ah
00005E79  B91E00            mov cx,0x1e
00005E7C  F7E9              imul cx
00005E7E  89C3              mov bx,ax
00005E80  8B875801          mov ax,[bx+0x158]
00005E84  8B9F5A01          mov bx,[bx+0x15a]
00005E88  8946FC            mov [bp-0x4],ax
00005E8B  895EFE            mov [bp-0x2],bx
00005E8E  8A4608            mov al,[bp+0x8]
00005E91  30E4              xor ah,ah
00005E93  B91E00            mov cx,0x1e
00005E96  F7E9              imul cx
00005E98  89C3              mov bx,ax
00005E9A  8B875C01          mov ax,[bx+0x15c]
00005E9E  8B9F5E01          mov bx,[bx+0x15e]
00005EA2  8946F8            mov [bp-0x8],ax
00005EA5  895EFA            mov [bp-0x6],bx
00005EA8  8B46F8            mov ax,[bp-0x8]
00005EAB  8B5EFA            mov bx,[bp-0x6]
00005EAE  E834A2            call word 0xe5
00005EB1  7550              jnz 0x5f03
00005EB3  8B46F4            mov ax,[bp-0xc]
00005EB6  31DB              xor bx,bx
00005EB8  53                push bx
00005EB9  50                push ax
00005EBA  8B46F2            mov ax,[bp-0xe]
00005EBD  31DB              xor bx,bx
00005EBF  53                push bx
00005EC0  50                push ax
00005EC1  8B46FC            mov ax,[bp-0x4]
00005EC4  8B5EFE            mov bx,[bp-0x2]
00005EC7  8D7EDE            lea di,[bp-0x22]
00005ECA  E872A2            call word 0x13f
00005ECD  83C404            add sp,byte +0x4
00005ED0  8D7EE2            lea di,[bp-0x1e]
00005ED3  E869A2            call word 0x13f
00005ED6  83C404            add sp,byte +0x4
00005ED9  53                push bx
00005EDA  50                push ax
00005EDB  B8FF3F            mov ax,0x3fff
00005EDE  31DB              xor bx,bx
00005EE0  53                push bx
00005EE1  50                push ax
00005EE2  8B46E2            mov ax,[bp-0x1e]
00005EE5  8B5EE4            mov bx,[bp-0x1c]
00005EE8  8D7EDE            lea di,[bp-0x22]
00005EEB  E8AEA1            call word 0x9c
00005EEE  7604              jna 0x5ef4
00005EF0  B001              mov al,0x1
00005EF2  EB02              jmp short 0x5ef6
00005EF4  30C0              xor al,al
00005EF6  83C408            add sp,byte +0x8
00005EF9  30E4              xor ah,ah
00005EFB  99                cwd
00005EFC  89D3              mov bx,dx
00005EFE  E8E4A1            call word 0xe5
00005F01  740D              jz 0x5f10
00005F03  31C0              xor ax,ax
00005F05  8946E6            mov [bp-0x1a],ax
00005F08  B8FF3F            mov ax,0x3fff
00005F0B  8946F6            mov [bp-0xa],ax
00005F0E  EB06              jmp short 0x5f16
00005F10  B80200            mov ax,0x2
00005F13  8946E6            mov [bp-0x1a],ax
00005F16  8A46EB            mov al,[bp-0x15]
00005F19  3C03              cmp al,0x3
00005F1B  7530              jnz 0x5f4d
00005F1D  B8FFFF            mov ax,0xffff
00005F20  8946F6            mov [bp-0xa],ax
00005F23  B8FFFF            mov ax,0xffff
00005F26  8946F4            mov [bp-0xc],ax
00005F29  B8FFFF            mov ax,0xffff
00005F2C  8946F2            mov [bp-0xe],ax
00005F2F  B8FFFF            mov ax,0xffff
00005F32  BBFFFF            mov bx,0xffff
00005F35  8946FC            mov [bp-0x4],ax
00005F38  895EFE            mov [bp-0x2],bx
00005F3B  B8FFFF            mov ax,0xffff
00005F3E  BBFFFF            mov bx,0xffff
00005F41  8946F8            mov [bp-0x8],ax
00005F44  895EFA            mov [bp-0x6],bx
00005F47  B87400            mov ax,0x74
00005F4A  8946E6            mov [bp-0x1a],ax
00005F4D  FF7604            push word [bp+0x4]
00005F50  8B4606            mov ax,[bp+0x6]
00005F53  40                inc ax
00005F54  40                inc ax
00005F55  50                push ax
00005F56  FF76E6            push word [bp-0x1a]
00005F59  E8B2A6            call word 0x60e
00005F5C  83C406            add sp,byte +0x6
00005F5F  FF7604            push word [bp+0x4]
00005F62  8B4606            mov ax,[bp+0x6]
00005F65  050400            add ax,0x4
00005F68  50                push ax
00005F69  8B46F6            mov ax,[bp-0xa]
00005F6C  31DB              xor bx,bx
00005F6E  53                push bx
00005F6F  50                push ax
00005F70  E8F4A0            call word 0x67
00005F73  83C408            add sp,byte +0x8
00005F76  FF7604            push word [bp+0x4]
00005F79  8B4606            mov ax,[bp+0x6]
00005F7C  050800            add ax,0x8
00005F7F  50                push ax
00005F80  8B46F4            mov ax,[bp-0xc]
00005F83  31DB              xor bx,bx
00005F85  53                push bx
00005F86  50                push ax
00005F87  E8DDA0            call word 0x67
00005F8A  83C408            add sp,byte +0x8
00005F8D  FF7604            push word [bp+0x4]
00005F90  8B4606            mov ax,[bp+0x6]
00005F93  050C00            add ax,0xc
00005F96  50                push ax
00005F97  8B46F2            mov ax,[bp-0xe]
00005F9A  31DB              xor bx,bx
00005F9C  53                push bx
00005F9D  50                push ax
00005F9E  E8C6A0            call word 0x67
00005FA1  83C408            add sp,byte +0x8
00005FA4  FF7604            push word [bp+0x4]
00005FA7  8B4606            mov ax,[bp+0x6]
00005FAA  051000            add ax,0x10
00005FAD  50                push ax
00005FAE  FF76FE            push word [bp-0x2]
00005FB1  FF76FC            push word [bp-0x4]
00005FB4  E8B0A0            call word 0x67
00005FB7  83C408            add sp,byte +0x8
00005FBA  FF7604            push word [bp+0x4]
00005FBD  8B4606            mov ax,[bp+0x6]
00005FC0  051400            add ax,0x14
00005FC3  50                push ax
00005FC4  FF76FA            push word [bp-0x6]
00005FC7  FF76F8            push word [bp-0x8]
00005FCA  E89AA0            call word 0x67
00005FCD  83C408            add sp,byte +0x8
00005FD0  FF7604            push word [bp+0x4]
00005FD3  8B4606            mov ax,[bp+0x6]
00005FD6  051800            add ax,0x18
00005FD9  50                push ax
00005FDA  FF76E8            push word [bp-0x18]
00005FDD  E82EA6            call word 0x60e
00005FE0  83C406            add sp,byte +0x6
00005FE3  83C404            add sp,byte +0x4
00005FE6  8B46F0            mov ax,[bp-0x10]
00005FE9  3D1E00            cmp ax,0x1e
00005FEC  0F82BC01          jc word 0x61ac
00005FF0  83C4F2            add sp,byte -0xe
00005FF3  FF7604            push word [bp+0x4]
00005FF6  8B4606            mov ax,[bp+0x6]
00005FF9  50                push ax
00005FFA  B81E00            mov ax,0x1e
00005FFD  50                push ax
00005FFE  E80DA6            call word 0x60e
00006001  83C406            add sp,byte +0x6
00006004  FF7604            push word [bp+0x4]
00006007  8B4606            mov ax,[bp+0x6]
0000600A  051C00            add ax,0x1c
0000600D  50                push ax
0000600E  FF76EC            push word [bp-0x14]
00006011  E8FAA5            call word 0x60e
00006014  83C406            add sp,byte +0x6
00006017  FF7604            push word [bp+0x4]
0000601A  8B4606            mov ax,[bp+0x6]
0000601D  051A00            add ax,0x1a
00006020  50                push ax
00006021  B84402            mov ax,0x244
00006024  50                push ax
00006025  E8E6A5            call word 0x60e
00006028  83C406            add sp,byte +0x6
0000602B  8A4608            mov al,[bp+0x8]
0000602E  30E4              xor ah,ah
00006030  D1E8              shr ax,1
00006032  8846E9            mov [bp-0x17],al
00006035  8A46E9            mov al,[bp-0x17]
00006038  30E4              xor ah,ah
0000603A  B103              mov cl,0x3
0000603C  D3E0              shl ax,cl
0000603E  89C3              mov bx,ax
00006040  8B9F2401          mov bx,[bx+0x124]
00006044  895EE0            mov [bp-0x20],bx
00006047  8A46E9            mov al,[bp-0x17]
0000604A  30E4              xor ah,ah
0000604C  B103              mov cl,0x3
0000604E  D3E0              shl ax,cl
00006050  89C3              mov bx,ax
00006052  8B9F2601          mov bx,[bx+0x126]
00006056  895EDE            mov [bp-0x22],bx
00006059  8A46E9            mov al,[bp-0x17]
0000605C  30E4              xor ah,ah
0000605E  B103              mov cl,0x3
00006060  D3E0              shl ax,cl
00006062  89C3              mov bx,ax
00006064  8A872801          mov al,[bx+0x128]
00006068  8846E7            mov [bp-0x19],al
0000606B  8A4608            mov al,[bp+0x8]
0000606E  30E4              xor ah,ah
00006070  B91E00            mov cx,0x1e
00006073  F7E9              imul cx
00006075  89C3              mov bx,ax
00006077  8A874601          mov al,[bx+0x146]
0000607B  8846E6            mov [bp-0x1a],al
0000607E  8A4608            mov al,[bp+0x8]
00006081  30E4              xor ah,ah
00006083  B91E00            mov cx,0x1e
00006086  F7E9              imul cx
00006088  89C3              mov bx,ax
0000608A  8A874A01          mov al,[bx+0x14a]
0000608E  8846E3            mov [bp-0x1d],al
00006091  B81000            mov ax,0x10
00006094  8946DC            mov [bp-0x24],ax
00006097  8A46E6            mov al,[bp-0x1a]
0000609A  3C01              cmp al,0x1
0000609C  7504              jnz 0x60a2
0000609E  B001              mov al,0x1
000060A0  EB02              jmp short 0x60a4
000060A2  30C0              xor al,al
000060A4  30E4              xor ah,ah
000060A6  B107              mov cl,0x7
000060A8  D3E0              shl ax,cl
000060AA  0B46DC            or ax,[bp-0x24]
000060AD  8946DC            mov [bp-0x24],ax
000060B0  8A46EB            mov al,[bp-0x15]
000060B3  3C02              cmp al,0x2
000060B5  754F              jnz 0x6106
000060B7  8A46E3            mov al,[bp-0x1d]
000060BA  84C0              test al,al
000060BC  7504              jnz 0x60c2
000060BE  30C0              xor al,al
000060C0  EB02              jmp short 0x60c4
000060C2  B001              mov al,0x1
000060C4  30E4              xor ah,ah
000060C6  B103              mov cl,0x3
000060C8  D3E0              shl ax,cl
000060CA  0B46DC            or ax,[bp-0x24]
000060CD  8946DC            mov [bp-0x24],ax
000060D0  8A46E3            mov al,[bp-0x1d]
000060D3  3C01              cmp al,0x1
000060D5  7504              jnz 0x60db
000060D7  B001              mov al,0x1
000060D9  EB02              jmp short 0x60dd
000060DB  30C0              xor al,al
000060DD  30E4              xor ah,ah
000060DF  88C4              mov ah,al
000060E1  30C0              xor al,al
000060E3  D1E0              shl ax,1
000060E5  0B46DC            or ax,[bp-0x24]
000060E8  8946DC            mov [bp-0x24],ax
000060EB  8A46E3            mov al,[bp-0x1d]
000060EE  3C03              cmp al,0x3
000060F0  7504              jnz 0x60f6
000060F2  B003              mov al,0x3
000060F4  EB02              jmp short 0x60f8
000060F6  30C0              xor al,al
000060F8  30E4              xor ah,ah
000060FA  88C4              mov ah,al
000060FC  30C0              xor al,al
000060FE  D1E0              shl ax,1
00006100  0B46DC            or ax,[bp-0x24]
00006103  8946DC            mov [bp-0x24],ax
00006106  8A46EB            mov al,[bp-0x15]
00006109  3C03              cmp al,0x3
0000610B  7510              jnz 0x611d
0000610D  8B46DC            mov ax,[bp-0x24]
00006110  0C20              or al,0x20
00006112  8946DC            mov [bp-0x24],ax
00006115  8B46DC            mov ax,[bp-0x24]
00006118  0C40              or al,0x40
0000611A  8946DC            mov [bp-0x24],ax
0000611D  8B46E0            mov ax,[bp-0x20]
00006120  A34402            mov [0x244],ax
00006123  8B46DE            mov ax,[bp-0x22]
00006126  050600            add ax,0x6
00006129  A34602            mov [0x246],ax
0000612C  8A4608            mov al,[bp+0x8]
0000612F  30E4              xor ah,ah
00006131  2401              and al,0x1
00006133  0C0E              or al,0xe
00006135  30E4              xor ah,ah
00006137  B104              mov cl,0x4
00006139  D3E0              shl ax,cl
0000613B  A24802            mov [0x248],al
0000613E  B0CB              mov al,0xcb
00006140  A24902            mov [0x249],al
00006143  8A46E7            mov al,[bp-0x19]
00006146  A24A02            mov [0x24a],al
00006149  B001              mov al,0x1
0000614B  A24B02            mov [0x24b],al
0000614E  30C0              xor al,al
00006150  A24C02            mov [0x24c],al
00006153  30C0              xor al,al
00006155  A24D02            mov [0x24d],al
00006158  8B46DC            mov ax,[bp-0x24]
0000615B  A34E02            mov [0x24e],ax
0000615E  31C0              xor ax,ax
00006160  A35002            mov [0x250],ax
00006163  B011              mov al,0x11
00006165  A25202            mov [0x252],al
00006168  30C0              xor al,al
0000616A  8846E5            mov [bp-0x1b],al
0000616D  30C0              xor al,al
0000616F  8846E4            mov [bp-0x1c],al
00006172  EB1D              jmp short 0x6191
00006174  8A46E4            mov al,[bp-0x1c]
00006177  30E4              xor ah,ah
00006179  89C3              mov bx,ax
0000617B  8A46E5            mov al,[bp-0x1b]
0000617E  30E4              xor ah,ah
00006180  02874402          add al,[bx+0x244]
00006184  80D400            adc ah,0x0
00006187  8846E5            mov [bp-0x1b],al
0000618A  8A46E4            mov al,[bp-0x1c]
0000618D  40                inc ax
0000618E  8846E4            mov [bp-0x1c],al
00006191  8A46E4            mov al,[bp-0x1c]
00006194  3C0F              cmp al,0xf
00006196  72DC              jc 0x6174
00006198  31C0              xor ax,ax
0000619A  2A46E5            sub al,[bp-0x1b]
0000619D  80DC00            sbb ah,0x0
000061A0  8846E5            mov [bp-0x1b],al
000061A3  8A46E5            mov al,[bp-0x1b]
000061A6  A25302            mov [0x253],al
000061A9  83C40E            add sp,byte +0xe
000061AC  8B46F0            mov ax,[bp-0x10]
000061AF  3D4200            cmp ax,0x42
000061B2  0F826702          jc word 0x641d
000061B6  83C4FA            add sp,byte -0x6
000061B9  8A4608            mov al,[bp+0x8]
000061BC  30E4              xor ah,ah
000061BE  D1E8              shr ax,1
000061C0  8846E9            mov [bp-0x17],al
000061C3  8A46E9            mov al,[bp-0x17]
000061C6  30E4              xor ah,ah
000061C8  B103              mov cl,0x3
000061CA  D3E0              shl ax,cl
000061CC  89C3              mov bx,ax
000061CE  8A872201          mov al,[bx+0x122]
000061D2  8846E8            mov [bp-0x18],al
000061D5  8A46E9            mov al,[bp-0x17]
000061D8  30E4              xor ah,ah
000061DA  B103              mov cl,0x3
000061DC  D3E0              shl ax,cl
000061DE  89C3              mov bx,ax
000061E0  8B9F2401          mov bx,[bx+0x124]
000061E4  895EE4            mov [bp-0x1c],bx
000061E7  FF7604            push word [bp+0x4]
000061EA  E870A4            call word 0x65d
000061ED  44                inc sp
000061EE  44                inc sp
000061EF  8B4606            mov ax,[bp+0x6]
000061F2  89C3              mov bx,ax
000061F4  B8DDBE            mov ax,0xbedd
000061F7  89471E            mov [bx+0x1e],ax
000061FA  8B46EE            mov ax,[bp-0x12]
000061FD  85C0              test ax,ax
000061FF  7404              jz 0x6205
00006201  B02C              mov al,0x2c
00006203  EB02              jmp short 0x6207
00006205  B024              mov al,0x24
00006207  50                push ax
00006208  8B4606            mov ax,[bp+0x6]
0000620B  89C3              mov bx,ax
0000620D  8A46E2            mov al,[bp-0x1e]
00006210  884720            mov [bx+0x20],al
00006213  44                inc sp
00006214  44                inc sp
00006215  8B4606            mov ax,[bp+0x6]
00006218  89C3              mov bx,ax
0000621A  30C0              xor al,al
0000621C  884721            mov [bx+0x21],al
0000621F  8B4606            mov ax,[bp+0x6]
00006222  89C3              mov bx,ax
00006224  31C0              xor ax,ax
00006226  894722            mov [bx+0x22],ax
00006229  8A46E8            mov al,[bp-0x18]
0000622C  84C0              test al,al
0000622E  752A              jnz 0x625a
00006230  8B4606            mov ax,[bp+0x6]
00006233  89C3              mov bx,ax
00006235  B049              mov al,0x49
00006237  884724            mov [bx+0x24],al
0000623A  8B4606            mov ax,[bp+0x6]
0000623D  89C3              mov bx,ax
0000623F  B053              mov al,0x53
00006241  884725            mov [bx+0x25],al
00006244  8B4606            mov ax,[bp+0x6]
00006247  89C3              mov bx,ax
00006249  B041              mov al,0x41
0000624B  884726            mov [bx+0x26],al
0000624E  8B4606            mov ax,[bp+0x6]
00006251  89C3              mov bx,ax
00006253  B020              mov al,0x20
00006255  884727            mov [bx+0x27],al
00006258  EB00              jmp short 0x625a
0000625A  8A46EB            mov al,[bp-0x15]
0000625D  3C02              cmp al,0x2
0000625F  0F855200          jnz word 0x62b5
00006263  8B4606            mov ax,[bp+0x6]
00006266  89C3              mov bx,ax
00006268  B041              mov al,0x41
0000626A  884728            mov [bx+0x28],al
0000626D  8B4606            mov ax,[bp+0x6]
00006270  89C3              mov bx,ax
00006272  B054              mov al,0x54
00006274  884729            mov [bx+0x29],al
00006277  8B4606            mov ax,[bp+0x6]
0000627A  89C3              mov bx,ax
0000627C  B041              mov al,0x41
0000627E  88472A            mov [bx+0x2a],al
00006281  8B4606            mov ax,[bp+0x6]
00006284  89C3              mov bx,ax
00006286  B020              mov al,0x20
00006288  88472B            mov [bx+0x2b],al
0000628B  8B4606            mov ax,[bp+0x6]
0000628E  89C3              mov bx,ax
00006290  B020              mov al,0x20
00006292  88472C            mov [bx+0x2c],al
00006295  8B4606            mov ax,[bp+0x6]
00006298  89C3              mov bx,ax
0000629A  B020              mov al,0x20
0000629C  88472D            mov [bx+0x2d],al
0000629F  8B4606            mov ax,[bp+0x6]
000062A2  89C3              mov bx,ax
000062A4  B020              mov al,0x20
000062A6  88472E            mov [bx+0x2e],al
000062A9  8B4606            mov ax,[bp+0x6]
000062AC  89C3              mov bx,ax
000062AE  B020              mov al,0x20
000062B0  88472F            mov [bx+0x2f],al
000062B3  EB57              jmp short 0x630c
000062B5  8A46EB            mov al,[bp-0x15]
000062B8  3C03              cmp al,0x3
000062BA  7550              jnz 0x630c
000062BC  8B4606            mov ax,[bp+0x6]
000062BF  89C3              mov bx,ax
000062C1  B041              mov al,0x41
000062C3  884728            mov [bx+0x28],al
000062C6  8B4606            mov ax,[bp+0x6]
000062C9  89C3              mov bx,ax
000062CB  B054              mov al,0x54
000062CD  884729            mov [bx+0x29],al
000062D0  8B4606            mov ax,[bp+0x6]
000062D3  89C3              mov bx,ax
000062D5  B041              mov al,0x41
000062D7  88472A            mov [bx+0x2a],al
000062DA  8B4606            mov ax,[bp+0x6]
000062DD  89C3              mov bx,ax
000062DF  B050              mov al,0x50
000062E1  88472B            mov [bx+0x2b],al
000062E4  8B4606            mov ax,[bp+0x6]
000062E7  89C3              mov bx,ax
000062E9  B049              mov al,0x49
000062EB  88472C            mov [bx+0x2c],al
000062EE  8B4606            mov ax,[bp+0x6]
000062F1  89C3              mov bx,ax
000062F3  B020              mov al,0x20
000062F5  88472D            mov [bx+0x2d],al
000062F8  8B4606            mov ax,[bp+0x6]
000062FB  89C3              mov bx,ax
000062FD  B020              mov al,0x20
000062FF  88472E            mov [bx+0x2e],al
00006302  8B4606            mov ax,[bp+0x6]
00006305  89C3              mov bx,ax
00006307  B020              mov al,0x20
00006309  88472F            mov [bx+0x2f],al
0000630C  8A46E8            mov al,[bp-0x18]
0000630F  84C0              test al,al
00006311  7526              jnz 0x6339
00006313  8B4606            mov ax,[bp+0x6]
00006316  89C3              mov bx,ax
00006318  8B46E4            mov ax,[bp-0x1c]
0000631B  894730            mov [bx+0x30],ax
0000631E  8B4606            mov ax,[bp+0x6]
00006321  89C3              mov bx,ax
00006323  31C0              xor ax,ax
00006325  894732            mov [bx+0x32],ax
00006328  8B4606            mov ax,[bp+0x6]
0000632B  89C3              mov bx,ax
0000632D  31C0              xor ax,ax
0000632F  31F6              xor si,si
00006331  894734            mov [bx+0x34],ax
00006334  897736            mov [bx+0x36],si
00006337  EB00              jmp short 0x6339
00006339  8A4608            mov al,[bp+0x8]
0000633C  30E4              xor ah,ah
0000633E  2401              and al,0x1
00006340  50                push ax
00006341  8B4606            mov ax,[bp+0x6]
00006344  89C3              mov bx,ax
00006346  8A46E2            mov al,[bp-0x1e]
00006349  884738            mov [bx+0x38],al
0000634C  44                inc sp
0000634D  44                inc sp
0000634E  8B4606            mov ax,[bp+0x6]
00006351  89C3              mov bx,ax
00006353  30C0              xor al,al
00006355  884739            mov [bx+0x39],al
00006358  8B4606            mov ax,[bp+0x6]
0000635B  89C3              mov bx,ax
0000635D  31C0              xor ax,ax
0000635F  89473A            mov [bx+0x3a],ax
00006362  8B4606            mov ax,[bp+0x6]
00006365  89C3              mov bx,ax
00006367  31C0              xor ax,ax
00006369  31F6              xor si,si
0000636B  89473C            mov [bx+0x3c],ax
0000636E  89773E            mov [bx+0x3e],si
00006371  8B46EE            mov ax,[bp-0x12]
00006374  85C0              test ax,ax
00006376  741E              jz 0x6396
00006378  8B4606            mov ax,[bp+0x6]
0000637B  89C3              mov bx,ax
0000637D  31C0              xor ax,ax
0000637F  31F6              xor si,si
00006381  894740            mov [bx+0x40],ax
00006384  897742            mov [bx+0x42],si
00006387  8B4606            mov ax,[bp+0x6]
0000638A  89C3              mov bx,ax
0000638C  31C0              xor ax,ax
0000638E  31F6              xor si,si
00006390  894744            mov [bx+0x44],ax
00006393  897746            mov [bx+0x46],si
00006396  8B46EE            mov ax,[bp-0x12]
00006399  85C0              test ax,ax
0000639B  740C              jz 0x63a9
0000639D  8B4606            mov ax,[bp+0x6]
000063A0  89C3              mov bx,ax
000063A2  30C0              xor al,al
000063A4  884748            mov [bx+0x48],al
000063A7  EB0A              jmp short 0x63b3
000063A9  8B4606            mov ax,[bp+0x6]
000063AC  89C3              mov bx,ax
000063AE  30C0              xor al,al
000063B0  884740            mov [bx+0x40],al
000063B3  30C0              xor al,al
000063B5  8846E7            mov [bp-0x19],al
000063B8  B01E              mov al,0x1e
000063BA  8846E6            mov [bp-0x1a],al
000063BD  EB1F              jmp short 0x63de
000063BF  8B4606            mov ax,[bp+0x6]
000063C2  0246E6            add al,[bp-0x1a]
000063C5  80D400            adc ah,0x0
000063C8  89C3              mov bx,ax
000063CA  8A46E7            mov al,[bp-0x19]
000063CD  30E4              xor ah,ah
000063CF  0207              add al,[bx]
000063D1  80D400            adc ah,0x0
000063D4  8846E7            mov [bp-0x19],al
000063D7  8A46E6            mov al,[bp-0x1a]
000063DA  40                inc ax
000063DB  8846E6            mov [bp-0x1a],al
000063DE  8B46EE            mov ax,[bp-0x12]
000063E1  85C0              test ax,ax
000063E3  7404              jz 0x63e9
000063E5  B049              mov al,0x49
000063E7  EB02              jmp short 0x63eb
000063E9  B041              mov al,0x41
000063EB  3A46E6            cmp al,[bp-0x1a]
000063EE  77CF              ja 0x63bf
000063F0  31C0              xor ax,ax
000063F2  2A46E7            sub al,[bp-0x19]
000063F5  80DC00            sbb ah,0x0
000063F8  8846E7            mov [bp-0x19],al
000063FB  8B46EE            mov ax,[bp-0x12]
000063FE  85C0              test ax,ax
00006400  740D              jz 0x640f
00006402  8B4606            mov ax,[bp+0x6]
00006405  89C3              mov bx,ax
00006407  8A46E7            mov al,[bp-0x19]
0000640A  884749            mov [bx+0x49],al
0000640D  EB0B              jmp short 0x641a
0000640F  8B4606            mov ax,[bp+0x6]
00006412  89C3              mov bx,ax
00006414  8A46E7            mov al,[bp-0x19]
00006417  884741            mov [bx+0x41],al
0000641A  83C406            add sp,byte +0x6
0000641D  31C0              xor ax,ax
0000641F  89EC              mov sp,bp
00006421  5D                pop bp
00006422  C3                ret
00006423  55                push bp
00006424  89E5              mov bp,sp
00006426  83C4DC            add sp,byte -0x24
00006429  B84000            mov ax,0x40
0000642C  50                push ax
0000642D  B88E00            mov ax,0x8e
00006430  50                push ax
00006431  31C0              xor ax,ax
00006433  50                push ax
00006434  E8C4A1            call word 0x5fb
00006437  83C406            add sp,byte +0x6
0000643A  8A4610            mov al,[bp+0x10]
0000643D  3C80              cmp al,0x80
0000643F  7207              jc 0x6448
00006441  8A4610            mov al,[bp+0x10]
00006444  3C88              cmp al,0x88
00006446  7222              jc 0x646a
00006448  8A4610            mov al,[bp+0x10]
0000644B  30E4              xor ah,ah
0000644D  50                push ax
0000644E  8B4618            mov ax,[bp+0x18]
00006451  88E0              mov al,ah
00006453  30E4              xor ah,ah
00006455  50                push ax
00006456  BB4AD2            mov bx,0xd24a
00006459  53                push bx
0000645A  B80400            mov ax,0x4
0000645D  50                push ax
0000645E  E8C9A4            call word 0x92a
00006461  83C408            add sp,byte +0x8
00006464  83C400            add sp,byte +0x0
00006467  E9D807            jmp word 0x6c42
0000646A  8A4610            mov al,[bp+0x10]
0000646D  30E4              xor ah,ah
0000646F  0580FF            add ax,0xff80
00006472  89C3              mov bx,ax
00006474  8A873302          mov al,[bx+0x233]
00006478  8846DD            mov [bp-0x23],al
0000647B  8A46DD            mov al,[bp-0x23]
0000647E  3C08              cmp al,0x8
00006480  7222              jc 0x64a4
00006482  8A4610            mov al,[bp+0x10]
00006485  30E4              xor ah,ah
00006487  50                push ax
00006488  8B4618            mov ax,[bp+0x18]
0000648B  88E0              mov al,ah
0000648D  30E4              xor ah,ah
0000648F  50                push ax
00006490  BB0CD2            mov bx,0xd20c
00006493  53                push bx
00006494  B80400            mov ax,0x4
00006497  50                push ax
00006498  E88FA4            call word 0x92a
0000649B  83C408            add sp,byte +0x8
0000649E  83C400            add sp,byte +0x0
000064A1  E99E07            jmp word 0x6c42
000064A4  8B4618            mov ax,[bp+0x18]
000064A7  88E0              mov al,ah
000064A9  30E4              xor ah,ah
000064AB  E91907            jmp word 0x6bc7
000064AE  8A46DD            mov al,[bp-0x23]
000064B1  30E4              xor ah,ah
000064B3  50                push ax
000064B4  E87DC3            call word 0x2834
000064B7  44                inc sp
000064B8  44                inc sp
000064B9  83C400            add sp,byte +0x0
000064BC  E9B007            jmp word 0x6c6f
000064BF  E98007            jmp word 0x6c42
000064C2  B84000            mov ax,0x40
000064C5  50                push ax
000064C6  B87400            mov ax,0x74
000064C9  50                push ax
000064CA  E812A1            call word 0x5df
000064CD  83C404            add sp,byte +0x4
000064D0  8846DC            mov [bp-0x24],al
000064D3  8A46DC            mov al,[bp-0x24]
000064D6  30E4              xor ah,ah
000064D8  88C4              mov ah,al
000064DA  30C0              xor al,al
000064DC  50                push ax
000064DD  8A4618            mov al,[bp+0x18]
000064E0  30E4              xor ah,ah
000064E2  0B46DA            or ax,[bp-0x26]
000064E5  44                inc sp
000064E6  44                inc sp
000064E7  894618            mov [bp+0x18],ax
000064EA  B84000            mov ax,0x40
000064ED  50                push ax
000064EE  B87400            mov ax,0x74
000064F1  50                push ax
000064F2  31C0              xor ax,ax
000064F4  50                push ax
000064F5  E803A1            call word 0x5fb
000064F8  83C406            add sp,byte +0x6
000064FB  8A46DC            mov al,[bp-0x24]
000064FE  84C0              test al,al
00006500  7408              jz 0x650a
00006502  83C400            add sp,byte +0x0
00006505  E95B07            jmp word 0x6c63
00006508  EB06              jmp short 0x6510
0000650A  83C400            add sp,byte +0x0
0000650D  E96907            jmp word 0x6c79
00006510  E92F07            jmp word 0x6c42
00006513  8A4618            mov al,[bp+0x18]
00006516  30E4              xor ah,ah
00006518  8946DE            mov [bp-0x22],ax
0000651B  8B4616            mov ax,[bp+0x16]
0000651E  88E0              mov al,ah
00006520  30E4              xor ah,ah
00006522  8946F6            mov [bp-0xa],ax
00006525  8A4616            mov al,[bp+0x16]
00006528  30E4              xor ah,ah
0000652A  D1E0              shl ax,1
0000652C  D1E0              shl ax,1
0000652E  250003            and ax,0x300
00006531  0B46F6            or ax,[bp-0xa]
00006534  8946F6            mov [bp-0xa],ax
00006537  8A4616            mov al,[bp+0x16]
0000653A  243F              and al,0x3f
0000653C  30E4              xor ah,ah
0000653E  8946F2            mov [bp-0xe],ax
00006541  8B4614            mov ax,[bp+0x14]
00006544  88E0              mov al,ah
00006546  30E4              xor ah,ah
00006548  8946F4            mov [bp-0xc],ax
0000654B  8B4608            mov ax,[bp+0x8]
0000654E  8946F0            mov [bp-0x10],ax
00006551  8B4612            mov ax,[bp+0x12]
00006554  8946EE            mov [bp-0x12],ax
00006557  8B46DE            mov ax,[bp-0x22]
0000655A  3D8000            cmp ax,0x80
0000655D  770E              ja 0x656d
0000655F  8B46DE            mov ax,[bp-0x22]
00006562  85C0              test ax,ax
00006564  7407              jz 0x656d
00006566  8B46F2            mov ax,[bp-0xe]
00006569  85C0              test ax,ax
0000656B  751C              jnz 0x6589
0000656D  8B4618            mov ax,[bp+0x18]
00006570  88E0              mov al,ah
00006572  30E4              xor ah,ah
00006574  50                push ax
00006575  BBD4D1            mov bx,0xd1d4
00006578  53                push bx
00006579  B80400            mov ax,0x4
0000657C  50                push ax
0000657D  E8AAA3            call word 0x92a
00006580  83C406            add sp,byte +0x6
00006583  83C400            add sp,byte +0x0
00006586  E9B906            jmp word 0x6c42
00006589  8A46DD            mov al,[bp-0x23]
0000658C  30E4              xor ah,ah
0000658E  B91E00            mov cx,0x1e
00006591  F7E9              imul cx
00006593  89C3              mov bx,ax
00006595  8B9F4E01          mov bx,[bx+0x14e]
00006599  895EE6            mov [bp-0x1a],bx
0000659C  8A46DD            mov al,[bp-0x23]
0000659F  30E4              xor ah,ah
000065A1  B91E00            mov cx,0x1e
000065A4  F7E9              imul cx
000065A6  89C3              mov bx,ax
000065A8  8B9F4C01          mov bx,[bx+0x14c]
000065AC  895EE4            mov [bp-0x1c],bx
000065AF  8A46DD            mov al,[bp-0x23]
000065B2  30E4              xor ah,ah
000065B4  B91E00            mov cx,0x1e
000065B7  F7E9              imul cx
000065B9  89C3              mov bx,ax
000065BB  8B9F5001          mov bx,[bx+0x150]
000065BF  895EE2            mov [bp-0x1e],bx
000065C2  8B46F6            mov ax,[bp-0xa]
000065C5  3B46E6            cmp ax,[bp-0x1a]
000065C8  7310              jnc 0x65da
000065CA  8B46F4            mov ax,[bp-0xc]
000065CD  3B46E4            cmp ax,[bp-0x1c]
000065D0  7308              jnc 0x65da
000065D2  8B46F2            mov ax,[bp-0xe]
000065D5  3B46E2            cmp ax,[bp-0x1e]
000065D8  7625              jna 0x65ff
000065DA  FF76F2            push word [bp-0xe]
000065DD  FF76F4            push word [bp-0xc]
000065E0  FF76F6            push word [bp-0xa]
000065E3  8B4618            mov ax,[bp+0x18]
000065E6  88E0              mov al,ah
000065E8  30E4              xor ah,ah
000065EA  50                push ax
000065EB  BB8CD1            mov bx,0xd18c
000065EE  53                push bx
000065EF  B80400            mov ax,0x4
000065F2  50                push ax
000065F3  E834A3            call word 0x92a
000065F6  83C40C            add sp,byte +0xc
000065F9  83C400            add sp,byte +0x0
000065FC  E94306            jmp word 0x6c42
000065FF  8B4618            mov ax,[bp+0x18]
00006602  88E0              mov al,ah
00006604  30E4              xor ah,ah
00006606  3D0400            cmp ax,0x4
00006609  7506              jnz 0x6611
0000660B  83C400            add sp,byte +0x0
0000660E  E95E06            jmp word 0x6c6f
00006611  8A46DD            mov al,[bp-0x23]
00006614  30E4              xor ah,ah
00006616  B91E00            mov cx,0x1e
00006619  F7E9              imul cx
0000661B  89C3              mov bx,ax
0000661D  8B9F5201          mov bx,[bx+0x152]
00006621  895EEA            mov [bp-0x16],bx
00006624  8A46DD            mov al,[bp-0x23]
00006627  30E4              xor ah,ah
00006629  B91E00            mov cx,0x1e
0000662C  F7E9              imul cx
0000662E  89C3              mov bx,ax
00006630  8B9F5601          mov bx,[bx+0x156]
00006634  895EE8            mov [bp-0x18],bx
00006637  8B46EA            mov ax,[bp-0x16]
0000663A  3B46E4            cmp ax,[bp-0x1c]
0000663D  7508              jnz 0x6647
0000663F  8B46E8            mov ax,[bp-0x18]
00006642  3B46E2            cmp ax,[bp-0x1e]
00006645  7472              jz 0x66b9
00006647  8B46F2            mov ax,[bp-0xe]
0000664A  31DB              xor bx,bx
0000664C  53                push bx
0000664D  50                push ax
0000664E  8B46E2            mov ax,[bp-0x1e]
00006651  31DB              xor bx,bx
00006653  53                push bx
00006654  50                push ax
00006655  8B46F4            mov ax,[bp-0xc]
00006658  31DB              xor bx,bx
0000665A  53                push bx
0000665B  50                push ax
0000665C  8B46E4            mov ax,[bp-0x1c]
0000665F  31DB              xor bx,bx
00006661  53                push bx
00006662  50                push ax
00006663  8B46F6            mov ax,[bp-0xa]
00006666  31DB              xor bx,bx
00006668  8D7ECC            lea di,[bp-0x34]
0000666B  E84C9A            call word 0xba
0000666E  83C404            add sp,byte +0x4
00006671  8D7ED0            lea di,[bp-0x30]
00006674  E81D9A            call word 0x94
00006677  83C404            add sp,byte +0x4
0000667A  8D7ED4            lea di,[bp-0x2c]
0000667D  E83A9A            call word 0xba
00006680  83C404            add sp,byte +0x4
00006683  8D7ED8            lea di,[bp-0x28]
00006686  E80B9A            call word 0x94
00006689  83C404            add sp,byte +0x4
0000668C  53                push bx
0000668D  50                push ax
0000668E  B80100            mov ax,0x1
00006691  31DB              xor bx,bx
00006693  53                push bx
00006694  50                push ax
00006695  8B46D8            mov ax,[bp-0x28]
00006698  8B5EDA            mov bx,[bp-0x26]
0000669B  8D7ED4            lea di,[bp-0x2c]
0000669E  E8119A            call word 0xb2
000066A1  83C408            add sp,byte +0x8
000066A4  8946FC            mov [bp-0x4],ax
000066A7  895EFE            mov [bp-0x2],bx
000066AA  31C0              xor ax,ax
000066AC  31DB              xor bx,bx
000066AE  8946F8            mov [bp-0x8],ax
000066B1  895EFA            mov [bp-0x6],bx
000066B4  31C0              xor ax,ax
000066B6  8946F2            mov [bp-0xe],ax
000066B9  8B4618            mov ax,[bp+0x18]
000066BC  88E0              mov al,ah
000066BE  30E4              xor ah,ah
000066C0  3D0200            cmp ax,0x2
000066C3  7536              jnz 0x66fb
000066C5  FF76EE            push word [bp-0x12]
000066C8  FF76F0            push word [bp-0x10]
000066CB  FF76FA            push word [bp-0x6]
000066CE  FF76F8            push word [bp-0x8]
000066D1  FF76FE            push word [bp-0x2]
000066D4  FF76FC            push word [bp-0x4]
000066D7  FF76F2            push word [bp-0xe]
000066DA  FF76F4            push word [bp-0xc]
000066DD  FF76F6            push word [bp-0xa]
000066E0  FF76DE            push word [bp-0x22]
000066E3  B82000            mov ax,0x20
000066E6  50                push ax
000066E7  8A46DD            mov al,[bp-0x23]
000066EA  30E4              xor ah,ah
000066EC  50                push ax
000066ED  31C0              xor ax,ax
000066EF  50                push ax
000066F0  E868C2            call word 0x295b
000066F3  83C41A            add sp,byte +0x1a
000066F6  8846DC            mov [bp-0x24],al
000066F9  EB35              jmp short 0x6730
000066FB  FF76EE            push word [bp-0x12]
000066FE  FF76F0            push word [bp-0x10]
00006701  FF76FA            push word [bp-0x6]
00006704  FF76F8            push word [bp-0x8]
00006707  FF76FE            push word [bp-0x2]
0000670A  FF76FC            push word [bp-0x4]
0000670D  FF76F2            push word [bp-0xe]
00006710  FF76F4            push word [bp-0xc]
00006713  FF76F6            push word [bp-0xa]
00006716  FF76DE            push word [bp-0x22]
00006719  B83000            mov ax,0x30
0000671C  50                push ax
0000671D  8A46DD            mov al,[bp-0x23]
00006720  30E4              xor ah,ah
00006722  50                push ax
00006723  B80100            mov ax,0x1
00006726  50                push ax
00006727  E831C2            call word 0x295b
0000672A  83C41A            add sp,byte +0x1a
0000672D  8846DC            mov [bp-0x24],al
00006730  8B4618            mov ax,[bp+0x18]
00006733  30C0              xor al,al
00006735  0B065402          or ax,[0x254]
00006739  894618            mov [bp+0x18],ax
0000673C  8A46DC            mov al,[bp-0x24]
0000673F  84C0              test al,al
00006741  742D              jz 0x6770
00006743  8A46DC            mov al,[bp-0x24]
00006746  30E4              xor ah,ah
00006748  50                push ax
00006749  8B4618            mov ax,[bp+0x18]
0000674C  88E0              mov al,ah
0000674E  30E4              xor ah,ah
00006750  50                push ax
00006751  BB5FD1            mov bx,0xd15f
00006754  53                push bx
00006755  B80400            mov ax,0x4
00006758  50                push ax
00006759  E8CEA1            call word 0x92a
0000675C  83C408            add sp,byte +0x8
0000675F  8A4618            mov al,[bp+0x18]
00006762  30E4              xor ah,ah
00006764  0D000C            or ax,0xc00
00006767  894618            mov [bp+0x18],ax
0000676A  83C400            add sp,byte +0x0
0000676D  E9DD04            jmp word 0x6c4d
00006770  83C400            add sp,byte +0x0
00006773  E9F904            jmp word 0x6c6f
00006776  E9C904            jmp word 0x6c42
00006779  BB45D1            mov bx,0xd145
0000677C  53                push bx
0000677D  B80400            mov ax,0x4
00006780  50                push ax
00006781  E8A6A1            call word 0x92a
00006784  83C404            add sp,byte +0x4
00006787  83C400            add sp,byte +0x0
0000678A  E9E204            jmp word 0x6c6f
0000678D  89EC              mov sp,bp
0000678F  5D                pop bp
00006790  C3                ret
00006791  E9AE04            jmp word 0x6c42
00006794  8A46DD            mov al,[bp-0x23]
00006797  30E4              xor ah,ah
00006799  B91E00            mov cx,0x1e
0000679C  F7E9              imul cx
0000679E  89C3              mov bx,ax
000067A0  8B9F4E01          mov bx,[bx+0x14e]
000067A4  895EE6            mov [bp-0x1a],bx
000067A7  8A46DD            mov al,[bp-0x23]
000067AA  30E4              xor ah,ah
000067AC  B91E00            mov cx,0x1e
000067AF  F7E9              imul cx
000067B1  89C3              mov bx,ax
000067B3  8B9F4C01          mov bx,[bx+0x14c]
000067B7  895EE4            mov [bp-0x1c],bx
000067BA  8A46DD            mov al,[bp-0x23]
000067BD  30E4              xor ah,ah
000067BF  B91E00            mov cx,0x1e
000067C2  F7E9              imul cx
000067C4  89C3              mov bx,ax
000067C6  8B9F5001          mov bx,[bx+0x150]
000067CA  895EE2            mov [bp-0x1e],bx
000067CD  A03202            mov al,[0x232]
000067D0  30E4              xor ah,ah
000067D2  8946DE            mov [bp-0x22],ax
000067D5  8B46E6            mov ax,[bp-0x1a]
000067D8  48                dec ax
000067D9  8946E6            mov [bp-0x1a],ax
000067DC  8B4618            mov ax,[bp+0x18]
000067DF  30C0              xor al,al
000067E1  0C00              or al,0x0
000067E3  894618            mov [bp+0x18],ax
000067E6  8A46E6            mov al,[bp-0x1a]
000067E9  30E4              xor ah,ah
000067EB  88C4              mov ah,al
000067ED  30C0              xor al,al
000067EF  50                push ax
000067F0  8A4616            mov al,[bp+0x16]
000067F3  30E4              xor ah,ah
000067F5  0B46DA            or ax,[bp-0x26]
000067F8  44                inc sp
000067F9  44                inc sp
000067FA  894616            mov [bp+0x16],ax
000067FD  8A46E2            mov al,[bp-0x1e]
00006800  243F              and al,0x3f
00006802  50                push ax
00006803  8B46E6            mov ax,[bp-0x1a]
00006806  D1E8              shr ax,1
00006808  D1E8              shr ax,1
0000680A  24C0              and al,0xc0
0000680C  0A46DA            or al,[bp-0x26]
0000680F  44                inc sp
00006810  44                inc sp
00006811  50                push ax
00006812  8B4616            mov ax,[bp+0x16]
00006815  30C0              xor al,al
00006817  0A46DA            or al,[bp-0x26]
0000681A  44                inc sp
0000681B  44                inc sp
0000681C  894616            mov [bp+0x16],ax
0000681F  8B46E4            mov ax,[bp-0x1c]
00006822  48                dec ax
00006823  88C4              mov ah,al
00006825  30C0              xor al,al
00006827  50                push ax
00006828  8A4614            mov al,[bp+0x14]
0000682B  30E4              xor ah,ah
0000682D  0B46DA            or ax,[bp-0x26]
00006830  44                inc sp
00006831  44                inc sp
00006832  894614            mov [bp+0x14],ax
00006835  8B4614            mov ax,[bp+0x14]
00006838  30C0              xor al,al
0000683A  0B46DE            or ax,[bp-0x22]
0000683D  894614            mov [bp+0x14],ax
00006840  83C400            add sp,byte +0x0
00006843  E92904            jmp word 0x6c6f
00006846  E9F903            jmp word 0x6c42
00006849  8A46DD            mov al,[bp-0x23]
0000684C  30E4              xor ah,ah
0000684E  D1E8              shr ax,1
00006850  B103              mov cl,0x3
00006852  D3E0              shl ax,cl
00006854  89C3              mov bx,ax
00006856  8B9F2401          mov bx,[bx+0x124]
0000685A  83C307            add bx,byte +0x7
0000685D  53                push bx
0000685E  E8C89C            call word 0x529
00006861  44                inc sp
00006862  44                inc sp
00006863  8846DC            mov [bp-0x24],al
00006866  8A46DC            mov al,[bp-0x24]
00006869  24C0              and al,0xc0
0000686B  3C40              cmp al,0x40
0000686D  7508              jnz 0x6877
0000686F  83C400            add sp,byte +0x0
00006872  E9FA03            jmp word 0x6c6f
00006875  EB11              jmp short 0x6888
00006877  8A4618            mov al,[bp+0x18]
0000687A  30E4              xor ah,ah
0000687C  0D00AA            or ax,0xaa00
0000687F  894618            mov [bp+0x18],ax
00006882  83C400            add sp,byte +0x0
00006885  E9C503            jmp word 0x6c4d
00006888  E9B703            jmp word 0x6c42
0000688B  8A46DD            mov al,[bp-0x23]
0000688E  30E4              xor ah,ah
00006890  B91E00            mov cx,0x1e
00006893  F7E9              imul cx
00006895  89C3              mov bx,ax
00006897  8B9F4E01          mov bx,[bx+0x14e]
0000689B  895EE6            mov [bp-0x1a],bx
0000689E  8A46DD            mov al,[bp-0x23]
000068A1  30E4              xor ah,ah
000068A3  B91E00            mov cx,0x1e
000068A6  F7E9              imul cx
000068A8  89C3              mov bx,ax
000068AA  8B9F4C01          mov bx,[bx+0x14c]
000068AE  895EE4            mov [bp-0x1c],bx
000068B1  8A46DD            mov al,[bp-0x23]
000068B4  30E4              xor ah,ah
000068B6  B91E00            mov cx,0x1e
000068B9  F7E9              imul cx
000068BB  89C3              mov bx,ax
000068BD  8B9F5001          mov bx,[bx+0x150]
000068C1  895EE2            mov [bp-0x1e],bx
000068C4  8B46E2            mov ax,[bp-0x1e]
000068C7  31DB              xor bx,bx
000068C9  53                push bx
000068CA  50                push ax
000068CB  8B46E4            mov ax,[bp-0x1c]
000068CE  31DB              xor bx,bx
000068D0  53                push bx
000068D1  50                push ax
000068D2  8B46E6            mov ax,[bp-0x1a]
000068D5  48                dec ax
000068D6  31DB              xor bx,bx
000068D8  8D7ED4            lea di,[bp-0x2c]
000068DB  E8DC97            call word 0xba
000068DE  83C404            add sp,byte +0x4
000068E1  8D7ED8            lea di,[bp-0x28]
000068E4  E8D397            call word 0xba
000068E7  83C404            add sp,byte +0x4
000068EA  8946FC            mov [bp-0x4],ax
000068ED  895EFE            mov [bp-0x2],bx
000068F0  8B46FC            mov ax,[bp-0x4]
000068F3  8B5EFE            mov bx,[bp-0x2]
000068F6  93                xchg ax,bx
000068F7  31DB              xor bx,bx
000068F9  894616            mov [bp+0x16],ax
000068FC  B8FFFF            mov ax,0xffff
000068FF  31DB              xor bx,bx
00006901  8D7EFC            lea di,[bp-0x4]
00006904  E88597            call word 0x8c
00006907  894614            mov [bp+0x14],ax
0000690A  8A4618            mov al,[bp+0x18]
0000690D  30E4              xor ah,ah
0000690F  0D0003            or ax,0x300
00006912  894618            mov [bp+0x18],ax
00006915  83C400            add sp,byte +0x0
00006918  E95E03            jmp word 0x6c79
0000691B  E92403            jmp word 0x6c42
0000691E  B855AA            mov ax,0xaa55
00006921  894612            mov [bp+0x12],ax
00006924  8A4618            mov al,[bp+0x18]
00006927  30E4              xor ah,ah
00006929  0D0030            or ax,0x3000
0000692C  894618            mov [bp+0x18],ax
0000692F  B80700            mov ax,0x7
00006932  894616            mov [bp+0x16],ax
00006935  83C400            add sp,byte +0x0
00006938  E93E03            jmp word 0x6c79
0000693B  E90403            jmp word 0x6c42
0000693E  FF7606            push word [bp+0x6]
00006941  8B460C            mov ax,[bp+0xc]
00006944  40                inc ax
00006945  40                inc ax
00006946  50                push ax
00006947  E8A39C            call word 0x5ed
0000694A  83C404            add sp,byte +0x4
0000694D  8946DE            mov [bp-0x22],ax
00006950  FF7606            push word [bp+0x6]
00006953  8B460C            mov ax,[bp+0xc]
00006956  050600            add ax,0x6
00006959  50                push ax
0000695A  E8909C            call word 0x5ed
0000695D  83C404            add sp,byte +0x4
00006960  8946F0            mov [bp-0x10],ax
00006963  FF7606            push word [bp+0x6]
00006966  8B460C            mov ax,[bp+0xc]
00006969  050400            add ax,0x4
0000696C  50                push ax
0000696D  E87D9C            call word 0x5ed
00006970  83C404            add sp,byte +0x4
00006973  8946EE            mov [bp-0x12],ax
00006976  FF7606            push word [bp+0x6]
00006979  8B460C            mov ax,[bp+0xc]
0000697C  050C00            add ax,0xc
0000697F  50                push ax
00006980  E8D396            call word 0x56
00006983  89D3              mov bx,dx
00006985  83C404            add sp,byte +0x4
00006988  8946F8            mov [bp-0x8],ax
0000698B  895EFA            mov [bp-0x6],bx
0000698E  8A46DD            mov al,[bp-0x23]
00006991  30E4              xor ah,ah
00006993  B91E00            mov cx,0x1e
00006996  F7E9              imul cx
00006998  89C3              mov bx,ax
0000699A  8B875C01          mov ax,[bx+0x15c]
0000699E  8B9F5E01          mov bx,[bx+0x15e]
000069A2  8D7EF8            lea di,[bp-0x8]
000069A5  E8F496            call word 0x9c
000069A8  731C              jnc 0x69c6
000069AA  8B4618            mov ax,[bp+0x18]
000069AD  88E0              mov al,ah
000069AF  30E4              xor ah,ah
000069B1  50                push ax
000069B2  BB14D1            mov bx,0xd114
000069B5  53                push bx
000069B6  B80400            mov ax,0x4
000069B9  50                push ax
000069BA  E86D9F            call word 0x92a
000069BD  83C406            add sp,byte +0x6
000069C0  83C400            add sp,byte +0x0
000069C3  E97C02            jmp word 0x6c42
000069C6  FF7606            push word [bp+0x6]
000069C9  8B460C            mov ax,[bp+0xc]
000069CC  050800            add ax,0x8
000069CF  50                push ax
000069D0  E88396            call word 0x56
000069D3  89D3              mov bx,dx
000069D5  83C404            add sp,byte +0x4
000069D8  8946FC            mov [bp-0x4],ax
000069DB  895EFE            mov [bp-0x2],bx
000069DE  8A46DD            mov al,[bp-0x23]
000069E1  30E4              xor ah,ah
000069E3  B91E00            mov cx,0x1e
000069E6  F7E9              imul cx
000069E8  89C3              mov bx,ax
000069EA  8B875C01          mov ax,[bx+0x15c]
000069EE  8B9F5E01          mov bx,[bx+0x15e]
000069F2  8D7EF8            lea di,[bp-0x8]
000069F5  E8A496            call word 0x9c
000069F8  7538              jnz 0x6a32
000069FA  8A46DD            mov al,[bp-0x23]
000069FD  30E4              xor ah,ah
000069FF  B91E00            mov cx,0x1e
00006A02  F7E9              imul cx
00006A04  89C3              mov bx,ax
00006A06  8B875801          mov ax,[bx+0x158]
00006A0A  8B9F5A01          mov bx,[bx+0x15a]
00006A0E  8D7EFC            lea di,[bp-0x4]
00006A11  E88896            call word 0x9c
00006A14  771C              ja 0x6a32
00006A16  8B4618            mov ax,[bp+0x18]
00006A19  88E0              mov al,ah
00006A1B  30E4              xor ah,ah
00006A1D  50                push ax
00006A1E  BBE3D0            mov bx,0xd0e3
00006A21  53                push bx
00006A22  B80400            mov ax,0x4
00006A25  50                push ax
00006A26  E8019F            call word 0x92a
00006A29  83C406            add sp,byte +0x6
00006A2C  83C400            add sp,byte +0x0
00006A2F  E91002            jmp word 0x6c42
00006A32  8B4618            mov ax,[bp+0x18]
00006A35  88E0              mov al,ah
00006A37  30E4              xor ah,ah
00006A39  3D4400            cmp ax,0x44
00006A3C  740C              jz 0x6a4a
00006A3E  8B4618            mov ax,[bp+0x18]
00006A41  88E0              mov al,ah
00006A43  30E4              xor ah,ah
00006A45  3D4700            cmp ax,0x47
00006A48  7506              jnz 0x6a50
00006A4A  83C400            add sp,byte +0x0
00006A4D  E91F02            jmp word 0x6c6f
00006A50  8B4618            mov ax,[bp+0x18]
00006A53  88E0              mov al,ah
00006A55  30E4              xor ah,ah
00006A57  3D4200            cmp ax,0x42
00006A5A  7536              jnz 0x6a92
00006A5C  FF76EE            push word [bp-0x12]
00006A5F  FF76F0            push word [bp-0x10]
00006A62  FF76FA            push word [bp-0x6]
00006A65  FF76F8            push word [bp-0x8]
00006A68  FF76FE            push word [bp-0x2]
00006A6B  FF76FC            push word [bp-0x4]
00006A6E  31C0              xor ax,ax
00006A70  50                push ax
00006A71  31C0              xor ax,ax
00006A73  50                push ax
00006A74  31C0              xor ax,ax
00006A76  50                push ax
00006A77  FF76DE            push word [bp-0x22]
00006A7A  B82000            mov ax,0x20
00006A7D  50                push ax
00006A7E  8A46DD            mov al,[bp-0x23]
00006A81  30E4              xor ah,ah
00006A83  50                push ax
00006A84  31C0              xor ax,ax
00006A86  50                push ax
00006A87  E8D1BE            call word 0x295b
00006A8A  83C41A            add sp,byte +0x1a
00006A8D  8846DC            mov [bp-0x24],al
00006A90  EB35              jmp short 0x6ac7
00006A92  FF76EE            push word [bp-0x12]
00006A95  FF76F0            push word [bp-0x10]
00006A98  FF76FA            push word [bp-0x6]
00006A9B  FF76F8            push word [bp-0x8]
00006A9E  FF76FE            push word [bp-0x2]
00006AA1  FF76FC            push word [bp-0x4]
00006AA4  31C0              xor ax,ax
00006AA6  50                push ax
00006AA7  31C0              xor ax,ax
00006AA9  50                push ax
00006AAA  31C0              xor ax,ax
00006AAC  50                push ax
00006AAD  FF76DE            push word [bp-0x22]
00006AB0  B83000            mov ax,0x30
00006AB3  50                push ax
00006AB4  8A46DD            mov al,[bp-0x23]
00006AB7  30E4              xor ah,ah
00006AB9  50                push ax
00006ABA  B80100            mov ax,0x1
00006ABD  50                push ax
00006ABE  E89ABE            call word 0x295b
00006AC1  83C41A            add sp,byte +0x1a
00006AC4  8846DC            mov [bp-0x24],al
00006AC7  A15402            mov ax,[0x254]
00006ACA  8946DE            mov [bp-0x22],ax
00006ACD  FF7606            push word [bp+0x6]
00006AD0  8B460C            mov ax,[bp+0xc]
00006AD3  40                inc ax
00006AD4  40                inc ax
00006AD5  50                push ax
00006AD6  FF76DE            push word [bp-0x22]
00006AD9  E8329B            call word 0x60e
00006ADC  83C406            add sp,byte +0x6
00006ADF  8A46DC            mov al,[bp-0x24]
00006AE2  84C0              test al,al
00006AE4  742D              jz 0x6b13
00006AE6  8A46DC            mov al,[bp-0x24]
00006AE9  30E4              xor ah,ah
00006AEB  50                push ax
00006AEC  8B4618            mov ax,[bp+0x18]
00006AEF  88E0              mov al,ah
00006AF1  30E4              xor ah,ah
00006AF3  50                push ax
00006AF4  BBB6D0            mov bx,0xd0b6
00006AF7  53                push bx
00006AF8  B80400            mov ax,0x4
00006AFB  50                push ax
00006AFC  E82B9E            call word 0x92a
00006AFF  83C408            add sp,byte +0x8
00006B02  8A4618            mov al,[bp+0x18]
00006B05  30E4              xor ah,ah
00006B07  0D000C            or ax,0xc00
00006B0A  894618            mov [bp+0x18],ax
00006B0D  83C400            add sp,byte +0x0
00006B10  E93A01            jmp word 0x6c4d
00006B13  83C400            add sp,byte +0x0
00006B16  E95601            jmp word 0x6c6f
00006B19  E92601            jmp word 0x6c42
00006B1C  83C400            add sp,byte +0x0
00006B1F  E94D01            jmp word 0x6c6f
00006B22  E91D01            jmp word 0x6c42
00006B25  8A4618            mov al,[bp+0x18]
00006B28  30E4              xor ah,ah
00006B2A  0D00B2            or ax,0xb200
00006B2D  894618            mov [bp+0x18],ax
00006B30  83C400            add sp,byte +0x0
00006B33  E91701            jmp word 0x6c4d
00006B36  E90901            jmp word 0x6c42
00006B39  8A46DD            mov al,[bp-0x23]
00006B3C  30E4              xor ah,ah
00006B3E  50                push ax
00006B3F  FF760C            push word [bp+0xc]
00006B42  FF7606            push word [bp+0x6]
00006B45  E85BF2            call word 0x5da3
00006B48  83C406            add sp,byte +0x6
00006B4B  85C0              test ax,ax
00006B4D  7406              jz 0x6b55
00006B4F  83C400            add sp,byte +0x0
00006B52  E9ED00            jmp word 0x6c42
00006B55  83C400            add sp,byte +0x0
00006B58  E91401            jmp word 0x6c6f
00006B5B  E9E400            jmp word 0x6c42
00006B5E  8A4618            mov al,[bp+0x18]
00006B61  EB10              jmp short 0x6b73
00006B63  83C400            add sp,byte +0x0
00006B66  E90601            jmp word 0x6c6f
00006B69  EB1A              jmp short 0x6b85
00006B6B  83C400            add sp,byte +0x0
00006B6E  E9D100            jmp word 0x6c42
00006B71  EB12              jmp short 0x6b85
00006B73  2C01              sub al,0x1
00006B75  74EC              jz 0x6b63
00006B77  2C02              sub al,0x2
00006B79  74E8              jz 0x6b63
00006B7B  2C01              sub al,0x1
00006B7D  74E4              jz 0x6b63
00006B7F  2C02              sub al,0x2
00006B81  74E0              jz 0x6b63
00006B83  EBE6              jmp short 0x6b6b
00006B85  E9BA00            jmp word 0x6c42
00006B88  8B4618            mov ax,[bp+0x18]
00006B8B  88E0              mov al,ah
00006B8D  30E4              xor ah,ah
00006B8F  50                push ax
00006B90  BB77D0            mov bx,0xd077
00006B93  53                push bx
00006B94  B80400            mov ax,0x4
00006B97  50                push ax
00006B98  E88F9D            call word 0x92a
00006B9B  83C406            add sp,byte +0x6
00006B9E  83C400            add sp,byte +0x0
00006BA1  E9CB00            jmp word 0x6c6f
00006BA4  E99B00            jmp word 0x6c42
00006BA7  8B4618            mov ax,[bp+0x18]
00006BAA  88E0              mov al,ah
00006BAC  30E4              xor ah,ah
00006BAE  50                push ax
00006BAF  BB3DD0            mov bx,0xd03d
00006BB2  53                push bx
00006BB3  B80400            mov ax,0x4
00006BB6  50                push ax
00006BB7  E8709D            call word 0x92a
00006BBA  83C406            add sp,byte +0x6
00006BBD  83C400            add sp,byte +0x0
00006BC0  E97F00            jmp word 0x6c42
00006BC3  EB7D              jmp short 0x6c42
00006BC5  EB7B              jmp short 0x6c42
00006BC7  2D0000            sub ax,0x0
00006BCA  7CDB              jl 0x6ba7
00006BCC  3D1800            cmp ax,0x18
00006BCF  773B              ja 0x6c0c
00006BD1  D1E0              shl ax,1
00006BD3  89C3              mov bx,ax
00006BD5  2EFFA7DA6B        jmp word [cs:bx+0x6bda]
00006BDA  AE                scasb
00006BDB  64C26413          fs ret 0x1364
00006BDF  65136513          adc sp,[gs:di+0x13]
00006BE3  657967            gs jns 0x6c4d
00006BE6  A7                cmpsw
00006BE7  6BA76B9467        imul sp,[bx-0x6b95],byte +0x67
00006BEC  886BA7            mov [bp+di-0x59],ch
00006BEF  6BA76B886B        imul sp,[bx-0x7795],byte +0x6b
00006BF4  886BA7            mov [bp+di-0x59],ch
00006BF7  6BA76B4968        imul sp,[bx+0x496b],byte +0x68
00006BFC  886BA7            mov [bp+di-0x59],ch
00006BFF  6BA76B886B        imul sp,[bx-0x7795],byte +0x6b
00006C04  8B68A7            mov bp,[bx+si-0x59]
00006C07  6BA76BA76B        imul sp,[bx-0x5895],byte +0x6b
00006C0C  2D4100            sub ax,0x41
00006C0F  7296              jc 0x6ba7
00006C11  3D0F00            cmp ax,0xf
00006C14  7729              ja 0x6c3f
00006C16  D1E0              shl ax,1
00006C18  89C3              mov bx,ax
00006C1A  2EFFA71F6C        jmp word [cs:bx+0x6c1f]
00006C1F  1E                push ds
00006C20  693E693E693E      imul di,[0x3e69],word 0x3e69
00006C26  691C6B25          imul bx,[si],word 0x256b
00006C2A  6B3E69396B        imul di,[0x3969],byte +0x6b
00006C2F  1C6B              sbb al,0x6b
00006C31  A7                cmpsw
00006C32  6BA76BA76B        imul sp,[bx-0x5895],byte +0x6b
00006C37  A7                cmpsw
00006C38  6B5E6BA7          imul bx,[bp+0x6b],byte -0x59
00006C3C  6BA76BE965        imul sp,[bx-0x1695],byte +0x65
00006C41  FF8A4618          dec word [bp+si+0x1846]
00006C45  30E4              xor ah,ah
00006C47  0D0001            or ax,0x100
00006C4A  894618            mov [bp+0x18],ax
00006C4D  B84000            mov ax,0x40
00006C50  50                push ax
00006C51  B87400            mov ax,0x74
00006C54  50                push ax
00006C55  8B4618            mov ax,[bp+0x18]
00006C58  88E0              mov al,ah
00006C5A  30E4              xor ah,ah
00006C5C  50                push ax
00006C5D  E89B99            call word 0x5fb
00006C60  83C406            add sp,byte +0x6
00006C63  8B461E            mov ax,[bp+0x1e]
00006C66  0C01              or al,0x1
00006C68  89461E            mov [bp+0x1e],ax
00006C6B  89EC              mov sp,bp
00006C6D  5D                pop bp
00006C6E  C3                ret
00006C6F  8A4618            mov al,[bp+0x18]
00006C72  0C00              or al,0x0
00006C74  30E4              xor ah,ah
00006C76  894618            mov [bp+0x18],ax
00006C79  B84000            mov ax,0x40
00006C7C  50                push ax
00006C7D  B87400            mov ax,0x74
00006C80  50                push ax
00006C81  31C0              xor ax,ax
00006C83  50                push ax
00006C84  E87499            call word 0x5fb
00006C87  83C406            add sp,byte +0x6
00006C8A  8B461E            mov ax,[bp+0x1e]
00006C8D  24FE              and al,0xfe
00006C8F  89461E            mov [bp+0x1e],ax
00006C92  89EC              mov sp,bp
00006C94  5D                pop bp
00006C95  C3                ret
00006C96  55                push bp
00006C97  89E5              mov bp,sp
00006C99  83C4E2            add sp,byte -0x1e
00006C9C  B84000            mov ax,0x40
00006C9F  50                push ax
00006CA0  B87400            mov ax,0x74
00006CA3  50                push ax
00006CA4  31C0              xor ax,ax
00006CA6  50                push ax
00006CA7  E85199            call word 0x5fb
00006CAA  83C406            add sp,byte +0x6
00006CAD  8A4610            mov al,[bp+0x10]
00006CB0  3CE0              cmp al,0xe0
00006CB2  7207              jc 0x6cbb
00006CB4  8A4610            mov al,[bp+0x10]
00006CB7  3CE8              cmp al,0xe8
00006CB9  7222              jc 0x6cdd
00006CBB  8A4610            mov al,[bp+0x10]
00006CBE  30E4              xor ah,ah
00006CC0  50                push ax
00006CC1  8B4618            mov ax,[bp+0x18]
00006CC4  88E0              mov al,ah
00006CC6  30E4              xor ah,ah
00006CC8  50                push ax
00006CC9  BB09D0            mov bx,0xd009
00006CCC  53                push bx
00006CCD  B80400            mov ax,0x4
00006CD0  50                push ax
00006CD1  E8569C            call word 0x92a
00006CD4  83C408            add sp,byte +0x8
00006CD7  83C400            add sp,byte +0x0
00006CDA  E92605            jmp word 0x7203
00006CDD  8A4610            mov al,[bp+0x10]
00006CE0  30E4              xor ah,ah
00006CE2  0520FF            add ax,0xff20
00006CE5  89C3              mov bx,ax
00006CE7  8A873C02          mov al,[bx+0x23c]
00006CEB  8846FF            mov [bp-0x1],al
00006CEE  8A46FF            mov al,[bp-0x1]
00006CF1  3C08              cmp al,0x8
00006CF3  7222              jc 0x6d17
00006CF5  8A4610            mov al,[bp+0x10]
00006CF8  30E4              xor ah,ah
00006CFA  50                push ax
00006CFB  8B4618            mov ax,[bp+0x18]
00006CFE  88E0              mov al,ah
00006D00  30E4              xor ah,ah
00006D02  50                push ax
00006D03  BBCECF            mov bx,0xcfce
00006D06  53                push bx
00006D07  B80400            mov ax,0x4
00006D0A  50                push ax
00006D0B  E81C9C            call word 0x92a
00006D0E  83C408            add sp,byte +0x8
00006D11  83C400            add sp,byte +0x0
00006D14  E9EC04            jmp word 0x7203
00006D17  8B4618            mov ax,[bp+0x18]
00006D1A  88E0              mov al,ah
00006D1C  30E4              xor ah,ah
00006D1E  E96704            jmp word 0x7188
00006D21  83C400            add sp,byte +0x0
00006D24  E90905            jmp word 0x7230
00006D27  E9D904            jmp word 0x7203
00006D2A  8A4618            mov al,[bp+0x18]
00006D2D  30E4              xor ah,ah
00006D2F  0D0003            or ax,0x300
00006D32  894618            mov [bp+0x18],ax
00006D35  83C400            add sp,byte +0x0
00006D38  E9D304            jmp word 0x720e
00006D3B  E9C504            jmp word 0x7203
00006D3E  B84000            mov ax,0x40
00006D41  50                push ax
00006D42  B87400            mov ax,0x74
00006D45  50                push ax
00006D46  E89698            call word 0x5df
00006D49  83C404            add sp,byte +0x4
00006D4C  8846FE            mov [bp-0x2],al
00006D4F  8A46FE            mov al,[bp-0x2]
00006D52  30E4              xor ah,ah
00006D54  88C4              mov ah,al
00006D56  30C0              xor al,al
00006D58  50                push ax
00006D59  8A4618            mov al,[bp+0x18]
00006D5C  30E4              xor ah,ah
00006D5E  0B46E0            or ax,[bp-0x20]
00006D61  44                inc sp
00006D62  44                inc sp
00006D63  894618            mov [bp+0x18],ax
00006D66  B84000            mov ax,0x40
00006D69  50                push ax
00006D6A  B87400            mov ax,0x74
00006D6D  50                push ax
00006D6E  31C0              xor ax,ax
00006D70  50                push ax
00006D71  E88798            call word 0x5fb
00006D74  83C406            add sp,byte +0x6
00006D77  8A46FE            mov al,[bp-0x2]
00006D7A  84C0              test al,al
00006D7C  7408              jz 0x6d86
00006D7E  83C400            add sp,byte +0x0
00006D81  E9A004            jmp word 0x7224
00006D84  EB06              jmp short 0x6d8c
00006D86  83C400            add sp,byte +0x0
00006D89  E9AE04            jmp word 0x723a
00006D8C  E97404            jmp word 0x7203
00006D8F  8A4618            mov al,[bp+0x18]
00006D92  30E4              xor ah,ah
00006D94  0D0002            or ax,0x200
00006D97  894618            mov [bp+0x18],ax
00006D9A  83C400            add sp,byte +0x0
00006D9D  E96E04            jmp word 0x720e
00006DA0  E96004            jmp word 0x7203
00006DA3  B855AA            mov ax,0xaa55
00006DA6  894612            mov [bp+0x12],ax
00006DA9  8A4618            mov al,[bp+0x18]
00006DAC  30E4              xor ah,ah
00006DAE  0D0030            or ax,0x3000
00006DB1  894618            mov [bp+0x18],ax
00006DB4  B80700            mov ax,0x7
00006DB7  894616            mov [bp+0x16],ax
00006DBA  83C400            add sp,byte +0x0
00006DBD  E97A04            jmp word 0x723a
00006DC0  E94004            jmp word 0x7203
00006DC3  FF7606            push word [bp+0x6]
00006DC6  8B460C            mov ax,[bp+0xc]
00006DC9  40                inc ax
00006DCA  40                inc ax
00006DCB  50                push ax
00006DCC  E81E98            call word 0x5ed
00006DCF  83C404            add sp,byte +0x4
00006DD2  8946EA            mov [bp-0x16],ax
00006DD5  FF7606            push word [bp+0x6]
00006DD8  8B460C            mov ax,[bp+0xc]
00006DDB  050600            add ax,0x6
00006DDE  50                push ax
00006DDF  E80B98            call word 0x5ed
00006DE2  83C404            add sp,byte +0x4
00006DE5  8946E8            mov [bp-0x18],ax
00006DE8  FF7606            push word [bp+0x6]
00006DEB  8B460C            mov ax,[bp+0xc]
00006DEE  050400            add ax,0x4
00006DF1  50                push ax
00006DF2  E8F897            call word 0x5ed
00006DF5  83C404            add sp,byte +0x4
00006DF8  8946E6            mov [bp-0x1a],ax
00006DFB  FF7606            push word [bp+0x6]
00006DFE  8B460C            mov ax,[bp+0xc]
00006E01  050C00            add ax,0xc
00006E04  50                push ax
00006E05  E84E92            call word 0x56
00006E08  89D3              mov bx,dx
00006E0A  83C404            add sp,byte +0x4
00006E0D  8946EC            mov [bp-0x14],ax
00006E10  895EEE            mov [bp-0x12],bx
00006E13  31C0              xor ax,ax
00006E15  31DB              xor bx,bx
00006E17  53                push bx
00006E18  50                push ax
00006E19  8B46EC            mov ax,[bp-0x14]
00006E1C  8B5EEE            mov bx,[bp-0x12]
00006E1F  8D7EDE            lea di,[bp-0x22]
00006E22  E87792            call word 0x9c
00006E25  8D66E2            lea sp,[bp-0x1e]
00006E28  741C              jz 0x6e46
00006E2A  8B4618            mov ax,[bp+0x18]
00006E2D  88E0              mov al,ah
00006E2F  30E4              xor ah,ah
00006E31  50                push ax
00006E32  BB9CCF            mov bx,0xcf9c
00006E35  53                push bx
00006E36  B80700            mov ax,0x7
00006E39  50                push ax
00006E3A  E8ED9A            call word 0x92a
00006E3D  83C406            add sp,byte +0x6
00006E40  83C400            add sp,byte +0x0
00006E43  E9BD03            jmp word 0x7203
00006E46  FF7606            push word [bp+0x6]
00006E49  8B460C            mov ax,[bp+0xc]
00006E4C  050800            add ax,0x8
00006E4F  50                push ax
00006E50  E80392            call word 0x56
00006E53  89D3              mov bx,dx
00006E55  83C404            add sp,byte +0x4
00006E58  8946EC            mov [bp-0x14],ax
00006E5B  895EEE            mov [bp-0x12],bx
00006E5E  8B4618            mov ax,[bp+0x18]
00006E61  88E0              mov al,ah
00006E63  30E4              xor ah,ah
00006E65  3D4400            cmp ax,0x44
00006E68  740C              jz 0x6e76
00006E6A  8B4618            mov ax,[bp+0x18]
00006E6D  88E0              mov al,ah
00006E6F  30E4              xor ah,ah
00006E71  3D4700            cmp ax,0x47
00006E74  7506              jnz 0x6e7c
00006E76  83C400            add sp,byte +0x0
00006E79  E9B403            jmp word 0x7230
00006E7C  B80C00            mov ax,0xc
00006E7F  50                push ax
00006E80  E8D797            call word 0x65a
00006E83  50                push ax
00006E84  8D5EF1            lea bx,[bp-0xf]
00006E87  53                push bx
00006E88  31C0              xor ax,ax
00006E8A  50                push ax
00006E8B  E87291            call word 0x0
00006E8E  83C408            add sp,byte +0x8
00006E91  B028              mov al,0x28
00006E93  8846F1            mov [bp-0xf],al
00006E96  8B46EA            mov ax,[bp-0x16]
00006E99  30C0              xor al,al
00006E9B  88E0              mov al,ah
00006E9D  30E4              xor ah,ah
00006E9F  8846F8            mov [bp-0x8],al
00006EA2  8A46EA            mov al,[bp-0x16]
00006EA5  8846F9            mov [bp-0x7],al
00006EA8  31C0              xor ax,ax
00006EAA  BB00FF            mov bx,0xff00
00006EAD  8D7EEC            lea di,[bp-0x14]
00006EB0  E8D991            call word 0x8c
00006EB3  93                xchg ax,bx
00006EB4  88E0              mov al,ah
00006EB6  30E4              xor ah,ah
00006EB8  31DB              xor bx,bx
00006EBA  8846F3            mov [bp-0xd],al
00006EBD  31C0              xor ax,ax
00006EBF  BBFF00            mov bx,0xff
00006EC2  8D7EEC            lea di,[bp-0x14]
00006EC5  E8C491            call word 0x8c
00006EC8  93                xchg ax,bx
00006EC9  31DB              xor bx,bx
00006ECB  8846F4            mov [bp-0xc],al
00006ECE  B800FF            mov ax,0xff00
00006ED1  31DB              xor bx,bx
00006ED3  8D7EEC            lea di,[bp-0x14]
00006ED6  E8B391            call word 0x8c
00006ED9  88E0              mov al,ah
00006EDB  88DC              mov ah,bl
00006EDD  88FB              mov bl,bh
00006EDF  28FF              sub bh,bh
00006EE1  8846F5            mov [bp-0xb],al
00006EE4  B8FF00            mov ax,0xff
00006EE7  31DB              xor bx,bx
00006EE9  8D7EEC            lea di,[bp-0x14]
00006EEC  E89D91            call word 0x8c
00006EEF  8846F6            mov [bp-0xa],al
00006EF2  FF76E6            push word [bp-0x1a]
00006EF5  FF76E8            push word [bp-0x18]
00006EF8  B80100            mov ax,0x1
00006EFB  50                push ax
00006EFC  8B46EA            mov ax,[bp-0x16]
00006EFF  31DB              xor bx,bx
00006F01  53                push bx
00006F02  50                push ax
00006F03  B80008            mov ax,0x800
00006F06  31DB              xor bx,bx
00006F08  53                push bx
00006F09  50                push ax
00006F0A  8B46D8            mov ax,[bp-0x28]
00006F0D  8B5EDA            mov bx,[bp-0x26]
00006F10  8D7ED4            lea di,[bp-0x2c]
00006F13  E8A491            call word 0xba
00006F16  83C408            add sp,byte +0x8
00006F19  53                push bx
00006F1A  50                push ax
00006F1B  31C0              xor ax,ax
00006F1D  50                push ax
00006F1E  8D5EF1            lea bx,[bp-0xf]
00006F21  53                push bx
00006F22  E83597            call word 0x65a
00006F25  50                push ax
00006F26  B80C00            mov ax,0xc
00006F29  50                push ax
00006F2A  8A46FF            mov al,[bp-0x1]
00006F2D  30E4              xor ah,ah
00006F2F  50                push ax
00006F30  E839BE            call word 0x2d6c
00006F33  83C414            add sp,byte +0x14
00006F36  8846FE            mov [bp-0x2],al
00006F39  A15602            mov ax,[0x256]
00006F3C  8B1E5802          mov bx,[0x258]
00006F40  88E0              mov al,ah
00006F42  88DC              mov ah,bl
00006F44  88FB              mov bl,bh
00006F46  28FF              sub bh,bh
00006F48  BF0300            mov di,0x3
00006F4B  E8AC91            call word 0xfa
00006F4E  8946EA            mov [bp-0x16],ax
00006F51  FF7606            push word [bp+0x6]
00006F54  8B460C            mov ax,[bp+0xc]
00006F57  40                inc ax
00006F58  40                inc ax
00006F59  50                push ax
00006F5A  FF76EA            push word [bp-0x16]
00006F5D  E8AE96            call word 0x60e
00006F60  83C406            add sp,byte +0x6
00006F63  8A46FE            mov al,[bp-0x2]
00006F66  84C0              test al,al
00006F68  742D              jz 0x6f97
00006F6A  8A46FE            mov al,[bp-0x2]
00006F6D  30E4              xor ah,ah
00006F6F  50                push ax
00006F70  8B4618            mov ax,[bp+0x18]
00006F73  88E0              mov al,ah
00006F75  30E4              xor ah,ah
00006F77  50                push ax
00006F78  BB71CF            mov bx,0xcf71
00006F7B  53                push bx
00006F7C  B80400            mov ax,0x4
00006F7F  50                push ax
00006F80  E8A799            call word 0x92a
00006F83  83C408            add sp,byte +0x8
00006F86  8A4618            mov al,[bp+0x18]
00006F89  30E4              xor ah,ah
00006F8B  0D000C            or ax,0xc00
00006F8E  894618            mov [bp+0x18],ax
00006F91  83C400            add sp,byte +0x0
00006F94  E97702            jmp word 0x720e
00006F97  83C400            add sp,byte +0x0
00006F9A  E99302            jmp word 0x7230
00006F9D  E96302            jmp word 0x7203
00006FA0  8A4618            mov al,[bp+0x18]
00006FA3  3C02              cmp al,0x2
00006FA5  7606              jna 0x6fad
00006FA7  83C400            add sp,byte +0x0
00006FAA  E95602            jmp word 0x7203
00006FAD  8A46FF            mov al,[bp-0x1]
00006FB0  30E4              xor ah,ah
00006FB2  B91E00            mov cx,0x1e
00006FB5  F7E9              imul cx
00006FB7  89C3              mov bx,ax
00006FB9  8A874501          mov al,[bx+0x145]
00006FBD  8846FD            mov [bp-0x3],al
00006FC0  8A4618            mov al,[bp+0x18]
00006FC3  E9C700            jmp word 0x708d
00006FC6  8A46FD            mov al,[bp-0x3]
00006FC9  3CFF              cmp al,0xff
00006FCB  751B              jnz 0x6fe8
00006FCD  8A4618            mov al,[bp+0x18]
00006FD0  30E4              xor ah,ah
00006FD2  0D00B4            or ax,0xb400
00006FD5  894618            mov [bp+0x18],ax
00006FD8  8B4618            mov ax,[bp+0x18]
00006FDB  30C0              xor al,al
00006FDD  0C01              or al,0x1
00006FDF  894618            mov [bp+0x18],ax
00006FE2  83C400            add sp,byte +0x0
00006FE5  E92602            jmp word 0x720e
00006FE8  8A46FD            mov al,[bp-0x3]
00006FEB  40                inc ax
00006FEC  8846FD            mov [bp-0x3],al
00006FEF  50                push ax
00006FF0  8A46FF            mov al,[bp-0x1]
00006FF3  30E4              xor ah,ah
00006FF5  B91E00            mov cx,0x1e
00006FF8  F7E9              imul cx
00006FFA  89C3              mov bx,ax
00006FFC  8A46E0            mov al,[bp-0x20]
00006FFF  88874501          mov [bx+0x145],al
00007003  44                inc sp
00007004  44                inc sp
00007005  8B4618            mov ax,[bp+0x18]
00007008  30C0              xor al,al
0000700A  0C01              or al,0x1
0000700C  894618            mov [bp+0x18],ax
0000700F  E98B00            jmp word 0x709d
00007012  8A46FD            mov al,[bp-0x3]
00007015  84C0              test al,al
00007017  751B              jnz 0x7034
00007019  8A4618            mov al,[bp+0x18]
0000701C  30E4              xor ah,ah
0000701E  0D00B0            or ax,0xb000
00007021  894618            mov [bp+0x18],ax
00007024  8B4618            mov ax,[bp+0x18]
00007027  30C0              xor al,al
00007029  0C00              or al,0x0
0000702B  894618            mov [bp+0x18],ax
0000702E  83C400            add sp,byte +0x0
00007031  E9DA01            jmp word 0x720e
00007034  8A46FD            mov al,[bp-0x3]
00007037  48                dec ax
00007038  8846FD            mov [bp-0x3],al
0000703B  50                push ax
0000703C  8A46FF            mov al,[bp-0x1]
0000703F  30E4              xor ah,ah
00007041  B91E00            mov cx,0x1e
00007044  F7E9              imul cx
00007046  89C3              mov bx,ax
00007048  8A46E0            mov al,[bp-0x20]
0000704B  88874501          mov [bx+0x145],al
0000704F  44                inc sp
00007050  44                inc sp
00007051  8A46FD            mov al,[bp-0x3]
00007054  84C0              test al,al
00007056  7504              jnz 0x705c
00007058  30C0              xor al,al
0000705A  EB02              jmp short 0x705e
0000705C  B001              mov al,0x1
0000705E  50                push ax
0000705F  8B4618            mov ax,[bp+0x18]
00007062  30C0              xor al,al
00007064  0A46E0            or al,[bp-0x20]
00007067  44                inc sp
00007068  44                inc sp
00007069  894618            mov [bp+0x18],ax
0000706C  EB2F              jmp short 0x709d
0000706E  8A46FD            mov al,[bp-0x3]
00007071  84C0              test al,al
00007073  7504              jnz 0x7079
00007075  30C0              xor al,al
00007077  EB02              jmp short 0x707b
00007079  B001              mov al,0x1
0000707B  50                push ax
0000707C  8B4618            mov ax,[bp+0x18]
0000707F  30C0              xor al,al
00007081  0A46E0            or al,[bp-0x20]
00007084  44                inc sp
00007085  44                inc sp
00007086  894618            mov [bp+0x18],ax
00007089  EB12              jmp short 0x709d
0000708B  EB10              jmp short 0x709d
0000708D  2C00              sub al,0x0
0000708F  0F8433FF          jz word 0x6fc6
00007093  2C01              sub al,0x1
00007095  0F8479FF          jz word 0x7012
00007099  2C01              sub al,0x1
0000709B  74D1              jz 0x706e
0000709D  83C400            add sp,byte +0x0
000070A0  E98D01            jmp word 0x7230
000070A3  E95D01            jmp word 0x7203
000070A6  8A46FF            mov al,[bp-0x1]
000070A9  30E4              xor ah,ah
000070AB  B91E00            mov cx,0x1e
000070AE  F7E9              imul cx
000070B0  89C3              mov bx,ax
000070B2  8A874501          mov al,[bx+0x145]
000070B6  8846FD            mov [bp-0x3],al
000070B9  8A46FD            mov al,[bp-0x3]
000070BC  84C0              test al,al
000070BE  7411              jz 0x70d1
000070C0  8A4618            mov al,[bp+0x18]
000070C3  30E4              xor ah,ah
000070C5  0D00B1            or ax,0xb100
000070C8  894618            mov [bp+0x18],ax
000070CB  83C400            add sp,byte +0x0
000070CE  E93D01            jmp word 0x720e
000070D1  55                push bp
000070D2  89E5              mov bp,sp
000070D4  B452              mov ah,0x52
000070D6  CD15              int 0x15
000070D8  88661E            mov [bp+0x1e],ah
000070DB  7306              jnc 0x70e3
000070DD  C7061C000100      mov word [0x1c],0x1
000070E3  5D                pop bp
000070E4  8A46FE            mov al,[bp-0x2]
000070E7  84C0              test al,al
000070E9  7411              jz 0x70fc
000070EB  8A4618            mov al,[bp+0x18]
000070EE  30E4              xor ah,ah
000070F0  0D00B1            or ax,0xb100
000070F3  894618            mov [bp+0x18],ax
000070F6  83C400            add sp,byte +0x0
000070F9  E91201            jmp word 0x720e
000070FC  83C400            add sp,byte +0x0
000070FF  E92E01            jmp word 0x7230
00007102  E9FE00            jmp word 0x7203
00007105  8A46FF            mov al,[bp-0x1]
00007108  30E4              xor ah,ah
0000710A  50                push ax
0000710B  FF760C            push word [bp+0xc]
0000710E  FF7606            push word [bp+0x6]
00007111  E88FEC            call word 0x5da3
00007114  83C406            add sp,byte +0x6
00007117  85C0              test ax,ax
00007119  7406              jz 0x7121
0000711B  83C400            add sp,byte +0x0
0000711E  E9E200            jmp word 0x7203
00007121  83C400            add sp,byte +0x0
00007124  E90901            jmp word 0x7230
00007127  E9D900            jmp word 0x7203
0000712A  8A4618            mov al,[bp+0x18]
0000712D  30E4              xor ah,ah
0000712F  0D0006            or ax,0x600
00007132  894618            mov [bp+0x18],ax
00007135  83C400            add sp,byte +0x0
00007138  E9E900            jmp word 0x7224
0000713B  E9C500            jmp word 0x7203
0000713E  8A4618            mov al,[bp+0x18]
00007141  EB10              jmp short 0x7153
00007143  83C400            add sp,byte +0x0
00007146  E9E700            jmp word 0x7230
00007149  EB1A              jmp short 0x7165
0000714B  83C400            add sp,byte +0x0
0000714E  E9B200            jmp word 0x7203
00007151  EB12              jmp short 0x7165
00007153  2C01              sub al,0x1
00007155  74EC              jz 0x7143
00007157  2C02              sub al,0x2
00007159  74E8              jz 0x7143
0000715B  2C01              sub al,0x1
0000715D  74E4              jz 0x7143
0000715F  2C02              sub al,0x2
00007161  74E0              jz 0x7143
00007163  EBE6              jmp short 0x714b
00007165  E99B00            jmp word 0x7203
00007168  8B4618            mov ax,[bp+0x18]
0000716B  88E0              mov al,ah
0000716D  30E4              xor ah,ah
0000716F  50                push ax
00007170  BB4FCF            mov bx,0xcf4f
00007173  53                push bx
00007174  B80400            mov ax,0x4
00007177  50                push ax
00007178  E8AF97            call word 0x92a
0000717B  83C406            add sp,byte +0x6
0000717E  83C400            add sp,byte +0x0
00007181  E97F00            jmp word 0x7203
00007184  EB7D              jmp short 0x7203
00007186  EB7B              jmp short 0x7203
00007188  2D0000            sub ax,0x0
0000718B  7CDB              jl 0x7168
0000718D  3D1800            cmp ax,0x18
00007190  773B              ja 0x71cd
00007192  D1E0              shl ax,1
00007194  89C3              mov bx,ax
00007196  2EFFA79B71        jmp word [cs:bx+0x719b]
0000719B  216D3E            and [di+0x3e],bp
0000719E  6D                insw
0000719F  68712A            push word 0x2a71
000071A2  6D                insw
000071A3  68712A            push word 0x2a71
000071A6  6D                insw
000071A7  687168            push word 0x6871
000071AA  7168              jno 0x7214
000071AC  7121              jno 0x71cf
000071AE  6D                insw
000071AF  687168            push word 0x6871
000071B2  7121              jno 0x71d5
000071B4  6D                insw
000071B5  216D68            and [di+0x68],bp
000071B8  7168              jno 0x7222
000071BA  7121              jno 0x71dd
000071BC  6D                insw
000071BD  216D68            and [di+0x68],bp
000071C0  7168              jno 0x722a
000071C2  7121              jno 0x71e5
000071C4  6D                insw
000071C5  8F                db 0x8f
000071C6  6D                insw
000071C7  216D68            and [di+0x68],bp
000071CA  7168              jno 0x7234
000071CC  712D              jno 0x71fb
000071CE  41                inc cx
000071CF  007296            add [bp+si-0x6a],dh
000071D2  3D0F00            cmp ax,0xf
000071D5  7729              ja 0x7200
000071D7  D1E0              shl ax,1
000071D9  89C3              mov bx,ax
000071DB  2EFFA7E071        jmp word [cs:bx+0x71e0]
000071E0  A36DC3            mov [0xc36d],ax
000071E3  6D                insw
000071E4  2A6DC3            sub ch,[di-0x3d]
000071E7  6D                insw
000071E8  A06FA6            mov al,[0xa66f]
000071EB  70C3              jo 0x71b0
000071ED  6D                insw
000071EE  05712A            add ax,0x2a71
000071F1  7168              jno 0x725b
000071F3  7168              jno 0x725d
000071F5  7168              jno 0x725f
000071F7  7168              jno 0x7261
000071F9  713E              jno 0x7239
000071FB  7168              jno 0x7265
000071FD  7168              jno 0x7267
000071FF  71E9              jno 0x71ea
00007201  65FF8A4618        dec word [gs:bp+si+0x1846]
00007206  30E4              xor ah,ah
00007208  0D0001            or ax,0x100
0000720B  894618            mov [bp+0x18],ax
0000720E  B84000            mov ax,0x40
00007211  50                push ax
00007212  B87400            mov ax,0x74
00007215  50                push ax
00007216  8B4618            mov ax,[bp+0x18]
00007219  88E0              mov al,ah
0000721B  30E4              xor ah,ah
0000721D  50                push ax
0000721E  E8DA93            call word 0x5fb
00007221  83C406            add sp,byte +0x6
00007224  8B461E            mov ax,[bp+0x1e]
00007227  0C01              or al,0x1
00007229  89461E            mov [bp+0x1e],ax
0000722C  89EC              mov sp,bp
0000722E  5D                pop bp
0000722F  C3                ret
00007230  8A4618            mov al,[bp+0x18]
00007233  0C00              or al,0x0
00007235  30E4              xor ah,ah
00007237  894618            mov [bp+0x18],ax
0000723A  B84000            mov ax,0x40
0000723D  50                push ax
0000723E  B87400            mov ax,0x74
00007241  50                push ax
00007242  31C0              xor ax,ax
00007244  50                push ax
00007245  E8B393            call word 0x5fb
00007248  83C406            add sp,byte +0x6
0000724B  8B461E            mov ax,[bp+0x1e]
0000724E  24FE              and al,0xfe
00007250  89461E            mov [bp+0x1e],ax
00007253  89EC              mov sp,bp
00007255  5D                pop bp
00007256  C3                ret
00007257  55                push bp
00007258  89E5              mov bp,sp
0000725A  4C                dec sp
0000725B  4C                dec sp
0000725C  B84000            mov ax,0x40
0000725F  50                push ax
00007260  B80E00            mov ax,0xe
00007263  50                push ax
00007264  E88693            call word 0x5ed
00007267  83C404            add sp,byte +0x4
0000726A  8946FE            mov [bp-0x2],ax
0000726D  8B4616            mov ax,[bp+0x16]
00007270  88E0              mov al,ah
00007272  30E4              xor ah,ah
00007274  E99301            jmp word 0x740a
00007277  FF7616            push word [bp+0x16]
0000727A  BB1ECF            mov bx,0xcf1e
0000727D  53                push bx
0000727E  B80700            mov ax,0x7
00007281  50                push ax
00007282  E8A596            call word 0x92a
00007285  83C406            add sp,byte +0x6
00007288  83C400            add sp,byte +0x0
0000728B  E99A01            jmp word 0x7428
0000728E  E99701            jmp word 0x7428
00007291  8B460A            mov ax,[bp+0xa]
00007294  89C3              mov bx,ax
00007296  B013              mov al,0x13
00007298  8807              mov [bx],al
0000729A  FF76FE            push word [bp-0x2]
0000729D  B85B02            mov ax,0x25b
000072A0  50                push ax
000072A1  E83B93            call word 0x5df
000072A4  83C404            add sp,byte +0x4
000072A7  50                push ax
000072A8  8B460A            mov ax,[bp+0xa]
000072AB  89C3              mov bx,ax
000072AD  8A46FC            mov al,[bp-0x4]
000072B0  884701            mov [bx+0x1],al
000072B3  44                inc sp
000072B4  44                inc sp
000072B5  FF76FE            push word [bp-0x2]
000072B8  B85C02            mov ax,0x25c
000072BB  50                push ax
000072BC  E82093            call word 0x5df
000072BF  83C404            add sp,byte +0x4
000072C2  50                push ax
000072C3  8B460A            mov ax,[bp+0xa]
000072C6  89C3              mov bx,ax
000072C8  8A46FC            mov al,[bp-0x4]
000072CB  884702            mov [bx+0x2],al
000072CE  44                inc sp
000072CF  44                inc sp
000072D0  FF76FE            push word [bp-0x2]
000072D3  B85D02            mov ax,0x25d
000072D6  50                push ax
000072D7  E80593            call word 0x5df
000072DA  83C404            add sp,byte +0x4
000072DD  50                push ax
000072DE  8B460A            mov ax,[bp+0xa]
000072E1  89C3              mov bx,ax
000072E3  8A46FC            mov al,[bp-0x4]
000072E6  884703            mov [bx+0x3],al
000072E9  44                inc sp
000072EA  44                inc sp
000072EB  FF76FE            push word [bp-0x2]
000072EE  B86002            mov ax,0x260
000072F1  50                push ax
000072F2  E8618D            call word 0x56
000072F5  89D3              mov bx,dx
000072F7  83C404            add sp,byte +0x4
000072FA  53                push bx
000072FB  50                push ax
000072FC  8B460A            mov ax,[bp+0xa]
000072FF  89C3              mov bx,ax
00007301  8B46FA            mov ax,[bp-0x6]
00007304  8B76FC            mov si,[bp-0x4]
00007307  894704            mov [bx+0x4],ax
0000730A  897706            mov [bx+0x6],si
0000730D  83C404            add sp,byte +0x4
00007310  FF76FE            push word [bp-0x2]
00007313  B85E02            mov ax,0x25e
00007316  50                push ax
00007317  E8D392            call word 0x5ed
0000731A  83C404            add sp,byte +0x4
0000731D  50                push ax
0000731E  8B460A            mov ax,[bp+0xa]
00007321  89C3              mov bx,ax
00007323  8B46FC            mov ax,[bp-0x4]
00007326  894708            mov [bx+0x8],ax
00007329  44                inc sp
0000732A  44                inc sp
0000732B  FF76FE            push word [bp-0x2]
0000732E  B86402            mov ax,0x264
00007331  50                push ax
00007332  E8B892            call word 0x5ed
00007335  83C404            add sp,byte +0x4
00007338  50                push ax
00007339  8B460A            mov ax,[bp+0xa]
0000733C  89C3              mov bx,ax
0000733E  8B46FC            mov ax,[bp-0x4]
00007341  89470A            mov [bx+0xa],ax
00007344  44                inc sp
00007345  44                inc sp
00007346  FF76FE            push word [bp-0x2]
00007349  B86602            mov ax,0x266
0000734C  50                push ax
0000734D  E89D92            call word 0x5ed
00007350  83C404            add sp,byte +0x4
00007353  50                push ax
00007354  8B460A            mov ax,[bp+0xa]
00007357  89C3              mov bx,ax
00007359  8B46FC            mov ax,[bp-0x4]
0000735C  89470C            mov [bx+0xc],ax
0000735F  44                inc sp
00007360  44                inc sp
00007361  FF76FE            push word [bp-0x2]
00007364  B86802            mov ax,0x268
00007367  50                push ax
00007368  E88292            call word 0x5ed
0000736B  83C404            add sp,byte +0x4
0000736E  50                push ax
0000736F  8B460A            mov ax,[bp+0xa]
00007372  89C3              mov bx,ax
00007374  8B46FC            mov ax,[bp-0x4]
00007377  89470E            mov [bx+0xe],ax
0000737A  44                inc sp
0000737B  44                inc sp
0000737C  FF76FE            push word [bp-0x2]
0000737F  B86C02            mov ax,0x26c
00007382  50                push ax
00007383  E85992            call word 0x5df
00007386  83C404            add sp,byte +0x4
00007389  50                push ax
0000738A  8B460A            mov ax,[bp+0xa]
0000738D  89C3              mov bx,ax
0000738F  8A46FC            mov al,[bp-0x4]
00007392  884710            mov [bx+0x10],al
00007395  44                inc sp
00007396  44                inc sp
00007397  FF76FE            push word [bp-0x2]
0000739A  B86E02            mov ax,0x26e
0000739D  50                push ax
0000739E  E83E92            call word 0x5df
000073A1  83C404            add sp,byte +0x4
000073A4  50                push ax
000073A5  8B460A            mov ax,[bp+0xa]
000073A8  89C3              mov bx,ax
000073AA  8A46FC            mov al,[bp-0x4]
000073AD  884711            mov [bx+0x11],al
000073B0  44                inc sp
000073B1  44                inc sp
000073B2  FF76FE            push word [bp-0x2]
000073B5  B86A02            mov ax,0x26a
000073B8  50                push ax
000073B9  E82392            call word 0x5df
000073BC  83C404            add sp,byte +0x4
000073BF  50                push ax
000073C0  8B460A            mov ax,[bp+0xa]
000073C3  89C3              mov bx,ax
000073C5  8A46FC            mov al,[bp-0x4]
000073C8  884712            mov [bx+0x12],al
000073CB  44                inc sp
000073CC  44                inc sp
000073CD  8A4616            mov al,[bp+0x16]
000073D0  84C0              test al,al
000073D2  7510              jnz 0x73e4
000073D4  FF76FE            push word [bp-0x2]
000073D7  B85A02            mov ax,0x25a
000073DA  50                push ax
000073DB  31C0              xor ax,ax
000073DD  50                push ax
000073DE  E81A92            call word 0x5fb
000073E1  83C406            add sp,byte +0x6
000073E4  83C400            add sp,byte +0x0
000073E7  EB6C              jmp short 0x7455
000073E9  EB3D              jmp short 0x7428
000073EB  8B4616            mov ax,[bp+0x16]
000073EE  88E0              mov al,ah
000073F0  30E4              xor ah,ah
000073F2  50                push ax
000073F3  BBF9CE            mov bx,0xcef9
000073F6  53                push bx
000073F7  B80400            mov ax,0x4
000073FA  50                push ax
000073FB  E82C95            call word 0x92a
000073FE  83C406            add sp,byte +0x6
00007401  83C400            add sp,byte +0x0
00007404  EB22              jmp short 0x7428
00007406  EB20              jmp short 0x7428
00007408  EB1E              jmp short 0x7428
0000740A  2D4A00            sub ax,0x4a
0000740D  0F8466FE          jz word 0x7277
00007411  2D0100            sub ax,0x1
00007414  0F8479FE          jz word 0x7291
00007418  2D0100            sub ax,0x1
0000741B  0F8458FE          jz word 0x7277
0000741F  2D0100            sub ax,0x1
00007422  0F8451FE          jz word 0x7277
00007426  EBC3              jmp short 0x73eb
00007428  8A4616            mov al,[bp+0x16]
0000742B  30E4              xor ah,ah
0000742D  0D0001            or ax,0x100
00007430  894616            mov [bp+0x16],ax
00007433  B84000            mov ax,0x40
00007436  50                push ax
00007437  B87400            mov ax,0x74
0000743A  50                push ax
0000743B  8B4616            mov ax,[bp+0x16]
0000743E  88E0              mov al,ah
00007440  30E4              xor ah,ah
00007442  50                push ax
00007443  E8B591            call word 0x5fb
00007446  83C406            add sp,byte +0x6
00007449  8B461C            mov ax,[bp+0x1c]
0000744C  0C01              or al,0x1
0000744E  89461C            mov [bp+0x1c],ax
00007451  89EC              mov sp,bp
00007453  5D                pop bp
00007454  C3                ret
00007455  8A4616            mov al,[bp+0x16]
00007458  0C00              or al,0x0
0000745A  30E4              xor ah,ah
0000745C  894616            mov [bp+0x16],ax
0000745F  B84000            mov ax,0x40
00007462  50                push ax
00007463  B87400            mov ax,0x74
00007466  50                push ax
00007467  31C0              xor ax,ax
00007469  50                push ax
0000746A  E88E91            call word 0x5fb
0000746D  83C406            add sp,byte +0x6
00007470  8B461C            mov ax,[bp+0x1c]
00007473  24FE              and al,0xfe
00007475  89461C            mov [bp+0x1c],ax
00007478  89EC              mov sp,bp
0000747A  5D                pop bp
0000747B  C3                ret
0000747C  55                push bp
0000747D  89E5              mov bp,sp
0000747F  83C4CE            add sp,byte -0x32
00007482  A05D02            mov al,[0x25d]
00007485  30E4              xor ah,ah
00007487  D1E0              shl ax,1
00007489  8846FF            mov [bp-0x1],al
0000748C  8A46FF            mov al,[bp-0x1]
0000748F  30E4              xor ah,ah
00007491  02065E02          add al,[0x25e]
00007495  80D400            adc ah,0x0
00007498  8846FF            mov [bp-0x1],al
0000749B  B84000            mov ax,0x40
0000749E  50                push ax
0000749F  B87400            mov ax,0x74
000074A2  50                push ax
000074A3  31C0              xor ax,ax
000074A5  50                push ax
000074A6  E85291            call word 0x5fb
000074A9  83C406            add sp,byte +0x6
000074AC  A05A02            mov al,[0x25a]
000074AF  84C0              test al,al
000074B1  7409              jz 0x74bc
000074B3  8A4612            mov al,[bp+0x12]
000074B6  3A065C02          cmp al,[0x25c]
000074BA  7422              jz 0x74de
000074BC  8A4612            mov al,[bp+0x12]
000074BF  30E4              xor ah,ah
000074C1  50                push ax
000074C2  8B4616            mov ax,[bp+0x16]
000074C5  88E0              mov al,ah
000074C7  30E4              xor ah,ah
000074C9  50                push ax
000074CA  BBBACE            mov bx,0xceba
000074CD  53                push bx
000074CE  B80400            mov ax,0x4
000074D1  50                push ax
000074D2  E85594            call word 0x92a
000074D5  83C408            add sp,byte +0x8
000074D8  83C400            add sp,byte +0x0
000074DB  E91505            jmp word 0x79f3
000074DE  8B4616            mov ax,[bp+0x16]
000074E1  88E0              mov al,ah
000074E3  30E4              xor ah,ah
000074E5  E99004            jmp word 0x7978
000074E8  83C400            add sp,byte +0x0
000074EB  E93205            jmp word 0x7a20
000074EE  E90205            jmp word 0x79f3
000074F1  8A4616            mov al,[bp+0x16]
000074F4  30E4              xor ah,ah
000074F6  0D0003            or ax,0x300
000074F9  894616            mov [bp+0x16],ax
000074FC  83C400            add sp,byte +0x0
000074FF  E9FC04            jmp word 0x79fe
00007502  E9EE04            jmp word 0x79f3
00007505  B84000            mov ax,0x40
00007508  50                push ax
00007509  B87400            mov ax,0x74
0000750C  50                push ax
0000750D  E8CF90            call word 0x5df
00007510  83C404            add sp,byte +0x4
00007513  8846FE            mov [bp-0x2],al
00007516  8A46FE            mov al,[bp-0x2]
00007519  30E4              xor ah,ah
0000751B  88C4              mov ah,al
0000751D  30C0              xor al,al
0000751F  50                push ax
00007520  8A4616            mov al,[bp+0x16]
00007523  30E4              xor ah,ah
00007525  0B46CC            or ax,[bp-0x34]
00007528  44                inc sp
00007529  44                inc sp
0000752A  894616            mov [bp+0x16],ax
0000752D  B84000            mov ax,0x40
00007530  50                push ax
00007531  B87400            mov ax,0x74
00007534  50                push ax
00007535  31C0              xor ax,ax
00007537  50                push ax
00007538  E8C090            call word 0x5fb
0000753B  83C406            add sp,byte +0x6
0000753E  8A46FE            mov al,[bp-0x2]
00007541  84C0              test al,al
00007543  7408              jz 0x754d
00007545  83C400            add sp,byte +0x0
00007548  E9C904            jmp word 0x7a14
0000754B  EB06              jmp short 0x7553
0000754D  83C400            add sp,byte +0x0
00007550  E9D704            jmp word 0x7a2a
00007553  E99D04            jmp word 0x79f3
00007556  A16E02            mov ax,[0x26e]
00007559  8946FA            mov [bp-0x6],ax
0000755C  A16C02            mov ax,[0x26c]
0000755F  8946F8            mov [bp-0x8],ax
00007562  A16A02            mov ax,[0x26a]
00007565  8946FC            mov [bp-0x4],ax
00007568  A16002            mov ax,[0x260]
0000756B  8B1E6202          mov bx,[0x262]
0000756F  8946E8            mov [bp-0x18],ax
00007572  895EEA            mov [bp-0x16],bx
00007575  8A4614            mov al,[bp+0x14]
00007578  243F              and al,0x3f
0000757A  30E4              xor ah,ah
0000757C  8946F4            mov [bp-0xc],ax
0000757F  8B4614            mov ax,[bp+0x14]
00007582  88E0              mov al,ah
00007584  30E4              xor ah,ah
00007586  50                push ax
00007587  8A4614            mov al,[bp+0x14]
0000758A  24C0              and al,0xc0
0000758C  30E4              xor ah,ah
0000758E  D1E0              shl ax,1
00007590  D1E0              shl ax,1
00007592  0B46CC            or ax,[bp-0x34]
00007595  44                inc sp
00007596  44                inc sp
00007597  8946F2            mov [bp-0xe],ax
0000759A  8B4612            mov ax,[bp+0x12]
0000759D  88E0              mov al,ah
0000759F  30E4              xor ah,ah
000075A1  8946F6            mov [bp-0xa],ax
000075A4  8A4616            mov al,[bp+0x16]
000075A7  30E4              xor ah,ah
000075A9  8946F0            mov [bp-0x10],ax
000075AC  8B4606            mov ax,[bp+0x6]
000075AF  8946DC            mov [bp-0x24],ax
000075B2  8B4610            mov ax,[bp+0x10]
000075B5  8946DA            mov [bp-0x26],ax
000075B8  8B46F0            mov ax,[bp-0x10]
000075BB  85C0              test ax,ax
000075BD  7506              jnz 0x75c5
000075BF  83C400            add sp,byte +0x0
000075C2  E95B04            jmp word 0x7a20
000075C5  8B46F4            mov ax,[bp-0xc]
000075C8  3B46FA            cmp ax,[bp-0x6]
000075CB  7710              ja 0x75dd
000075CD  8B46F2            mov ax,[bp-0xe]
000075D0  3B46F8            cmp ax,[bp-0x8]
000075D3  7308              jnc 0x75dd
000075D5  8B46F6            mov ax,[bp-0xa]
000075D8  3B46FC            cmp ax,[bp-0x4]
000075DB  7206              jc 0x75e3
000075DD  83C400            add sp,byte +0x0
000075E0  E91004            jmp word 0x79f3
000075E3  8B4616            mov ax,[bp+0x16]
000075E6  88E0              mov al,ah
000075E8  30E4              xor ah,ah
000075EA  3D0400            cmp ax,0x4
000075ED  7506              jnz 0x75f5
000075EF  83C400            add sp,byte +0x0
000075F2  E92B04            jmp word 0x7a20
000075F5  8B4610            mov ax,[bp+0x10]
000075F8  B104              mov cl,0x4
000075FA  D3E8              shr ax,cl
000075FC  034606            add ax,[bp+0x6]
000075FF  8946DC            mov [bp-0x24],ax
00007602  8B4610            mov ax,[bp+0x10]
00007605  240F              and al,0xf
00007607  30E4              xor ah,ah
00007609  8946DA            mov [bp-0x26],ax
0000760C  8B46F4            mov ax,[bp-0xc]
0000760F  48                dec ax
00007610  31DB              xor bx,bx
00007612  53                push bx
00007613  50                push ax
00007614  8B46FA            mov ax,[bp-0x6]
00007617  31DB              xor bx,bx
00007619  53                push bx
0000761A  50                push ax
0000761B  8B46F6            mov ax,[bp-0xa]
0000761E  31DB              xor bx,bx
00007620  53                push bx
00007621  50                push ax
00007622  8B46FC            mov ax,[bp-0x4]
00007625  31DB              xor bx,bx
00007627  53                push bx
00007628  50                push ax
00007629  8B46F2            mov ax,[bp-0xe]
0000762C  31DB              xor bx,bx
0000762E  8D7EBE            lea di,[bp-0x42]
00007631  E8868A            call word 0xba
00007634  83C404            add sp,byte +0x4
00007637  8D7EC2            lea di,[bp-0x3e]
0000763A  E8578A            call word 0x94
0000763D  83C404            add sp,byte +0x4
00007640  8D7EC6            lea di,[bp-0x3a]
00007643  E8748A            call word 0xba
00007646  83C404            add sp,byte +0x4
00007649  8D7ECA            lea di,[bp-0x36]
0000764C  E8458A            call word 0x94
0000764F  83C404            add sp,byte +0x4
00007652  8946EC            mov [bp-0x14],ax
00007655  895EEE            mov [bp-0x12],bx
00007658  8B4616            mov ax,[bp+0x16]
0000765B  30C0              xor al,al
0000765D  0B46F0            or ax,[bp-0x10]
00007660  894616            mov [bp+0x16],ax
00007663  B80400            mov ax,0x4
00007666  31DB              xor bx,bx
00007668  53                push bx
00007669  50                push ax
0000766A  8B46EC            mov ax,[bp-0x14]
0000766D  8B5EEE            mov bx,[bp-0x12]
00007670  8D7ECA            lea di,[bp-0x36]
00007673  E8C98A            call word 0x13f
00007676  83C404            add sp,byte +0x4
00007679  8946E4            mov [bp-0x1c],ax
0000767C  895EE6            mov [bp-0x1a],bx
0000767F  8B46EC            mov ax,[bp-0x14]
00007682  2403              and al,0x3
00007684  30E4              xor ah,ah
00007686  8946DE            mov [bp-0x22],ax
00007689  8B46F0            mov ax,[bp-0x10]
0000768C  31DB              xor bx,bx
0000768E  8D7EEC            lea di,[bp-0x14]
00007691  E8008A            call word 0x94
00007694  53                push bx
00007695  50                push ax
00007696  B80100            mov ax,0x1
00007699  31DB              xor bx,bx
0000769B  53                push bx
0000769C  50                push ax
0000769D  8B46CA            mov ax,[bp-0x36]
000076A0  8B5ECC            mov bx,[bp-0x34]
000076A3  8D7EC6            lea di,[bp-0x3a]
000076A6  E8098A            call word 0xb2
000076A9  83C408            add sp,byte +0x8
000076AC  53                push bx
000076AD  50                push ax
000076AE  B80400            mov ax,0x4
000076B1  31DB              xor bx,bx
000076B3  53                push bx
000076B4  50                push ax
000076B5  8B46CA            mov ax,[bp-0x36]
000076B8  8B5ECC            mov bx,[bp-0x34]
000076BB  8D7EC6            lea di,[bp-0x3a]
000076BE  E87E8A            call word 0x13f
000076C1  83C408            add sp,byte +0x8
000076C4  8946E0            mov [bp-0x20],ax
000076C7  895EE2            mov [bp-0x1e],bx
000076CA  B80C00            mov ax,0xc
000076CD  50                push ax
000076CE  E8898F            call word 0x65a
000076D1  50                push ax
000076D2  8D5ECE            lea bx,[bp-0x32]
000076D5  53                push bx
000076D6  31C0              xor ax,ax
000076D8  50                push ax
000076D9  E82489            call word 0x0
000076DC  83C408            add sp,byte +0x8
000076DF  B028              mov al,0x28
000076E1  8846CE            mov [bp-0x32],al
000076E4  8B46E0            mov ax,[bp-0x20]
000076E7  8B5EE2            mov bx,[bp-0x1e]
000076EA  8D7EE4            lea di,[bp-0x1c]
000076ED  E8C289            call word 0xb2
000076F0  53                push bx
000076F1  50                push ax
000076F2  B80100            mov ax,0x1
000076F5  31DB              xor bx,bx
000076F7  53                push bx
000076F8  50                push ax
000076F9  8B46CA            mov ax,[bp-0x36]
000076FC  8B5ECC            mov bx,[bp-0x34]
000076FF  8D7EC6            lea di,[bp-0x3a]
00007702  E88F89            call word 0x94
00007705  83C408            add sp,byte +0x8
00007708  30C0              xor al,al
0000770A  88E0              mov al,ah
0000770C  30E4              xor ah,ah
0000770E  8846D5            mov [bp-0x2b],al
00007711  8B46E0            mov ax,[bp-0x20]
00007714  8B5EE2            mov bx,[bp-0x1e]
00007717  8D7EE4            lea di,[bp-0x1c]
0000771A  E89589            call word 0xb2
0000771D  53                push bx
0000771E  50                push ax
0000771F  B80100            mov ax,0x1
00007722  31DB              xor bx,bx
00007724  53                push bx
00007725  50                push ax
00007726  8B46CA            mov ax,[bp-0x36]
00007729  8B5ECC            mov bx,[bp-0x34]
0000772C  8D7EC6            lea di,[bp-0x3a]
0000772F  E86289            call word 0x94
00007732  83C408            add sp,byte +0x8
00007735  8846D6            mov [bp-0x2a],al
00007738  8B46E8            mov ax,[bp-0x18]
0000773B  8B5EEA            mov bx,[bp-0x16]
0000773E  8D7EE4            lea di,[bp-0x1c]
00007741  E85089            call word 0x94
00007744  53                push bx
00007745  50                push ax
00007746  31C0              xor ax,ax
00007748  BB00FF            mov bx,0xff00
0000774B  53                push bx
0000774C  50                push ax
0000774D  8B46CA            mov ax,[bp-0x36]
00007750  8B5ECC            mov bx,[bp-0x34]
00007753  8D7EC6            lea di,[bp-0x3a]
00007756  E83389            call word 0x8c
00007759  83C408            add sp,byte +0x8
0000775C  93                xchg ax,bx
0000775D  88E0              mov al,ah
0000775F  30E4              xor ah,ah
00007761  31DB              xor bx,bx
00007763  8846D0            mov [bp-0x30],al
00007766  8B46E8            mov ax,[bp-0x18]
00007769  8B5EEA            mov bx,[bp-0x16]
0000776C  8D7EE4            lea di,[bp-0x1c]
0000776F  E82289            call word 0x94
00007772  53                push bx
00007773  50                push ax
00007774  31C0              xor ax,ax
00007776  BBFF00            mov bx,0xff
00007779  53                push bx
0000777A  50                push ax
0000777B  8B46CA            mov ax,[bp-0x36]
0000777E  8B5ECC            mov bx,[bp-0x34]
00007781  8D7EC6            lea di,[bp-0x3a]
00007784  E80589            call word 0x8c
00007787  83C408            add sp,byte +0x8
0000778A  93                xchg ax,bx
0000778B  31DB              xor bx,bx
0000778D  8846D1            mov [bp-0x2f],al
00007790  8B46E8            mov ax,[bp-0x18]
00007793  8B5EEA            mov bx,[bp-0x16]
00007796  8D7EE4            lea di,[bp-0x1c]
00007799  E8F888            call word 0x94
0000779C  53                push bx
0000779D  50                push ax
0000779E  B800FF            mov ax,0xff00
000077A1  31DB              xor bx,bx
000077A3  53                push bx
000077A4  50                push ax
000077A5  8B46CA            mov ax,[bp-0x36]
000077A8  8B5ECC            mov bx,[bp-0x34]
000077AB  8D7EC6            lea di,[bp-0x3a]
000077AE  E8DB88            call word 0x8c
000077B1  83C408            add sp,byte +0x8
000077B4  88E0              mov al,ah
000077B6  88DC              mov ah,bl
000077B8  88FB              mov bl,bh
000077BA  28FF              sub bh,bh
000077BC  8846D2            mov [bp-0x2e],al
000077BF  8B46E8            mov ax,[bp-0x18]
000077C2  8B5EEA            mov bx,[bp-0x16]
000077C5  8D7EE4            lea di,[bp-0x1c]
000077C8  E8C988            call word 0x94
000077CB  53                push bx
000077CC  50                push ax
000077CD  B8FF00            mov ax,0xff
000077D0  31DB              xor bx,bx
000077D2  53                push bx
000077D3  50                push ax
000077D4  8B46CA            mov ax,[bp-0x36]
000077D7  8B5ECC            mov bx,[bp-0x34]
000077DA  8D7EC6            lea di,[bp-0x3a]
000077DD  E8AC88            call word 0x8c
000077E0  83C408            add sp,byte +0x8
000077E3  8846D3            mov [bp-0x2d],al
000077E6  FF76DA            push word [bp-0x26]
000077E9  FF76DC            push word [bp-0x24]
000077EC  B80100            mov ax,0x1
000077EF  50                push ax
000077F0  8B46F0            mov ax,[bp-0x10]
000077F3  31DB              xor bx,bx
000077F5  53                push bx
000077F6  50                push ax
000077F7  B80002            mov ax,0x200
000077FA  31DB              xor bx,bx
000077FC  53                push bx
000077FD  50                push ax
000077FE  8B46C4            mov ax,[bp-0x3c]
00007801  8B5EC6            mov bx,[bp-0x3a]
00007804  8D7EC0            lea di,[bp-0x40]
00007807  E8B088            call word 0xba
0000780A  83C408            add sp,byte +0x8
0000780D  53                push bx
0000780E  50                push ax
0000780F  8B46DE            mov ax,[bp-0x22]
00007812  B90002            mov cx,0x200
00007815  F7E9              imul cx
00007817  50                push ax
00007818  8D5ECE            lea bx,[bp-0x32]
0000781B  53                push bx
0000781C  E83B8E            call word 0x65a
0000781F  50                push ax
00007820  B80C00            mov ax,0xc
00007823  50                push ax
00007824  8A46FF            mov al,[bp-0x1]
00007827  30E4              xor ah,ah
00007829  50                push ax
0000782A  E83FB5            call word 0x2d6c
0000782D  83C414            add sp,byte +0x14
00007830  8846FE            mov [bp-0x2],al
00007833  84C0              test al,al
00007835  7437              jz 0x786e
00007837  8A46FE            mov al,[bp-0x2]
0000783A  30E4              xor ah,ah
0000783C  50                push ax
0000783D  8B4616            mov ax,[bp+0x16]
00007840  88E0              mov al,ah
00007842  30E4              xor ah,ah
00007844  50                push ax
00007845  BB90CE            mov bx,0xce90
00007848  53                push bx
00007849  B80400            mov ax,0x4
0000784C  50                push ax
0000784D  E8DA90            call word 0x92a
00007850  83C408            add sp,byte +0x8
00007853  8A4616            mov al,[bp+0x16]
00007856  30E4              xor ah,ah
00007858  0D0002            or ax,0x200
0000785B  894616            mov [bp+0x16],ax
0000785E  8B4616            mov ax,[bp+0x16]
00007861  30C0              xor al,al
00007863  0C00              or al,0x0
00007865  894616            mov [bp+0x16],ax
00007868  83C400            add sp,byte +0x0
0000786B  E99001            jmp word 0x79fe
0000786E  83C400            add sp,byte +0x0
00007871  E9AC01            jmp word 0x7a20
00007874  E97C01            jmp word 0x79f3
00007877  A16E02            mov ax,[0x26e]
0000787A  8946FA            mov [bp-0x6],ax
0000787D  A16C02            mov ax,[0x26c]
00007880  48                dec ax
00007881  8946F8            mov [bp-0x8],ax
00007884  A16A02            mov ax,[0x26a]
00007887  48                dec ax
00007888  8946FC            mov [bp-0x4],ax
0000788B  8B4616            mov ax,[bp+0x16]
0000788E  30C0              xor al,al
00007890  0C00              or al,0x0
00007892  894616            mov [bp+0x16],ax
00007895  8B4610            mov ax,[bp+0x10]
00007898  30C0              xor al,al
0000789A  0C00              or al,0x0
0000789C  894610            mov [bp+0x10],ax
0000789F  8A46F8            mov al,[bp-0x8]
000078A2  30E4              xor ah,ah
000078A4  88C4              mov ah,al
000078A6  30C0              xor al,al
000078A8  50                push ax
000078A9  8A4614            mov al,[bp+0x14]
000078AC  30E4              xor ah,ah
000078AE  0B46CC            or ax,[bp-0x34]
000078B1  44                inc sp
000078B2  44                inc sp
000078B3  894614            mov [bp+0x14],ax
000078B6  8A46FA            mov al,[bp-0x6]
000078B9  243F              and al,0x3f
000078BB  50                push ax
000078BC  8B46F8            mov ax,[bp-0x8]
000078BF  D1E8              shr ax,1
000078C1  D1E8              shr ax,1
000078C3  24C0              and al,0xc0
000078C5  0A46CC            or al,[bp-0x34]
000078C8  44                inc sp
000078C9  44                inc sp
000078CA  50                push ax
000078CB  8B4614            mov ax,[bp+0x14]
000078CE  30C0              xor al,al
000078D0  0A46CC            or al,[bp-0x34]
000078D3  44                inc sp
000078D4  44                inc sp
000078D5  894614            mov [bp+0x14],ax
000078D8  8B46FC            mov ax,[bp-0x4]
000078DB  88C4              mov ah,al
000078DD  30C0              xor al,al
000078DF  50                push ax
000078E0  8A4612            mov al,[bp+0x12]
000078E3  30E4              xor ah,ah
000078E5  0B46CC            or ax,[bp-0x34]
000078E8  44                inc sp
000078E9  44                inc sp
000078EA  894612            mov [bp+0x12],ax
000078ED  8B4612            mov ax,[bp+0x12]
000078F0  30C0              xor al,al
000078F2  0C02              or al,0x2
000078F4  894612            mov [bp+0x12],ax
000078F7  A05B02            mov al,[0x25b]
000078FA  EB26              jmp short 0x7922
000078FC  8B4610            mov ax,[bp+0x10]
000078FF  30C0              xor al,al
00007901  0C02              or al,0x2
00007903  894610            mov [bp+0x10],ax
00007906  EB26              jmp short 0x792e
00007908  8B4610            mov ax,[bp+0x10]
0000790B  30C0              xor al,al
0000790D  0C04              or al,0x4
0000790F  894610            mov [bp+0x10],ax
00007912  EB1A              jmp short 0x792e
00007914  8B4610            mov ax,[bp+0x10]
00007917  30C0              xor al,al
00007919  0C06              or al,0x6
0000791B  894610            mov [bp+0x10],ax
0000791E  EB0E              jmp short 0x792e
00007920  EB0C              jmp short 0x792e
00007922  2C01              sub al,0x1
00007924  74D6              jz 0x78fc
00007926  2C01              sub al,0x1
00007928  74DE              jz 0x7908
0000792A  2C01              sub al,0x1
0000792C  74E6              jz 0x7914
0000792E  55                push bp
0000792F  89E5              mov bp,sp
00007931  B8DEEF            mov ax,0xefde
00007934  89463C            mov [bp+0x3c],ax
00007937  8C4E3A            mov [bp+0x3a],cs
0000793A  5D                pop bp
0000793B  83C400            add sp,byte +0x0
0000793E  E9DF00            jmp word 0x7a20
00007941  E9AF00            jmp word 0x79f3
00007944  8A4616            mov al,[bp+0x16]
00007947  30E4              xor ah,ah
00007949  0D0003            or ax,0x300
0000794C  894616            mov [bp+0x16],ax
0000794F  83C400            add sp,byte +0x0
00007952  E9D500            jmp word 0x7a2a
00007955  E99B00            jmp word 0x79f3
00007958  8B4616            mov ax,[bp+0x16]
0000795B  88E0              mov al,ah
0000795D  30E4              xor ah,ah
0000795F  50                push ax
00007960  BB58CE            mov bx,0xce58
00007963  53                push bx
00007964  B80400            mov ax,0x4
00007967  50                push ax
00007968  E8BF8F            call word 0x92a
0000796B  83C406            add sp,byte +0x6
0000796E  83C400            add sp,byte +0x0
00007971  E97F00            jmp word 0x79f3
00007974  EB7D              jmp short 0x79f3
00007976  EB7B              jmp short 0x79f3
00007978  2D0000            sub ax,0x0
0000797B  7CDB              jl 0x7958
0000797D  3D1800            cmp ax,0x18
00007980  773B              ja 0x79bd
00007982  D1E0              shl ax,1
00007984  89C3              mov bx,ax
00007986  2EFFA78B79        jmp word [cs:bx+0x798b]
0000798B  E87405            call word 0x7f02
0000798E  7556              jnz 0x79e6
00007990  75F1              jnz 0x7983
00007992  7456              jz 0x79ea
00007994  75F1              jnz 0x7987
00007996  7458              jz 0x79f0
00007998  7958              jns 0x79f2
0000799A  7977              jns 0x7a13
0000799C  78E8              js 0x7986
0000799E  7458              jz 0x79f8
000079A0  7958              jns 0x79fa
000079A2  79E8              jns 0x798c
000079A4  74E8              jz 0x798e
000079A6  7458              jz 0x7a00
000079A8  7958              jns 0x7a02
000079AA  79E8              jns 0x7994
000079AC  74E8              jz 0x7996
000079AE  7458              jz 0x7a08
000079B0  7958              jns 0x7a0a
000079B2  79E8              jns 0x799c
000079B4  7444              jz 0x79fa
000079B6  79E8              jns 0x79a0
000079B8  7458              jz 0x7a12
000079BA  7958              jns 0x7a14
000079BC  792D              jns 0x79eb
000079BE  41                inc cx
000079BF  007296            add [bp+si-0x6a],dh
000079C2  3D0F00            cmp ax,0xf
000079C5  7729              ja 0x79f0
000079C7  D1E0              shl ax,1
000079C9  89C3              mov bx,ax
000079CB  2EFFA7D079        jmp word [cs:bx+0x79d0]
000079D0  58                pop ax
000079D1  7958              jns 0x7a2b
000079D3  7958              jns 0x7a2d
000079D5  7958              jns 0x7a2f
000079D7  7958              jns 0x7a31
000079D9  7958              jns 0x7a33
000079DB  7958              jns 0x7a35
000079DD  7958              jns 0x7a37
000079DF  7958              jns 0x7a39
000079E1  7958              jns 0x7a3b
000079E3  7958              jns 0x7a3d
000079E5  7958              jns 0x7a3f
000079E7  7958              jns 0x7a41
000079E9  7958              jns 0x7a43
000079EB  7958              jns 0x7a45
000079ED  7958              jns 0x7a47
000079EF  79E9              jns 0x79da
000079F1  65FF8A4616        dec word [gs:bp+si+0x1646]
000079F6  30E4              xor ah,ah
000079F8  0D0001            or ax,0x100
000079FB  894616            mov [bp+0x16],ax
000079FE  B84000            mov ax,0x40
00007A01  50                push ax
00007A02  B87400            mov ax,0x74
00007A05  50                push ax
00007A06  8B4616            mov ax,[bp+0x16]
00007A09  88E0              mov al,ah
00007A0B  30E4              xor ah,ah
00007A0D  50                push ax
00007A0E  E8EA8B            call word 0x5fb
00007A11  83C406            add sp,byte +0x6
00007A14  8B461C            mov ax,[bp+0x1c]
00007A17  0C01              or al,0x1
00007A19  89461C            mov [bp+0x1c],ax
00007A1C  89EC              mov sp,bp
00007A1E  5D                pop bp
00007A1F  C3                ret
00007A20  8A4616            mov al,[bp+0x16]
00007A23  0C00              or al,0x0
00007A25  30E4              xor ah,ah
00007A27  894616            mov [bp+0x16],ax
00007A2A  B84000            mov ax,0x40
00007A2D  50                push ax
00007A2E  B87400            mov ax,0x74
00007A31  50                push ax
00007A32  31C0              xor ax,ax
00007A34  50                push ax
00007A35  E8C38B            call word 0x5fb
00007A38  83C406            add sp,byte +0x6
00007A3B  8B461C            mov ax,[bp+0x1c]
00007A3E  24FE              and al,0xfe
00007A40  89461C            mov [bp+0x1c],ax
00007A43  89EC              mov sp,bp
00007A45  5D                pop bp
00007A46  C3                ret
00007A47  55                push bp
00007A48  89E5              mov bp,sp
00007A4A  4C                dec sp
00007A4B  4C                dec sp
00007A4C  B8F203            mov ax,0x3f2
00007A4F  50                push ax
00007A50  E8D68A            call word 0x529
00007A53  44                inc sp
00007A54  44                inc sp
00007A55  8846FF            mov [bp-0x1],al
00007A58  8A46FF            mov al,[bp-0x1]
00007A5B  24FB              and al,0xfb
00007A5D  30E4              xor ah,ah
00007A5F  50                push ax
00007A60  B8F203            mov ax,0x3f2
00007A63  50                push ax
00007A64  E8D88A            call word 0x53f
00007A67  83C404            add sp,byte +0x4
00007A6A  8A46FF            mov al,[bp-0x1]
00007A6D  0C04              or al,0x4
00007A6F  30E4              xor ah,ah
00007A71  50                push ax
00007A72  B8F203            mov ax,0x3f2
00007A75  50                push ax
00007A76  E8C68A            call word 0x53f
00007A79  83C404            add sp,byte +0x4
00007A7C  B8F403            mov ax,0x3f4
00007A7F  50                push ax
00007A80  E8A68A            call word 0x529
00007A83  44                inc sp
00007A84  44                inc sp
00007A85  8846FF            mov [bp-0x1],al
00007A88  8A46FF            mov al,[bp-0x1]
00007A8B  24C0              and al,0xc0
00007A8D  3C80              cmp al,0x80
00007A8F  75EB              jnz 0x7a7c
00007A91  89EC              mov sp,bp
00007A93  5D                pop bp
00007A94  C3                ret
00007A95  55                push bp
00007A96  89E5              mov bp,sp
00007A98  83C4FC            add sp,byte -0x4
00007A9B  A03E00            mov al,[0x3e]
00007A9E  8846FF            mov [bp-0x1],al
00007AA1  8A46FF            mov al,[bp-0x1]
00007AA4  247F              and al,0x7f
00007AA6  8846FF            mov [bp-0x1],al
00007AA9  8A46FF            mov al,[bp-0x1]
00007AAC  A23E00            mov [0x3e],al
00007AAF  B8F203            mov ax,0x3f2
00007AB2  50                push ax
00007AB3  E8738A            call word 0x529
00007AB6  44                inc sp
00007AB7  44                inc sp
00007AB8  2404              and al,0x4
00007ABA  8846FD            mov [bp-0x3],al
00007ABD  8B4604            mov ax,[bp+0x4]
00007AC0  85C0              test ax,ax
00007AC2  7407              jz 0x7acb
00007AC4  B020              mov al,0x20
00007AC6  8846FE            mov [bp-0x2],al
00007AC9  EB05              jmp short 0x7ad0
00007ACB  B010              mov al,0x10
00007ACD  8846FE            mov [bp-0x2],al
00007AD0  8A46FE            mov al,[bp-0x2]
00007AD3  0C0C              or al,0xc
00007AD5  8846FE            mov [bp-0x2],al
00007AD8  8B4604            mov ax,[bp+0x4]
00007ADB  0A46FE            or al,[bp-0x2]
00007ADE  8846FE            mov [bp-0x2],al
00007AE1  8A46FE            mov al,[bp-0x2]
00007AE4  30E4              xor ah,ah
00007AE6  50                push ax
00007AE7  B8F203            mov ax,0x3f2
00007AEA  50                push ax
00007AEB  E8518A            call word 0x53f
00007AEE  83C404            add sp,byte +0x4
00007AF1  B025              mov al,0x25
00007AF3  A24000            mov [0x40],al
00007AF6  B8F403            mov ax,0x3f4
00007AF9  50                push ax
00007AFA  E82C8A            call word 0x529
00007AFD  44                inc sp
00007AFE  44                inc sp
00007AFF  8846FF            mov [bp-0x1],al
00007B02  8A46FF            mov al,[bp-0x1]
00007B05  24C0              and al,0xc0
00007B07  3C80              cmp al,0x80
00007B09  75EB              jnz 0x7af6
00007B0B  8A46FD            mov al,[bp-0x3]
00007B0E  84C0              test al,al
00007B10  751F              jnz 0x7b31
00007B12  FB                sti
00007B13  A03E00            mov al,[0x3e]
00007B16  8846FF            mov [bp-0x1],al
00007B19  8A46FF            mov al,[bp-0x1]
00007B1C  2480              and al,0x80
00007B1E  84C0              test al,al
00007B20  74F1              jz 0x7b13
00007B22  8A46FF            mov al,[bp-0x1]
00007B25  247F              and al,0x7f
00007B27  8846FF            mov [bp-0x1],al
00007B2A  FA                cli
00007B2B  8A46FF            mov al,[bp-0x1]
00007B2E  A23E00            mov [0x3e],al
00007B31  89EC              mov sp,bp
00007B33  5D                pop bp
00007B34  C3                ret
00007B35  55                push bp
00007B36  89E5              mov bp,sp
00007B38  83C4FC            add sp,byte -0x4
00007B3B  A03E00            mov al,[0x3e]
00007B3E  8846FF            mov [bp-0x1],al
00007B41  8B4604            mov ax,[bp+0x4]
00007B44  85C0              test ax,ax
00007B46  740A              jz 0x7b52
00007B48  8A46FF            mov al,[bp-0x1]
00007B4B  30E4              xor ah,ah
00007B4D  D1E8              shr ax,1
00007B4F  8846FF            mov [bp-0x1],al
00007B52  8A46FF            mov al,[bp-0x1]
00007B55  2401              and al,0x1
00007B57  8846FF            mov [bp-0x1],al
00007B5A  8A46FF            mov al,[bp-0x1]
00007B5D  84C0              test al,al
00007B5F  7506              jnz 0x7b67
00007B61  31C0              xor ax,ax
00007B63  89EC              mov sp,bp
00007B65  5D                pop bp
00007B66  C3                ret
00007B67  B89000            mov ax,0x90
00007B6A  8946FC            mov [bp-0x4],ax
00007B6D  8B4604            mov ax,[bp+0x4]
00007B70  85C0              test ax,ax
00007B72  7407              jz 0x7b7b
00007B74  8B46FC            mov ax,[bp-0x4]
00007B77  40                inc ax
00007B78  8946FC            mov [bp-0x4],ax
00007B7B  8B5EFC            mov bx,[bp-0x4]
00007B7E  8A07              mov al,[bx]
00007B80  8846FF            mov [bp-0x1],al
00007B83  8A46FF            mov al,[bp-0x1]
00007B86  30E4              xor ah,ah
00007B88  B104              mov cl,0x4
00007B8A  D3E8              shr ax,cl
00007B8C  2401              and al,0x1
00007B8E  8846FF            mov [bp-0x1],al
00007B91  8A46FF            mov al,[bp-0x1]
00007B94  84C0              test al,al
00007B96  7506              jnz 0x7b9e
00007B98  31C0              xor ax,ax
00007B9A  89EC              mov sp,bp
00007B9C  5D                pop bp
00007B9D  C3                ret
00007B9E  B80100            mov ax,0x1
00007BA1  89EC              mov sp,bp
00007BA3  5D                pop bp
00007BA4  C3                ret
00007BA5  55                push bp
00007BA6  89E5              mov bp,sp
00007BA8  83C4F8            add sp,byte -0x8
00007BAB  FF7604            push word [bp+0x4]
00007BAE  E8E500            call word 0x7c96
00007BB1  44                inc sp
00007BB2  44                inc sp
00007BB3  85C0              test ax,ax
00007BB5  7506              jnz 0x7bbd
00007BB7  31C0              xor ax,ax
00007BB9  89EC              mov sp,bp
00007BBB  5D                pop bp
00007BBC  C3                ret
00007BBD  B81000            mov ax,0x10
00007BC0  50                push ax
00007BC1  E8AA89            call word 0x56e
00007BC4  44                inc sp
00007BC5  44                inc sp
00007BC6  8846FB            mov [bp-0x5],al
00007BC9  8B4604            mov ax,[bp+0x4]
00007BCC  85C0              test ax,ax
00007BCE  750E              jnz 0x7bde
00007BD0  8A46FB            mov al,[bp-0x5]
00007BD3  30E4              xor ah,ah
00007BD5  B104              mov cl,0x4
00007BD7  D3E8              shr ax,cl
00007BD9  8846FB            mov [bp-0x5],al
00007BDC  EB08              jmp short 0x7be6
00007BDE  8A46FB            mov al,[bp-0x5]
00007BE1  240F              and al,0xf
00007BE3  8846FB            mov [bp-0x5],al
00007BE6  8A46FB            mov al,[bp-0x5]
00007BE9  E95B00            jmp word 0x7c47
00007BEC  30C0              xor al,al
00007BEE  8846FA            mov [bp-0x6],al
00007BF1  B025              mov al,0x25
00007BF3  8846F9            mov [bp-0x7],al
00007BF6  B80100            mov ax,0x1
00007BF9  8946FE            mov [bp-0x2],ax
00007BFC  EB6E              jmp short 0x7c6c
00007BFE  30C0              xor al,al
00007C00  8846FA            mov [bp-0x6],al
00007C03  B017              mov al,0x17
00007C05  8846F9            mov [bp-0x7],al
00007C08  B80100            mov ax,0x1
00007C0B  8946FE            mov [bp-0x2],ax
00007C0E  EB5C              jmp short 0x7c6c
00007C10  B0CC              mov al,0xcc
00007C12  8846FA            mov [bp-0x6],al
00007C15  B0D7              mov al,0xd7
00007C17  8846F9            mov [bp-0x7],al
00007C1A  B80100            mov ax,0x1
00007C1D  8946FE            mov [bp-0x2],ax
00007C20  EB4A              jmp short 0x7c6c
00007C22  30C0              xor al,al
00007C24  8846FA            mov [bp-0x6],al
00007C27  B027              mov al,0x27
00007C29  8846F9            mov [bp-0x7],al
00007C2C  B80100            mov ax,0x1
00007C2F  8946FE            mov [bp-0x2],ax
00007C32  EB38              jmp short 0x7c6c
00007C34  30C0              xor al,al
00007C36  8846FA            mov [bp-0x6],al
00007C39  30C0              xor al,al
00007C3B  8846F9            mov [bp-0x7],al
00007C3E  31C0              xor ax,ax
00007C40  8946FE            mov [bp-0x2],ax
00007C43  EB27              jmp short 0x7c6c
00007C45  EB25              jmp short 0x7c6c
00007C47  2C01              sub al,0x1
00007C49  72E9              jc 0x7c34
00007C4B  3C07              cmp al,0x7
00007C4D  771B              ja 0x7c6a
00007C4F  30E4              xor ah,ah
00007C51  D1E0              shl ax,1
00007C53  89C3              mov bx,ax
00007C55  2EFFA75A7C        jmp word [cs:bx+0x7c5a]
00007C5A  EC                in al,dx
00007C5B  7BEC              jpo 0x7c49
00007C5D  7BFE              jpo 0x7c5d
00007C5F  7BFE              jpo 0x7c5f
00007C61  7B10              jpo 0x7c73
00007C63  7C22              jl 0x7c87
00007C65  7C22              jl 0x7c89
00007C67  7C22              jl 0x7c8b
00007C69  7CEB              jl 0x7c56
00007C6B  C88B4604          enter 0x468b,0x4
00007C6F  85C0              test ax,ax
00007C71  7508              jnz 0x7c7b
00007C73  B89000            mov ax,0x90
00007C76  8946FC            mov [bp-0x4],ax
00007C79  EB06              jmp short 0x7c81
00007C7B  B89100            mov ax,0x91
00007C7E  8946FC            mov [bp-0x4],ax
00007C81  8A46FA            mov al,[bp-0x6]
00007C84  A28B00            mov [0x8b],al
00007C87  8B5EFC            mov bx,[bp-0x4]
00007C8A  8A46F9            mov al,[bp-0x7]
00007C8D  8807              mov [bx],al
00007C8F  8B46FE            mov ax,[bp-0x2]
00007C92  89EC              mov sp,bp
00007C94  5D                pop bp
00007C95  C3                ret
00007C96  55                push bp
00007C97  89E5              mov bp,sp
00007C99  83C4FC            add sp,byte -0x4
00007C9C  FF7604            push word [bp+0x4]
00007C9F  E8F3FD            call word 0x7a95
00007CA2  44                inc sp
00007CA3  44                inc sp
00007CA4  B80700            mov ax,0x7
00007CA7  50                push ax
00007CA8  B8F503            mov ax,0x3f5
00007CAB  50                push ax
00007CAC  E89088            call word 0x53f
00007CAF  83C404            add sp,byte +0x4
00007CB2  FF7604            push word [bp+0x4]
00007CB5  B8F503            mov ax,0x3f5
00007CB8  50                push ax
00007CB9  E88388            call word 0x53f
00007CBC  83C404            add sp,byte +0x4
00007CBF  FB                sti
00007CC0  A03E00            mov al,[0x3e]
00007CC3  2480              and al,0x80
00007CC5  8846FF            mov [bp-0x1],al
00007CC8  8A46FF            mov al,[bp-0x1]
00007CCB  84C0              test al,al
00007CCD  74F1              jz 0x7cc0
00007CCF  30C0              xor al,al
00007CD1  8846FF            mov [bp-0x1],al
00007CD4  FA                cli
00007CD5  A03E00            mov al,[0x3e]
00007CD8  8846FF            mov [bp-0x1],al
00007CDB  8A46FF            mov al,[bp-0x1]
00007CDE  247F              and al,0x7f
00007CE0  8846FF            mov [bp-0x1],al
00007CE3  8B4604            mov ax,[bp+0x4]
00007CE6  85C0              test ax,ax
00007CE8  7410              jz 0x7cfa
00007CEA  8A46FF            mov al,[bp-0x1]
00007CED  0C02              or al,0x2
00007CEF  8846FF            mov [bp-0x1],al
00007CF2  B89500            mov ax,0x95
00007CF5  8946FC            mov [bp-0x4],ax
00007CF8  EB0E              jmp short 0x7d08
00007CFA  8A46FF            mov al,[bp-0x1]
00007CFD  0C01              or al,0x1
00007CFF  8846FF            mov [bp-0x1],al
00007D02  B89400            mov ax,0x94
00007D05  8946FC            mov [bp-0x4],ax
00007D08  8A46FF            mov al,[bp-0x1]
00007D0B  A23E00            mov [0x3e],al
00007D0E  8B5EFC            mov bx,[bp-0x4]
00007D11  30C0              xor al,al
00007D13  8807              mov [bx],al
00007D15  B80100            mov ax,0x1
00007D18  89EC              mov sp,bp
00007D1A  5D                pop bp
00007D1B  C3                ret
00007D1C  55                push bp
00007D1D  89E5              mov bp,sp
00007D1F  4C                dec sp
00007D20  4C                dec sp
00007D21  B81000            mov ax,0x10
00007D24  50                push ax
00007D25  E84688            call word 0x56e
00007D28  44                inc sp
00007D29  44                inc sp
00007D2A  8846FF            mov [bp-0x1],al
00007D2D  8B4604            mov ax,[bp+0x4]
00007D30  85C0              test ax,ax
00007D32  750E              jnz 0x7d42
00007D34  8A46FF            mov al,[bp-0x1]
00007D37  30E4              xor ah,ah
00007D39  B104              mov cl,0x4
00007D3B  D3E8              shr ax,cl
00007D3D  8846FF            mov [bp-0x1],al
00007D40  EB08              jmp short 0x7d4a
00007D42  8A46FF            mov al,[bp-0x1]
00007D45  240F              and al,0xf
00007D47  8846FF            mov [bp-0x1],al
00007D4A  8A46FF            mov al,[bp-0x1]
00007D4D  84C0              test al,al
00007D4F  7508              jnz 0x7d59
00007D51  31C0              xor ax,ax
00007D53  89EC              mov sp,bp
00007D55  5D                pop bp
00007D56  C3                ret
00007D57  EB07              jmp short 0x7d60
00007D59  B80100            mov ax,0x1
00007D5C  89EC              mov sp,bp
00007D5E  5D                pop bp
00007D5F  C3                ret
00007D60  89EC              mov sp,bp
00007D62  5D                pop bp
00007D63  C3                ret
00007D64  55                push bp
00007D65  89E5              mov bp,sp
00007D67  83C4DE            add sp,byte -0x22
00007D6A  8B4616            mov ax,[bp+0x16]
00007D6D  88E0              mov al,ah
00007D6F  30E4              xor ah,ah
00007D71  8846E6            mov [bp-0x1a],al
00007D74  8A46E6            mov al,[bp-0x1a]
00007D77  E9EA0F            jmp word 0x8d64
00007D7A  8A460E            mov al,[bp+0xe]
00007D7D  8846FF            mov [bp-0x1],al
00007D80  8A46FF            mov al,[bp-0x1]
00007D83  3C01              cmp al,0x1
00007D85  7620              jna 0x7da7
00007D87  8A4616            mov al,[bp+0x16]
00007D8A  30E4              xor ah,ah
00007D8C  0D0001            or ax,0x100
00007D8F  894616            mov [bp+0x16],ax
00007D92  B80100            mov ax,0x1
00007D95  50                push ax
00007D96  E80E10            call word 0x8da7
00007D99  44                inc sp
00007D9A  44                inc sp
00007D9B  8B461C            mov ax,[bp+0x1c]
00007D9E  0C01              or al,0x1
00007DA0  89461C            mov [bp+0x1c],ax
00007DA3  89EC              mov sp,bp
00007DA5  5D                pop bp
00007DA6  C3                ret
00007DA7  B81000            mov ax,0x10
00007DAA  50                push ax
00007DAB  E8C087            call word 0x56e
00007DAE  44                inc sp
00007DAF  44                inc sp
00007DB0  8846E8            mov [bp-0x18],al
00007DB3  8A46FF            mov al,[bp-0x1]
00007DB6  84C0              test al,al
00007DB8  750E              jnz 0x7dc8
00007DBA  8A46E8            mov al,[bp-0x18]
00007DBD  30E4              xor ah,ah
00007DBF  B104              mov cl,0x4
00007DC1  D3E8              shr ax,cl
00007DC3  8846E8            mov [bp-0x18],al
00007DC6  EB08              jmp short 0x7dd0
00007DC8  8A46E8            mov al,[bp-0x18]
00007DCB  240F              and al,0xf
00007DCD  8846E8            mov [bp-0x18],al
00007DD0  8A46E8            mov al,[bp-0x18]
00007DD3  84C0              test al,al
00007DD5  7520              jnz 0x7df7
00007DD7  8A4616            mov al,[bp+0x16]
00007DDA  30E4              xor ah,ah
00007DDC  0D0080            or ax,0x8000
00007DDF  894616            mov [bp+0x16],ax
00007DE2  B88000            mov ax,0x80
00007DE5  50                push ax
00007DE6  E8BE0F            call word 0x8da7
00007DE9  44                inc sp
00007DEA  44                inc sp
00007DEB  8B461C            mov ax,[bp+0x1c]
00007DEE  0C01              or al,0x1
00007DF0  89461C            mov [bp+0x1c],ax
00007DF3  89EC              mov sp,bp
00007DF5  5D                pop bp
00007DF6  C3                ret
00007DF7  8A4616            mov al,[bp+0x16]
00007DFA  0C00              or al,0x0
00007DFC  30E4              xor ah,ah
00007DFE  894616            mov [bp+0x16],ax
00007E01  31C0              xor ax,ax
00007E03  50                push ax
00007E04  E8A00F            call word 0x8da7
00007E07  44                inc sp
00007E08  44                inc sp
00007E09  8B461C            mov ax,[bp+0x1c]
00007E0C  24FE              and al,0xfe
00007E0E  89461C            mov [bp+0x1c],ax
00007E11  31C0              xor ax,ax
00007E13  50                push ax
00007E14  8A46FF            mov al,[bp-0x1]
00007E17  30E4              xor ah,ah
00007E19  50                push ax
00007E1A  E8A20F            call word 0x8dbf
00007E1D  83C404            add sp,byte +0x4
00007E20  89EC              mov sp,bp
00007E22  5D                pop bp
00007E23  C3                ret
00007E24  8B461C            mov ax,[bp+0x1c]
00007E27  24FE              and al,0xfe
00007E29  89461C            mov [bp+0x1c],ax
00007E2C  A04100            mov al,[0x41]
00007E2F  8846F1            mov [bp-0xf],al
00007E32  8A46F1            mov al,[bp-0xf]
00007E35  30E4              xor ah,ah
00007E37  88C4              mov ah,al
00007E39  30C0              xor al,al
00007E3B  50                push ax
00007E3C  8A4616            mov al,[bp+0x16]
00007E3F  30E4              xor ah,ah
00007E41  0B46DC            or ax,[bp-0x24]
00007E44  44                inc sp
00007E45  44                inc sp
00007E46  894616            mov [bp+0x16],ax
00007E49  8A46F1            mov al,[bp-0xf]
00007E4C  84C0              test al,al
00007E4E  7408              jz 0x7e58
00007E50  8B461C            mov ax,[bp+0x1c]
00007E53  0C01              or al,0x1
00007E55  89461C            mov [bp+0x1c],ax
00007E58  89EC              mov sp,bp
00007E5A  5D                pop bp
00007E5B  C3                ret
00007E5C  8A4616            mov al,[bp+0x16]
00007E5F  8846FE            mov [bp-0x2],al
00007E62  8B4614            mov ax,[bp+0x14]
00007E65  88E0              mov al,ah
00007E67  30E4              xor ah,ah
00007E69  8846FD            mov [bp-0x3],al
00007E6C  8A4614            mov al,[bp+0x14]
00007E6F  8846FC            mov [bp-0x4],al
00007E72  8B4612            mov ax,[bp+0x12]
00007E75  88E0              mov al,ah
00007E77  30E4              xor ah,ah
00007E79  8846FB            mov [bp-0x5],al
00007E7C  8A460E            mov al,[bp+0xe]
00007E7F  8846FF            mov [bp-0x1],al
00007E82  8A46FF            mov al,[bp-0x1]
00007E85  3C01              cmp al,0x1
00007E87  771C              ja 0x7ea5
00007E89  8A46FB            mov al,[bp-0x5]
00007E8C  3C01              cmp al,0x1
00007E8E  7715              ja 0x7ea5
00007E90  8A46FC            mov al,[bp-0x4]
00007E93  84C0              test al,al
00007E95  740E              jz 0x7ea5
00007E97  8A46FE            mov al,[bp-0x2]
00007E9A  84C0              test al,al
00007E9C  7407              jz 0x7ea5
00007E9E  8A46FE            mov al,[bp-0x2]
00007EA1  3C48              cmp al,0x48
00007EA3  7638              jna 0x7edd
00007EA5  BB1DCE            mov bx,0xce1d
00007EA8  53                push bx
00007EA9  B80400            mov ax,0x4
00007EAC  50                push ax
00007EAD  E87A8A            call word 0x92a
00007EB0  83C404            add sp,byte +0x4
00007EB3  8A4616            mov al,[bp+0x16]
00007EB6  30E4              xor ah,ah
00007EB8  0D0001            or ax,0x100
00007EBB  894616            mov [bp+0x16],ax
00007EBE  B80100            mov ax,0x1
00007EC1  50                push ax
00007EC2  E8E20E            call word 0x8da7
00007EC5  44                inc sp
00007EC6  44                inc sp
00007EC7  8B4616            mov ax,[bp+0x16]
00007ECA  30C0              xor al,al
00007ECC  0C00              or al,0x0
00007ECE  894616            mov [bp+0x16],ax
00007ED1  8B461C            mov ax,[bp+0x1c]
00007ED4  0C01              or al,0x1
00007ED6  89461C            mov [bp+0x1c],ax
00007ED9  89EC              mov sp,bp
00007EDB  5D                pop bp
00007EDC  C3                ret
00007EDD  8A46FF            mov al,[bp-0x1]
00007EE0  30E4              xor ah,ah
00007EE2  50                push ax
00007EE3  E836FE            call word 0x7d1c
00007EE6  44                inc sp
00007EE7  44                inc sp
00007EE8  85C0              test ax,ax
00007EEA  752A              jnz 0x7f16
00007EEC  8A4616            mov al,[bp+0x16]
00007EEF  30E4              xor ah,ah
00007EF1  0D0080            or ax,0x8000
00007EF4  894616            mov [bp+0x16],ax
00007EF7  B88000            mov ax,0x80
00007EFA  50                push ax
00007EFB  E8A90E            call word 0x8da7
00007EFE  44                inc sp
00007EFF  44                inc sp
00007F00  8B4616            mov ax,[bp+0x16]
00007F03  30C0              xor al,al
00007F05  0C00              or al,0x0
00007F07  894616            mov [bp+0x16],ax
00007F0A  8B461C            mov ax,[bp+0x1c]
00007F0D  0C01              or al,0x1
00007F0F  89461C            mov [bp+0x1c],ax
00007F12  89EC              mov sp,bp
00007F14  5D                pop bp
00007F15  C3                ret
00007F16  8A46FF            mov al,[bp-0x1]
00007F19  30E4              xor ah,ah
00007F1B  50                push ax
00007F1C  E816FC            call word 0x7b35
00007F1F  44                inc sp
00007F20  44                inc sp
00007F21  85C0              test ax,ax
00007F23  7539              jnz 0x7f5e
00007F25  8A46FF            mov al,[bp-0x1]
00007F28  30E4              xor ah,ah
00007F2A  50                push ax
00007F2B  E877FC            call word 0x7ba5
00007F2E  44                inc sp
00007F2F  44                inc sp
00007F30  85C0              test ax,ax
00007F32  752A              jnz 0x7f5e
00007F34  8A4616            mov al,[bp+0x16]
00007F37  30E4              xor ah,ah
00007F39  0D000C            or ax,0xc00
00007F3C  894616            mov [bp+0x16],ax
00007F3F  B80C00            mov ax,0xc
00007F42  50                push ax
00007F43  E8610E            call word 0x8da7
00007F46  44                inc sp
00007F47  44                inc sp
00007F48  8B4616            mov ax,[bp+0x16]
00007F4B  30C0              xor al,al
00007F4D  0C00              or al,0x0
00007F4F  894616            mov [bp+0x16],ax
00007F52  8B461C            mov ax,[bp+0x1c]
00007F55  0C01              or al,0x1
00007F57  89461C            mov [bp+0x1c],ax
00007F5A  89EC              mov sp,bp
00007F5C  5D                pop bp
00007F5D  C3                ret
00007F5E  8A46E6            mov al,[bp-0x1a]
00007F61  3C04              cmp al,0x4
00007F63  7506              jnz 0x7f6b
00007F65  83C400            add sp,byte +0x0
00007F68  E97303            jmp word 0x82de
00007F6B  8B4606            mov ax,[bp+0x6]
00007F6E  88E0              mov al,ah
00007F70  30E4              xor ah,ah
00007F72  B104              mov cl,0x4
00007F74  D3E8              shr ax,cl
00007F76  8846F3            mov [bp-0xd],al
00007F79  8B4606            mov ax,[bp+0x6]
00007F7C  B104              mov cl,0x4
00007F7E  D3E0              shl ax,cl
00007F80  8946F4            mov [bp-0xc],ax
00007F83  8B46F4            mov ax,[bp-0xc]
00007F86  034610            add ax,[bp+0x10]
00007F89  8946F8            mov [bp-0x8],ax
00007F8C  8B46F8            mov ax,[bp-0x8]
00007F8F  3B46F4            cmp ax,[bp-0xc]
00007F92  0F830700          jnc word 0x7f9d
00007F96  8A46F3            mov al,[bp-0xd]
00007F99  40                inc ax
00007F9A  8846F3            mov [bp-0xd],al
00007F9D  8A46FE            mov al,[bp-0x2]
00007FA0  30E4              xor ah,ah
00007FA2  B90002            mov cx,0x200
00007FA5  F7E9              imul cx
00007FA7  48                dec ax
00007FA8  8946F6            mov [bp-0xa],ax
00007FAB  8B46F8            mov ax,[bp-0x8]
00007FAE  0346F6            add ax,[bp-0xa]
00007FB1  8946E0            mov [bp-0x20],ax
00007FB4  8B46E0            mov ax,[bp-0x20]
00007FB7  3B46F8            cmp ax,[bp-0x8]
00007FBA  732A              jnc 0x7fe6
00007FBC  8A4616            mov al,[bp+0x16]
00007FBF  30E4              xor ah,ah
00007FC1  0D0009            or ax,0x900
00007FC4  894616            mov [bp+0x16],ax
00007FC7  B80900            mov ax,0x9
00007FCA  50                push ax
00007FCB  E8D90D            call word 0x8da7
00007FCE  44                inc sp
00007FCF  44                inc sp
00007FD0  8B4616            mov ax,[bp+0x16]
00007FD3  30C0              xor al,al
00007FD5  0C00              or al,0x0
00007FD7  894616            mov [bp+0x16],ax
00007FDA  8B461C            mov ax,[bp+0x1c]
00007FDD  0C01              or al,0x1
00007FDF  89461C            mov [bp+0x1c],ax
00007FE2  89EC              mov sp,bp
00007FE4  5D                pop bp
00007FE5  C3                ret
00007FE6  B80600            mov ax,0x6
00007FE9  50                push ax
00007FEA  B80A00            mov ax,0xa
00007FED  50                push ax
00007FEE  E84E85            call word 0x53f
00007FF1  83C404            add sp,byte +0x4
00007FF4  31C0              xor ax,ax
00007FF6  50                push ax
00007FF7  B80C00            mov ax,0xc
00007FFA  50                push ax
00007FFB  E84185            call word 0x53f
00007FFE  83C404            add sp,byte +0x4
00008001  FF76F8            push word [bp-0x8]
00008004  B80400            mov ax,0x4
00008007  50                push ax
00008008  E83485            call word 0x53f
0000800B  83C404            add sp,byte +0x4
0000800E  8B46F8            mov ax,[bp-0x8]
00008011  88E0              mov al,ah
00008013  30E4              xor ah,ah
00008015  50                push ax
00008016  B80400            mov ax,0x4
00008019  50                push ax
0000801A  E82285            call word 0x53f
0000801D  83C404            add sp,byte +0x4
00008020  31C0              xor ax,ax
00008022  50                push ax
00008023  B80C00            mov ax,0xc
00008026  50                push ax
00008027  E81585            call word 0x53f
0000802A  83C404            add sp,byte +0x4
0000802D  FF76F6            push word [bp-0xa]
00008030  B80500            mov ax,0x5
00008033  50                push ax
00008034  E80885            call word 0x53f
00008037  83C404            add sp,byte +0x4
0000803A  8B46F6            mov ax,[bp-0xa]
0000803D  88E0              mov al,ah
0000803F  30E4              xor ah,ah
00008041  50                push ax
00008042  B80500            mov ax,0x5
00008045  50                push ax
00008046  E8F684            call word 0x53f
00008049  83C404            add sp,byte +0x4
0000804C  8A46E6            mov al,[bp-0x1a]
0000804F  3C02              cmp al,0x2
00008051  755C              jnz 0x80af
00008053  B046              mov al,0x46
00008055  8846F2            mov [bp-0xe],al
00008058  8A46F2            mov al,[bp-0xe]
0000805B  30E4              xor ah,ah
0000805D  50                push ax
0000805E  B80B00            mov ax,0xb
00008061  50                push ax
00008062  E8DA84            call word 0x53f
00008065  83C404            add sp,byte +0x4
00008068  8A46F3            mov al,[bp-0xd]
0000806B  30E4              xor ah,ah
0000806D  50                push ax
0000806E  B88100            mov ax,0x81
00008071  50                push ax
00008072  E8CA84            call word 0x53f
00008075  83C404            add sp,byte +0x4
00008078  B80200            mov ax,0x2
0000807B  50                push ax
0000807C  B80A00            mov ax,0xa
0000807F  50                push ax
00008080  E8BC84            call word 0x53f
00008083  83C404            add sp,byte +0x4
00008086  B80200            mov ax,0x2
00008089  50                push ax
0000808A  B80A00            mov ax,0xa
0000808D  50                push ax
0000808E  E8AE84            call word 0x53f
00008091  83C404            add sp,byte +0x4
00008094  8A46FF            mov al,[bp-0x1]
00008097  30E4              xor ah,ah
00008099  50                push ax
0000809A  E8F8F9            call word 0x7a95
0000809D  44                inc sp
0000809E  44                inc sp
0000809F  B8E600            mov ax,0xe6
000080A2  50                push ax
000080A3  B8F503            mov ax,0x3f5
000080A6  50                push ax
000080A7  E89584            call word 0x53f
000080AA  83C404            add sp,byte +0x4
000080AD  EB4C              jmp short 0x80fb
000080AF  B04A              mov al,0x4a
000080B1  8846F2            mov [bp-0xe],al
000080B4  8A46F2            mov al,[bp-0xe]
000080B7  30E4              xor ah,ah
000080B9  50                push ax
000080BA  B80B00            mov ax,0xb
000080BD  50                push ax
000080BE  E87E84            call word 0x53f
000080C1  83C404            add sp,byte +0x4
000080C4  8A46F3            mov al,[bp-0xd]
000080C7  30E4              xor ah,ah
000080C9  50                push ax
000080CA  B88100            mov ax,0x81
000080CD  50                push ax
000080CE  E86E84            call word 0x53f
000080D1  83C404            add sp,byte +0x4
000080D4  B80200            mov ax,0x2
000080D7  50                push ax
000080D8  B80A00            mov ax,0xa
000080DB  50                push ax
000080DC  E86084            call word 0x53f
000080DF  83C404            add sp,byte +0x4
000080E2  8A46FF            mov al,[bp-0x1]
000080E5  30E4              xor ah,ah
000080E7  50                push ax
000080E8  E8AAF9            call word 0x7a95
000080EB  44                inc sp
000080EC  44                inc sp
000080ED  B8C500            mov ax,0xc5
000080F0  50                push ax
000080F1  B8F503            mov ax,0x3f5
000080F4  50                push ax
000080F5  E84784            call word 0x53f
000080F8  83C404            add sp,byte +0x4
000080FB  8A46FB            mov al,[bp-0x5]
000080FE  30E4              xor ah,ah
00008100  D1E0              shl ax,1
00008102  D1E0              shl ax,1
00008104  0A46FF            or al,[bp-0x1]
00008107  50                push ax
00008108  B8F503            mov ax,0x3f5
0000810B  50                push ax
0000810C  E83084            call word 0x53f
0000810F  83C404            add sp,byte +0x4
00008112  8A46FD            mov al,[bp-0x3]
00008115  30E4              xor ah,ah
00008117  50                push ax
00008118  B8F503            mov ax,0x3f5
0000811B  50                push ax
0000811C  E82084            call word 0x53f
0000811F  83C404            add sp,byte +0x4
00008122  8A46FB            mov al,[bp-0x5]
00008125  30E4              xor ah,ah
00008127  50                push ax
00008128  B8F503            mov ax,0x3f5
0000812B  50                push ax
0000812C  E81084            call word 0x53f
0000812F  83C404            add sp,byte +0x4
00008132  8A46FC            mov al,[bp-0x4]
00008135  30E4              xor ah,ah
00008137  50                push ax
00008138  B8F503            mov ax,0x3f5
0000813B  50                push ax
0000813C  E80084            call word 0x53f
0000813F  83C404            add sp,byte +0x4
00008142  B80200            mov ax,0x2
00008145  50                push ax
00008146  B8F503            mov ax,0x3f5
00008149  50                push ax
0000814A  E8F283            call word 0x53f
0000814D  83C404            add sp,byte +0x4
00008150  8A46FC            mov al,[bp-0x4]
00008153  30E4              xor ah,ah
00008155  0246FE            add al,[bp-0x2]
00008158  80D400            adc ah,0x0
0000815B  48                dec ax
0000815C  50                push ax
0000815D  B8F503            mov ax,0x3f5
00008160  50                push ax
00008161  E8DB83            call word 0x53f
00008164  83C404            add sp,byte +0x4
00008167  31C0              xor ax,ax
00008169  50                push ax
0000816A  B8F503            mov ax,0x3f5
0000816D  50                push ax
0000816E  E8CE83            call word 0x53f
00008171  83C404            add sp,byte +0x4
00008174  B8FF00            mov ax,0xff
00008177  50                push ax
00008178  B8F503            mov ax,0x3f5
0000817B  50                push ax
0000817C  E8C083            call word 0x53f
0000817F  83C404            add sp,byte +0x4
00008182  FB                sti
00008183  A04000            mov al,[0x40]
00008186  8846F1            mov [bp-0xf],al
00008189  8A46F1            mov al,[bp-0xf]
0000818C  84C0              test al,al
0000818E  752D              jnz 0x81bd
00008190  E8B4F8            call word 0x7a47
00008193  8A4616            mov al,[bp+0x16]
00008196  30E4              xor ah,ah
00008198  0D0080            or ax,0x8000
0000819B  894616            mov [bp+0x16],ax
0000819E  B88000            mov ax,0x80
000081A1  50                push ax
000081A2  E8020C            call word 0x8da7
000081A5  44                inc sp
000081A6  44                inc sp
000081A7  8B4616            mov ax,[bp+0x16]
000081AA  30C0              xor al,al
000081AC  0C00              or al,0x0
000081AE  894616            mov [bp+0x16],ax
000081B1  8B461C            mov ax,[bp+0x1c]
000081B4  0C01              or al,0x1
000081B6  89461C            mov [bp+0x1c],ax
000081B9  89EC              mov sp,bp
000081BB  5D                pop bp
000081BC  C3                ret
000081BD  A03E00            mov al,[0x3e]
000081C0  2480              and al,0x80
000081C2  8846F1            mov [bp-0xf],al
000081C5  8A46F1            mov al,[bp-0xf]
000081C8  84C0              test al,al
000081CA  74B7              jz 0x8183
000081CC  30C0              xor al,al
000081CE  8846F1            mov [bp-0xf],al
000081D1  FA                cli
000081D2  A03E00            mov al,[0x3e]
000081D5  8846F1            mov [bp-0xf],al
000081D8  8A46F1            mov al,[bp-0xf]
000081DB  247F              and al,0x7f
000081DD  8846F1            mov [bp-0xf],al
000081E0  8A46F1            mov al,[bp-0xf]
000081E3  A23E00            mov [0x3e],al
000081E6  B8F403            mov ax,0x3f4
000081E9  50                push ax
000081EA  E83C83            call word 0x529
000081ED  44                inc sp
000081EE  44                inc sp
000081EF  8846F1            mov [bp-0xf],al
000081F2  8A46F1            mov al,[bp-0xf]
000081F5  24C0              and al,0xc0
000081F7  3CC0              cmp al,0xc0
000081F9  740E              jz 0x8209
000081FB  BBFDCD            mov bx,0xcdfd
000081FE  53                push bx
000081FF  B80700            mov ax,0x7
00008202  50                push ax
00008203  E82487            call word 0x92a
00008206  83C404            add sp,byte +0x4
00008209  B8F503            mov ax,0x3f5
0000820C  50                push ax
0000820D  E81983            call word 0x529
00008210  44                inc sp
00008211  44                inc sp
00008212  8846E9            mov [bp-0x17],al
00008215  B8F503            mov ax,0x3f5
00008218  50                push ax
00008219  E80D83            call word 0x529
0000821C  44                inc sp
0000821D  44                inc sp
0000821E  8846EA            mov [bp-0x16],al
00008221  B8F503            mov ax,0x3f5
00008224  50                push ax
00008225  E80183            call word 0x529
00008228  44                inc sp
00008229  44                inc sp
0000822A  8846EB            mov [bp-0x15],al
0000822D  B8F503            mov ax,0x3f5
00008230  50                push ax
00008231  E8F582            call word 0x529
00008234  44                inc sp
00008235  44                inc sp
00008236  8846EC            mov [bp-0x14],al
00008239  B8F503            mov ax,0x3f5
0000823C  50                push ax
0000823D  E8E982            call word 0x529
00008240  44                inc sp
00008241  44                inc sp
00008242  8846ED            mov [bp-0x13],al
00008245  B8F503            mov ax,0x3f5
00008248  50                push ax
00008249  E8DD82            call word 0x529
0000824C  44                inc sp
0000824D  44                inc sp
0000824E  8846EE            mov [bp-0x12],al
00008251  B8F503            mov ax,0x3f5
00008254  50                push ax
00008255  E8D182            call word 0x529
00008258  44                inc sp
00008259  44                inc sp
0000825A  8846EF            mov [bp-0x11],al
0000825D  B80700            mov ax,0x7
00008260  50                push ax
00008261  E8F683            call word 0x65a
00008264  50                push ax
00008265  8D5EE9            lea bx,[bp-0x17]
00008268  53                push bx
00008269  B84000            mov ax,0x40
0000826C  50                push ax
0000826D  B84200            mov ax,0x42
00008270  50                push ax
00008271  E8A77D            call word 0x1b
00008274  83C40A            add sp,byte +0xa
00008277  8A46E9            mov al,[bp-0x17]
0000827A  24C0              and al,0xc0
0000827C  84C0              test al,al
0000827E  745E              jz 0x82de
00008280  8A46E6            mov al,[bp-0x1a]
00008283  3C02              cmp al,0x2
00008285  752C              jnz 0x82b3
00008287  8A4616            mov al,[bp+0x16]
0000828A  30E4              xor ah,ah
0000828C  0D0020            or ax,0x2000
0000828F  894616            mov [bp+0x16],ax
00008292  B82000            mov ax,0x20
00008295  50                push ax
00008296  E80E0B            call word 0x8da7
00008299  44                inc sp
0000829A  44                inc sp
0000829B  8B4616            mov ax,[bp+0x16]
0000829E  30C0              xor al,al
000082A0  0C00              or al,0x0
000082A2  894616            mov [bp+0x16],ax
000082A5  8B461C            mov ax,[bp+0x1c]
000082A8  0C01              or al,0x1
000082AA  89461C            mov [bp+0x1c],ax
000082AD  89EC              mov sp,bp
000082AF  5D                pop bp
000082B0  C3                ret
000082B1  EB2B              jmp short 0x82de
000082B3  8A46EA            mov al,[bp-0x16]
000082B6  2402              and al,0x2
000082B8  84C0              test al,al
000082BA  7414              jz 0x82d0
000082BC  B80003            mov ax,0x300
000082BF  894616            mov [bp+0x16],ax
000082C2  8B461C            mov ax,[bp+0x1c]
000082C5  0C01              or al,0x1
000082C7  89461C            mov [bp+0x1c],ax
000082CA  89EC              mov sp,bp
000082CC  5D                pop bp
000082CD  C3                ret
000082CE  EB0E              jmp short 0x82de
000082D0  BBD8CD            mov bx,0xcdd8
000082D3  53                push bx
000082D4  B80700            mov ax,0x7
000082D7  50                push ax
000082D8  E84F86            call word 0x92a
000082DB  83C404            add sp,byte +0x4
000082DE  8A46FD            mov al,[bp-0x3]
000082E1  30E4              xor ah,ah
000082E3  50                push ax
000082E4  8A46FF            mov al,[bp-0x1]
000082E7  30E4              xor ah,ah
000082E9  50                push ax
000082EA  E8D20A            call word 0x8dbf
000082ED  83C404            add sp,byte +0x4
000082F0  8A4616            mov al,[bp+0x16]
000082F3  0C00              or al,0x0
000082F5  30E4              xor ah,ah
000082F7  894616            mov [bp+0x16],ax
000082FA  8B461C            mov ax,[bp+0x1c]
000082FD  24FE              and al,0xfe
000082FF  89461C            mov [bp+0x1c],ax
00008302  E99E0A            jmp word 0x8da3
00008305  8A4616            mov al,[bp+0x16]
00008308  8846FE            mov [bp-0x2],al
0000830B  8B4614            mov ax,[bp+0x14]
0000830E  88E0              mov al,ah
00008310  30E4              xor ah,ah
00008312  8846FD            mov [bp-0x3],al
00008315  8B4612            mov ax,[bp+0x12]
00008318  88E0              mov al,ah
0000831A  30E4              xor ah,ah
0000831C  8846FB            mov [bp-0x5],al
0000831F  8A460E            mov al,[bp+0xe]
00008322  8846FF            mov [bp-0x1],al
00008325  8A46FF            mov al,[bp-0x1]
00008328  3C01              cmp al,0x1
0000832A  771C              ja 0x8348
0000832C  8A46FB            mov al,[bp-0x5]
0000832F  3C01              cmp al,0x1
00008331  7715              ja 0x8348
00008333  8A46FD            mov al,[bp-0x3]
00008336  3C4F              cmp al,0x4f
00008338  770E              ja 0x8348
0000833A  8A46FE            mov al,[bp-0x2]
0000833D  84C0              test al,al
0000833F  7407              jz 0x8348
00008341  8A46FE            mov al,[bp-0x2]
00008344  3C12              cmp al,0x12
00008346  761C              jna 0x8364
00008348  8A4616            mov al,[bp+0x16]
0000834B  30E4              xor ah,ah
0000834D  0D0001            or ax,0x100
00008350  894616            mov [bp+0x16],ax
00008353  B80100            mov ax,0x1
00008356  50                push ax
00008357  E84D0A            call word 0x8da7
0000835A  44                inc sp
0000835B  44                inc sp
0000835C  8B461C            mov ax,[bp+0x1c]
0000835F  0C01              or al,0x1
00008361  89461C            mov [bp+0x1c],ax
00008364  8A46FF            mov al,[bp-0x1]
00008367  30E4              xor ah,ah
00008369  50                push ax
0000836A  E8AFF9            call word 0x7d1c
0000836D  44                inc sp
0000836E  44                inc sp
0000836F  85C0              test ax,ax
00008371  7520              jnz 0x8393
00008373  8A4616            mov al,[bp+0x16]
00008376  30E4              xor ah,ah
00008378  0D0080            or ax,0x8000
0000837B  894616            mov [bp+0x16],ax
0000837E  B88000            mov ax,0x80
00008381  50                push ax
00008382  E8220A            call word 0x8da7
00008385  44                inc sp
00008386  44                inc sp
00008387  8B461C            mov ax,[bp+0x1c]
0000838A  0C01              or al,0x1
0000838C  89461C            mov [bp+0x1c],ax
0000838F  89EC              mov sp,bp
00008391  5D                pop bp
00008392  C3                ret
00008393  8A46FF            mov al,[bp-0x1]
00008396  30E4              xor ah,ah
00008398  50                push ax
00008399  E899F7            call word 0x7b35
0000839C  44                inc sp
0000839D  44                inc sp
0000839E  85C0              test ax,ax
000083A0  7539              jnz 0x83db
000083A2  8A46FF            mov al,[bp-0x1]
000083A5  30E4              xor ah,ah
000083A7  50                push ax
000083A8  E8FAF7            call word 0x7ba5
000083AB  44                inc sp
000083AC  44                inc sp
000083AD  85C0              test ax,ax
000083AF  752A              jnz 0x83db
000083B1  8A4616            mov al,[bp+0x16]
000083B4  30E4              xor ah,ah
000083B6  0D000C            or ax,0xc00
000083B9  894616            mov [bp+0x16],ax
000083BC  B80C00            mov ax,0xc
000083BF  50                push ax
000083C0  E8E409            call word 0x8da7
000083C3  44                inc sp
000083C4  44                inc sp
000083C5  8B4616            mov ax,[bp+0x16]
000083C8  30C0              xor al,al
000083CA  0C00              or al,0x0
000083CC  894616            mov [bp+0x16],ax
000083CF  8B461C            mov ax,[bp+0x1c]
000083D2  0C01              or al,0x1
000083D4  89461C            mov [bp+0x1c],ax
000083D7  89EC              mov sp,bp
000083D9  5D                pop bp
000083DA  C3                ret
000083DB  8B4606            mov ax,[bp+0x6]
000083DE  88E0              mov al,ah
000083E0  30E4              xor ah,ah
000083E2  B104              mov cl,0x4
000083E4  D3E8              shr ax,cl
000083E6  8846F3            mov [bp-0xd],al
000083E9  8B4606            mov ax,[bp+0x6]
000083EC  B104              mov cl,0x4
000083EE  D3E0              shl ax,cl
000083F0  8946F4            mov [bp-0xc],ax
000083F3  8B46F4            mov ax,[bp-0xc]
000083F6  034610            add ax,[bp+0x10]
000083F9  8946F8            mov [bp-0x8],ax
000083FC  8B46F8            mov ax,[bp-0x8]
000083FF  3B46F4            cmp ax,[bp-0xc]
00008402  7307              jnc 0x840b
00008404  8A46F3            mov al,[bp-0xd]
00008407  40                inc ax
00008408  8846F3            mov [bp-0xd],al
0000840B  8A46FE            mov al,[bp-0x2]
0000840E  30E4              xor ah,ah
00008410  D1E0              shl ax,1
00008412  D1E0              shl ax,1
00008414  48                dec ax
00008415  8946F6            mov [bp-0xa],ax
00008418  8B46F8            mov ax,[bp-0x8]
0000841B  0346F6            add ax,[bp-0xa]
0000841E  8946E0            mov [bp-0x20],ax
00008421  8B46E0            mov ax,[bp-0x20]
00008424  3B46F8            cmp ax,[bp-0x8]
00008427  732A              jnc 0x8453
00008429  8A4616            mov al,[bp+0x16]
0000842C  30E4              xor ah,ah
0000842E  0D0009            or ax,0x900
00008431  894616            mov [bp+0x16],ax
00008434  B80900            mov ax,0x9
00008437  50                push ax
00008438  E86C09            call word 0x8da7
0000843B  44                inc sp
0000843C  44                inc sp
0000843D  8B4616            mov ax,[bp+0x16]
00008440  30C0              xor al,al
00008442  0C00              or al,0x0
00008444  894616            mov [bp+0x16],ax
00008447  8B461C            mov ax,[bp+0x1c]
0000844A  0C01              or al,0x1
0000844C  89461C            mov [bp+0x1c],ax
0000844F  89EC              mov sp,bp
00008451  5D                pop bp
00008452  C3                ret
00008453  B80600            mov ax,0x6
00008456  50                push ax
00008457  B80A00            mov ax,0xa
0000845A  50                push ax
0000845B  E8E180            call word 0x53f
0000845E  83C404            add sp,byte +0x4
00008461  31C0              xor ax,ax
00008463  50                push ax
00008464  B80C00            mov ax,0xc
00008467  50                push ax
00008468  E8D480            call word 0x53f
0000846B  83C404            add sp,byte +0x4
0000846E  FF76F8            push word [bp-0x8]
00008471  B80400            mov ax,0x4
00008474  50                push ax
00008475  E8C780            call word 0x53f
00008478  83C404            add sp,byte +0x4
0000847B  8B46F8            mov ax,[bp-0x8]
0000847E  88E0              mov al,ah
00008480  30E4              xor ah,ah
00008482  50                push ax
00008483  B80400            mov ax,0x4
00008486  50                push ax
00008487  E8B580            call word 0x53f
0000848A  83C404            add sp,byte +0x4
0000848D  31C0              xor ax,ax
0000848F  50                push ax
00008490  B80C00            mov ax,0xc
00008493  50                push ax
00008494  E8A880            call word 0x53f
00008497  83C404            add sp,byte +0x4
0000849A  FF76F6            push word [bp-0xa]
0000849D  B80500            mov ax,0x5
000084A0  50                push ax
000084A1  E89B80            call word 0x53f
000084A4  83C404            add sp,byte +0x4
000084A7  8B46F6            mov ax,[bp-0xa]
000084AA  88E0              mov al,ah
000084AC  30E4              xor ah,ah
000084AE  50                push ax
000084AF  B80500            mov ax,0x5
000084B2  50                push ax
000084B3  E88980            call word 0x53f
000084B6  83C404            add sp,byte +0x4
000084B9  B04A              mov al,0x4a
000084BB  8846F2            mov [bp-0xe],al
000084BE  8A46F2            mov al,[bp-0xe]
000084C1  30E4              xor ah,ah
000084C3  50                push ax
000084C4  B80B00            mov ax,0xb
000084C7  50                push ax
000084C8  E87480            call word 0x53f
000084CB  83C404            add sp,byte +0x4
000084CE  8A46F3            mov al,[bp-0xd]
000084D1  30E4              xor ah,ah
000084D3  50                push ax
000084D4  B88100            mov ax,0x81
000084D7  50                push ax
000084D8  E86480            call word 0x53f
000084DB  83C404            add sp,byte +0x4
000084DE  B80200            mov ax,0x2
000084E1  50                push ax
000084E2  B80A00            mov ax,0xa
000084E5  50                push ax
000084E6  E85680            call word 0x53f
000084E9  83C404            add sp,byte +0x4
000084EC  8A46FF            mov al,[bp-0x1]
000084EF  30E4              xor ah,ah
000084F1  50                push ax
000084F2  E8A0F5            call word 0x7a95
000084F5  44                inc sp
000084F6  44                inc sp
000084F7  B84D00            mov ax,0x4d
000084FA  50                push ax
000084FB  B8F503            mov ax,0x3f5
000084FE  50                push ax
000084FF  E83D80            call word 0x53f
00008502  83C404            add sp,byte +0x4
00008505  8A46FB            mov al,[bp-0x5]
00008508  30E4              xor ah,ah
0000850A  D1E0              shl ax,1
0000850C  D1E0              shl ax,1
0000850E  0A46FF            or al,[bp-0x1]
00008511  50                push ax
00008512  B8F503            mov ax,0x3f5
00008515  50                push ax
00008516  E82680            call word 0x53f
00008519  83C404            add sp,byte +0x4
0000851C  B80200            mov ax,0x2
0000851F  50                push ax
00008520  B8F503            mov ax,0x3f5
00008523  50                push ax
00008524  E81880            call word 0x53f
00008527  83C404            add sp,byte +0x4
0000852A  8A46FE            mov al,[bp-0x2]
0000852D  30E4              xor ah,ah
0000852F  50                push ax
00008530  B8F503            mov ax,0x3f5
00008533  50                push ax
00008534  E80880            call word 0x53f
00008537  83C404            add sp,byte +0x4
0000853A  31C0              xor ax,ax
0000853C  50                push ax
0000853D  B8F503            mov ax,0x3f5
00008540  50                push ax
00008541  E8FB7F            call word 0x53f
00008544  83C404            add sp,byte +0x4
00008547  B8F600            mov ax,0xf6
0000854A  50                push ax
0000854B  B8F503            mov ax,0x3f5
0000854E  50                push ax
0000854F  E8ED7F            call word 0x53f
00008552  83C404            add sp,byte +0x4
00008555  FB                sti
00008556  A04000            mov al,[0x40]
00008559  8846F1            mov [bp-0xf],al
0000855C  8A46F1            mov al,[bp-0xf]
0000855F  84C0              test al,al
00008561  7523              jnz 0x8586
00008563  E8E1F4            call word 0x7a47
00008566  8A4616            mov al,[bp+0x16]
00008569  30E4              xor ah,ah
0000856B  0D0080            or ax,0x8000
0000856E  894616            mov [bp+0x16],ax
00008571  B88000            mov ax,0x80
00008574  50                push ax
00008575  E82F08            call word 0x8da7
00008578  44                inc sp
00008579  44                inc sp
0000857A  8B461C            mov ax,[bp+0x1c]
0000857D  0C01              or al,0x1
0000857F  89461C            mov [bp+0x1c],ax
00008582  89EC              mov sp,bp
00008584  5D                pop bp
00008585  C3                ret
00008586  A03E00            mov al,[0x3e]
00008589  2480              and al,0x80
0000858B  8846F1            mov [bp-0xf],al
0000858E  8A46F1            mov al,[bp-0xf]
00008591  84C0              test al,al
00008593  74C1              jz 0x8556
00008595  30C0              xor al,al
00008597  8846F1            mov [bp-0xf],al
0000859A  FA                cli
0000859B  A03E00            mov al,[0x3e]
0000859E  8846F1            mov [bp-0xf],al
000085A1  8A46F1            mov al,[bp-0xf]
000085A4  247F              and al,0x7f
000085A6  8846F1            mov [bp-0xf],al
000085A9  8A46F1            mov al,[bp-0xf]
000085AC  A23E00            mov [0x3e],al
000085AF  B8F403            mov ax,0x3f4
000085B2  50                push ax
000085B3  E8737F            call word 0x529
000085B6  44                inc sp
000085B7  44                inc sp
000085B8  8846F1            mov [bp-0xf],al
000085BB  8A46F1            mov al,[bp-0xf]
000085BE  24C0              and al,0xc0
000085C0  3CC0              cmp al,0xc0
000085C2  740E              jz 0x85d2
000085C4  BBB8CD            mov bx,0xcdb8
000085C7  53                push bx
000085C8  B80700            mov ax,0x7
000085CB  50                push ax
000085CC  E85B83            call word 0x92a
000085CF  83C404            add sp,byte +0x4
000085D2  B8F503            mov ax,0x3f5
000085D5  50                push ax
000085D6  E8507F            call word 0x529
000085D9  44                inc sp
000085DA  44                inc sp
000085DB  8846E9            mov [bp-0x17],al
000085DE  B8F503            mov ax,0x3f5
000085E1  50                push ax
000085E2  E8447F            call word 0x529
000085E5  44                inc sp
000085E6  44                inc sp
000085E7  8846EA            mov [bp-0x16],al
000085EA  B8F503            mov ax,0x3f5
000085ED  50                push ax
000085EE  E8387F            call word 0x529
000085F1  44                inc sp
000085F2  44                inc sp
000085F3  8846EB            mov [bp-0x15],al
000085F6  B8F503            mov ax,0x3f5
000085F9  50                push ax
000085FA  E82C7F            call word 0x529
000085FD  44                inc sp
000085FE  44                inc sp
000085FF  8846EC            mov [bp-0x14],al
00008602  B8F503            mov ax,0x3f5
00008605  50                push ax
00008606  E8207F            call word 0x529
00008609  44                inc sp
0000860A  44                inc sp
0000860B  8846ED            mov [bp-0x13],al
0000860E  B8F503            mov ax,0x3f5
00008611  50                push ax
00008612  E8147F            call word 0x529
00008615  44                inc sp
00008616  44                inc sp
00008617  8846EE            mov [bp-0x12],al
0000861A  B8F503            mov ax,0x3f5
0000861D  50                push ax
0000861E  E8087F            call word 0x529
00008621  44                inc sp
00008622  44                inc sp
00008623  8846EF            mov [bp-0x11],al
00008626  B80700            mov ax,0x7
00008629  50                push ax
0000862A  E82D80            call word 0x65a
0000862D  50                push ax
0000862E  8D5EE9            lea bx,[bp-0x17]
00008631  53                push bx
00008632  B84000            mov ax,0x40
00008635  50                push ax
00008636  B84200            mov ax,0x42
00008639  50                push ax
0000863A  E8DE79            call word 0x1b
0000863D  83C40A            add sp,byte +0xa
00008640  8A46E9            mov al,[bp-0x17]
00008643  24C0              and al,0xc0
00008645  84C0              test al,al
00008647  742B              jz 0x8674
00008649  8A46EA            mov al,[bp-0x16]
0000864C  2402              and al,0x2
0000864E  84C0              test al,al
00008650  7414              jz 0x8666
00008652  B80003            mov ax,0x300
00008655  894616            mov [bp+0x16],ax
00008658  8B461C            mov ax,[bp+0x1c]
0000865B  0C01              or al,0x1
0000865D  89461C            mov [bp+0x1c],ax
00008660  89EC              mov sp,bp
00008662  5D                pop bp
00008663  C3                ret
00008664  EB0E              jmp short 0x8674
00008666  BB92CD            mov bx,0xcd92
00008669  53                push bx
0000866A  B80700            mov ax,0x7
0000866D  50                push ax
0000866E  E8B982            call word 0x92a
00008671  83C404            add sp,byte +0x4
00008674  8A4616            mov al,[bp+0x16]
00008677  0C00              or al,0x0
00008679  30E4              xor ah,ah
0000867B  894616            mov [bp+0x16],ax
0000867E  31C0              xor ax,ax
00008680  50                push ax
00008681  E82307            call word 0x8da7
00008684  44                inc sp
00008685  44                inc sp
00008686  31C0              xor ax,ax
00008688  50                push ax
00008689  8A46FF            mov al,[bp-0x1]
0000868C  30E4              xor ah,ah
0000868E  50                push ax
0000868F  E82D07            call word 0x8dbf
00008692  83C404            add sp,byte +0x4
00008695  8B461C            mov ax,[bp+0x1c]
00008698  24FE              and al,0xfe
0000869A  89461C            mov [bp+0x1c],ax
0000869D  89EC              mov sp,bp
0000869F  5D                pop bp
000086A0  C3                ret
000086A1  8A460E            mov al,[bp+0xe]
000086A4  8846FF            mov [bp-0x1],al
000086A7  8A46FF            mov al,[bp-0x1]
000086AA  3C01              cmp al,0x1
000086AC  7635              jna 0x86e3
000086AE  31C0              xor ax,ax
000086B0  894616            mov [bp+0x16],ax
000086B3  31C0              xor ax,ax
000086B5  894610            mov [bp+0x10],ax
000086B8  31C0              xor ax,ax
000086BA  894614            mov [bp+0x14],ax
000086BD  31C0              xor ax,ax
000086BF  894612            mov [bp+0x12],ax
000086C2  31C0              xor ax,ax
000086C4  894606            mov [bp+0x6],ax
000086C7  31C0              xor ax,ax
000086C9  894608            mov [bp+0x8],ax
000086CC  8B4612            mov ax,[bp+0x12]
000086CF  30C0              xor al,al
000086D1  0A46E7            or al,[bp-0x19]
000086D4  894612            mov [bp+0x12],ax
000086D7  8B461C            mov ax,[bp+0x1c]
000086DA  0C01              or al,0x1
000086DC  89461C            mov [bp+0x1c],ax
000086DF  89EC              mov sp,bp
000086E1  5D                pop bp
000086E2  C3                ret
000086E3  B81000            mov ax,0x10
000086E6  50                push ax
000086E7  E8847E            call word 0x56e
000086EA  44                inc sp
000086EB  44                inc sp
000086EC  8846E8            mov [bp-0x18],al
000086EF  30C0              xor al,al
000086F1  8846E7            mov [bp-0x19],al
000086F4  8A46E8            mov al,[bp-0x18]
000086F7  24F0              and al,0xf0
000086F9  84C0              test al,al
000086FB  7407              jz 0x8704
000086FD  8A46E7            mov al,[bp-0x19]
00008700  40                inc ax
00008701  8846E7            mov [bp-0x19],al
00008704  8A46E8            mov al,[bp-0x18]
00008707  240F              and al,0xf
00008709  84C0              test al,al
0000870B  7407              jz 0x8714
0000870D  8A46E7            mov al,[bp-0x19]
00008710  40                inc ax
00008711  8846E7            mov [bp-0x19],al
00008714  8A46FF            mov al,[bp-0x1]
00008717  84C0              test al,al
00008719  750E              jnz 0x8729
0000871B  8A46E8            mov al,[bp-0x18]
0000871E  30E4              xor ah,ah
00008720  B104              mov cl,0x4
00008722  D3E8              shr ax,cl
00008724  8846E8            mov [bp-0x18],al
00008727  EB08              jmp short 0x8731
00008729  8A46E8            mov al,[bp-0x18]
0000872C  240F              and al,0xf
0000872E  8846E8            mov [bp-0x18],al
00008731  8A4610            mov al,[bp+0x10]
00008734  0C00              or al,0x0
00008736  30E4              xor ah,ah
00008738  894610            mov [bp+0x10],ax
0000873B  8B4610            mov ax,[bp+0x10]
0000873E  30C0              xor al,al
00008740  0A46E8            or al,[bp-0x18]
00008743  894610            mov [bp+0x10],ax
00008746  8A4616            mov al,[bp+0x16]
00008749  0C00              or al,0x0
0000874B  30E4              xor ah,ah
0000874D  894616            mov [bp+0x16],ax
00008750  8B4616            mov ax,[bp+0x16]
00008753  30C0              xor al,al
00008755  0C00              or al,0x0
00008757  894616            mov [bp+0x16],ax
0000875A  8B4612            mov ax,[bp+0x12]
0000875D  30C0              xor al,al
0000875F  0A46E7            or al,[bp-0x19]
00008762  894612            mov [bp+0x12],ax
00008765  8A46E8            mov al,[bp-0x18]
00008768  E9BC00            jmp word 0x8827
0000876B  31C0              xor ax,ax
0000876D  894614            mov [bp+0x14],ax
00008770  8A4612            mov al,[bp+0x12]
00008773  0C00              or al,0x0
00008775  30E4              xor ah,ah
00008777  894612            mov [bp+0x12],ax
0000877A  E9D100            jmp word 0x884e
0000877D  B80927            mov ax,0x2709
00008780  894614            mov [bp+0x14],ax
00008783  8A4612            mov al,[bp+0x12]
00008786  30E4              xor ah,ah
00008788  0D0001            or ax,0x100
0000878B  894612            mov [bp+0x12],ax
0000878E  E9BD00            jmp word 0x884e
00008791  B80F4F            mov ax,0x4f0f
00008794  894614            mov [bp+0x14],ax
00008797  8A4612            mov al,[bp+0x12]
0000879A  30E4              xor ah,ah
0000879C  0D0001            or ax,0x100
0000879F  894612            mov [bp+0x12],ax
000087A2  E9A900            jmp word 0x884e
000087A5  B8094F            mov ax,0x4f09
000087A8  894614            mov [bp+0x14],ax
000087AB  8A4612            mov al,[bp+0x12]
000087AE  30E4              xor ah,ah
000087B0  0D0001            or ax,0x100
000087B3  894612            mov [bp+0x12],ax
000087B6  E99500            jmp word 0x884e
000087B9  B8124F            mov ax,0x4f12
000087BC  894614            mov [bp+0x14],ax
000087BF  8A4612            mov al,[bp+0x12]
000087C2  30E4              xor ah,ah
000087C4  0D0001            or ax,0x100
000087C7  894612            mov [bp+0x12],ax
000087CA  E98100            jmp word 0x884e
000087CD  B8244F            mov ax,0x4f24
000087D0  894614            mov [bp+0x14],ax
000087D3  8A4612            mov al,[bp+0x12]
000087D6  30E4              xor ah,ah
000087D8  0D0001            or ax,0x100
000087DB  894612            mov [bp+0x12],ax
000087DE  EB6E              jmp short 0x884e
000087E0  B80827            mov ax,0x2708
000087E3  894614            mov [bp+0x14],ax
000087E6  8A4612            mov al,[bp+0x12]
000087E9  0C00              or al,0x0
000087EB  30E4              xor ah,ah
000087ED  894612            mov [bp+0x12],ax
000087F0  EB5C              jmp short 0x884e
000087F2  B80927            mov ax,0x2709
000087F5  894614            mov [bp+0x14],ax
000087F8  8A4612            mov al,[bp+0x12]
000087FB  0C00              or al,0x0
000087FD  30E4              xor ah,ah
000087FF  894612            mov [bp+0x12],ax
00008802  EB4A              jmp short 0x884e
00008804  B80827            mov ax,0x2708
00008807  894614            mov [bp+0x14],ax
0000880A  8A4612            mov al,[bp+0x12]
0000880D  30E4              xor ah,ah
0000880F  0D0001            or ax,0x100
00008812  894612            mov [bp+0x12],ax
00008815  EB37              jmp short 0x884e
00008817  BB72CD            mov bx,0xcd72
0000881A  53                push bx
0000881B  B80700            mov ax,0x7
0000881E  50                push ax
0000881F  E80881            call word 0x92a
00008822  83C404            add sp,byte +0x4
00008825  EB27              jmp short 0x884e
00008827  2C00              sub al,0x0
00008829  72EC              jc 0x8817
0000882B  3C08              cmp al,0x8
0000882D  771D              ja 0x884c
0000882F  30E4              xor ah,ah
00008831  D1E0              shl ax,1
00008833  89C3              mov bx,ax
00008835  2EFFA73A88        jmp word [cs:bx-0x77c6]
0000883A  6B877D8791        imul ax,[bx-0x7883],byte -0x6f
0000883F  87A587B9          xchg sp,[di-0x4679]
00008843  87CD              xchg cx,bp
00008845  87E0              xchg sp,ax
00008847  87F2              xchg si,dx
00008849  8704              xchg ax,[si]
0000884B  88EB              mov bl,ch
0000884D  C9                leave
0000884E  55                push bp
0000884F  89E5              mov bp,sp
00008851  B8DEEF            mov ax,0xefde
00008854  89462C            mov [bp+0x2c],ax
00008857  8C4E2A            mov [bp+0x2a],cs
0000885A  5D                pop bp
0000885B  8B461C            mov ax,[bp+0x1c]
0000885E  24FE              and al,0xfe
00008860  89461C            mov [bp+0x1c],ax
00008863  89EC              mov sp,bp
00008865  5D                pop bp
00008866  C3                ret
00008867  8A460E            mov al,[bp+0xe]
0000886A  8846FF            mov [bp-0x1],al
0000886D  8A46FF            mov al,[bp-0x1]
00008870  3C01              cmp al,0x1
00008872  7616              jna 0x888a
00008874  8A4616            mov al,[bp+0x16]
00008877  0C00              or al,0x0
00008879  30E4              xor ah,ah
0000887B  894616            mov [bp+0x16],ax
0000887E  8B461C            mov ax,[bp+0x1c]
00008881  0C01              or al,0x1
00008883  89461C            mov [bp+0x1c],ax
00008886  89EC              mov sp,bp
00008888  5D                pop bp
00008889  C3                ret
0000888A  B81000            mov ax,0x10
0000888D  50                push ax
0000888E  E8DD7C            call word 0x56e
00008891  44                inc sp
00008892  44                inc sp
00008893  8846E8            mov [bp-0x18],al
00008896  8A46FF            mov al,[bp-0x1]
00008899  84C0              test al,al
0000889B  750E              jnz 0x88ab
0000889D  8A46E8            mov al,[bp-0x18]
000088A0  30E4              xor ah,ah
000088A2  B104              mov cl,0x4
000088A4  D3E8              shr ax,cl
000088A6  8846E8            mov [bp-0x18],al
000088A9  EB08              jmp short 0x88b3
000088AB  8A46E8            mov al,[bp-0x18]
000088AE  240F              and al,0xf
000088B0  8846E8            mov [bp-0x18],al
000088B3  8B461C            mov ax,[bp+0x1c]
000088B6  24FE              and al,0xfe
000088B8  89461C            mov [bp+0x1c],ax
000088BB  8A46E8            mov al,[bp-0x18]
000088BE  84C0              test al,al
000088C0  750C              jnz 0x88ce
000088C2  8A4616            mov al,[bp+0x16]
000088C5  0C00              or al,0x0
000088C7  30E4              xor ah,ah
000088C9  894616            mov [bp+0x16],ax
000088CC  EB0B              jmp short 0x88d9
000088CE  8A4616            mov al,[bp+0x16]
000088D1  30E4              xor ah,ah
000088D3  0D0001            or ax,0x100
000088D6  894616            mov [bp+0x16],ax
000088D9  89EC              mov sp,bp
000088DB  5D                pop bp
000088DC  C3                ret
000088DD  8A460E            mov al,[bp+0xe]
000088E0  8846FF            mov [bp-0x1],al
000088E3  8A46FF            mov al,[bp-0x1]
000088E6  3C01              cmp al,0x1
000088E8  7620              jna 0x890a
000088EA  8A4616            mov al,[bp+0x16]
000088ED  30E4              xor ah,ah
000088EF  0D0001            or ax,0x100
000088F2  894616            mov [bp+0x16],ax
000088F5  B80100            mov ax,0x1
000088F8  50                push ax
000088F9  E8AB04            call word 0x8da7
000088FC  44                inc sp
000088FD  44                inc sp
000088FE  8B461C            mov ax,[bp+0x1c]
00008901  0C01              or al,0x1
00008903  89461C            mov [bp+0x1c],ax
00008906  89EC              mov sp,bp
00008908  5D                pop bp
00008909  C3                ret
0000890A  8A4616            mov al,[bp+0x16]
0000890D  30E4              xor ah,ah
0000890F  0D0006            or ax,0x600
00008912  894616            mov [bp+0x16],ax
00008915  B80600            mov ax,0x6
00008918  50                push ax
00008919  E88B04            call word 0x8da7
0000891C  44                inc sp
0000891D  44                inc sp
0000891E  8B461C            mov ax,[bp+0x1c]
00008921  0C01              or al,0x1
00008923  89461C            mov [bp+0x1c],ax
00008926  89EC              mov sp,bp
00008928  5D                pop bp
00008929  C3                ret
0000892A  8A460E            mov al,[bp+0xe]
0000892D  8846FF            mov [bp-0x1],al
00008930  8A4616            mov al,[bp+0x16]
00008933  8846E8            mov [bp-0x18],al
00008936  8A46FF            mov al,[bp-0x1]
00008939  3C01              cmp al,0x1
0000893B  7620              jna 0x895d
0000893D  8A4616            mov al,[bp+0x16]
00008940  30E4              xor ah,ah
00008942  0D0001            or ax,0x100
00008945  894616            mov [bp+0x16],ax
00008948  B80100            mov ax,0x1
0000894B  50                push ax
0000894C  E85804            call word 0x8da7
0000894F  44                inc sp
00008950  44                inc sp
00008951  8B461C            mov ax,[bp+0x1c]
00008954  0C01              or al,0x1
00008956  89461C            mov [bp+0x1c],ax
00008959  89EC              mov sp,bp
0000895B  5D                pop bp
0000895C  C3                ret
0000895D  8A46FF            mov al,[bp-0x1]
00008960  30E4              xor ah,ah
00008962  50                push ax
00008963  E8B6F3            call word 0x7d1c
00008966  44                inc sp
00008967  44                inc sp
00008968  85C0              test ax,ax
0000896A  7520              jnz 0x898c
0000896C  8A4616            mov al,[bp+0x16]
0000896F  30E4              xor ah,ah
00008971  0D0080            or ax,0x8000
00008974  894616            mov [bp+0x16],ax
00008977  B88000            mov ax,0x80
0000897A  50                push ax
0000897B  E82904            call word 0x8da7
0000897E  44                inc sp
0000897F  44                inc sp
00008980  8B461C            mov ax,[bp+0x1c]
00008983  0C01              or al,0x1
00008985  89461C            mov [bp+0x1c],ax
00008988  89EC              mov sp,bp
0000898A  5D                pop bp
0000898B  C3                ret
0000898C  8A46FF            mov al,[bp-0x1]
0000898F  84C0              test al,al
00008991  7404              jz 0x8997
00008993  B091              mov al,0x91
00008995  EB02              jmp short 0x8999
00008997  B090              mov al,0x90
00008999  30E4              xor ah,ah
0000899B  8946F8            mov [bp-0x8],ax
0000899E  8B5EF8            mov bx,[bp-0x8]
000089A1  8A07              mov al,[bx]
000089A3  8846FA            mov [bp-0x6],al
000089A6  8A46FA            mov al,[bp-0x6]
000089A9  240F              and al,0xf
000089AB  8846F1            mov [bp-0xf],al
000089AE  8A46E8            mov al,[bp-0x18]
000089B1  EB70              jmp short 0x8a23
000089B3  8A46F1            mov al,[bp-0xf]
000089B6  0C90              or al,0x90
000089B8  8846F1            mov [bp-0xf],al
000089BB  EB78              jmp short 0x8a35
000089BD  8A46F1            mov al,[bp-0xf]
000089C0  0C70              or al,0x70
000089C2  8846F1            mov [bp-0xf],al
000089C5  EB6E              jmp short 0x8a35
000089C7  8A46F1            mov al,[bp-0xf]
000089CA  0C10              or al,0x10
000089CC  8846F1            mov [bp-0xf],al
000089CF  EB64              jmp short 0x8a35
000089D1  8A46FA            mov al,[bp-0x6]
000089D4  30E4              xor ah,ah
000089D6  B104              mov cl,0x4
000089D8  D3E8              shr ax,cl
000089DA  2401              and al,0x1
000089DC  84C0              test al,al
000089DE  7417              jz 0x89f7
000089E0  8A46FA            mov al,[bp-0x6]
000089E3  30E4              xor ah,ah
000089E5  D1E8              shr ax,1
000089E7  2401              and al,0x1
000089E9  84C0              test al,al
000089EB  740A              jz 0x89f7
000089ED  8A46F1            mov al,[bp-0xf]
000089F0  0C50              or al,0x50
000089F2  8846F1            mov [bp-0xf],al
000089F5  EB08              jmp short 0x89ff
000089F7  8A46F1            mov al,[bp-0xf]
000089FA  0C90              or al,0x90
000089FC  8846F1            mov [bp-0xf],al
000089FF  EB34              jmp short 0x8a35
00008A01  8A4616            mov al,[bp+0x16]
00008A04  30E4              xor ah,ah
00008A06  0D0001            or ax,0x100
00008A09  894616            mov [bp+0x16],ax
00008A0C  B80100            mov ax,0x1
00008A0F  50                push ax
00008A10  E89403            call word 0x8da7
00008A13  44                inc sp
00008A14  44                inc sp
00008A15  8B461C            mov ax,[bp+0x1c]
00008A18  0C01              or al,0x1
00008A1A  89461C            mov [bp+0x1c],ax
00008A1D  89EC              mov sp,bp
00008A1F  5D                pop bp
00008A20  C3                ret
00008A21  EB12              jmp short 0x8a35
00008A23  2C01              sub al,0x1
00008A25  748C              jz 0x89b3
00008A27  2C01              sub al,0x1
00008A29  7492              jz 0x89bd
00008A2B  2C01              sub al,0x1
00008A2D  7498              jz 0x89c7
00008A2F  2C01              sub al,0x1
00008A31  749E              jz 0x89d1
00008A33  EBCC              jmp short 0x8a01
00008A35  8B5EF8            mov bx,[bp-0x8]
00008A38  8A46F1            mov al,[bp-0xf]
00008A3B  8807              mov [bx],al
00008A3D  8A4616            mov al,[bp+0x16]
00008A40  0C00              or al,0x0
00008A42  30E4              xor ah,ah
00008A44  894616            mov [bp+0x16],ax
00008A47  31C0              xor ax,ax
00008A49  50                push ax
00008A4A  E85A03            call word 0x8da7
00008A4D  44                inc sp
00008A4E  44                inc sp
00008A4F  8B461C            mov ax,[bp+0x1c]
00008A52  24FE              and al,0xfe
00008A54  89461C            mov [bp+0x1c],ax
00008A57  89EC              mov sp,bp
00008A59  5D                pop bp
00008A5A  C3                ret
00008A5B  8A460E            mov al,[bp+0xe]
00008A5E  8846FF            mov [bp-0x1],al
00008A61  8A4614            mov al,[bp+0x14]
00008A64  8846F1            mov [bp-0xf],al
00008A67  8A46F1            mov al,[bp-0xf]
00008A6A  243F              and al,0x3f
00008A6C  8846E5            mov [bp-0x1b],al
00008A6F  8B4614            mov ax,[bp+0x14]
00008A72  88E0              mov al,ah
00008A74  30E4              xor ah,ah
00008A76  50                push ax
00008A77  8A46F1            mov al,[bp-0xf]
00008A7A  30E4              xor ah,ah
00008A7C  B106              mov cl,0x6
00008A7E  D3E8              shr ax,cl
00008A80  88C4              mov ah,al
00008A82  30C0              xor al,al
00008A84  0346DC            add ax,[bp-0x24]
00008A87  44                inc sp
00008A88  44                inc sp
00008A89  8946DE            mov [bp-0x22],ax
00008A8C  8A46FF            mov al,[bp-0x1]
00008A8F  3C01              cmp al,0x1
00008A91  7620              jna 0x8ab3
00008A93  8A4616            mov al,[bp+0x16]
00008A96  30E4              xor ah,ah
00008A98  0D0001            or ax,0x100
00008A9B  894616            mov [bp+0x16],ax
00008A9E  B80100            mov ax,0x1
00008AA1  50                push ax
00008AA2  E80203            call word 0x8da7
00008AA5  44                inc sp
00008AA6  44                inc sp
00008AA7  8B461C            mov ax,[bp+0x1c]
00008AAA  0C01              or al,0x1
00008AAC  89461C            mov [bp+0x1c],ax
00008AAF  89EC              mov sp,bp
00008AB1  5D                pop bp
00008AB2  C3                ret
00008AB3  8A46FF            mov al,[bp-0x1]
00008AB6  30E4              xor ah,ah
00008AB8  50                push ax
00008AB9  E860F2            call word 0x7d1c
00008ABC  44                inc sp
00008ABD  44                inc sp
00008ABE  85C0              test ax,ax
00008AC0  7520              jnz 0x8ae2
00008AC2  8A4616            mov al,[bp+0x16]
00008AC5  30E4              xor ah,ah
00008AC7  0D0080            or ax,0x8000
00008ACA  894616            mov [bp+0x16],ax
00008ACD  B88000            mov ax,0x80
00008AD0  50                push ax
00008AD1  E8D302            call word 0x8da7
00008AD4  44                inc sp
00008AD5  44                inc sp
00008AD6  8B461C            mov ax,[bp+0x1c]
00008AD9  0C01              or al,0x1
00008ADB  89461C            mov [bp+0x1c],ax
00008ADE  89EC              mov sp,bp
00008AE0  5D                pop bp
00008AE1  C3                ret
00008AE2  8A46FF            mov al,[bp-0x1]
00008AE5  30E4              xor ah,ah
00008AE7  50                push ax
00008AE8  E84AF0            call word 0x7b35
00008AEB  44                inc sp
00008AEC  44                inc sp
00008AED  85C0              test ax,ax
00008AEF  752F              jnz 0x8b20
00008AF1  8A46FF            mov al,[bp-0x1]
00008AF4  30E4              xor ah,ah
00008AF6  50                push ax
00008AF7  E8ABF0            call word 0x7ba5
00008AFA  44                inc sp
00008AFB  44                inc sp
00008AFC  85C0              test ax,ax
00008AFE  7520              jnz 0x8b20
00008B00  8A4616            mov al,[bp+0x16]
00008B03  30E4              xor ah,ah
00008B05  0D000C            or ax,0xc00
00008B08  894616            mov [bp+0x16],ax
00008B0B  B80C00            mov ax,0xc
00008B0E  50                push ax
00008B0F  E89502            call word 0x8da7
00008B12  44                inc sp
00008B13  44                inc sp
00008B14  8B461C            mov ax,[bp+0x1c]
00008B17  0C01              or al,0x1
00008B19  89461C            mov [bp+0x1c],ax
00008B1C  89EC              mov sp,bp
00008B1E  5D                pop bp
00008B1F  C3                ret
00008B20  B81000            mov ax,0x10
00008B23  50                push ax
00008B24  E8477A            call word 0x56e
00008B27  44                inc sp
00008B28  44                inc sp
00008B29  8846E8            mov [bp-0x18],al
00008B2C  8A46FF            mov al,[bp-0x1]
00008B2F  84C0              test al,al
00008B31  750E              jnz 0x8b41
00008B33  8A46E8            mov al,[bp-0x18]
00008B36  30E4              xor ah,ah
00008B38  B104              mov cl,0x4
00008B3A  D3E8              shr ax,cl
00008B3C  8846E8            mov [bp-0x18],al
00008B3F  EB08              jmp short 0x8b49
00008B41  8A46E8            mov al,[bp-0x18]
00008B44  240F              and al,0xf
00008B46  8846E8            mov [bp-0x18],al
00008B49  8A46FF            mov al,[bp-0x1]
00008B4C  84C0              test al,al
00008B4E  7404              jz 0x8b54
00008B50  B091              mov al,0x91
00008B52  EB02              jmp short 0x8b56
00008B54  B090              mov al,0x90
00008B56  30E4              xor ah,ah
00008B58  8946F8            mov [bp-0x8],ax
00008B5B  8B5EF8            mov bx,[bp-0x8]
00008B5E  8A07              mov al,[bx]
00008B60  8846FA            mov [bp-0x6],al
00008B63  8A46FA            mov al,[bp-0x6]
00008B66  240F              and al,0xf
00008B68  8846F1            mov [bp-0xf],al
00008B6B  8A4616            mov al,[bp+0x16]
00008B6E  30E4              xor ah,ah
00008B70  0D000C            or ax,0xc00
00008B73  894616            mov [bp+0x16],ax
00008B76  8A46E8            mov al,[bp-0x18]
00008B79  E93C01            jmp word 0x8cb8
00008B7C  E96001            jmp word 0x8cdf
00008B7F  8B46DE            mov ax,[bp-0x22]
00008B82  3D2700            cmp ax,0x27
00008B85  7520              jnz 0x8ba7
00008B87  8A46E5            mov al,[bp-0x1b]
00008B8A  3C08              cmp al,0x8
00008B8C  7407              jz 0x8b95
00008B8E  8A46E5            mov al,[bp-0x1b]
00008B91  3C09              cmp al,0x9
00008B93  7512              jnz 0x8ba7
00008B95  8A46F1            mov al,[bp-0xf]
00008B98  0C90              or al,0x90
00008B9A  8846F1            mov [bp-0xf],al
00008B9D  8A4616            mov al,[bp+0x16]
00008BA0  0C00              or al,0x0
00008BA2  30E4              xor ah,ah
00008BA4  894616            mov [bp+0x16],ax
00008BA7  E93501            jmp word 0x8cdf
00008BAA  8B46DE            mov ax,[bp-0x22]
00008BAD  3D2700            cmp ax,0x27
00008BB0  7522              jnz 0x8bd4
00008BB2  8A46E5            mov al,[bp-0x1b]
00008BB5  3C08              cmp al,0x8
00008BB7  7407              jz 0x8bc0
00008BB9  8A46E5            mov al,[bp-0x1b]
00008BBC  3C09              cmp al,0x9
00008BBE  7514              jnz 0x8bd4
00008BC0  8A46F1            mov al,[bp-0xf]
00008BC3  0C70              or al,0x70
00008BC5  8846F1            mov [bp-0xf],al
00008BC8  8A4616            mov al,[bp+0x16]
00008BCB  0C00              or al,0x0
00008BCD  30E4              xor ah,ah
00008BCF  894616            mov [bp+0x16],ax
00008BD2  EB21              jmp short 0x8bf5
00008BD4  8B46DE            mov ax,[bp-0x22]
00008BD7  3D4F00            cmp ax,0x4f
00008BDA  7519              jnz 0x8bf5
00008BDC  8A46E5            mov al,[bp-0x1b]
00008BDF  3C0F              cmp al,0xf
00008BE1  7512              jnz 0x8bf5
00008BE3  8A46F1            mov al,[bp-0xf]
00008BE6  0C10              or al,0x10
00008BE8  8846F1            mov [bp-0xf],al
00008BEB  8A4616            mov al,[bp+0x16]
00008BEE  0C00              or al,0x0
00008BF0  30E4              xor ah,ah
00008BF2  894616            mov [bp+0x16],ax
00008BF5  E9E700            jmp word 0x8cdf
00008BF8  8B46DE            mov ax,[bp-0x22]
00008BFB  3D4F00            cmp ax,0x4f
00008BFE  7519              jnz 0x8c19
00008C00  8A46E5            mov al,[bp-0x1b]
00008C03  3C09              cmp al,0x9
00008C05  7512              jnz 0x8c19
00008C07  8A46F1            mov al,[bp-0xf]
00008C0A  0C90              or al,0x90
00008C0C  8846F1            mov [bp-0xf],al
00008C0F  8A4616            mov al,[bp+0x16]
00008C12  0C00              or al,0x0
00008C14  30E4              xor ah,ah
00008C16  894616            mov [bp+0x16],ax
00008C19  E9C300            jmp word 0x8cdf
00008C1C  8B46DE            mov ax,[bp-0x22]
00008C1F  3D4F00            cmp ax,0x4f
00008C22  7534              jnz 0x8c58
00008C24  8A46E5            mov al,[bp-0x1b]
00008C27  3C09              cmp al,0x9
00008C29  7514              jnz 0x8c3f
00008C2B  8A46F1            mov al,[bp-0xf]
00008C2E  0C90              or al,0x90
00008C30  8846F1            mov [bp-0xf],al
00008C33  8A4616            mov al,[bp+0x16]
00008C36  0C00              or al,0x0
00008C38  30E4              xor ah,ah
00008C3A  894616            mov [bp+0x16],ax
00008C3D  EB19              jmp short 0x8c58
00008C3F  8A46E5            mov al,[bp-0x1b]
00008C42  3C12              cmp al,0x12
00008C44  7512              jnz 0x8c58
00008C46  8A46F1            mov al,[bp-0xf]
00008C49  0C10              or al,0x10
00008C4B  8846F1            mov [bp-0xf],al
00008C4E  8A4616            mov al,[bp+0x16]
00008C51  0C00              or al,0x0
00008C53  30E4              xor ah,ah
00008C55  894616            mov [bp+0x16],ax
00008C58  E98400            jmp word 0x8cdf
00008C5B  8B46DE            mov ax,[bp-0x22]
00008C5E  3D4F00            cmp ax,0x4f
00008C61  754F              jnz 0x8cb2
00008C63  8A46E5            mov al,[bp-0x1b]
00008C66  3C09              cmp al,0x9
00008C68  7514              jnz 0x8c7e
00008C6A  8A46F1            mov al,[bp-0xf]
00008C6D  0C90              or al,0x90
00008C6F  8846F1            mov [bp-0xf],al
00008C72  8A4616            mov al,[bp+0x16]
00008C75  0C00              or al,0x0
00008C77  30E4              xor ah,ah
00008C79  894616            mov [bp+0x16],ax
00008C7C  EB34              jmp short 0x8cb2
00008C7E  8A46E5            mov al,[bp-0x1b]
00008C81  3C12              cmp al,0x12
00008C83  7514              jnz 0x8c99
00008C85  8A46F1            mov al,[bp-0xf]
00008C88  0C10              or al,0x10
00008C8A  8846F1            mov [bp-0xf],al
00008C8D  8A4616            mov al,[bp+0x16]
00008C90  0C00              or al,0x0
00008C92  30E4              xor ah,ah
00008C94  894616            mov [bp+0x16],ax
00008C97  EB19              jmp short 0x8cb2
00008C99  8A46E5            mov al,[bp-0x1b]
00008C9C  3C24              cmp al,0x24
00008C9E  7512              jnz 0x8cb2
00008CA0  8A46F1            mov al,[bp-0xf]
00008CA3  0CD0              or al,0xd0
00008CA5  8846F1            mov [bp-0xf],al
00008CA8  8A4616            mov al,[bp+0x16]
00008CAB  0C00              or al,0x0
00008CAD  30E4              xor ah,ah
00008CAF  894616            mov [bp+0x16],ax
00008CB2  EB2B              jmp short 0x8cdf
00008CB4  EB29              jmp short 0x8cdf
00008CB6  EB27              jmp short 0x8cdf
00008CB8  2C00              sub al,0x0
00008CBA  72F8              jc 0x8cb4
00008CBC  3C08              cmp al,0x8
00008CBE  771D              ja 0x8cdd
00008CC0  30E4              xor ah,ah
00008CC2  D1E0              shl ax,1
00008CC4  89C3              mov bx,ax
00008CC6  2EFFA7CB8C        jmp word [cs:bx-0x7335]
00008CCB  7C8B              jl 0x8c58
00008CCD  7F8B              jg 0x8c5a
00008CCF  AA                stosb
00008CD0  8BF8              mov di,ax
00008CD2  8B1C              mov bx,[si]
00008CD4  8C5B8C            mov [bp+di-0x74],ds
00008CD7  7F8B              jg 0x8c64
00008CD9  7F8B              jg 0x8c66
00008CDB  7F8B              jg 0x8c68
00008CDD  EBD5              jmp short 0x8cb4
00008CDF  8B4616            mov ax,[bp+0x16]
00008CE2  88E0              mov al,ah
00008CE4  30E4              xor ah,ah
00008CE6  85C0              test ax,ax
00008CE8  7419              jz 0x8d03
00008CEA  8B4616            mov ax,[bp+0x16]
00008CED  88E0              mov al,ah
00008CEF  30E4              xor ah,ah
00008CF1  50                push ax
00008CF2  E8B200            call word 0x8da7
00008CF5  44                inc sp
00008CF6  44                inc sp
00008CF7  8B461C            mov ax,[bp+0x1c]
00008CFA  0C01              or al,0x1
00008CFC  89461C            mov [bp+0x1c],ax
00008CFF  89EC              mov sp,bp
00008D01  5D                pop bp
00008D02  C3                ret
00008D03  8B5EF8            mov bx,[bp-0x8]
00008D06  8A46F1            mov al,[bp-0xf]
00008D09  8807              mov [bx],al
00008D0B  55                push bp
00008D0C  89E5              mov bp,sp
00008D0E  B8DEEF            mov ax,0xefde
00008D11  89462C            mov [bp+0x2c],ax
00008D14  8C4E2A            mov [bp+0x2a],cs
00008D17  5D                pop bp
00008D18  31C0              xor ax,ax
00008D1A  50                push ax
00008D1B  E88900            call word 0x8da7
00008D1E  44                inc sp
00008D1F  44                inc sp
00008D20  8B461C            mov ax,[bp+0x1c]
00008D23  24FE              and al,0xfe
00008D25  89461C            mov [bp+0x1c],ax
00008D28  89EC              mov sp,bp
00008D2A  5D                pop bp
00008D2B  C3                ret
00008D2C  8B4616            mov ax,[bp+0x16]
00008D2F  88E0              mov al,ah
00008D31  30E4              xor ah,ah
00008D33  50                push ax
00008D34  BB4DCD            mov bx,0xcd4d
00008D37  53                push bx
00008D38  B80400            mov ax,0x4
00008D3B  50                push ax
00008D3C  E8EB7B            call word 0x92a
00008D3F  83C406            add sp,byte +0x6
00008D42  8A4616            mov al,[bp+0x16]
00008D45  30E4              xor ah,ah
00008D47  0D0001            or ax,0x100
00008D4A  894616            mov [bp+0x16],ax
00008D4D  B80100            mov ax,0x1
00008D50  50                push ax
00008D51  E85300            call word 0x8da7
00008D54  44                inc sp
00008D55  44                inc sp
00008D56  8B461C            mov ax,[bp+0x1c]
00008D59  0C01              or al,0x1
00008D5B  89461C            mov [bp+0x1c],ax
00008D5E  89EC              mov sp,bp
00008D60  5D                pop bp
00008D61  C3                ret
00008D62  EB3F              jmp short 0x8da3
00008D64  2C00              sub al,0x0
00008D66  72C4              jc 0x8d2c
00008D68  3C08              cmp al,0x8
00008D6A  771D              ja 0x8d89
00008D6C  30E4              xor ah,ah
00008D6E  D1E0              shl ax,1
00008D70  89C3              mov bx,ax
00008D72  2EFFA7778D        jmp word [cs:bx-0x7289]
00008D77  7A7D              jpe 0x8df6
00008D79  247E              and al,0x7e
00008D7B  5C                pop sp
00008D7C  7E5C              jng 0x8dda
00008D7E  7E5C              jng 0x8ddc
00008D80  7E05              jng 0x8d87
00008D82  832C8D            sub word [si],byte -0x73
00008D85  2C8D              sub al,0x8d
00008D87  A1862C            mov ax,[0x2c86]
00008D8A  150F84            adc ax,0x840f
00008D8D  D8FA              fdivr st2
00008D8F  2C01              sub al,0x1
00008D91  0F8448FB          jz word 0x88dd
00008D95  2C01              sub al,0x1
00008D97  0F848FFB          jz word 0x892a
00008D9B  2C01              sub al,0x1
00008D9D  0F84BAFC          jz word 0x8a5b
00008DA1  EB89              jmp short 0x8d2c
00008DA3  89EC              mov sp,bp
00008DA5  5D                pop bp
00008DA6  C3                ret
00008DA7  55                push bp
00008DA8  89E5              mov bp,sp
00008DAA  B84000            mov ax,0x40
00008DAD  50                push ax
00008DAE  B84100            mov ax,0x41
00008DB1  50                push ax
00008DB2  8A4604            mov al,[bp+0x4]
00008DB5  30E4              xor ah,ah
00008DB7  50                push ax
00008DB8  E84078            call word 0x5fb
00008DBB  89EC              mov sp,bp
00008DBD  5D                pop bp
00008DBE  C3                ret
00008DBF  55                push bp
00008DC0  89E5              mov bp,sp
00008DC2  8A4604            mov al,[bp+0x4]
00008DC5  3C01              cmp al,0x1
00008DC7  760D              jna 0x8dd6
00008DC9  BB26CD            mov bx,0xcd26
00008DCC  53                push bx
00008DCD  B80700            mov ax,0x7
00008DD0  50                push ax
00008DD1  E8567B            call word 0x92a
00008DD4  89EC              mov sp,bp
00008DD6  B84000            mov ax,0x40
00008DD9  50                push ax
00008DDA  8A4604            mov al,[bp+0x4]
00008DDD  30E4              xor ah,ah
00008DDF  059400            add ax,0x94
00008DE2  50                push ax
00008DE3  8A4606            mov al,[bp+0x6]
00008DE6  30E4              xor ah,ah
00008DE8  50                push ax
00008DE9  E80F78            call word 0x5fb
00008DEC  89EC              mov sp,bp
00008DEE  5D                pop bp
00008DEF  C3                ret
00008DF0  C3                ret
00008DF1  55                push bp
00008DF2  89E5              mov bp,sp
00008DF4  83C4FA            add sp,byte -0x6
00008DF7  FB                sti
00008DF8  8B460E            mov ax,[bp+0xe]
00008DFB  D1E0              shl ax,1
00008DFD  89C3              mov bx,ax
00008DFF  8B9F0804          mov bx,[bx+0x408]
00008E03  895EFE            mov [bp-0x2],bx
00008E06  8A4613            mov al,[bp+0x13]
00008E09  3C03              cmp al,0x3
00008E0B  0F830001          jnc word 0x8f0f
00008E0F  8B460E            mov ax,[bp+0xe]
00008E12  3D0300            cmp ax,0x3
00008E15  0F83F600          jnc word 0x8f0f
00008E19  8B46FE            mov ax,[bp-0x2]
00008E1C  85C0              test ax,ax
00008E1E  0F84ED00          jz word 0x8f0f
00008E22  8B460E            mov ax,[bp+0xe]
00008E25  89C3              mov bx,ax
00008E27  8A877804          mov al,[bx+0x478]
00008E2B  30E4              xor ah,ah
00008E2D  88C4              mov ah,al
00008E2F  30C0              xor al,al
00008E31  8946FC            mov [bp-0x4],ax
00008E34  8A4613            mov al,[bp+0x13]
00008E37  84C0              test al,al
00008E39  0F856600          jnz word 0x8ea3
00008E3D  8A4612            mov al,[bp+0x12]
00008E40  30E4              xor ah,ah
00008E42  50                push ax
00008E43  FF76FE            push word [bp-0x2]
00008E46  E8F676            call word 0x53f
00008E49  83C404            add sp,byte +0x4
00008E4C  8B46FE            mov ax,[bp-0x2]
00008E4F  40                inc ax
00008E50  40                inc ax
00008E51  50                push ax
00008E52  E8D476            call word 0x529
00008E55  44                inc sp
00008E56  44                inc sp
00008E57  8846FB            mov [bp-0x5],al
00008E5A  8A46FB            mov al,[bp-0x5]
00008E5D  0C01              or al,0x1
00008E5F  30E4              xor ah,ah
00008E61  50                push ax
00008E62  8B46FE            mov ax,[bp-0x2]
00008E65  40                inc ax
00008E66  40                inc ax
00008E67  50                push ax
00008E68  E8D476            call word 0x53f
00008E6B  83C404            add sp,byte +0x4
00008E6E  90                nop
00008E6F  8A46FB            mov al,[bp-0x5]
00008E72  24FE              and al,0xfe
00008E74  30E4              xor ah,ah
00008E76  50                push ax
00008E77  8B46FE            mov ax,[bp-0x2]
00008E7A  40                inc ax
00008E7B  40                inc ax
00008E7C  50                push ax
00008E7D  E8BF76            call word 0x53f
00008E80  83C404            add sp,byte +0x4
00008E83  EB07              jmp short 0x8e8c
00008E85  8B46FC            mov ax,[bp-0x4]
00008E88  48                dec ax
00008E89  8946FC            mov [bp-0x4],ax
00008E8C  8B46FE            mov ax,[bp-0x2]
00008E8F  40                inc ax
00008E90  50                push ax
00008E91  E89576            call word 0x529
00008E94  44                inc sp
00008E95  44                inc sp
00008E96  2440              and al,0x40
00008E98  3C40              cmp al,0x40
00008E9A  7507              jnz 0x8ea3
00008E9C  8B46FC            mov ax,[bp-0x4]
00008E9F  85C0              test ax,ax
00008EA1  75E2              jnz 0x8e85
00008EA3  8A4613            mov al,[bp+0x13]
00008EA6  3C01              cmp al,0x1
00008EA8  7537              jnz 0x8ee1
00008EAA  8B46FE            mov ax,[bp-0x2]
00008EAD  40                inc ax
00008EAE  40                inc ax
00008EAF  50                push ax
00008EB0  E87676            call word 0x529
00008EB3  44                inc sp
00008EB4  44                inc sp
00008EB5  8846FB            mov [bp-0x5],al
00008EB8  8A46FB            mov al,[bp-0x5]
00008EBB  24FB              and al,0xfb
00008EBD  30E4              xor ah,ah
00008EBF  50                push ax
00008EC0  8B46FE            mov ax,[bp-0x2]
00008EC3  40                inc ax
00008EC4  40                inc ax
00008EC5  50                push ax
00008EC6  E87676            call word 0x53f
00008EC9  83C404            add sp,byte +0x4
00008ECC  90                nop
00008ECD  8A46FB            mov al,[bp-0x5]
00008ED0  0C04              or al,0x4
00008ED2  30E4              xor ah,ah
00008ED4  50                push ax
00008ED5  8B46FE            mov ax,[bp-0x2]
00008ED8  40                inc ax
00008ED9  40                inc ax
00008EDA  50                push ax
00008EDB  E86176            call word 0x53f
00008EDE  83C404            add sp,byte +0x4
00008EE1  8B46FE            mov ax,[bp-0x2]
00008EE4  40                inc ax
00008EE5  50                push ax
00008EE6  E84076            call word 0x529
00008EE9  44                inc sp
00008EEA  44                inc sp
00008EEB  8846FB            mov [bp-0x5],al
00008EEE  8A46FB            mov al,[bp-0x5]
00008EF1  3448              xor al,0x48
00008EF3  884613            mov [bp+0x13],al
00008EF6  8B46FC            mov ax,[bp-0x4]
00008EF9  85C0              test ax,ax
00008EFB  7508              jnz 0x8f05
00008EFD  8A4613            mov al,[bp+0x13]
00008F00  0C01              or al,0x1
00008F02  884613            mov [bp+0x13],al
00008F05  8A461A            mov al,[bp+0x1a]
00008F08  24FE              and al,0xfe
00008F0A  88461A            mov [bp+0x1a],al
00008F0D  EB08              jmp short 0x8f17
00008F0F  8A461A            mov al,[bp+0x1a]
00008F12  0C01              or al,0x1
00008F14  88461A            mov [bp+0x1a],al
00008F17  89EC              mov sp,bp
00008F19  5D                pop bp
00008F1A  C3                ret
00008F1B  55                push bp
00008F1C  89E5              mov bp,sp
00008F1E  4C                dec sp
00008F1F  4C                dec sp
00008F20  A10E04            mov ax,[0x40e]
00008F23  8946FE            mov [bp-0x2],ax
00008F26  83C4E4            add sp,byte -0x1c
00008F29  B83D00            mov ax,0x3d
00008F2C  50                push ax
00008F2D  E83E76            call word 0x56e
00008F30  44                inc sp
00008F31  44                inc sp
00008F32  30E4              xor ah,ah
00008F34  8946FC            mov [bp-0x4],ax
00008F37  B83800            mov ax,0x38
00008F3A  50                push ax
00008F3B  E83076            call word 0x56e
00008F3E  44                inc sp
00008F3F  44                inc sp
00008F40  24F0              and al,0xf0
00008F42  30E4              xor ah,ah
00008F44  B104              mov cl,0x4
00008F46  D3E0              shl ax,cl
00008F48  0B46FC            or ax,[bp-0x4]
00008F4B  8946FC            mov [bp-0x4],ax
00008F4E  8B4604            mov ax,[bp+0x4]
00008F51  D1E0              shl ax,1
00008F53  D1E0              shl ax,1
00008F55  89C3              mov bx,ax
00008F57  8B46FC            mov ax,[bp-0x4]
00008F5A  89D9              mov cx,bx
00008F5C  D3E8              shr ax,cl
00008F5E  8946FC            mov [bp-0x4],ax
00008F61  8A46FC            mov al,[bp-0x4]
00008F64  240F              and al,0xf
00008F66  30E4              xor ah,ah
00008F68  8946FC            mov [bp-0x4],ax
00008F6B  B8F09F            mov ax,0x9ff0
00008F6E  50                push ax
00008F6F  B88400            mov ax,0x84
00008F72  50                push ax
00008F73  E87776            call word 0x5ed
00008F76  83C404            add sp,byte +0x4
00008F79  8946F2            mov [bp-0xe],ax
00008F7C  8B46F2            mov ax,[bp-0xe]
00008F7F  3DFFFF            cmp ax,0xffff
00008F82  742C              jz 0x8fb0
00008F84  8B46F2            mov ax,[bp-0xe]
00008F87  8946FC            mov [bp-0x4],ax
00008F8A  B8F09F            mov ax,0x9ff0
00008F8D  50                push ax
00008F8E  B88400            mov ax,0x84
00008F91  50                push ax
00008F92  B8FFFF            mov ax,0xffff
00008F95  50                push ax
00008F96  E87576            call word 0x60e
00008F99  83C406            add sp,byte +0x6
00008F9C  B8F09F            mov ax,0x9ff0
00008F9F  50                push ax
00008FA0  B88200            mov ax,0x82
00008FA3  50                push ax
00008FA4  B8FFFF            mov ax,0xffff
00008FA7  50                push ax
00008FA8  E86376            call word 0x60e
00008FAB  83C406            add sp,byte +0x6
00008FAE  EB15              jmp short 0x8fc5
00008FB0  8B46FC            mov ax,[bp-0x4]
00008FB3  85C0              test ax,ax
00008FB5  750E              jnz 0x8fc5
00008FB7  BB11CD            mov bx,0xcd11
00008FBA  53                push bx
00008FBB  B80700            mov ax,0x7
00008FBE  50                push ax
00008FBF  E86879            call word 0x92a
00008FC2  83C404            add sp,byte +0x4
00008FC5  8B46FC            mov ax,[bp-0x4]
00008FC8  48                dec ax
00008FC9  8946FC            mov [bp-0x4],ax
00008FCC  8D5EE2            lea bx,[bp-0x1e]
00008FCF  53                push bx
00008FD0  FF76FC            push word [bp-0x4]
00008FD3  E87583            call word 0x134b
00008FD6  83C404            add sp,byte +0x4
00008FD9  84C0              test al,al
00008FDB  7515              jnz 0x8ff2
00008FDD  FF76FC            push word [bp-0x4]
00008FE0  BBF5CC            mov bx,0xccf5
00008FE3  53                push bx
00008FE4  B80400            mov ax,0x4
00008FE7  50                push ax
00008FE8  E83F79            call word 0x92a
00008FEB  83C406            add sp,byte +0x6
00008FEE  89EC              mov sp,bp
00008FF0  5D                pop bp
00008FF1  C3                ret
00008FF2  8D5EE2            lea bx,[bp-0x1e]
00008FF5  53                push bx
00008FF6  E89885            call word 0x1591
00008FF9  44                inc sp
00008FFA  44                inc sp
00008FFB  8B46E2            mov ax,[bp-0x1e]
00008FFE  E91901            jmp word 0x911a
00009001  8B46E2            mov ax,[bp-0x1e]
00009004  3D0200            cmp ax,0x2
00009007  7504              jnz 0x900d
00009009  B080              mov al,0x80
0000900B  EB02              jmp short 0x900f
0000900D  30C0              xor al,al
0000900F  8846FB            mov [bp-0x5],al
00009012  B8C007            mov ax,0x7c0
00009015  8946F8            mov [bp-0x8],ax
00009018  31C0              xor ax,ax
0000901A  8946F4            mov [bp-0xc],ax
0000901D  55                push bp
0000901E  89E5              mov bp,sp
00009020  50                push ax
00009021  53                push bx
00009022  51                push cx
00009023  52                push dx
00009024  8A561B            mov dl,[bp+0x1b]
00009027  8B4618            mov ax,[bp+0x18]
0000902A  8EC0              mov es,ax
0000902C  31DB              xor bx,bx
0000902E  B402              mov ah,0x2
00009030  B001              mov al,0x1
00009032  B500              mov ch,0x0
00009034  B101              mov cl,0x1
00009036  B600              mov dh,0x0
00009038  CD13              int 0x13
0000903A  7306              jnc 0x9042
0000903C  B80100            mov ax,0x1
0000903F  894614            mov [bp+0x14],ax
00009042  5A                pop dx
00009043  59                pop cx
00009044  5B                pop bx
00009045  58                pop ax
00009046  5D                pop bp
00009047  8B46F4            mov ax,[bp-0xc]
0000904A  85C0              test ax,ax
0000904C  7411              jz 0x905f
0000904E  B80100            mov ax,0x1
00009051  50                push ax
00009052  FF76E2            push word [bp-0x1e]
00009055  E81C86            call word 0x1674
00009058  83C404            add sp,byte +0x4
0000905B  89EC              mov sp,bp
0000905D  5D                pop bp
0000905E  C3                ret
0000905F  8B46E2            mov ax,[bp-0x1e]
00009062  3D0100            cmp ax,0x1
00009065  750F              jnz 0x9076
00009067  B83800            mov ax,0x38
0000906A  50                push ax
0000906B  E80075            call word 0x56e
0000906E  44                inc sp
0000906F  44                inc sp
00009070  2401              and al,0x1
00009072  84C0              test al,al
00009074  7522              jnz 0x9098
00009076  FF76F8            push word [bp-0x8]
00009079  B8FE01            mov ax,0x1fe
0000907C  50                push ax
0000907D  E86D75            call word 0x5ed
00009080  83C404            add sp,byte +0x4
00009083  3D55AA            cmp ax,0xaa55
00009086  7410              jz 0x9098
00009088  31C0              xor ax,ax
0000908A  50                push ax
0000908B  FF76E2            push word [bp-0x1e]
0000908E  E8E385            call word 0x1674
00009091  83C404            add sp,byte +0x4
00009094  89EC              mov sp,bp
00009096  5D                pop bp
00009097  C3                ret
00009098  8B46F8            mov ax,[bp-0x8]
0000909B  25FF0F            and ax,0xfff
0000909E  B104              mov cl,0x4
000090A0  D3E0              shl ax,cl
000090A2  8946F6            mov [bp-0xa],ax
000090A5  8B46F8            mov ax,[bp-0x8]
000090A8  2500F0            and ax,0xf000
000090AB  8946F8            mov [bp-0x8],ax
000090AE  E98500            jmp word 0x9136
000090B1  E8EEA5            call word 0x36a2
000090B4  8946F4            mov [bp-0xc],ax
000090B7  8A46F4            mov al,[bp-0xc]
000090BA  84C0              test al,al
000090BC  7419              jz 0x90d7
000090BE  FF76F4            push word [bp-0xc]
000090C1  E81686            call word 0x16da
000090C4  44                inc sp
000090C5  44                inc sp
000090C6  B80100            mov ax,0x1
000090C9  50                push ax
000090CA  FF76E2            push word [bp-0x1e]
000090CD  E8A485            call word 0x1674
000090D0  83C404            add sp,byte +0x4
000090D3  89EC              mov sp,bp
000090D5  5D                pop bp
000090D6  C3                ret
000090D7  8B46F4            mov ax,[bp-0xc]
000090DA  88E0              mov al,ah
000090DC  30E4              xor ah,ah
000090DE  8846FB            mov [bp-0x5],al
000090E1  FF76FE            push word [bp-0x2]
000090E4  B86602            mov ax,0x266
000090E7  50                push ax
000090E8  E80275            call word 0x5ed
000090EB  83C404            add sp,byte +0x4
000090EE  8946F8            mov [bp-0x8],ax
000090F1  31C0              xor ax,ax
000090F3  8946F6            mov [bp-0xa],ax
000090F6  EB3E              jmp short 0x9136
000090F8  8B46E6            mov ax,[bp-0x1a]
000090FB  8B5EE8            mov bx,[bp-0x18]
000090FE  93                xchg ax,bx
000090FF  31DB              xor bx,bx
00009101  8946F8            mov [bp-0x8],ax
00009104  B8FFFF            mov ax,0xffff
00009107  31DB              xor bx,bx
00009109  8D7EE6            lea di,[bp-0x1a]
0000910C  E87D6F            call word 0x8c
0000910F  8946F6            mov [bp-0xa],ax
00009112  EB22              jmp short 0x9136
00009114  89EC              mov sp,bp
00009116  5D                pop bp
00009117  C3                ret
00009118  EB1C              jmp short 0x9136
0000911A  2D0100            sub ax,0x1
0000911D  0F84E0FE          jz word 0x9001
00009121  2D0100            sub ax,0x1
00009124  0F84D9FE          jz word 0x9001
00009128  2D0100            sub ax,0x1
0000912B  0F8482FF          jz word 0x90b1
0000912F  2D7D00            sub ax,0x7d
00009132  74C4              jz 0x90f8
00009134  EBDE              jmp short 0x9114
00009136  FF76F6            push word [bp-0xa]
00009139  FF76F8            push word [bp-0x8]
0000913C  BBE1CC            mov bx,0xcce1
0000913F  53                push bx
00009140  B80400            mov ax,0x4
00009143  50                push ax
00009144  E8E377            call word 0x92a
00009147  83C408            add sp,byte +0x8
0000914A  89E5              mov bp,sp
0000914C  0E                push cs
0000914D  68D296            push word 0x96d2
00009150  9C                pushfw
00009151  8B4616            mov ax,[bp+0x16]
00009154  50                push ax
00009155  8B4614            mov ax,[bp+0x14]
00009158  50                push ax
00009159  B855AA            mov ax,0xaa55
0000915C  8A5619            mov dl,[bp+0x19]
0000915F  31DB              xor bx,bx
00009161  8EDB              mov ds,bx
00009163  8EC3              mov es,bx
00009165  89DD              mov bp,bx
00009167  CF                iretw
00009168  89EC              mov sp,bp
0000916A  5D                pop bp
0000916B  C3                ret
0000916C  55                push bp
0000916D  89E5              mov bp,sp
0000916F  4C                dec sp
00009170  4C                dec sp
00009171  FB                sti
00009172  8A4613            mov al,[bp+0x13]
00009175  E96E03            jmp word 0x94e6
00009178  FA                cli
00009179  A16E04            mov ax,[0x46e]
0000917C  894610            mov [bp+0x10],ax
0000917F  A16C04            mov ax,[0x46c]
00009182  89460E            mov [bp+0xe],ax
00009185  A07004            mov al,[0x470]
00009188  884612            mov [bp+0x12],al
0000918B  30C0              xor al,al
0000918D  A27004            mov [0x470],al
00009190  FB                sti
00009191  8A461A            mov al,[bp+0x1a]
00009194  24FE              and al,0xfe
00009196  88461A            mov [bp+0x1a],al
00009199  E97503            jmp word 0x9511
0000919C  FA                cli
0000919D  8B4610            mov ax,[bp+0x10]
000091A0  A36E04            mov [0x46e],ax
000091A3  8B460E            mov ax,[bp+0xe]
000091A6  A36C04            mov [0x46c],ax
000091A9  30C0              xor al,al
000091AB  A27004            mov [0x470],al
000091AE  FB                sti
000091AF  30C0              xor al,al
000091B1  884613            mov [bp+0x13],al
000091B4  8A461A            mov al,[bp+0x1a]
000091B7  24FE              and al,0xfe
000091B9  88461A            mov [bp+0x1a],al
000091BC  E95203            jmp word 0x9511
000091BF  E8E973            call word 0x5ab
000091C2  85C0              test ax,ax
000091C4  740B              jz 0x91d1
000091C6  8A461A            mov al,[bp+0x1a]
000091C9  0C01              or al,0x1
000091CB  88461A            mov [bp+0x1a],al
000091CE  E94003            jmp word 0x9511
000091D1  31C0              xor ax,ax
000091D3  50                push ax
000091D4  E89773            call word 0x56e
000091D7  44                inc sp
000091D8  44                inc sp
000091D9  88460F            mov [bp+0xf],al
000091DC  B80200            mov ax,0x2
000091DF  50                push ax
000091E0  E88B73            call word 0x56e
000091E3  44                inc sp
000091E4  44                inc sp
000091E5  884610            mov [bp+0x10],al
000091E8  B80400            mov ax,0x4
000091EB  50                push ax
000091EC  E87F73            call word 0x56e
000091EF  44                inc sp
000091F0  44                inc sp
000091F1  884611            mov [bp+0x11],al
000091F4  B80B00            mov ax,0xb
000091F7  50                push ax
000091F8  E87373            call word 0x56e
000091FB  44                inc sp
000091FC  44                inc sp
000091FD  2401              and al,0x1
000091FF  88460E            mov [bp+0xe],al
00009202  30C0              xor al,al
00009204  884613            mov [bp+0x13],al
00009207  8A4611            mov al,[bp+0x11]
0000920A  884612            mov [bp+0x12],al
0000920D  8A461A            mov al,[bp+0x1a]
00009210  24FE              and al,0xfe
00009212  88461A            mov [bp+0x1a],al
00009215  E9F902            jmp word 0x9511
00009218  E89073            call word 0x5ab
0000921B  85C0              test ax,ax
0000921D  7403              jz 0x9222
0000921F  E85873            call word 0x57a
00009222  8A460F            mov al,[bp+0xf]
00009225  30E4              xor ah,ah
00009227  50                push ax
00009228  31C0              xor ax,ax
0000922A  50                push ax
0000922B  E83173            call word 0x55f
0000922E  83C404            add sp,byte +0x4
00009231  8A4610            mov al,[bp+0x10]
00009234  30E4              xor ah,ah
00009236  50                push ax
00009237  B80200            mov ax,0x2
0000923A  50                push ax
0000923B  E82173            call word 0x55f
0000923E  83C404            add sp,byte +0x4
00009241  8A4611            mov al,[bp+0x11]
00009244  30E4              xor ah,ah
00009246  50                push ax
00009247  B80400            mov ax,0x4
0000924A  50                push ax
0000924B  E81173            call word 0x55f
0000924E  83C404            add sp,byte +0x4
00009251  B80B00            mov ax,0xb
00009254  50                push ax
00009255  E81673            call word 0x56e
00009258  44                inc sp
00009259  44                inc sp
0000925A  2460              and al,0x60
0000925C  0C02              or al,0x2
0000925E  50                push ax
0000925F  8A460E            mov al,[bp+0xe]
00009262  2401              and al,0x1
00009264  0A46FC            or al,[bp-0x4]
00009267  44                inc sp
00009268  44                inc sp
00009269  8846FF            mov [bp-0x1],al
0000926C  8A46FF            mov al,[bp-0x1]
0000926F  30E4              xor ah,ah
00009271  50                push ax
00009272  B80B00            mov ax,0xb
00009275  50                push ax
00009276  E8E672            call word 0x55f
00009279  83C404            add sp,byte +0x4
0000927C  30C0              xor al,al
0000927E  884613            mov [bp+0x13],al
00009281  8A46FF            mov al,[bp-0x1]
00009284  884612            mov [bp+0x12],al
00009287  8A461A            mov al,[bp+0x1a]
0000928A  24FE              and al,0xfe
0000928C  88461A            mov [bp+0x1a],al
0000928F  E97F02            jmp word 0x9511
00009292  30C0              xor al,al
00009294  884613            mov [bp+0x13],al
00009297  E81173            call word 0x5ab
0000929A  85C0              test ax,ax
0000929C  740B              jz 0x92a9
0000929E  8A461A            mov al,[bp+0x1a]
000092A1  0C01              or al,0x1
000092A3  88461A            mov [bp+0x1a],al
000092A6  E96802            jmp word 0x9511
000092A9  B80900            mov ax,0x9
000092AC  50                push ax
000092AD  E8BE72            call word 0x56e
000092B0  44                inc sp
000092B1  44                inc sp
000092B2  884610            mov [bp+0x10],al
000092B5  B80800            mov ax,0x8
000092B8  50                push ax
000092B9  E8B272            call word 0x56e
000092BC  44                inc sp
000092BD  44                inc sp
000092BE  88460F            mov [bp+0xf],al
000092C1  B80700            mov ax,0x7
000092C4  50                push ax
000092C5  E8A672            call word 0x56e
000092C8  44                inc sp
000092C9  44                inc sp
000092CA  88460E            mov [bp+0xe],al
000092CD  B83200            mov ax,0x32
000092D0  50                push ax
000092D1  E89A72            call word 0x56e
000092D4  44                inc sp
000092D5  44                inc sp
000092D6  884611            mov [bp+0x11],al
000092D9  8A4611            mov al,[bp+0x11]
000092DC  884612            mov [bp+0x12],al
000092DF  8A461A            mov al,[bp+0x1a]
000092E2  24FE              and al,0xfe
000092E4  88461A            mov [bp+0x1a],al
000092E7  E92702            jmp word 0x9511
000092EA  E8BE72            call word 0x5ab
000092ED  85C0              test ax,ax
000092EF  740E              jz 0x92ff
000092F1  E88672            call word 0x57a
000092F4  8A461A            mov al,[bp+0x1a]
000092F7  0C01              or al,0x1
000092F9  88461A            mov [bp+0x1a],al
000092FC  E91202            jmp word 0x9511
000092FF  8A4610            mov al,[bp+0x10]
00009302  30E4              xor ah,ah
00009304  50                push ax
00009305  B80900            mov ax,0x9
00009308  50                push ax
00009309  E85372            call word 0x55f
0000930C  83C404            add sp,byte +0x4
0000930F  8A460F            mov al,[bp+0xf]
00009312  30E4              xor ah,ah
00009314  50                push ax
00009315  B80800            mov ax,0x8
00009318  50                push ax
00009319  E84372            call word 0x55f
0000931C  83C404            add sp,byte +0x4
0000931F  8A460E            mov al,[bp+0xe]
00009322  30E4              xor ah,ah
00009324  50                push ax
00009325  B80700            mov ax,0x7
00009328  50                push ax
00009329  E83372            call word 0x55f
0000932C  83C404            add sp,byte +0x4
0000932F  8A4611            mov al,[bp+0x11]
00009332  30E4              xor ah,ah
00009334  50                push ax
00009335  B83200            mov ax,0x32
00009338  50                push ax
00009339  E82372            call word 0x55f
0000933C  83C404            add sp,byte +0x4
0000933F  B80B00            mov ax,0xb
00009342  50                push ax
00009343  E82872            call word 0x56e
00009346  44                inc sp
00009347  44                inc sp
00009348  247F              and al,0x7f
0000934A  8846FF            mov [bp-0x1],al
0000934D  8A46FF            mov al,[bp-0x1]
00009350  30E4              xor ah,ah
00009352  50                push ax
00009353  B80B00            mov ax,0xb
00009356  50                push ax
00009357  E80572            call word 0x55f
0000935A  83C404            add sp,byte +0x4
0000935D  30C0              xor al,al
0000935F  884613            mov [bp+0x13],al
00009362  8A46FF            mov al,[bp-0x1]
00009365  884612            mov [bp+0x12],al
00009368  8A461A            mov al,[bp+0x1a]
0000936B  24FE              and al,0xfe
0000936D  88461A            mov [bp+0x1a],al
00009370  E99E01            jmp word 0x9511
00009373  B80B00            mov ax,0xb
00009376  50                push ax
00009377  E8F471            call word 0x56e
0000937A  44                inc sp
0000937B  44                inc sp
0000937C  8846FF            mov [bp-0x1],al
0000937F  31C0              xor ax,ax
00009381  894612            mov [bp+0x12],ax
00009384  8A46FF            mov al,[bp-0x1]
00009387  2420              and al,0x20
00009389  84C0              test al,al
0000938B  740B              jz 0x9398
0000938D  8A461A            mov al,[bp+0x1a]
00009390  0C01              or al,0x1
00009392  88461A            mov [bp+0x1a],al
00009395  E97901            jmp word 0x9511
00009398  E81072            call word 0x5ab
0000939B  85C0              test ax,ax
0000939D  7403              jz 0x93a2
0000939F  E8D871            call word 0x57a
000093A2  8A460F            mov al,[bp+0xf]
000093A5  30E4              xor ah,ah
000093A7  50                push ax
000093A8  B80100            mov ax,0x1
000093AB  50                push ax
000093AC  E8B071            call word 0x55f
000093AF  83C404            add sp,byte +0x4
000093B2  8A4610            mov al,[bp+0x10]
000093B5  30E4              xor ah,ah
000093B7  50                push ax
000093B8  B80300            mov ax,0x3
000093BB  50                push ax
000093BC  E8A071            call word 0x55f
000093BF  83C404            add sp,byte +0x4
000093C2  8A4611            mov al,[bp+0x11]
000093C5  30E4              xor ah,ah
000093C7  50                push ax
000093C8  B80500            mov ax,0x5
000093CB  50                push ax
000093CC  E89071            call word 0x55f
000093CF  83C404            add sp,byte +0x4
000093D2  B8A100            mov ax,0xa1
000093D5  50                push ax
000093D6  E85071            call word 0x529
000093D9  44                inc sp
000093DA  44                inc sp
000093DB  24FE              and al,0xfe
000093DD  30E4              xor ah,ah
000093DF  50                push ax
000093E0  B8A100            mov ax,0xa1
000093E3  50                push ax
000093E4  E85871            call word 0x53f
000093E7  83C404            add sp,byte +0x4
000093EA  8A46FF            mov al,[bp-0x1]
000093ED  247F              and al,0x7f
000093EF  0C20              or al,0x20
000093F1  30E4              xor ah,ah
000093F3  50                push ax
000093F4  B80B00            mov ax,0xb
000093F7  50                push ax
000093F8  E86471            call word 0x55f
000093FB  83C404            add sp,byte +0x4
000093FE  8A461A            mov al,[bp+0x1a]
00009401  24FE              and al,0xfe
00009403  88461A            mov [bp+0x1a],al
00009406  E90801            jmp word 0x9511
00009409  B80B00            mov ax,0xb
0000940C  50                push ax
0000940D  E85E71            call word 0x56e
00009410  44                inc sp
00009411  44                inc sp
00009412  8846FF            mov [bp-0x1],al
00009415  8A46FF            mov al,[bp-0x1]
00009418  2457              and al,0x57
0000941A  30E4              xor ah,ah
0000941C  50                push ax
0000941D  B80B00            mov ax,0xb
00009420  50                push ax
00009421  E83B71            call word 0x55f
00009424  83C404            add sp,byte +0x4
00009427  30C0              xor al,al
00009429  884613            mov [bp+0x13],al
0000942C  8A46FF            mov al,[bp-0x1]
0000942F  884612            mov [bp+0x12],al
00009432  8A461A            mov al,[bp+0x1a]
00009435  24FE              and al,0xfe
00009437  88461A            mov [bp+0x1a],al
0000943A  E9D400            jmp word 0x9511
0000943D  8A460C            mov al,[bp+0xc]
00009440  3CFF              cmp al,0xff
00009442  7510              jnz 0x9454
00009444  BBC6CC            mov bx,0xccc6
00009447  53                push bx
00009448  B80400            mov ax,0x4
0000944B  50                push ax
0000944C  E8DB74            call word 0x92a
0000944F  83C404            add sp,byte +0x4
00009452  EB78              jmp short 0x94cc
00009454  8A460C            mov al,[bp+0xc]
00009457  3C81              cmp al,0x81
00009459  7516              jnz 0x9471
0000945B  8A4612            mov al,[bp+0x12]
0000945E  30E4              xor ah,ah
00009460  50                push ax
00009461  BBA0CC            mov bx,0xcca0
00009464  53                push bx
00009465  B80400            mov ax,0x4
00009468  50                push ax
00009469  E8BE74            call word 0x92a
0000946C  83C406            add sp,byte +0x6
0000946F  EB5B              jmp short 0x94cc
00009471  8A460C            mov al,[bp+0xc]
00009474  3C83              cmp al,0x83
00009476  7513              jnz 0x948b
00009478  FF760E            push word [bp+0xe]
0000947B  BB88CC            mov bx,0xcc88
0000947E  53                push bx
0000947F  B80400            mov ax,0x4
00009482  50                push ax
00009483  E8A474            call word 0x92a
00009486  83C406            add sp,byte +0x6
00009489  EB41              jmp short 0x94cc
0000948B  8A460C            mov al,[bp+0xc]
0000948E  3C86              cmp al,0x86
00009490  753A              jnz 0x94cc
00009492  8A4612            mov al,[bp+0x12]
00009495  3C02              cmp al,0x2
00009497  7519              jnz 0x94b2
00009499  FF7606            push word [bp+0x6]
0000949C  FF7610            push word [bp+0x10]
0000949F  FF760E            push word [bp+0xe]
000094A2  BB5CCC            mov bx,0xcc5c
000094A5  53                push bx
000094A6  B80400            mov ax,0x4
000094A9  50                push ax
000094AA  E87D74            call word 0x92a
000094AD  83C40A            add sp,byte +0xa
000094B0  EB1A              jmp short 0x94cc
000094B2  FF7606            push word [bp+0x6]
000094B5  FF760E            push word [bp+0xe]
000094B8  8A4610            mov al,[bp+0x10]
000094BB  30E4              xor ah,ah
000094BD  50                push ax
000094BE  BB20CC            mov bx,0xcc20
000094C1  53                push bx
000094C2  B80400            mov ax,0x4
000094C5  50                push ax
000094C6  E86174            call word 0x92a
000094C9  83C40A            add sp,byte +0xa
000094CC  8A460C            mov al,[bp+0xc]
000094CF  884613            mov [bp+0x13],al
000094D2  8A461A            mov al,[bp+0x1a]
000094D5  0C01              or al,0x1
000094D7  88461A            mov [bp+0x1a],al
000094DA  EB35              jmp short 0x9511
000094DC  8A461A            mov al,[bp+0x1a]
000094DF  0C01              or al,0x1
000094E1  88461A            mov [bp+0x1a],al
000094E4  EB2B              jmp short 0x9511
000094E6  2C00              sub al,0x0
000094E8  72F2              jc 0x94dc
000094EA  3C07              cmp al,0x7
000094EC  771B              ja 0x9509
000094EE  30E4              xor ah,ah
000094F0  D1E0              shl ax,1
000094F2  89C3              mov bx,ax
000094F4  2EFFA7F994        jmp word [cs:bx-0x6b07]
000094F9  7891              js 0x948c
000094FB  9C                pushfw
000094FC  91                xchg ax,cx
000094FD  BF9118            mov di,0x1891
00009500  92                xchg ax,dx
00009501  92                xchg ax,dx
00009502  92                xchg ax,dx
00009503  EA92739309        jmp word 0x993:0x7392
00009508  94                xchg ax,sp
00009509  2CB1              sub al,0xb1
0000950B  0F842EFF          jz word 0x943d
0000950F  EBCB              jmp short 0x94dc
00009511  89EC              mov sp,bp
00009513  5D                pop bp
00009514  C3                ret
00009515  55                push bp
00009516  89E5              mov bp,sp
00009518  4C                dec sp
00009519  30C0              xor al,al
0000951B  8846FF            mov [bp-0x1],al
0000951E  4C                dec sp
0000951F  30C0              xor al,al
00009521  8846FE            mov [bp-0x2],al
00009524  B80B00            mov ax,0xb
00009527  50                push ax
00009528  E84370            call word 0x56e
0000952B  44                inc sp
0000952C  44                inc sp
0000952D  8846FF            mov [bp-0x1],al
00009530  B80C00            mov ax,0xc
00009533  50                push ax
00009534  E83770            call word 0x56e
00009537  44                inc sp
00009538  44                inc sp
00009539  8846FE            mov [bp-0x2],al
0000953C  8A46FF            mov al,[bp-0x1]
0000953F  2460              and al,0x60
00009541  84C0              test al,al
00009543  0F84B200          jz word 0x95f9
00009547  8A46FE            mov al,[bp-0x2]
0000954A  2420              and al,0x20
0000954C  84C0              test al,al
0000954E  7404              jz 0x9554
00009550  FB                sti
00009551  CD4A              int 0x4a
00009553  FA                cli
00009554  8A46FE            mov al,[bp-0x2]
00009557  2440              and al,0x40
00009559  84C0              test al,al
0000955B  0F849A00          jz word 0x95f9
0000955F  A0A004            mov al,[0x4a0]
00009562  84C0              test al,al
00009564  0F849100          jz word 0x95f9
00009568  83C4F8            add sp,byte -0x8
0000956B  A19C04            mov ax,[0x49c]
0000956E  8B1E9E04          mov bx,[0x49e]
00009572  8946FA            mov [bp-0x6],ax
00009575  895EFC            mov [bp-0x4],bx
00009578  B8D103            mov ax,0x3d1
0000957B  31DB              xor bx,bx
0000957D  8D7EFA            lea di,[bp-0x6]
00009580  E8196B            call word 0x9c
00009583  7648              jna 0x95cd
00009585  83C4FC            add sp,byte -0x4
00009588  A19804            mov ax,[0x498]
0000958B  8946F4            mov [bp-0xc],ax
0000958E  A19A04            mov ax,[0x49a]
00009591  8946F2            mov [bp-0xe],ax
00009594  30C0              xor al,al
00009596  A2A004            mov [0x4a0],al
00009599  8A46FF            mov al,[bp-0x1]
0000959C  2437              and al,0x37
0000959E  30E4              xor ah,ah
000095A0  50                push ax
000095A1  B80B00            mov ax,0xb
000095A4  50                push ax
000095A5  E8B76F            call word 0x55f
000095A8  83C404            add sp,byte +0x4
000095AB  FF76F4            push word [bp-0xc]
000095AE  FF76F2            push word [bp-0xe]
000095B1  FF76F4            push word [bp-0xc]
000095B4  FF76F2            push word [bp-0xe]
000095B7  E82570            call word 0x5df
000095BA  83C404            add sp,byte +0x4
000095BD  0C80              or al,0x80
000095BF  30E4              xor ah,ah
000095C1  50                push ax
000095C2  E83670            call word 0x5fb
000095C5  83C406            add sp,byte +0x6
000095C8  83C404            add sp,byte +0x4
000095CB  EB29              jmp short 0x95f6
000095CD  B8D103            mov ax,0x3d1
000095D0  31DB              xor bx,bx
000095D2  53                push bx
000095D3  50                push ax
000095D4  8B46FA            mov ax,[bp-0x6]
000095D7  8B5EFC            mov bx,[bp-0x4]
000095DA  8D7EF2            lea di,[bp-0xe]
000095DD  E8D26A            call word 0xb2
000095E0  8946FA            mov [bp-0x6],ax
000095E3  895EFC            mov [bp-0x4],bx
000095E6  83C404            add sp,byte +0x4
000095E9  8B46FA            mov ax,[bp-0x6]
000095EC  8B5EFC            mov bx,[bp-0x4]
000095EF  A39C04            mov [0x49c],ax
000095F2  891E9E04          mov [0x49e],bx
000095F6  83C408            add sp,byte +0x8
000095F9  E82D04            call word 0x9a29
000095FC  89EC              mov sp,bp
000095FE  5D                pop bp
000095FF  C3                ret
00009600  FB                sti
00009601  60                pushaw
00009602  1E                push ds
00009603  6A00              push byte +0x0
00009605  1F                pop ds
00009606  FF360E04          push word [0x40e]
0000960A  1F                pop ds
0000960B  6A00              push byte +0x0
0000960D  6A00              push byte +0x0
0000960F  6A00              push byte +0x0
00009611  6A00              push byte +0x0
00009613  6A00              push byte +0x0
00009615  E8A9C6            call word 0x5cc1
00009618  59                pop cx
00009619  E304              jcxz 0x961f
0000961B  FF1E2200          call word far [0x22]
0000961F  FA                cli
00009620  E80604            call word 0x9a29
00009623  83C408            add sp,byte +0x8
00009626  1F                pop ds
00009627  61                popaw
00009628  CF                iretw
00009629  7209              jc 0x9634
0000962B  55                push bp
0000962C  89E5              mov bp,sp
0000962E  806606FE          and byte [bp+0x6],0xfe
00009632  5D                pop bp
00009633  CF                iretw
00009634  55                push bp
00009635  89E5              mov bp,sp
00009637  804E0601          or byte [bp+0x6],0x1
0000963B  5D                pop bp
0000963C  CF                iretw
0000963D  80FC4A            cmp ah,0x4a
00009640  720E              jc 0x9650
00009642  80FC4D            cmp ah,0x4d
00009645  7709              ja 0x9650
00009647  60                pushaw
00009648  06                push es
00009649  1E                push ds
0000964A  68CE96            push word 0x96ce
0000964D  E907DC            jmp word 0x7257
00009650  50                push ax
00009651  53                push bx
00009652  51                push cx
00009653  52                push dx
00009654  E8DF9F            call word 0x3636
00009657  3C00              cmp al,0x0
00009659  7431              jz 0x968c
0000965B  E8FF9F            call word 0x365d
0000965E  5A                pop dx
0000965F  52                push dx
00009660  38D0              cmp al,dl
00009662  7515              jnz 0x9679
00009664  5A                pop dx
00009665  59                pop cx
00009666  5B                pop bx
00009667  58                pop ax
00009668  60                pushaw
00009669  06                push es
0000966A  1E                push ds
0000966B  6A40              push byte +0x40
0000966D  1F                pop ds
0000966E  FF360E00          push word [0xe]
00009672  1F                pop ds
00009673  68CE96            push word 0x96ce
00009676  E903DE            jmp word 0x747c
00009679  80E2E0            and dl,0xe0
0000967C  38D0              cmp al,dl
0000967E  750C              jnz 0x968c
00009680  5A                pop dx
00009681  59                pop cx
00009682  5B                pop bx
00009683  58                pop ax
00009684  50                push ax
00009685  51                push cx
00009686  52                push dx
00009687  53                push bx
00009688  FECA              dec dl
0000968A  EB08              jmp short 0x9694
0000968C  5A                pop dx
0000968D  59                pop cx
0000968E  5B                pop bx
0000968F  58                pop ax
00009690  50                push ax
00009691  51                push cx
00009692  52                push dx
00009693  53                push bx
00009694  52                push dx
00009695  55                push bp
00009696  56                push si
00009697  57                push di
00009698  06                push es
00009699  1E                push ds
0000969A  6A40              push byte +0x40
0000969C  1F                pop ds
0000969D  F6C280            test dl,0x80
000096A0  7506              jnz 0x96a8
000096A2  68CE96            push word 0x96ce
000096A5  E9BCE6            jmp word 0x7d64
000096A8  FF360E00          push word [0xe]
000096AC  1F                pop ds
000096AD  80FAE0            cmp dl,0xe0
000096B0  720F              jc 0x96c1
000096B2  66C1EB10          shr ebx,byte 0x10
000096B6  53                push bx
000096B7  E8DCD5            call word 0x6c96
000096BA  5B                pop bx
000096BB  66C1E310          shl ebx,byte 0x10
000096BF  EB0D              jmp short 0x96ce
000096C1  66C1E810          shr eax,byte 0x10
000096C5  50                push ax
000096C6  E85ACD            call word 0x6423
000096C9  58                pop ax
000096CA  66C1E010          shl eax,byte 0x10
000096CE  1F                pop ds
000096CF  07                pop es
000096D0  61                popaw
000096D1  CF                iretw
000096D2  B8FEFF            mov ax,0xfffe
000096D5  89C4              mov sp,ax
000096D7  31C0              xor ax,ax
000096D9  8ED0              mov ss,ax
000096DB  BBF09F            mov bx,0x9ff0
000096DE  8EDB              mov ds,bx
000096E0  8B1E8200          mov bx,[0x82]
000096E4  43                inc bx
000096E5  891E8200          mov [0x82],bx
000096E9  8ED8              mov ds,ax
000096EB  53                push bx
000096EC  EB17              jmp short 0x9705
000096EE  55                push bp
000096EF  89E5              mov bp,sp
000096F1  B8FEFF            mov ax,0xfffe
000096F4  89C4              mov sp,ax
000096F6  31C0              xor ax,ax
000096F8  8ED0              mov ss,ax
000096FA  BBF09F            mov bx,0x9ff0
000096FD  8EDB              mov ds,bx
000096FF  A38200            mov [0x82],ax
00009702  8ED8              mov ds,ax
00009704  50                push ax
00009705  E813F8            call word 0x8f1b
00009708  CD18              int 0x18
0000970A  31C0              xor ax,ax
0000970C  8ED8              mov ds,ax
0000970E  B000              mov al,0x0
00009710  A23E04            mov [0x43e],al
00009713  A23F04            mov [0x43f],al
00009716  A24004            mov [0x440],al
00009719  A24104            mov [0x441],al
0000971C  A24204            mov [0x442],al
0000971F  A24304            mov [0x443],al
00009722  A24404            mov [0x444],al
00009725  A24504            mov [0x445],al
00009728  A24604            mov [0x446],al
0000972B  A24704            mov [0x447],al
0000972E  A24804            mov [0x448],al
00009731  A28B04            mov [0x48b],al
00009734  B010              mov al,0x10
00009736  E670              out 0x70,al
00009738  E471              in al,0x71
0000973A  88C4              mov ah,al
0000973C  C0E804            shr al,byte 0x4
0000973F  7404              jz 0x9745
00009741  B307              mov bl,0x7
00009743  EB02              jmp short 0x9747
00009745  B300              mov bl,0x0
00009747  88E0              mov al,ah
00009749  240F              and al,0xf
0000974B  7403              jz 0x9750
0000974D  80CB70            or bl,0x70
00009750  881E8F04          mov [0x48f],bl
00009754  B000              mov al,0x0
00009756  A29004            mov [0x490],al
00009759  A29104            mov [0x491],al
0000975C  A29204            mov [0x492],al
0000975F  A29304            mov [0x493],al
00009762  A29404            mov [0x494],al
00009765  A29504            mov [0x495],al
00009768  B002              mov al,0x2
0000976A  E60A              out 0xa,al
0000976C  B8DEEF            mov ax,0xefde
0000976F  A37800            mov [0x78],ax
00009772  B800F0            mov ax,0xf000
00009775  A37A00            mov [0x7a],ax
00009778  B859EC            mov ax,0xec59
0000977B  A30001            mov [0x100],ax
0000977E  B800F0            mov ax,0xf000
00009781  A30201            mov [0x102],ax
00009784  B857EF            mov ax,0xef57
00009787  A33800            mov [0x38],ax
0000978A  B800F0            mov ax,0xf000
0000978D  A33A00            mov [0x3a],ax
00009790  C3                ret
00009791  B00A              mov al,0xa
00009793  BAF603            mov dx,0x3f6
00009796  EE                out dx,al
00009797  31C0              xor ax,ax
00009799  8ED8              mov ds,ax
0000979B  A27404            mov [0x474],al
0000979E  A27704            mov [0x477],al
000097A1  A28C04            mov [0x48c],al
000097A4  A28D04            mov [0x48d],al
000097A7  A28E04            mov [0x48e],al
000097AA  B001              mov al,0x1
000097AC  A27504            mov [0x475],al
000097AF  B0C0              mov al,0xc0
000097B1  A27604            mov [0x476],al
000097B4  B8FEE3            mov ax,0xe3fe
000097B7  A34C00            mov [0x4c],ax
000097BA  B800F0            mov ax,0xf000
000097BD  A34E00            mov [0x4e],ax
000097C0  B8979A            mov ax,0x9a97
000097C3  A3D801            mov [0x1d8],ax
000097C6  B800F0            mov ax,0xf000
000097C9  A3DA01            mov [0x1da],ax
000097CC  B83D00            mov ax,0x3d
000097CF  A30401            mov [0x104],ax
000097D2  B8C09F            mov ax,0x9fc0
000097D5  A30601            mov [0x106],ax
000097D8  B84D00            mov ax,0x4d
000097DB  A31801            mov [0x118],ax
000097DE  B8C09F            mov ax,0x9fc0
000097E1  A31A01            mov [0x11a],ax
000097E4  B012              mov al,0x12
000097E6  E670              out 0x70,al
000097E8  E471              in al,0x71
000097EA  24F0              and al,0xf0
000097EC  3CF0              cmp al,0xf0
000097EE  7403              jz 0x97f3
000097F0  E9D400            jmp word 0x98c7
000097F3  B019              mov al,0x19
000097F5  E670              out 0x70,al
000097F7  E471              in al,0x71
000097F9  3C2F              cmp al,0x2f
000097FB  7407              jz 0x9804
000097FD  BA0004            mov dx,0x400
00009800  B86323            mov ax,0x2363
00009803  EF                out dx,ax
00009804  B8C09F            mov ax,0x9fc0
00009807  8ED8              mov ds,ax
00009809  B01F              mov al,0x1f
0000980B  E670              out 0x70,al
0000980D  E471              in al,0x71
0000980F  88C4              mov ah,al
00009811  B01E              mov al,0x1e
00009813  E670              out 0x70,al
00009815  E471              in al,0x71
00009817  A34200            mov [0x42],ax
0000981A  B020              mov al,0x20
0000981C  E670              out 0x70,al
0000981E  E471              in al,0x71
00009820  A24500            mov [0x45],al
00009823  B022              mov al,0x22
00009825  E670              out 0x70,al
00009827  E471              in al,0x71
00009829  88C4              mov ah,al
0000982B  B021              mov al,0x21
0000982D  E670              out 0x70,al
0000982F  E471              in al,0x71
00009831  A34900            mov [0x49],ax
00009834  B01C              mov al,0x1c
00009836  E670              out 0x70,al
00009838  E471              in al,0x71
0000983A  88C4              mov ah,al
0000983C  B01B              mov al,0x1b
0000983E  E670              out 0x70,al
00009840  E471              in al,0x71
00009842  89C3              mov bx,ax
00009844  B01D              mov al,0x1d
00009846  E670              out 0x70,al
00009848  E471              in al,0x71
0000984A  88C1              mov cl,al
0000984C  B023              mov al,0x23
0000984E  E670              out 0x70,al
00009850  E471              in al,0x71
00009852  88C2              mov dl,al
00009854  81FB0004          cmp bx,0x400
00009858  770E              ja 0x9868
0000985A  891E3D00          mov [0x3d],bx
0000985E  880E3F00          mov [0x3f],cl
00009862  88164B00          mov [0x4b],dl
00009866  EB5F              jmp short 0x98c7
00009868  891E4600          mov [0x46],bx
0000986C  880E4800          mov [0x48],cl
00009870  88164100          mov [0x41],dl
00009874  88164B00          mov [0x4b],dl
00009878  B0A0              mov al,0xa0
0000987A  A24000            mov [0x40],al
0000987D  81FB0008          cmp bx,0x800
00009881  7706              ja 0x9889
00009883  D1EB              shr bx,1
00009885  D0E1              shl cl,1
00009887  EB22              jmp short 0x98ab
00009889  81FB0010          cmp bx,0x1000
0000988D  7708              ja 0x9897
0000988F  C1EB02            shr bx,byte 0x2
00009892  C0E102            shl cl,byte 0x2
00009895  EB14              jmp short 0x98ab
00009897  81FB0020          cmp bx,0x2000
0000989B  7708              ja 0x98a5
0000989D  C1EB03            shr bx,byte 0x3
000098A0  C0E103            shl cl,byte 0x3
000098A3  EB06              jmp short 0x98ab
000098A5  C1EB04            shr bx,byte 0x4
000098A8  C0E104            shl cl,byte 0x4
000098AB  891E3D00          mov [0x3d],bx
000098AF  880E3F00          mov [0x3f],cl
000098B3  B10F              mov cl,0xf
000098B5  BE3D00            mov si,0x3d
000098B8  B000              mov al,0x0
000098BA  0204              add al,[si]
000098BC  46                inc si
000098BD  FEC9              dec cl
000098BF  75F9              jnz 0x98ba
000098C1  F6D0              not al
000098C3  FEC0              inc al
000098C5  8804              mov [si],al
000098C7  B012              mov al,0x12
000098C9  E670              out 0x70,al
000098CB  E471              in al,0x71
000098CD  240F              and al,0xf
000098CF  7501              jnz 0x98d2
000098D1  C3                ret
000098D2  3C0F              cmp al,0xf
000098D4  7407              jz 0x98dd
000098D6  BA0004            mov dx,0x400
000098D9  B8EC23            mov ax,0x23ec
000098DC  EF                out dx,ax
000098DD  B01A              mov al,0x1a
000098DF  E670              out 0x70,al
000098E1  E471              in al,0x71
000098E3  3C2F              cmp al,0x2f
000098E5  7407              jz 0x98ee
000098E7  BA0004            mov dx,0x400
000098EA  B8F423            mov ax,0x23f4
000098ED  EF                out dx,ax
000098EE  B8C09F            mov ax,0x9fc0
000098F1  8ED8              mov ds,ax
000098F3  B028              mov al,0x28
000098F5  E670              out 0x70,al
000098F7  E471              in al,0x71
000098F9  88C4              mov ah,al
000098FB  B027              mov al,0x27
000098FD  E670              out 0x70,al
000098FF  E471              in al,0x71
00009901  A35200            mov [0x52],ax
00009904  B029              mov al,0x29
00009906  E670              out 0x70,al
00009908  E471              in al,0x71
0000990A  A25500            mov [0x55],al
0000990D  B02B              mov al,0x2b
0000990F  E670              out 0x70,al
00009911  E471              in al,0x71
00009913  88C4              mov ah,al
00009915  B02A              mov al,0x2a
00009917  E670              out 0x70,al
00009919  E471              in al,0x71
0000991B  A35900            mov [0x59],ax
0000991E  B025              mov al,0x25
00009920  E670              out 0x70,al
00009922  E471              in al,0x71
00009924  88C4              mov ah,al
00009926  B024              mov al,0x24
00009928  E670              out 0x70,al
0000992A  E471              in al,0x71
0000992C  89C3              mov bx,ax
0000992E  B026              mov al,0x26
00009930  E670              out 0x70,al
00009932  E471              in al,0x71
00009934  88C1              mov cl,al
00009936  B02C              mov al,0x2c
00009938  E670              out 0x70,al
0000993A  E471              in al,0x71
0000993C  88C2              mov dl,al
0000993E  81FB0004          cmp bx,0x400
00009942  770D              ja 0x9951
00009944  891E4D00          mov [0x4d],bx
00009948  880E4F00          mov [0x4f],cl
0000994C  88165B00          mov [0x5b],dl
00009950  C3                ret
00009951  891E5600          mov [0x56],bx
00009955  880E5800          mov [0x58],cl
00009959  88165100          mov [0x51],dl
0000995D  88165B00          mov [0x5b],dl
00009961  B0A0              mov al,0xa0
00009963  A25000            mov [0x50],al
00009966  81FB0008          cmp bx,0x800
0000996A  7706              ja 0x9972
0000996C  D1EB              shr bx,1
0000996E  D0E1              shl cl,1
00009970  EB22              jmp short 0x9994
00009972  81FB0010          cmp bx,0x1000
00009976  7708              ja 0x9980
00009978  C1EB02            shr bx,byte 0x2
0000997B  C0E102            shl cl,byte 0x2
0000997E  EB14              jmp short 0x9994
00009980  81FB0020          cmp bx,0x2000
00009984  7708              ja 0x998e
00009986  C1EB03            shr bx,byte 0x3
00009989  C0E103            shl cl,byte 0x3
0000998C  EB06              jmp short 0x9994
0000998E  C1EB04            shr bx,byte 0x4
00009991  C0E104            shl cl,byte 0x4
00009994  891E4D00          mov [0x4d],bx
00009998  880E4F00          mov [0x4f],cl
0000999C  B10F              mov cl,0xf
0000999E  BE4D00            mov si,0x4d
000099A1  B000              mov al,0x0
000099A3  0204              add al,[si]
000099A5  46                inc si
000099A6  FEC9              dec cl
000099A8  75F9              jnz 0x99a3
000099AA  F6D0              not al
000099AC  FEC0              inc al
000099AE  8804              mov [si],al
000099B0  C3                ret
000099B1  B8C09F            mov ax,0x9fc0
000099B4  8ED8              mov ds,ax
000099B6  C606000001        mov byte [0x0],0x1
000099BB  31C0              xor ax,ax
000099BD  8ED8              mov ds,ax
000099BF  C7060E04C09F      mov word [0x40e],0x9fc0
000099C5  C3                ret
000099C6  B011              mov al,0x11
000099C8  E620              out 0x20,al
000099CA  E6A0              out 0xa0,al
000099CC  B008              mov al,0x8
000099CE  E621              out 0x21,al
000099D0  B070              mov al,0x70
000099D2  E6A1              out 0xa1,al
000099D4  B004              mov al,0x4
000099D6  E621              out 0x21,al
000099D8  B002              mov al,0x2
000099DA  E6A1              out 0xa1,al
000099DC  B001              mov al,0x1
000099DE  E621              out 0x21,al
000099E0  E6A1              out 0xa1,al
000099E2  B0B8              mov al,0xb8
000099E4  E621              out 0x21,al
000099E6  B08F              mov al,0x8f
000099E8  E6A1              out 0xa1,al
000099EA  B020              mov al,0x20
000099EC  E6A0              out 0xa0,al
000099EE  B020              mov al,0x20
000099F0  E620              out 0x20,al
000099F2  31C0              xor ax,ax
000099F4  8ED8              mov ds,ax
000099F6  FF2E6704          jmp word far [0x467]
000099FA  31C0              xor ax,ax
000099FC  8ED8              mov ds,ax
000099FE  8B266704          mov sp,[0x467]
00009A02  8E166904          mov ss,[0x469]
00009A06  CF                iretw
00009A07  31C0              xor ax,ax
00009A09  8ED8              mov ds,ax
00009A0B  8B266704          mov sp,[0x467]
00009A0F  8E166904          mov ss,[0x469]
00009A13  CB                retf
00009A14  BCFE0F            mov sp,0xffe
00009A17  E83607            call word 0xa150
00009A1A  E8827D            call word 0x179f
00009A1D  B300              mov bl,0x0
00009A1F  21C0              and ax,ax
00009A21  7503              jnz 0x9a26
00009A23  E97D46            jmp word 0xe0a3
00009A26  E88877            call word 0x11b1
00009A29  B020              mov al,0x20
00009A2B  E6A0              out 0xa0,al
00009A2D  B020              mov al,0x20
00009A2F  E620              out 0x20,al
00009A31  C3                ret
00009A32  88C3              mov bl,al
00009A34  80E30F            and bl,0xf
00009A37  C0E804            shr al,byte 0x4
00009A3A  B70A              mov bh,0xa
00009A3C  F6E7              mul bh
00009A3E  00D8              add al,bl
00009A40  C3                ret
00009A41  6631C0            xor eax,eax
00009A44  B004              mov al,0x4
00009A46  E670              out 0x70,al
00009A48  E471              in al,0x71
00009A4A  E8E5FF            call word 0x9a32
00009A4D  666BC03C          imul eax,eax,byte +0x3c
00009A51  6689C2            mov edx,eax
00009A54  6631C0            xor eax,eax
00009A57  B002              mov al,0x2
00009A59  E670              out 0x70,al
00009A5B  E471              in al,0x71
00009A5D  E8D2FF            call word 0x9a32
00009A60  6601D0            add eax,edx
00009A63  666BC03C          imul eax,eax,byte +0x3c
00009A67  6689C2            mov edx,eax
00009A6A  6631C0            xor eax,eax
00009A6D  B000              mov al,0x0
00009A6F  E670              out 0x70,al
00009A71  E471              in al,0x71
00009A73  E8BCFF            call word 0x9a32
00009A76  6601D0            add eax,edx
00009A79  6689C1            mov ecx,eax
00009A7C  666BC912          imul ecx,ecx,byte +0x12
00009A80  66BAABAADD34      mov edx,0x34ddaaab
00009A86  66F7E2            mul edx
00009A89  6601D1            add ecx,edx
00009A8C  66890E6C04        mov [0x46c],ecx
00009A91  30C0              xor al,al
00009A93  A27004            mov [0x470],al
00009A96  C3                ret
00009A97  50                push ax
00009A98  1E                push ds
00009A99  B84000            mov ax,0x40
00009A9C  8ED8              mov ds,ax
00009A9E  C6068E00FF        mov byte [0x8e],0xff
00009AA3  E883FF            call word 0x9a29
00009AA6  B80091            mov ax,0x9100
00009AA9  CD15              int 0x15
00009AAB  1F                pop ds
00009AAC  58                pop ax
00009AAD  CF                iretw
00009AAE  50                push ax
00009AAF  53                push bx
00009AB0  89C3              mov bx,ax
00009AB2  2E678A07          mov al,[cs:edi]
00009AB6  3C00              cmp al,0x0
00009AB8  7404              jz 0x9abe
00009ABA  EE                out dx,al
00009ABB  43                inc bx
00009ABC  EBF4              jmp short 0x9ab2
00009ABE  5B                pop bx
00009ABF  58                pop ax
00009AC0  C3                ret
00009AC1  53                push bx
00009AC2  687574            push word 0x7475
00009AC5  646F              fs outsw
00009AC7  776E              ja 0x9b37
00009AC9  005375            add [bp+di+0x75],dl
00009ACC  7370              jnc 0x9b3e
00009ACE  656E              gs outsb
00009AD0  64005374          add [fs:bp+di+0x74],dl
00009AD4  61                popaw
00009AD5  6E                outsb
00009AD6  64627900          bound di,[fs:bx+di+0x0]
00009ADA  669C              pushfd
00009ADC  3C04              cmp al,0x4
00009ADE  7505              jnz 0x9ae5
00009AE0  E9A100            jmp word 0x9b84
00009AE3  0000              add [bx+si],al
00009AE5  3C05              cmp al,0x5
00009AE7  7507              jnz 0x9af0
00009AE9  FB                sti
00009AEA  F4                hlt
00009AEB  E99600            jmp word 0x9b84
00009AEE  0000              add [bx+si],al
00009AF0  3C07              cmp al,0x7
00009AF2  7552              jnz 0x9b46
00009AF4  6683FB01          cmp ebx,byte +0x1
00009AF8  7405              jz 0x9aff
00009AFA  E98700            jmp word 0x9b84
00009AFD  0000              add [bx+si],al
00009AFF  6683F903          cmp ecx,byte +0x3
00009B03  740E              jz 0x9b13
00009B05  6683F902          cmp ecx,byte +0x2
00009B09  7419              jz 0x9b24
00009B0B  6683F901          cmp ecx,byte +0x1
00009B0F  7424              jz 0x9b35
00009B11  7573              jnz 0x9b86
00009B13  FA                cli
00009B14  66BA008966B8      mov edx,0xb8668900
00009B1A  C19AE88DFF        rcr word [bp+si-0x7218],byte 0xff
00009B1F  FF                db 0xff
00009B20  FFF4              push sp
00009B22  EBFD              jmp short 0x9b21
00009B24  52                push dx
00009B25  66BA008966B8      mov edx,0xb8668900
00009B2B  CA9AE8            retf 0xe89a
00009B2E  7CFF              jl 0x9b2f
00009B30  FF                db 0xff
00009B31  FF5AEB            call word far [bp+si-0x15]
00009B34  51                push cx
00009B35  52                push dx
00009B36  66BA008966B8      mov edx,0xb8668900
00009B3C  D29AE86B          rcr byte [bp+si+0x6be8],cl
00009B40  FF                db 0xff
00009B41  FF                db 0xff
00009B42  FF5AEB            call word far [bp+si-0x15]
00009B45  40                inc ax
00009B46  3C08              cmp al,0x8
00009B48  7502              jnz 0x9b4c
00009B4A  EB3A              jmp short 0x9b86
00009B4C  3C0A              cmp al,0xa
00009B4E  7512              jnz 0x9b62
00009B50  B701              mov bh,0x1
00009B52  B3FF              mov bl,0xff
00009B54  B580              mov ch,0x80
00009B56  B1FF              mov cl,0xff
00009B58  66BAFFFF66BE      mov edx,0xbe66ffff
00009B5E  0000              add [bx+si],al
00009B60  EB24              jmp short 0x9b86
00009B62  3C0B              cmp al,0xb
00009B64  7504              jnz 0x9b6a
00009B66  B480              mov ah,0x80
00009B68  EB20              jmp short 0x9b8a
00009B6A  3C0E              cmp al,0xe
00009B6C  7506              jnz 0x9b74
00009B6E  B401              mov ah,0x1
00009B70  B002              mov al,0x2
00009B72  EB12              jmp short 0x9b86
00009B74  3C0F              cmp al,0xf
00009B76  7502              jnz 0x9b7a
00009B78  EB0C              jmp short 0x9b86
00009B7A  3C10              cmp al,0x10
00009B7C  750C              jnz 0x9b8a
00009B7E  B300              mov bl,0x0
00009B80  66B90000EB00      mov ecx,0xeb0000
00009B86  669D              popfd
00009B88  F8                clc
00009B89  CB                retf
00009B8A  669D              popfd
00009B8C  F9                stc
00009B8D  CB                retf
00009B8E  6650              push eax
00009B90  6653              push ebx
00009B92  6689C3            mov ebx,eax
00009B95  2E8A07            mov al,[cs:bx]
00009B98  3C00              cmp al,0x0
00009B9A  7405              jz 0x9ba1
00009B9C  EE                out dx,al
00009B9D  6643              inc ebx
00009B9F  EBF4              jmp short 0x9b95
00009BA1  665B              pop ebx
00009BA3  6658              pop eax
00009BA5  C3                ret
00009BA6  53                push bx
00009BA7  687574            push word 0x7475
00009BAA  646F              fs outsw
00009BAC  776E              ja 0x9c1c
00009BAE  005375            add [bp+di+0x75],dl
00009BB1  7370              jnc 0x9c23
00009BB3  656E              gs outsb
00009BB5  64005374          add [fs:bp+di+0x74],dl
00009BB9  61                popaw
00009BBA  6E                outsb
00009BBB  64627900          bound di,[fs:bx+di+0x0]
00009BBF  9C                pushfw
00009BC0  3C04              cmp al,0x4
00009BC2  7503              jnz 0x9bc7
00009BC4  E98B00            jmp word 0x9c52
00009BC7  3C05              cmp al,0x5
00009BC9  7505              jnz 0x9bd0
00009BCB  FB                sti
00009BCC  F4                hlt
00009BCD  E98200            jmp word 0x9c52
00009BD0  3C07              cmp al,0x7
00009BD2  7541              jnz 0x9c15
00009BD4  83FB01            cmp bx,byte +0x1
00009BD7  7579              jnz 0x9c52
00009BD9  83F903            cmp cx,byte +0x3
00009BDC  740C              jz 0x9bea
00009BDE  83F902            cmp cx,byte +0x2
00009BE1  7414              jz 0x9bf7
00009BE3  83F901            cmp cx,byte +0x1
00009BE6  741E              jz 0x9c06
00009BE8  7568              jnz 0x9c52
00009BEA  FA                cli
00009BEB  BA0089            mov dx,0x8900
00009BEE  B8A69B            mov ax,0x9ba6
00009BF1  E89AFF            call word 0x9b8e
00009BF4  F4                hlt
00009BF5  EBFD              jmp short 0x9bf4
00009BF7  6652              push edx
00009BF9  BA0089            mov dx,0x8900
00009BFC  B8AF9B            mov ax,0x9baf
00009BFF  E88CFF            call word 0x9b8e
00009C02  665A              pop edx
00009C04  EB4C              jmp short 0x9c52
00009C06  6652              push edx
00009C08  BA0089            mov dx,0x8900
00009C0B  B8B79B            mov ax,0x9bb7
00009C0E  E87DFF            call word 0x9b8e
00009C11  665A              pop edx
00009C13  EB3D              jmp short 0x9c52
00009C15  3C08              cmp al,0x8
00009C17  7502              jnz 0x9c1b
00009C19  EB37              jmp short 0x9c52
00009C1B  3C0A              cmp al,0xa
00009C1D  7510              jnz 0x9c2f
00009C1F  B701              mov bh,0x1
00009C21  B3FF              mov bl,0xff
00009C23  B580              mov ch,0x80
00009C25  B1FF              mov cl,0xff
00009C27  BAFFFF            mov dx,0xffff
00009C2A  BE0000            mov si,0x0
00009C2D  EB23              jmp short 0x9c52
00009C2F  3C0B              cmp al,0xb
00009C31  7504              jnz 0x9c37
00009C33  B480              mov ah,0x80
00009C35  EB1E              jmp short 0x9c55
00009C37  3C0E              cmp al,0xe
00009C39  7506              jnz 0x9c41
00009C3B  B401              mov ah,0x1
00009C3D  B002              mov al,0x2
00009C3F  EB11              jmp short 0x9c52
00009C41  3C0F              cmp al,0xf
00009C43  7502              jnz 0x9c47
00009C45  EB0B              jmp short 0x9c52
00009C47  3C10              cmp al,0x10
00009C49  750A              jnz 0x9c55
00009C4B  B300              mov bl,0x0
00009C4D  B90000            mov cx,0x0
00009C50  EB00              jmp short 0x9c52
00009C52  9D                popfw
00009C53  F8                clc
00009C54  CB                retf
00009C55  9D                popfw
00009C56  F9                stc
00009C57  CB                retf
00009C58  6650              push eax
00009C5A  6653              push ebx
00009C5C  6689C3            mov ebx,eax
00009C5F  2E8A07            mov al,[cs:bx]
00009C62  3C00              cmp al,0x0
00009C64  7405              jz 0x9c6b
00009C66  EE                out dx,al
00009C67  6643              inc ebx
00009C69  EBF4              jmp short 0x9c5f
00009C6B  665B              pop ebx
00009C6D  6658              pop eax
00009C6F  C3                ret
00009C70  53                push bx
00009C71  687574            push word 0x7475
00009C74  646F              fs outsw
00009C76  776E              ja 0x9ce6
00009C78  005375            add [bp+di+0x75],dl
00009C7B  7370              jnc 0x9ced
00009C7D  656E              gs outsb
00009C7F  64005374          add [fs:bp+di+0x74],dl
00009C83  61                popaw
00009C84  6E                outsb
00009C85  64627900          bound di,[fs:bx+di+0x0]
00009C89  9C                pushfw
00009C8A  3C00              cmp al,0x0
00009C8C  750E              jnz 0x9c9c
00009C8E  B401              mov ah,0x1
00009C90  B002              mov al,0x2
00009C92  B750              mov bh,0x50
00009C94  B34D              mov bl,0x4d
00009C96  B90300            mov cx,0x3
00009C99  E9CE00            jmp word 0x9d6a
00009C9C  3C01              cmp al,0x1
00009C9E  7503              jnz 0x9ca3
00009CA0  E9C700            jmp word 0x9d6a
00009CA3  3C02              cmp al,0x2
00009CA5  7512              jnz 0x9cb9
00009CA7  BBBF9B            mov bx,0x9bbf
00009CAA  B800F0            mov ax,0xf000
00009CAD  BEF0FF            mov si,0xfff0
00009CB0  B900F0            mov cx,0xf000
00009CB3  BFF0FF            mov di,0xfff0
00009CB6  E9B100            jmp word 0x9d6a
00009CB9  3C03              cmp al,0x3
00009CBB  751B              jnz 0x9cd8
00009CBD  B800F0            mov ax,0xf000
00009CC0  66BBDA9A0000      mov ebx,0x9ada
00009CC6  B900F0            mov cx,0xf000
00009CC9  66BEF0FFF0FF      mov esi,0xfff0fff0
00009CCF  BA00F0            mov dx,0xf000
00009CD2  BFF0FF            mov di,0xfff0
00009CD5  E99200            jmp word 0x9d6a
00009CD8  3C04              cmp al,0x4
00009CDA  7503              jnz 0x9cdf
00009CDC  E98B00            jmp word 0x9d6a
00009CDF  3C05              cmp al,0x5
00009CE1  7505              jnz 0x9ce8
00009CE3  FB                sti
00009CE4  F4                hlt
00009CE5  E98200            jmp word 0x9d6a
00009CE8  3C07              cmp al,0x7
00009CEA  7541              jnz 0x9d2d
00009CEC  83FB01            cmp bx,byte +0x1
00009CEF  7579              jnz 0x9d6a
00009CF1  83F903            cmp cx,byte +0x3
00009CF4  740C              jz 0x9d02
00009CF6  83F902            cmp cx,byte +0x2
00009CF9  7414              jz 0x9d0f
00009CFB  83F901            cmp cx,byte +0x1
00009CFE  741E              jz 0x9d1e
00009D00  7568              jnz 0x9d6a
00009D02  FA                cli
00009D03  BA0089            mov dx,0x8900
00009D06  B8709C            mov ax,0x9c70
00009D09  E84CFF            call word 0x9c58
00009D0C  F4                hlt
00009D0D  EBFD              jmp short 0x9d0c
00009D0F  6652              push edx
00009D11  BA0089            mov dx,0x8900
00009D14  B8799C            mov ax,0x9c79
00009D17  E83EFF            call word 0x9c58
00009D1A  665A              pop edx
00009D1C  EB4C              jmp short 0x9d6a
00009D1E  6652              push edx
00009D20  BA0089            mov dx,0x8900
00009D23  B8819C            mov ax,0x9c81
00009D26  E82FFF            call word 0x9c58
00009D29  665A              pop edx
00009D2B  EB3D              jmp short 0x9d6a
00009D2D  3C08              cmp al,0x8
00009D2F  7502              jnz 0x9d33
00009D31  EB37              jmp short 0x9d6a
00009D33  3C0A              cmp al,0xa
00009D35  7510              jnz 0x9d47
00009D37  B701              mov bh,0x1
00009D39  B3FF              mov bl,0xff
00009D3B  B580              mov ch,0x80
00009D3D  B1FF              mov cl,0xff
00009D3F  BAFFFF            mov dx,0xffff
00009D42  BE0000            mov si,0x0
00009D45  EB23              jmp short 0x9d6a
00009D47  3C0B              cmp al,0xb
00009D49  7504              jnz 0x9d4f
00009D4B  B480              mov ah,0x80
00009D4D  EB20              jmp short 0x9d6f
00009D4F  3C0E              cmp al,0xe
00009D51  7506              jnz 0x9d59
00009D53  B401              mov ah,0x1
00009D55  B002              mov al,0x2
00009D57  EB11              jmp short 0x9d6a
00009D59  3C0F              cmp al,0xf
00009D5B  7502              jnz 0x9d5f
00009D5D  EB0B              jmp short 0x9d6a
00009D5F  3C10              cmp al,0x10
00009D61  750C              jnz 0x9d6f
00009D63  B300              mov bl,0x0
00009D65  B90000            mov cx,0x0
00009D68  EB00              jmp short 0x9d6a
00009D6A  9D                popfw
00009D6B  F8                clc
00009D6C  E9BAF8            jmp word 0x9629
00009D6F  9D                popfw
00009D70  F9                stc
00009D71  E9B5F8            jmp word 0x9629
00009D74  0000              add [bx+si],al
00009D76  0000              add [bx+si],al
00009D78  0000              add [bx+si],al
00009D7A  0000              add [bx+si],al
00009D7C  0000              add [bx+si],al
00009D7E  0000              add [bx+si],al
00009D80  5F                pop di
00009D81  3332              xor si,[bp+si]
00009D83  5F                pop di
00009D84  90                nop
00009D85  9D                popfw
00009D86  0F0000            sldt [bx+si]
00009D89  01A00000          add [bx+si+0x0],sp
00009D8D  0000              add [bx+si],al
00009D8F  009C3D24          add [si+0x243d],bl
00009D93  50                push ax
00009D94  43                inc bx
00009D95  49                dec cx
00009D96  7530              jnz 0x9dc8
00009D98  B80000            mov ax,0x0
00009D9B  008066BA          add [bx+si-0x459a],al
00009D9F  F8                clc
00009DA0  0CEF              or al,0xef
00009DA2  66BAFC0CED3D      mov edx,0x3ded0cfc
00009DA8  86803712          xchg al,[bx+si+0x1237]
00009DAC  7407              jz 0x9db5
00009DAE  3D8680            cmp ax,0x8086
00009DB1  2201              and al,[bx+di]
00009DB3  7513              jnz 0x9dc8
00009DB5  BB0000            mov bx,0x0
00009DB8  0F                db 0x0f
00009DB9  00B90000          add [bx+di+0x0],bh
00009DBD  0100              add [bx+si],ax
00009DBF  BAD09D            mov dx,0x9dd0
00009DC2  0000              add [bx+si],al
00009DC4  30C0              xor al,al
00009DC6  EB02              jmp short 0x9dca
00009DC8  B080              mov al,0x80
00009DCA  9D                popfw
00009DCB  CB                retf
00009DCC  0000              add [bx+si],al
00009DCE  0000              add [bx+si],al
00009DD0  9C                pushfw
00009DD1  FA                cli
00009DD2  56                push si
00009DD3  57                push di
00009DD4  3C01              cmp al,0x1
00009DD6  7514              jnz 0x9dec
00009DD8  66BB100266B9      mov ebx,0xb9660210
00009DDE  0000              add [bx+si],al
00009DE0  BA5043            mov dx,0x4350
00009DE3  49                dec cx
00009DE4  20B001E9          and [bx+si-0x16ff],dh
00009DE8  1B01              sbb ax,[bx+di]
00009DEA  0000              add [bx+si],al
00009DEC  3C02              cmp al,0x2
00009DEE  7538              jnz 0x9e28
00009DF0  C1E110            shl cx,byte 0x10
00009DF3  6689D1            mov ecx,edx
00009DF6  6631DB            xor ebx,ebx
00009DF9  66BF0000E80C      mov edi,0xce80000
00009DFF  0100              add [bx+si],ax
00009E01  0066BA            add [bp-0x46],ah
00009E04  FC                cld
00009E05  0CED              or al,0xed
00009E07  39C8              cmp ax,cx
00009E09  750D              jnz 0x9e18
00009E0B  6683FE00          cmp esi,byte +0x0
00009E0F  7505              jnz 0x9e16
00009E11  E9F100            jmp word 0x9f05
00009E14  0000              add [bx+si],al
00009E16  664E              dec esi
00009E18  6643              inc ebx
00009E1A  6681FB000175DC    cmp ebx,0xdc750100
00009E21  B486              mov ah,0x86
00009E23  E9DA00            jmp word 0x9f00
00009E26  0000              add [bx+si],al
00009E28  3C03              cmp al,0x3
00009E2A  7535              jnz 0x9e61
00009E2C  6631DB            xor ebx,ebx
00009E2F  66BF0800E8D6      mov edi,0xd6e80008
00009E35  0000              add [bx+si],al
00009E37  0066BA            add [bp-0x46],ah
00009E3A  FC                cld
00009E3B  0CED              or al,0xed
00009E3D  C1E808            shr ax,byte 0x8
00009E40  39C8              cmp ax,cx
00009E42  750D              jnz 0x9e51
00009E44  6683FE00          cmp esi,byte +0x0
00009E48  7505              jnz 0x9e4f
00009E4A  E9B800            jmp word 0x9f05
00009E4D  0000              add [bx+si],al
00009E4F  664E              dec esi
00009E51  6643              inc ebx
00009E53  6681FB000175D9    cmp ebx,0xd9750100
00009E5A  B486              mov ah,0x86
00009E5C  E9A100            jmp word 0x9f00
00009E5F  0000              add [bx+si],al
00009E61  3C08              cmp al,0x8
00009E63  751B              jnz 0x9e80
00009E65  E8A400            call word 0x9f0c
00009E68  0000              add [bx+si],al
00009E6A  52                push dx
00009E6B  6689FA            mov edx,edi
00009E6E  6683E203          and edx,byte +0x3
00009E72  6681C2FC0CEC5A    add edx,0x5aec0cfc
00009E79  88C1              mov cl,al
00009E7B  E98700            jmp word 0x9f05
00009E7E  0000              add [bx+si],al
00009E80  3C09              cmp al,0x9
00009E82  751A              jnz 0x9e9e
00009E84  E88500            call word 0x9f0c
00009E87  0000              add [bx+si],al
00009E89  52                push dx
00009E8A  6689FA            mov edx,edi
00009E8D  6683E202          and edx,byte +0x2
00009E91  6681C2FC0C66ED    add edx,0xed660cfc
00009E98  5A                pop dx
00009E99  6689C1            mov ecx,eax
00009E9C  EB69              jmp short 0x9f07
00009E9E  3C0A              cmp al,0xa
00009EA0  7510              jnz 0x9eb2
00009EA2  E86700            call word 0x9f0c
00009EA5  0000              add [bx+si],al
00009EA7  52                push dx
00009EA8  66BAFC0CED5A      mov edx,0x5aed0cfc
00009EAE  89C1              mov cx,ax
00009EB0  EB55              jmp short 0x9f07
00009EB2  3C0B              cmp al,0xb
00009EB4  7518              jnz 0x9ece
00009EB6  E85300            call word 0x9f0c
00009EB9  0000              add [bx+si],al
00009EBB  52                push dx
00009EBC  6689FA            mov edx,edi
00009EBF  6683E203          and edx,byte +0x3
00009EC3  6681C2FC0C88C8    add edx,0xc8880cfc
00009ECA  EE                out dx,al
00009ECB  5A                pop dx
00009ECC  EB39              jmp short 0x9f07
00009ECE  3C0C              cmp al,0xc
00009ED0  751A              jnz 0x9eec
00009ED2  E83700            call word 0x9f0c
00009ED5  0000              add [bx+si],al
00009ED7  52                push dx
00009ED8  6689FA            mov edx,edi
00009EDB  6683E202          and edx,byte +0x2
00009EDF  6681C2FC0C6689    add edx,0x89660cfc
00009EE6  C866EF5A          enter 0xef66,0x5a
00009EEA  EB1B              jmp short 0x9f07
00009EEC  3C0D              cmp al,0xd
00009EEE  7510              jnz 0x9f00
00009EF0  E81900            call word 0x9f0c
00009EF3  0000              add [bx+si],al
00009EF5  52                push dx
00009EF6  66BAFC0C89C8      mov edx,0xc8890cfc
00009EFC  EF                out dx,ax
00009EFD  5A                pop dx
00009EFE  EB07              jmp short 0x9f07
00009F00  B481              mov ah,0x81
00009F02  5F                pop di
00009F03  5E                pop si
00009F04  9D                popfw
00009F05  F9                stc
00009F06  CB                retf
00009F07  30E4              xor ah,ah
00009F09  5F                pop di
00009F0A  5E                pop si
00009F0B  9D                popfw
00009F0C  F8                clc
00009F0D  CB                retf
00009F0E  52                push dx
00009F0F  B80000            mov ax,0x0
00009F12  800066            add byte [bx+si],0x66
00009F15  89D8              mov ax,bx
00009F17  C1E008            shl ax,byte 0x8
00009F1A  6681E7FF006609    and edi,0x96600ff
00009F21  F8                clc
00009F22  24FC              and al,0xfc
00009F24  66BAF80CEF5A      mov edx,0x5aef0cf8
00009F2A  C3                ret
00009F2B  6650              push eax
00009F2D  52                push dx
00009F2E  66B800000080      mov eax,0x80000000
00009F34  BAF80C            mov dx,0xcf8
00009F37  66EF              out dx,eax
00009F39  BAFC0C            mov dx,0xcfc
00009F3C  66ED              in eax,dx
00009F3E  663D86803712      cmp eax,0x12378086
00009F44  740F              jz 0x9f55
00009F46  663D86802201      cmp eax,0x1228086
00009F4C  7407              jz 0x9f55
00009F4E  5A                pop dx
00009F4F  6658              pop eax
00009F51  B4FF              mov ah,0xff
00009F53  F9                stc
00009F54  C3                ret
00009F55  5A                pop dx
00009F56  6658              pop eax
00009F58  3C01              cmp al,0x1
00009F5A  751A              jnz 0x9f76
00009F5C  B80100            mov ax,0x1
00009F5F  BB1002            mov bx,0x210
00009F62  B90000            mov cx,0x0
00009F65  66BA50434920      mov edx,0x20494350
00009F6B  66BF00000F00      mov edi,0xf0000
00009F71  BFD09D            mov di,0x9dd0
00009F74  F8                clc
00009F75  C3                ret
00009F76  6656              push esi
00009F78  6657              push edi
00009F7A  3C02              cmp al,0x2
00009F7C  7534              jnz 0x9fb2
00009F7E  66C1E110          shl ecx,byte 0x10
00009F82  89D1              mov cx,dx
00009F84  31DB              xor bx,bx
00009F86  BF0000            mov di,0x0
00009F89  E81E01            call word 0xa0aa
00009F8C  BAFC0C            mov dx,0xcfc
00009F8F  66ED              in eax,dx
00009F91  6639C8            cmp eax,ecx
00009F94  7509              jnz 0x9f9f
00009F96  83FE00            cmp si,byte +0x0
00009F99  7503              jnz 0x9f9e
00009F9B  E90401            jmp word 0xa0a2
00009F9E  4E                dec si
00009F9F  43                inc bx
00009FA0  81FB0001          cmp bx,0x100
00009FA4  75E3              jnz 0x9f89
00009FA6  89CA              mov dx,cx
00009FA8  66C1E910          shr ecx,byte 0x10
00009FAC  B80286            mov ax,0x8602
00009FAF  E9EA00            jmp word 0xa09c
00009FB2  3C03              cmp al,0x3
00009FB4  7532              jnz 0x9fe8
00009FB6  31DB              xor bx,bx
00009FB8  BF0800            mov di,0x8
00009FBB  E8EC00            call word 0xa0aa
00009FBE  BAFC0C            mov dx,0xcfc
00009FC1  66ED              in eax,dx
00009FC3  66C1E808          shr eax,byte 0x8
00009FC7  6639C8            cmp eax,ecx
00009FCA  7509              jnz 0x9fd5
00009FCC  83FE00            cmp si,byte +0x0
00009FCF  7503              jnz 0x9fd4
00009FD1  E9CE00            jmp word 0xa0a2
00009FD4  4E                dec si
00009FD5  43                inc bx
00009FD6  81FB0001          cmp bx,0x100
00009FDA  75DF              jnz 0x9fbb
00009FDC  89CA              mov dx,cx
00009FDE  66C1E910          shr ecx,byte 0x10
00009FE2  B80386            mov ax,0x8603
00009FE5  E9B400            jmp word 0xa09c
00009FE8  3C08              cmp al,0x8
00009FEA  7514              jnz 0xa000
00009FEC  E8BB00            call word 0xa0aa
00009FEF  52                push dx
00009FF0  89FA              mov dx,di
00009FF2  83E203            and dx,byte +0x3
00009FF5  81C2FC0C          add dx,0xcfc
00009FF9  EC                in al,dx
00009FFA  5A                pop dx
00009FFB  88C1              mov cl,al
00009FFD  E9A200            jmp word 0xa0a2
0000A000  3C09              cmp al,0x9
0000A002  7514              jnz 0xa018
0000A004  E8A300            call word 0xa0aa
0000A007  52                push dx
0000A008  89FA              mov dx,di
0000A00A  83E202            and dx,byte +0x2
0000A00D  81C2FC0C          add dx,0xcfc
0000A011  ED                in ax,dx
0000A012  5A                pop dx
0000A013  89C1              mov cx,ax
0000A015  E98A00            jmp word 0xa0a2
0000A018  3C0A              cmp al,0xa
0000A01A  750F              jnz 0xa02b
0000A01C  E88B00            call word 0xa0aa
0000A01F  52                push dx
0000A020  BAFC0C            mov dx,0xcfc
0000A023  66ED              in eax,dx
0000A025  5A                pop dx
0000A026  6689C1            mov ecx,eax
0000A029  EB77              jmp short 0xa0a2
0000A02B  3C0B              cmp al,0xb
0000A02D  7513              jnz 0xa042
0000A02F  E87800            call word 0xa0aa
0000A032  52                push dx
0000A033  89FA              mov dx,di
0000A035  83E203            and dx,byte +0x3
0000A038  81C2FC0C          add dx,0xcfc
0000A03C  88C8              mov al,cl
0000A03E  EE                out dx,al
0000A03F  5A                pop dx
0000A040  EB60              jmp short 0xa0a2
0000A042  3C0C              cmp al,0xc
0000A044  7513              jnz 0xa059
0000A046  E86100            call word 0xa0aa
0000A049  52                push dx
0000A04A  89FA              mov dx,di
0000A04C  83E202            and dx,byte +0x2
0000A04F  81C2FC0C          add dx,0xcfc
0000A053  89C8              mov ax,cx
0000A055  EF                out dx,ax
0000A056  5A                pop dx
0000A057  EB49              jmp short 0xa0a2
0000A059  3C0D              cmp al,0xd
0000A05B  750F              jnz 0xa06c
0000A05D  E84A00            call word 0xa0aa
0000A060  52                push dx
0000A061  BAFC0C            mov dx,0xcfc
0000A064  6689C8            mov eax,ecx
0000A067  66EF              out dx,eax
0000A069  5A                pop dx
0000A06A  EB36              jmp short 0xa0a2
0000A06C  3C0E              cmp al,0xe
0000A06E  752A              jnz 0xa09a
0000A070  50                push ax
0000A071  B86000            mov ax,0x60
0000A074  263905            cmp [es:di],ax
0000A077  721B              jc 0xa094
0000A079  AB                stosw
0000A07A  9C                pushfw
0000A07B  06                push es
0000A07C  51                push cx
0000A07D  FC                cld
0000A07E  BEF0A0            mov si,0xa0f0
0000A081  0E                push cs
0000A082  1F                pop ds
0000A083  26C47D02          les di,[es:di+0x2]
0000A087  89C1              mov cx,ax
0000A089  F3A4              rep movsb
0000A08B  59                pop cx
0000A08C  07                pop es
0000A08D  9D                popfw
0000A08E  58                pop ax
0000A08F  BB000A            mov bx,0xa00
0000A092  EB0E              jmp short 0xa0a2
0000A094  AB                stosw
0000A095  58                pop ax
0000A096  B489              mov ah,0x89
0000A098  EB02              jmp short 0xa09c
0000A09A  B481              mov ah,0x81
0000A09C  665F              pop edi
0000A09E  665E              pop esi
0000A0A0  F9                stc
0000A0A1  C3                ret
0000A0A2  30E4              xor ah,ah
0000A0A4  665F              pop edi
0000A0A6  665E              pop esi
0000A0A8  F8                clc
0000A0A9  C3                ret
0000A0AA  52                push dx
0000A0AB  66B800008000      mov eax,0x800000
0000A0B1  89D8              mov ax,bx
0000A0B3  66C1E008          shl eax,byte 0x8
0000A0B7  81E7FF00          and di,0xff
0000A0BB  09F8              or ax,di
0000A0BD  24FC              and al,0xfc
0000A0BF  BAF80C            mov dx,0xcf8
0000A0C2  66EF              out dx,eax
0000A0C4  5A                pop dx
0000A0C5  C3                ret
0000A0C6  0000              add [bx+si],al
0000A0C8  0000              add [bx+si],al
0000A0CA  0000              add [bx+si],al
0000A0CC  0000              add [bx+si],al
0000A0CE  0000              add [bx+si],al
0000A0D0  2450              and al,0x50
0000A0D2  49                dec cx
0000A0D3  52                push dx
0000A0D4  0001              add [bx+di],al
0000A0D6  800000            add byte [bx+si],0x0
0000A0D9  0800              or [bx+si],al
0000A0DB  0086802E          add [bp+0x2e80],al
0000A0DF  1200              adc al,[bx+si]
0000A0E1  0000              add [bx+si],al
0000A0E3  0000              add [bx+si],al
0000A0E5  0000              add [bx+si],al
0000A0E7  0000              add [bx+si],al
0000A0E9  0000              add [bx+si],al
0000A0EB  0000              add [bx+si],al
0000A0ED  0000              add [bx+si],al
0000A0EF  37                aaa
0000A0F0  0008              add [bx+si],cl
0000A0F2  60                pushaw
0000A0F3  F8                clc
0000A0F4  DE61F8            fisub word [bx+di-0x8]
0000A0F7  DE62F8            fisub word [bp+si-0x8]
0000A0FA  DE63F8            fisub word [bp+di-0x8]
0000A0FD  DE00              fiadd word [bx+si]
0000A0FF  0000              add [bx+si],al
0000A101  1061F8            adc [bx+di-0x8],ah
0000A104  DE62F8            fisub word [bp+si-0x8]
0000A107  DE63F8            fisub word [bp+di-0x8]
0000A10A  DE60F8            fisub word [bx+si-0x8]
0000A10D  DE01              fiadd word [bx+di]
0000A10F  0000              add [bx+si],al
0000A111  1862F8            sbb [bp+si-0x8],ah
0000A114  DE63F8            fisub word [bp+di-0x8]
0000A117  DE60F8            fisub word [bx+si-0x8]
0000A11A  DE61F8            fisub word [bx+di-0x8]
0000A11D  DE02              fiadd word [bp+si]
0000A11F  0000              add [bx+si],al
0000A121  2063F8            and [bp+di-0x8],ah
0000A124  DE60F8            fisub word [bx+si-0x8]
0000A127  DE61F8            fisub word [bx+di-0x8]
0000A12A  DE62F8            fisub word [bp+si-0x8]
0000A12D  DE03              fiadd word [bp+di]
0000A12F  0000              add [bx+si],al
0000A131  2860F8            sub [bx+si-0x8],ah
0000A134  DE61F8            fisub word [bx+di-0x8]
0000A137  DE62F8            fisub word [bp+si-0x8]
0000A13A  DE63F8            fisub word [bp+di-0x8]
0000A13D  DE04              fiadd word [si]
0000A13F  0000              add [bx+si],al
0000A141  3061F8            xor [bx+di-0x8],ah
0000A144  DE62F8            fisub word [bp+si-0x8]
0000A147  DE63F8            fisub word [bp+di-0x8]
0000A14A  DE60F8            fisub word [bx+si-0x8]
0000A14D  DE05              fiadd word [di]
0000A14F  00E4              add ah,ah
0000A151  92                xchg ax,dx
0000A152  50                push ax
0000A153  0C02              or al,0x2
0000A155  E692              out 0x92,al
0000A157  31C0              xor ax,ax
0000A159  8ED8              mov ds,ax
0000A15B  8C166904          mov [0x469],ss
0000A15F  89266704          mov [0x467],sp
0000A163  2E0F011E8CF8      lidt [cs:0xf88c]
0000A169  2E0F0116F1A1      lgdt [cs:0xa1f1]
0000A16F  0F20C0            mov eax,cr0
0000A172  0C01              or al,0x1
0000A174  0F22C0            mov cr0,eax
0000A177  66EA7FA10F001000  jmp dword 0x10:0xfa17f
0000A17F  B81800            mov ax,0x18
0000A182  0000              add [bx+si],al
0000A184  8ED8              mov ds,ax
0000A186  8EC0              mov es,ax
0000A188  8ED0              mov ss,ax
0000A18A  31C0              xor ax,ax
0000A18C  8EE0              mov fs,ax
0000A18E  8EE8              mov gs,ax
0000A190  FC                cld
0000A191  6766A10E04C1E0    mov eax,[dword 0xe0c1040e]
0000A198  04BC              add al,0xbc
0000A19A  F0                lock
0000A19B  FF                db 0xff
0000A19C  FF                db 0xff
0000A19D  FF01              inc word [bx+di]
0000A19F  C468B0            les bp,[bx+si-0x50]
0000A1A2  0400              add al,0x0
0000A1A4  0068B2            add [bx+si-0x4e],ch
0000A1A7  0400              add al,0x0
0000A1A9  00B80000          add [bx+si+0x0],bh
0000A1AD  0E                push cs
0000A1AE  00FF              add bh,bh
0000A1B0  D0EA              shr dl,1
0000A1B2  B8A100            mov ax,0xa1
0000A1B5  0020              add [bx+si],ah
0000A1B7  00B82800          add [bx+si+0x28],bh
0000A1BB  8ED8              mov ds,ax
0000A1BD  8EC0              mov es,ax
0000A1BF  8ED0              mov ss,ax
0000A1C1  8EE0              mov fs,ax
0000A1C3  8EE8              mov gs,ax
0000A1C5  0F20C0            mov eax,cr0
0000A1C8  24FE              and al,0xfe
0000A1CA  0F22C0            mov cr0,eax
0000A1CD  EAD2A100F0        jmp word 0xf000:0xa1d2
0000A1D2  2E0F011E92F8      lidt [cs:0xf892]
0000A1D8  31C0              xor ax,ax
0000A1DA  8ED8              mov ds,ax
0000A1DC  8EC0              mov es,ax
0000A1DE  8EE0              mov fs,ax
0000A1E0  8EE8              mov gs,ax
0000A1E2  8E166904          mov ss,[0x469]
0000A1E6  6631E4            xor esp,esp
0000A1E9  8B266704          mov sp,[0x467]
0000A1ED  58                pop ax
0000A1EE  E692              out 0x92,al
0000A1F0  C3                ret
0000A1F1  3000              xor [bx+si],al
0000A1F3  F7A10F00          mul word [bx+di+0xf]
0000A1F7  0000              add [bx+si],al
0000A1F9  0000              add [bx+si],al
0000A1FB  0000              add [bx+si],al
0000A1FD  0000              add [bx+si],al
0000A1FF  0000              add [bx+si],al
0000A201  0000              add [bx+si],al
0000A203  0000              add [bx+si],al
0000A205  0000              add [bx+si],al
0000A207  FF                db 0xff
0000A208  FF00              inc word [bx+si]
0000A20A  0000              add [bx+si],al
0000A20C  9BCF              wait iretw
0000A20E  00FF              add bh,bh
0000A210  FF00              inc word [bx+si]
0000A212  0000              add [bx+si],al
0000A214  93                xchg ax,bx
0000A215  CF                iretw
0000A216  00FF              add bh,bh
0000A218  FF00              inc word [bx+si]
0000A21A  000F              add [bx],cl
0000A21C  9B0000            wait add [bx+si],al
0000A21F  FF                db 0xff
0000A220  FF00              inc word [bx+si]
0000A222  0000              add [bx+si],al
0000A224  93                xchg ax,bx
0000A225  0000              add [bx+si],al
0000A227  52                push dx
0000A228  83C202            add dx,byte +0x2
0000A22B  EC                in al,dx
0000A22C  24DF              and al,0xdf
0000A22E  EE                out dx,al
0000A22F  5A                pop dx
0000A230  B0AA              mov al,0xaa
0000A232  EE                out dx,al
0000A233  EC                in al,dx
0000A234  3CAA              cmp al,0xaa
0000A236  750D              jnz 0xa245
0000A238  53                push bx
0000A239  D1E3              shl bx,1
0000A23B  89970804          mov [bx+0x408],dx
0000A23F  5B                pop bx
0000A240  888F7804          mov [bx+0x478],cl
0000A244  43                inc bx
0000A245  C3                ret
0000A246  52                push dx
0000A247  42                inc dx
0000A248  B002              mov al,0x2
0000A24A  EE                out dx,al
0000A24B  EC                in al,dx
0000A24C  3C02              cmp al,0x2
0000A24E  7519              jnz 0xa269
0000A250  42                inc dx
0000A251  EC                in al,dx
0000A252  3C02              cmp al,0x2
0000A254  7513              jnz 0xa269
0000A256  4A                dec dx
0000A257  30C0              xor al,al
0000A259  EE                out dx,al
0000A25A  5A                pop dx
0000A25B  53                push bx
0000A25C  D1E3              shl bx,1
0000A25E  89970004          mov [bx+0x400],dx
0000A262  5B                pop bx
0000A263  888F7C04          mov [bx+0x47c],cl
0000A267  43                inc bx
0000A268  C3                ret
0000A269  5A                pop dx
0000A26A  C3                ret
0000A26B  60                pushaw
0000A26C  1E                push ds
0000A26D  31C0              xor ax,ax
0000A26F  31DB              xor bx,bx
0000A271  31C9              xor cx,cx
0000A273  31D2              xor dx,dx
0000A275  8A2E0200          mov ch,[0x2]
0000A279  D1E1              shl cx,1
0000A27B  7305              jnc 0xa282
0000A27D  7403              jz 0xa282
0000A27F  87CA              xchg cx,dx
0000A281  49                dec cx
0000A282  0207              add al,[bx]
0000A284  43                inc bx
0000A285  E2FB              loop 0xa282
0000A287  85D2              test dx,dx
0000A289  7411              jz 0xa29c
0000A28B  0207              add al,[bx]
0000A28D  89D1              mov cx,dx
0000A28F  8CDA              mov dx,ds
0000A291  80C610            add dh,0x10
0000A294  8EDA              mov ds,dx
0000A296  31D2              xor dx,dx
0000A298  31DB              xor bx,bx
0000A29A  EBE6              jmp short 0xa282
0000A29C  24FF              and al,0xff
0000A29E  1F                pop ds
0000A29F  61                popaw
0000A2A0  C3                ret
0000A2A1  0000              add [bx+si],al
0000A2A3  0000              add [bx+si],al
0000A2A5  0000              add [bx+si],al
0000A2A7  0000              add [bx+si],al
0000A2A9  0000              add [bx+si],al
0000A2AB  0000              add [bx+si],al
0000A2AD  0000              add [bx+si],al
0000A2AF  0024              add [si],ah
0000A2B1  50                push ax
0000A2B2  6E                outsb
0000A2B3  50                push ax
0000A2B4  1021              adc [bx+di],ah
0000A2B6  0000              add [bx+si],al
0000A2B8  A30000            mov [0x0],ax
0000A2BB  0F00D8            ltr ax
0000A2BE  A200F0            mov [0xf000],al
0000A2C1  D1A20000          shl word [bp+si+0x0],1
0000A2C5  0F0000            sldt [bx+si]
0000A2C8  0000              add [bx+si],al
0000A2CA  0000              add [bx+si],al
0000A2CC  F00000            lock add [bx+si],al
0000A2CF  0F006655          verr [bp+0x55]
0000A2D3  6689E5            mov ebp,esp
0000A2D6  EB06              jmp short 0xa2de
0000A2D8  6655              push ebp
0000A2DA  660FB7EC          movzx ebp,sp
0000A2DE  678B4508          mov ax,[ebp+0x8]
0000A2E2  3D6000            cmp ax,0x60
0000A2E5  750F              jnz 0xa2f6
0000A2E7  06                push es
0000A2E8  57                push di
0000A2E9  C47E0A            les di,[bp+0xa]
0000A2EC  B80101            mov ax,0x101
0000A2EF  AB                stosw
0000A2F0  5F                pop di
0000A2F1  07                pop es
0000A2F2  31C0              xor ax,ax
0000A2F4  EB03              jmp short 0xa2f9
0000A2F6  B88200            mov ax,0x82
0000A2F9  665D              pop ebp
0000A2FB  CB                retf
0000A2FC  50                push ax
0000A2FD  8ED9              mov ds,cx
0000A2FF  B80400            mov ax,0x4
0000A302  813E000055AA      cmp word [0x0],0xaa55
0000A308  7403              jz 0xa30d
0000A30A  E99E00            jmp word 0xa3ab
0000A30D  E85BFF            call word 0xa26b
0000A310  7403              jz 0xa315
0000A312  E99600            jmp word 0xa3ab
0000A315  A00200            mov al,[0x2]
0000A318  A803              test al,0x3
0000A31A  7404              jz 0xa320
0000A31C  24FC              and al,0xfc
0000A31E  0404              add al,0x4
0000A320  31DB              xor bx,bx
0000A322  8EDB              mov ds,bx
0000A324  50                push ax
0000A325  57                push di
0000A326  51                push cx
0000A327  6A03              push byte +0x3
0000A329  B800F0            mov ax,0xf000
0000A32C  8EC0              mov es,ax
0000A32E  8D3EB0A2          lea di,[0xa2b0]
0000A332  89E5              mov bp,sp
0000A334  FF5E00            call word far [bp+0x0]
0000A337  FA                cli
0000A338  83C402            add sp,byte +0x2
0000A33B  59                pop cx
0000A33C  8ED9              mov ds,cx
0000A33E  8B1E1A00          mov bx,[0x1a]
0000A342  8B07              mov ax,[bx]
0000A344  3D2450            cmp ax,0x5024
0000A347  7560              jnz 0xa3a9
0000A349  8B4702            mov ax,[bx+0x2]
0000A34C  3D6E50            cmp ax,0x506e
0000A34F  7558              jnz 0xa3a9
0000A351  8B4716            mov ax,[bx+0x16]
0000A354  3D0000            cmp ax,0x0
0000A357  7417              jz 0xa370
0000A359  51                push cx
0000A35A  50                push ax
0000A35B  BB00F0            mov bx,0xf000
0000A35E  8EC3              mov es,bx
0000A360  8D3EB0A2          lea di,[0xa2b0]
0000A364  89E5              mov bp,sp
0000A366  FF5E00            call word far [bp+0x0]
0000A369  FA                cli
0000A36A  83C402            add sp,byte +0x2
0000A36D  59                pop cx
0000A36E  EB39              jmp short 0xa3a9
0000A370  8B471A            mov ax,[bx+0x1a]
0000A373  3D0000            cmp ax,0x0
0000A376  7431              jz 0xa3a9
0000A378  8B7F10            mov di,[bx+0x10]
0000A37B  BBF09F            mov bx,0x9ff0
0000A37E  8EDB              mov ds,bx
0000A380  8B1E8000          mov bx,[0x80]
0000A384  83FB08            cmp bx,byte +0x8
0000A387  7420              jz 0xa3a9
0000A389  C1E304            shl bx,byte 0x4
0000A38C  C7078000          mov word [bx],0x80
0000A390  894F06            mov [bx+0x6],cx
0000A393  894704            mov [bx+0x4],ax
0000A396  83FF00            cmp di,byte +0x0
0000A399  7406              jz 0xa3a1
0000A39B  894F0A            mov [bx+0xa],cx
0000A39E  897F08            mov [bx+0x8],di
0000A3A1  C1EB04            shr bx,byte 0x4
0000A3A4  43                inc bx
0000A3A5  891E8000          mov [0x80],bx
0000A3A9  5F                pop di
0000A3AA  58                pop ax
0000A3AB  C1E005            shl ax,byte 0x5
0000A3AE  01C1              add cx,ax
0000A3B0  58                pop ax
0000A3B1  39C1              cmp cx,ax
0000A3B3  7703              ja 0xa3b8
0000A3B5  E944FF            jmp word 0xa2fc
0000A3B8  31C0              xor ax,ax
0000A3BA  8ED8              mov ds,ax
0000A3BC  C3                ret
0000A3BD  B011              mov al,0x11
0000A3BF  E620              out 0x20,al
0000A3C1  E6A0              out 0xa0,al
0000A3C3  B008              mov al,0x8
0000A3C5  E621              out 0x21,al
0000A3C7  B070              mov al,0x70
0000A3C9  E6A1              out 0xa1,al
0000A3CB  B004              mov al,0x4
0000A3CD  E621              out 0x21,al
0000A3CF  B002              mov al,0x2
0000A3D1  E6A1              out 0xa1,al
0000A3D3  B001              mov al,0x1
0000A3D5  E621              out 0x21,al
0000A3D7  E6A1              out 0xa1,al
0000A3D9  B0B8              mov al,0xb8
0000A3DB  E621              out 0x21,al
0000A3DD  B08F              mov al,0x8f
0000A3DF  E6A1              out 0xa1,al
0000A3E1  C3                ret
0000A3E2  31FF              xor di,di
0000A3E4  B97800            mov cx,0x78
0000A3E7  B800F0            mov ax,0xf000
0000A3EA  66C1E010          shl eax,byte 0x10
0000A3EE  B853FF            mov ax,0xff53
0000A3F1  FC                cld
0000A3F2  F366AB            rep stosd
0000A3F5  BB2000            mov bx,0x20
0000A3F8  B108              mov cl,0x8
0000A3FA  B8E6E9            mov ax,0xe9e6
0000A3FD  8907              mov [bx],ax
0000A3FF  83C304            add bx,byte +0x4
0000A402  E2F9              loop 0xa3fd
0000A404  81C38001          add bx,0x180
0000A408  B108              mov cl,0x8
0000A40A  B8ECE9            mov ax,0xe9ec
0000A40D  8907              mov [bx],ax
0000A40F  83C304            add bx,byte +0x4
0000A412  E2F9              loop 0xa40d
0000A414  B8D2EF            mov ax,0xefd2
0000A417  A35C00            mov [0x5c],ax
0000A41A  B800F0            mov ax,0xf000
0000A41D  A35E00            mov [0x5e],ax
0000A420  B8D296            mov ax,0x96d2
0000A423  A36000            mov [0x60],ax
0000A426  B800F0            mov ax,0xf000
0000A429  A36200            mov [0x62],ax
0000A42C  B8F2E6            mov ax,0xe6f2
0000A42F  A36400            mov [0x64],ax
0000A432  B800F0            mov ax,0xf000
0000A435  A36600            mov [0x66],ax
0000A438  B841F8            mov ax,0xf841
0000A43B  A34800            mov [0x48],ax
0000A43E  B800F0            mov ax,0xf000
0000A441  A34A00            mov [0x4a],ax
0000A444  B84DF8            mov ax,0xf84d
0000A447  A34400            mov [0x44],ax
0000A44A  B800F0            mov ax,0xf000
0000A44D  A34600            mov [0x46],ax
0000A450  B859F8            mov ax,0xf859
0000A453  A35400            mov [0x54],ax
0000A456  B800F0            mov ax,0xf000
0000A459  A35600            mov [0x56],ax
0000A45C  B80000            mov ax,0x0
0000A45F  A37400            mov [0x74],ax
0000A462  B80000            mov ax,0x0
0000A465  A37600            mov [0x76],ax
0000A468  B80000            mov ax,0x0
0000A46B  A37C00            mov [0x7c],ax
0000A46E  B80000            mov ax,0x0
0000A471  A37E00            mov [0x7e],ax
0000A474  31C0              xor ax,ax
0000A476  B91000            mov cx,0x10
0000A479  BF8001            mov di,0x180
0000A47C  FC                cld
0000A47D  F3AB              rep stosw
0000A47F  6631C0            xor eax,eax
0000A482  B188              mov cl,0x88
0000A484  BFE001            mov di,0x1e0
0000A487  F366AB            rep stosd
0000A48A  C3                ret
0000A48B  0000              add [bx+si],al
0000A48D  0000              add [bx+si],al
0000A48F  004244            add [bp+si+0x44],al
0000A492  FB                sti
0000A493  AA                stosb
0000A494  682700            push word 0x27
0000A497  0000              add [bx+si],al
0000A499  0000              add [bx+si],al
0000A49B  0000              add [bx+si],al
0000A49D  0000              add [bx+si],al
0000A49F  0000              add [bx+si],al
0000A4A1  0000              add [bx+si],al
0000A4A3  0000              add [bx+si],al
0000A4A5  0000              add [bx+si],al
0000A4A7  0000              add [bx+si],al
0000A4A9  0000              add [bx+si],al
0000A4AB  0000              add [bx+si],al
0000A4AD  0000              add [bx+si],al
0000A4AF  0000              add [bx+si],al
0000A4B1  0000              add [bx+si],al
0000A4B3  0000              add [bx+si],al
0000A4B5  0000              add [bx+si],al
0000A4B7  0000              add [bx+si],al
0000A4B9  0000              add [bx+si],al
0000A4BB  0000              add [bx+si],al
0000A4BD  0000              add [bx+si],al
0000A4BF  0000              add [bx+si],al
0000A4C1  0000              add [bx+si],al
0000A4C3  0000              add [bx+si],al
0000A4C5  0000              add [bx+si],al
0000A4C7  0000              add [bx+si],al
0000A4C9  0000              add [bx+si],al
0000A4CB  0000              add [bx+si],al
0000A4CD  0000              add [bx+si],al
0000A4CF  0000              add [bx+si],al
0000A4D1  0000              add [bx+si],al
0000A4D3  0000              add [bx+si],al
0000A4D5  0000              add [bx+si],al
0000A4D7  0000              add [bx+si],al
0000A4D9  0000              add [bx+si],al
0000A4DB  0000              add [bx+si],al
0000A4DD  0000              add [bx+si],al
0000A4DF  0000              add [bx+si],al
0000A4E1  0000              add [bx+si],al
0000A4E3  0000              add [bx+si],al
0000A4E5  0000              add [bx+si],al
0000A4E7  0000              add [bx+si],al
0000A4E9  0000              add [bx+si],al
0000A4EB  0000              add [bx+si],al
0000A4ED  0000              add [bx+si],al
0000A4EF  0000              add [bx+si],al
0000A4F1  0000              add [bx+si],al
0000A4F3  0000              add [bx+si],al
0000A4F5  0000              add [bx+si],al
0000A4F7  0000              add [bx+si],al
0000A4F9  0000              add [bx+si],al
0000A4FB  0000              add [bx+si],al
0000A4FD  0000              add [bx+si],al
0000A4FF  00                db 0x00
