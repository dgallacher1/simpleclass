#Root libraries
ROOTLIBS      := $(shell $(ROOTSYS)/bin/root-config --libs)
ROOTGLIBS     := $(shell $(ROOTSYS)/bin/root-config --glibs)

#Variables and options
OPT           := -O2
#Compliler of choice
CXX           := g++
CXXFLAGS      := -Wall -pthread $(OPT) -fPIC -I$(ROOTSYS)/include
LD            := g++
LDFLAGS       := $(OPT) -pthread
LIBS         	:= $(ROOTGLIBS) -L/usr/X11R6/lib -lX11 -lXpm


#include all header files for linking here
HDRS := SimpleClass.hh

#Objects files for each class
#This will automatically create an object file for each header file "Header.hh" called "Header.o" in the list "HDRS"
OBJS := $(HDRS:.hh=.o)
#Source files for each class, here we also create an array of the source files corresponding to the headers
#This helps us reduce the number of places to input variables and reduce the chance of typos causing issues
SRCS := $(HDRS:.hh=.cxx)

#Since we dont create a file called "all" or "clean" with our rules, we declare them as phony targets
#A good description for this is here : https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: all clean

#Having a function called "all" ensures that all of our rules will be ran when we call "make"
#otherwise only the first rule will be called
#Call "make clean" to remove clean the directory and start compilation fresh.
all: lib Dictionary.C program

lib: libtree.so

#Here we create a shared library to use in our simple program
#We're linking our dictionary with all of our object files.
libtree.so: $(OBJS) Dictionary.o
	@echo "Creating shared library.."
	$(LD) $(LDFLAGS) -shared -o $@ $^ $(LIBS)

#To illustrate what's going on below we compile the dictionary file independently
#The
Dictionary.o: Dictionary.C
	@echo "Creating dictionary object.."
	$(CXX) -c $(CXXFLAGS) $<

Dictionary.C: $(HDRS) LinkDef.h
	@echo "Creating dictionary.."
	$(ROOTSYS)/bin/rootcint -f $@ -c $(CXXFLAGS) -p $^

#This will be a simple program we use to test our class implementation
program: program.o
	@echo "Creating program.."
	$(LD) $(LDFLAGS) -o $@ $< $(LIBS) -L/path/to/library/ -ltree

#This rule helps us build our individual machine-readable object files for header files listed in HDRS
%.o: %.cxx
	$(CXX) -c $(CXXFLAGS) $<

clean:
	@echo "Cleaning up..."
	rm -f *.o
	rm -f *~
	rm -f *.so
	rm -f Dictionary.*
	rm -f program
