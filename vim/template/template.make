clean:
	rm *.out
default: target.cpp
	gcc target.cpp
	./a.out
