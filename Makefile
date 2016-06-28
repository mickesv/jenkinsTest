CC=g++
OUT=ex01
SOURCES= $(wildcard *.cc) $(wildcard *.cpp)
OBJECTS= $(SOURCES:.cpp=.o)

$(OUT): $(OBJECTS)	
	$(CC) $(OBJECTS)  -o $(OUT)

%.o: %.cpp
	$(CC) -c $< -o $@

go: $(OUT)
#	export LD_LIBRARY_PATH=$(SFMLPATH)/lib && ./$(OUT)
	./$(OUT)

clean:
	rm -f *.o
	rm -f *~
	rm -f $(OUT)
