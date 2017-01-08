GHC_LIB_DIR=$(shell ghc --print-libdir)
GHC_LIB_RTS_DIR=$(GHC_LIB_DIR)/rts
GHC_RTS_LIB= HSrts
OUT_DIR=./build
GHC_STATIC_FLAGS=-static -optl-static -optl-pthread

main: main.o hs/test.o
	ghc  -g  $(GHC_STATIC_FLAGS) -fPIC -no-hs-main  $^ -o main -lstdc++
main.o: test.o main.cpp unpack

	g++ -g -c main.cpp -I hs/ -I ./include -I ./include/mathlibra -I `ghc --print-libdir`/include 
%.o : hs/%.hs
	ghc -g  -c  $(GHC_STATIC_FLAGS) -fPIC -optc-static   -fforce-recomp  $<  

#extract needed headers 
unpack: plugin_api.zip
	unzip -d include/mathlibra/ -f plugin_api.zip	

clean:
	rm -rf *.o 
	rm -rf hs/*.hi
	rm -rf hs/*_stub.h
	rm -rf hs/*.o
