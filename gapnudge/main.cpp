#include <stdlib.h>
#include <iostream>
#include "util.hpp"



 int main(int argc, char const *argv[]) {

//argv[1] = fasta genome
//argv[2] = gff
  gffread(argv[2], argv[1]);
  return 0;
}
