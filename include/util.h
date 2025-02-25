#ifndef __UTIL_H_
#define __UTIL_H_
extern unsigned int strlen(const char *str);
#ifndef _Bool
#define _Bool unsigned char
#endif
#ifndef bool
#define bool _Bool
#endif
#ifndef true
#define true 1
#endif
#ifndef false
#define false 0
#endif
#ifndef __null
#define __null ((void *)0)
#endif
#ifndef NULL
#define NULL __null
#endif
#endif