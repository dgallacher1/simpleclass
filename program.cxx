//Here we have a simple program that uses our custom ROOT class.

#include "SimpleClass.hh"

#include "TROOT.h"
#include "TObject.h"

#include <iostream>

using namespace std;

int main(int argc, char **argv){

    Int_t val;
    if(argc==2){
      val = atoi(argv[1]);
    } else {
      cout <<"./program value"<< endl;
      return 0;
    }

    SimpleClass *simpleclass = new SimpleClass();

    simpleclass->SetValue(val);

    Double_t valsq = simpleclass->GetSquare();

    cout << "Value squared = " << valsq << endl;

    delete simpleclass;
    simpleclass =0;

    return 0;
}
