#!/bin/bash

printf '#include <stdlib.h>\n\nint main(int argc, char* argv[]) {\n' > ./mod10_16bit.c
printf '\tint x = atoi(argv[1]);\n' >> ./mod10_16bit.c
printf '\tif (x == 0) return 0;\n' >> ./mod10_16bit.c
for ((i=1;i<=65535;i++))
do
	modi=$((i % 10));
	printf '\telse if (x == %s)' "$i" >> ./mod10_16bit.c
	printf ' return %s;\n' "$modi" >> ./mod10_16bit.c
done
printf '\telse return 0;\n}' >> ./mod10_16bit.c
