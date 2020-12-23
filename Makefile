##Basic makefile for compiling all source files and cleaning class files.
##Might do more interesting stuff here later, i.e. running specific files.

all: 
	javac */*.java

clean: 
	rm -rf */*.class