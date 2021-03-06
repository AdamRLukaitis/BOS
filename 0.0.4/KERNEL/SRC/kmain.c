#include <BOSBOOT.h>
#include <i386/memory/physical.h>
#include <i386/cpu/i686.h>
#include <taskmanagement.h>

int kmain(BootInfo_p BOOTINF);

int kmain(BootInfo_p BOOTINF)
{
#ifdef DEBUG
	DEBUG_printf("BOS v. 0.0.4\t%s\tCompiled at %s on %s Line %i\tFunction \"%s\"\n", __FILE__, __TIME__, __DATE__, (__LINE__ - 3), __func__);
#endif
	_PMM_init(BOOTINF);
	_VMM_init(BOOTINF);
	_i686_init();
	_TM_init(BOOTINF);

	// Do everything the Kernel Needs to do before sti
	// Note Kernel Thread is Idle Thread once ints are on.
	_TSS_setESP();
#ifdef DEBUG
	DEBUG_printf("BOS v. 0.0.4\t%s\tCompiled at %s on %s Line %i\tFunction \"%s\"\n", __FILE__, __TIME__, __DATE__, (__LINE__ - 3), __func__);
#endif
	sti();
	while(TRUE) {
#ifdef DEBUG_FULL
	DEBUG_print("Idle Thread\n");
#endif
		hlt();
	DEBUG_print("DONE\n");
	}
	return -1;
}

size_t strlen(const char *str)
{
	size_t ret = 0;
	while (str[ret++]);
	return ret;
}

bool streql( const char *s1, const char *s2 )
{
	int temp = strcmp (s1, s2);
	if (temp == 0) return TRUE;
	return FALSE;
}

int strcmp( const char * s1, const char * s2 )
{
	int ret = 0;
	while (!(ret = *(char*)s1 - *(char*)s2) && *s2)
    {
        ++s1;
        ++s2;
    }
	if (ret < 0) ret = -1;
	if (ret > 0) ret = 1;
    return	ret;
}

char *strcpy(char *s1, const char *s2)
{
	char *s1_p = s1;
	while ( (*s1++ = *s2++) );
	return s1_p;
}

	void DEBUG_printf(const char* Str, ...)
	{
		va_list ap;
		va_start(ap, Str);
		while(*Str) {
			if(*Str == '%') {
				*Str++;
				switch(*Str) {
					/*** characters ***/
					case 'c': {
						const char c = (const char) va_arg (ap, const char);
						DEBUG_putch(c);
						*Str++;
						break;
					}
					/*** integers ***/
					case 'd':
					case 'i':
					{
						uint32_t c = va_arg (ap, uint32_t);
						uint8_t s[32]={0};
						itoa_s (c, 10, s);
						DEBUG_print((const char*) s);
						*Str++;		// go to next character
						break;
					}
					/*** display in hex ***/
					case 'X':
					case 'x':
					{
						uint32_t c = va_arg (ap, uint32_t);
						uint8_t s[32]={0};
						itoa_s (c,16,s);
						DEBUG_print((const char*) s);
						*Str++;		// go to next character
						break;
					}
					/*** strings ***/
					case 's':
					{
						const char *s = va_arg (ap, const char*);
						DEBUG_print((const char*) s);
						*Str++;		// go to next character
						break;
					}
					case '%':
					{
						DEBUG_putch('%');
						*Str++;
						break;
					}
				}
			} else {
				DEBUG_putch(*Str++);
			}
		}
	}

	void DEBUG_print(const char* Str)
	{
		while(*Str)
			DEBUG_putch(*Str++);
	}
	int vpos = 2;
	char color = 0x07;
	void DEBUG_putch(const char Chr)
	{
		char* VGAMEM = (char*)(0xB8000 + 0xFF000000);
		VGAMEM[vpos++] = (char) Chr;
		VGAMEM[vpos++] = color;
		if(vpos >= 0xFA0) {
			vpos = 0;
			color ^= (char) 0x40;
		}
		//outb(0xE9, (uint8_t) Chr);
	}

	uint8_t		tbuf[32];
	uint8_t		bchars[] =				{'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};

	void itoa(uint32_t i, uint32_t base, uint8_t* buf)
	{
	   uint32_t pos = 0;
	   uint32_t opos = 0;
	   uint32_t top = 0;

	   if (i == 0 || base > 16)
	   {
	      buf[0] = '0';
	      buf[1] = '\0';
	      return;
	   }

	   while (i != 0)
	   {
	      tbuf[pos] = bchars[i % base];
	      pos++;
	      i /= base;
	   }
	   top=pos--;
	   for (opos=0; opos<top; pos--,opos++)
	   {
	      buf[opos] = tbuf[pos];
	   }
	   buf[opos] = 0;
	   return;
	}

	void itoa_s(uint32_t i, uint32_t base, uint8_t* buf)
	{
	   if (base > 16) return;
	   itoa(i,base,buf);
	   return;
	}