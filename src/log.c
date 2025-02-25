#include <log.h>

#include <util.h>

extern unsigned int lognc(void);
extern void logfc(unsigned int index, char thing);
extern void logpc(unsigned int index);

void lstr(char* thing) {
	unsigned int len = strlen(thing), i = 0, index = lognc();
	for (; i < len; i++) {
		logfc(index, thing[i]);
	};
	logpc(index);
	return;
};
