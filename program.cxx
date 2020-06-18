//Here we have a simple program that uses our custom ROOT class.

#include "SimpleClass.h"

#include "TROOT.h"
#include "TObject.h"

#include <iostream>

using namespace std;

int main(int argc, char **arg){

    Int_t val;
    if(argc==1){
        val = atoi(argv[1]);
    } else {
        cout <<"./program value"<< endl;
     exit(0);
    }

    SimpleClass *class = new SimpleClass();

    class->SetValue(val);

    Double_t valsq = class->GetSquare();

    cout << "Value squared = " << valsq << endl;

    //We own the pointer so we have to delete it.
    delete class;
    class =0;

    return 0;
}
