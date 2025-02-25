#ifndef __LOG_H_
#define __LOG_H_
extern void lstr(char* thing);
extern void ldc(char thing);
extern void lsc(signed char thing);
extern void lusc(unsigned char thing);
extern void ldi(int thing);
extern void lusi(unsigned int thing);
extern void lds(short thing);
extern void luss(unsigned short thing);
extern void ldl(long thing);
extern void lusl(unsigned long thing);
extern void ldf(float thing);
extern void ldd(double thing);
extern void lld(long double thing);
#ifdef log
#undef log
#endif
#define log(thing) _Generic((thing), \
	char*: lstr, \
	char: ldc, \
	unsigned char: lusc, \
	signed char: lsc, \
	int: ldi, \
	unsigned int: lusi, \
	short: lds, \
	unsigned short: luss, \
	long: ldl, \
	unsigned long: lusl, \
	float: ldf, \
	double: ldd, \
	long double: lld, \
	default: lstr)(thing)
#endif