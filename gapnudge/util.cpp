#include <iostream>
#include <stdlib.h>
#include <fstream>
#include <string.h>



void fastaparse(const char* ffile, std::string contig, int fsta, int fsto, int* nsta, int* nsto, int* pindic){
  std::string fs;
  std::ifstream fasta(ffile);
  while(std::getline(fasta, fs)){
    
    std::string hdr = fs.substr(1,fs.length());

    if(hdr==contig ){

      std::string nuc;
      getline(fasta, nuc);


      std::string nsub = nuc.substr(fsta-1,fsto-fsta+1);

      int len = nsub.length();
      int ncnt=0, tncnt=0;
      for(int i=0;i < len;i++) {
        if(std::strncmp(&nsub[i],"N",1)==0){
          ncnt++;
        }else{break;}
      }
      for(int i=len-1;i>0;i--) {
        if(std::strncmp(&nsub[i],"N",1)==0){
          tncnt++;
        }else{break;}
      }


      int newfiv = fsta+ncnt;
      int newthree = fsto-tncnt;

      *nsta = newfiv;
      *nsto = newthree;
      int indic=0;
      if(ncnt==0 && tncnt ==0){
        indic=0; //use original start and stop
      }else if(ncnt!=0 && tncnt == 0){
        indic=1; //N's on 5' end, use nsta
      }else if(ncnt == 0 && tncnt !=0){
        indic = 2; //N's on 3' end, use nsto
      }else if(ncnt!=0 && tncnt !=0){
        indic =3; //N's on both ends, use nsta and nsto
      }
      *pindic = indic;


      }
  }
}


















void gffread(const char* pfile, const char* ffile){


  std::string line;
  int nsta, nsto, indit;
  std::string seqid, src, ftyp, attribs, seqstrand, seqframe, seqscore;
  int seqstart, seqstop;
  std::ifstream myfile(pfile);
     while(myfile >> seqid >> src >> ftyp >> seqstart >> seqstop && std::getline(myfile,line)){



      fastaparse(ffile,seqid, seqstart, seqstop, &nsta, &nsto, &indit);


      if(indit ==0){
        std::cout << seqid << "\t" << src << "\t" << ftyp << "\t" << seqstart << "\t" << seqstop << "\t" << line << std::endl;
      } else if(indit ==1){
        std::cout << seqid << "\t" << src << "\t" << ftyp << "\t" << nsta << "\t" << seqstop << "\t" << line << std::endl;
      } else if(indit ==2){
        std::cout << seqid << "\t" << src << "\t" << ftyp << "\t" << seqstart << "\t" << nsto << "\t" << line << std::endl;
      } else if(indit ==3) {
        std::cout << seqid << "\t" << src << "\t" << ftyp << "\t" << nsta << "\t" << nsto << "\t" << line << std::endl;
      }




      nsta=0;
      nsto=0;
      indit = 0;
      continue;

      std::cout << seqstart << "\t" << seqstop << std::endl;
      std::cout << line << std::endl;


    }




}
