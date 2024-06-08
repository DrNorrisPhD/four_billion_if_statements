# Bash scripts to generate C code for x % 10
### but with if statements.

It sounded funny, so I did it.

## Script Descriptions
`lines_per_second.sh` is to check how many lines are begin generated per second, to help track the progress of the `mod10_generator.sh` script

`mod10_generator_16bit.sh` is a lighter version of `mod10_generator.sh`, and will output a file that can do `x % 10` up to the 16 bit integer limit of 65,535

`mod10_generator.sh` will return `x % 10` up to the 32 bit integer limit of 4,294,967,295

## Run the bash script
```bash 
./mod10_generator.sh
```
If you cannot run a script, make it executable by running:
```bash
chmod +x ./script_name
```

## Compile
### Clang
Clang segfaults every time I try to compile even the 16 bit version
### GCC
```bash 
gcc ./mod10.c -o ./mod10
```
**BE WARNED** On my system (Arch Linux Kernder 6.9.1-zen 62.5GiB DDR4, i7-13700K) I get a memory error trying to compile with gcc  
## To view the result
Bash or Zsh: 
```bash 
./mod10.out 489; echo $?
```
Fish:
```fish
./mod10.out 489; echo $status
```

## To Check Progress
To get an approximate % of progress per second, run:
```bash
./lines_per_second.sh ./mod10.c | awk '{printf "%.05f%% Progress per Second\n", $1/4294967296 * 100}'
```
and divide the output by 4,294,967,296 and multiply by 100

To get the current total progress, run: 
```bash
wc -l ./mod10.c | awk '{printf "%.02f%% Completed\n", $1/4294967296*100}'
```

To get a continually updating progress bar, run:
```bash
./progress_updater.sh ./mod10.c
```
