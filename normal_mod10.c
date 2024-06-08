#include <stdlib.h>

int main(int argc, char *argv[]) {
	if (argc < 1) exit(1);
	return atoi(argv[1]) % 10;
}
