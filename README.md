# These are just some bash scripts to generate C code for x % 10 but with if statements.

`lines_per_second.sh` is to check how many lines are begin generated per second, to help track the progress of the `mod10_generator.sh` script

`mod10_generator_16bit.sh` is a lighter version of `mod10_generator.sh`, and will output a file that can do `x % 10` up to the 16 bit integer limit of 65,535

`mod10_generator.sh` will return `x % 10` up to the 32 bit integer limit of 4,294,967,295

## Run the bash script
```bash 
bash ./mod10_generator.sh
```

## Compile
### Clang
Clang gives a segmentation fault every time I try to compile even the 16 bit version
### GCC
```bash 
gcc ./mod10.c -o ./mod10
```

## To view the result
Bash or Zsh: 
```bash 
./mod10_generator ; echo $?
```
Fish:
```fish
./mod10_generator ; echo $status
```

## To Check Progress
```bash
bash lines_per_second.sh ./mod10.c
```
Divide the output by 4,294,967,296 and multiply by 100 to get an approximate % of progress
