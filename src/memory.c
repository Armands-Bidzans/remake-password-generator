#include <memory.h>

#include <util.h>

void bcopy(const void* src, void* dest, long unsigned int len) {
	if (dest < src) {
		const char* firsts = (const char*) src;
		char* firstd = (char*) dest;
		while (len--)
			*firstd++ = *firsts++;
	} else {
		const char* lasts = (const char*) src + (len - 1);
		char* lastd = (char*) dest + (len - 1);
		while (len--)
			*lastd-- = *lasts--;
	};
	return;
};

void* memchr(register const void* src_void, int c, long unsigned int length) {
	const unsigned char* src = (const unsigned char*) src_void;
	while (length-- > 0) {
		if (*src == c)
			return (void*) src;
		src++;
	};
	return NULL;
};

int memcmp(const void* str1, const void* str2, long unsigned int count) {
	register const unsigned char* s1 = (const unsigned char*) str1;
	register const unsigned char* s2 = (const unsigned char*) str2;
	while (count-- > 0) {
		if (*s1++ != *s2++)
			return s1[-1] < s2[-1] ? -1 : 1;
	};
	return 0;
};

void* memcpy(void* out, const void* in, long unsigned int length) {
	bcopy(in, out, length);
	return out;
};

void* memmem(const void* haystack, long unsigned int haystack_len, const void* needle, long unsigned int needle_len) {
	const char* begin;
	const char* const last_possible = (const char*) haystack + haystack_len - needle_len;
	if (needle_len == 0)
		return (void*) haystack;
	if (__builtin_expect(haystack_len < needle_len, 0))
		return NULL;
	for (begin = (const char*) haystack; begin <= last_possible; begin++)
		if (begin[0] == ((const char*) needle)[0] && !memcmp((const void*) &begin[1], (const void*) ((const char*) needle + 1), needle_len - 1))
			return (void*) begin;
	return NULL;
};

void* memmove(void* s1, const void* s2, long unsigned int n) {
	bcopy(s2, s1, n);
	return s1;
};

void* mempcpy(void* dst, const void* src, long unsigned int len) {
	return (char*) memcpy(dst, src, len) + len;
};

void* memset(void* dest, register int val, register long unsigned int len) {
	register unsigned char* ptr = (unsigned char*) dest;
	while (len-- > 0)
		*ptr++ = val;
	return dest;
};