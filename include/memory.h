#ifndef __MEMORY_H_
#define __MEMORY_H_
extern void* memory;
extern void bcopy(const void* src, void* dest, long unsigned int len);
extern void* memchr(register const void* src_void, int c, long unsigned int length);
extern int memcmp(const void* str1, const void* str2, long unsigned int count);
extern void* memcpy(void* out, const void* in, long unsigned int length);
extern void* memmem(const void* haystack, long unsigned int haystack_len, const void* needle, long unsigned int needle_len);
extern void* memmove(void* s1, const void* s2, long unsigned int n);
extern void* mempcpy(void* dst, const void* src, long unsigned int len);
extern void* memset(void* dest, register int val, register long unsigned int len);
#ifndef __builtin_expect
#define __builtin_expect(expr, val) (expr)
#endif
#endif