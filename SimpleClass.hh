// A simple class
#ifndef ROOT_SimpleClass
#define ROOT_SimpleClass

#include "TObject.h"

class SimpleClass : public TObject {
private:
  // Private data members
  Int_t      value;

public:
    //Constructor and destructor
   SimpleClass();
   ~SimpleClass();

   void       Init();
   void       Clear(Option_t *option = "");

   // Public member functions
    Int_t        GetValue(){return value;}
    void            SetValue(Int_t _value){value = _value;}

    Int_t        GetSquare();

   ClassDef(SimpleClass,1)  //Root Class version
};
#endif
