#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <string.h>
#include <vector>



void quals(const char* ffile){

  std::ifstream fastq(ffile);
  std::string l;
  std::vector<std::string> qlin;
  size_t i=0, n=0;
  while(std::getline(fastq,l)){
    //std::cout << l << " newline" << std::endl;
    if(i%4==3){
      qlin.push_back(l);
      n++;
    }
    i++;
  }






for(size_t i=0;i<n; i++) {
  //std::cout << qlin[i] <<std::endl;
  int f = qlin[i].size();
  double qt = 0;
  for(size_t j=0;j<f; j++){

    if(qlin[i][j]==33){

    						qt = qt+0;
    					}else if(qlin[i][j]==34){

    						qt =qt+1;
    					}else if(qlin[i][j]==35){

    						qt = qt+2;
    					}else if(qlin[i][j]==36){

    						qt = qt+3;
    					}else if(qlin[i][j]==37){

    						qt = qt+4;
    					}else if(qlin[i][j]==38){

    						qt = qt+5;
    					}else if(qlin[i][j]==39){

    						qt = qt+6;
    					}else if(qlin[i][j]==40){
    						qt = qt+7;
    					}else if(qlin[i][j]==41){
    						qt = qt+8;
    					}else if(qlin[i][j]==42){
    						qt = qt+9;
    					}else if(qlin[i][j]==43){
    						qt = qt+10;
    					}else if(qlin[i][j]==44){
    						qt = qt+11;
    					}else if(qlin[i][j]==45){
    						qt = qt+12;
    					}else if(qlin[i][j]==46){
    						qt = qt+13;
    					}else if(qlin[i][j]==47){
    						qt = qt+14;
    					}else if(qlin[i][j]==48){
    						qt = qt+15;
    					}else if(qlin[i][j]==49){
    						qt = qt+16;
    					}else if(qlin[i][j]==50){
    						qt = qt+17;
    					}else if(qlin[i][j]==51){
    						qt = qt+18;
    					}else if(qlin[i][j]==52){
    						qt = qt+19;
    					}else if(qlin[i][j]==53){
    						qt = qt+20;
    					}else if(qlin[i][j]==54){
    						qt = qt+21;
    					}else if(qlin[i][j]==55){
    						qt = qt+22;
    					}else if(qlin[i][j]==56){
    						qt = qt+23;
    					}else if(qlin[i][j]==57){
    						qt = qt+24;
    					}else if(qlin[i][j]==58){
    						qt = qt+25;
    					}else if(qlin[i][j]==59){
    						qt = qt+26;
    					}else if(qlin[i][j]==60){
    						qt = qt+27;
    					}else if(qlin[i][j]==61){
    						qt = qt+28;
    					}else if(qlin[i][j]==62){
    						qt = qt+29;
    					}else if(qlin[i][j]==63){
    						qt = qt+30;
    					}else if(qlin[i][j]==64){
    						qt = qt+31;
    					}else if(qlin[i][j]==65){
    						qt = qt+32;
    					}else if(qlin[i][j]==66){
    						qt = qt+33;
    					}else if(qlin[i][j]==67){
    						qt = qt+34;
    					}else if(qlin[i][j]==68){
    						qt = qt+35;
    					}else if(qlin[i][j]==69){
    						qt = qt+36;
    					}else if(qlin[i][j]==70){
    						qt = qt+37;
    					}else if(qlin[i][j]==71){
    						qt = qt+38;
    					}else if(qlin[i][j]==72){
    						qt = qt+39;
    					}else if(qlin[i][j]==73){
    						qt = qt+40;
    					}




    }
    std::cout << (qt/f) << std::endl;
  }

}


void novec(){
std::string l;
size_t i=0;
while(std::getline(std::cin, l)){

  if(i%4==3){
    //std::cout << l << std::endl;
    double qt=0;
    int f=l.size();

    for(size_t j=0;j<f;j++){
      //std::cout << l[j] << "." << std::endl;

      if(l[j]==33){

      						qt = qt+0;
      					}else if(l[j]==34){

      						qt =qt+1;
      					}else if(l[j]==35){

      						qt = qt+2;
      					}else if(l[j]==36){

      						qt = qt+3;
      					}else if(l[j]==37){

      						qt = qt+4;
      					}else if(l[j]==38){

      						qt = qt+5;
      					}else if(l[j]==39){

      						qt = qt+6;
      					}else if(l[j]==40){
      						qt = qt+7;
      					}else if(l[j]==41){
      						qt = qt+8;
      					}else if(l[j]==42){
      						qt = qt+9;
      					}else if(l[j]==43){
      						qt = qt+10;
      					}else if(l[j]==44){
      						qt = qt+11;
      					}else if(l[j]==45){
      						qt = qt+12;
      					}else if(l[j]==46){
      						qt = qt+13;
      					}else if(l[j]==47){
      						qt = qt+14;
      					}else if(l[j]==48){
      						qt = qt+15;
      					}else if(l[j]==49){
      						qt = qt+16;
      					}else if(l[j]==50){
      						qt = qt+17;
      					}else if(l[j]==51){
      						qt = qt+18;
      					}else if(l[j]==52){
      						qt = qt+19;
      					}else if(l[j]==53){
      						qt = qt+20;
      					}else if(l[j]==54){
      						qt = qt+21;
      					}else if(l[j]==55){
      						qt = qt+22;
      					}else if(l[j]==56){
      						qt = qt+23;
      					}else if(l[j]==57){
      						qt = qt+24;
      					}else if(l[j]==58){
      						qt = qt+25;
      					}else if(l[j]==59){
      						qt = qt+26;
      					}else if(l[j]==60){
      						qt = qt+27;
      					}else if(l[j]==61){
      						qt = qt+28;
      					}else if(l[j]==62){
      						qt = qt+29;
      					}else if(l[j]==63){
      						qt = qt+30;
      					}else if(l[j]==64){
      						qt = qt+31;
      					}else if(l[j]==65){
      						qt = qt+32;
      					}else if(l[j]==66){
      						qt = qt+33;
      					}else if(l[j]==67){
      						qt = qt+34;
      					}else if(l[j]==68){
      						qt = qt+35;
      					}else if(l[j]==69){
      						qt = qt+36;
      					}else if(l[j]==70){
      						qt = qt+37;
      					}else if(l[j]==71){
      						qt = qt+38;
      					}else if(l[j]==72){
      						qt = qt+39;
      					}else if(l[j]==73){
      						qt = qt+40;
      					}




    }
    std::cout << (qt/f) << std::endl;
  }
  i++;
}



}
