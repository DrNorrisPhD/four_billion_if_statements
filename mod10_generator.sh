#!/bin/bash

printf '#include <stdio.h>\n#include <stdlib.h>\n\nint main(int argc, char* argv[]) {\n' > ./mod10.c
printf 'int x = atoi(argv[1]);' >> ./mod10.c
printf '\tif (x == 0) return 0;\n' >> ./mod10.c
for ((i=1;i<=4294967295;i++))
do
	modi=$((i % 10));
	printf '\telse if (x == %s)' "$i" >> ./mod10.c
	printf ' return %s;\n' "$modi" >> ./mod10.c
done
printf '\telse return 0;\n}' >> ./mod10.c
