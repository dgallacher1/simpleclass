#include "SimpleClass.hh"

ClassImp(SimpleClass)

SimpleClass::SimpleClass()
{
  Init(); // Initialize values
}

SimpleClass::~SimpleClass()
{
  Clear();// Clear our values, this allows us to clear arrays and call a sequential Clear() function for nested classes.
}


/// Reset class
void SimpleClass::Clear(Option_t *option)
{

}

///Initialize parameters
void SimpleClass::Init()
{
  value = 0.0;
}

Int_t SimpleClass::GetSquare()
{
  return value*value; // Returns the square of the value
}
