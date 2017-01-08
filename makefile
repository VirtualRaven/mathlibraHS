GHC_LIB_DIR=$(shell ghc --print-libdir)
GHC_LIB_RTS_DIR=$(GHC_LIB_DIR)/rts
GHC_RTS_LIB= HSrts
OUT_DIR=./build
GHC_STATIC_FLAGS=-static -optl-static -optl-pthread
O_CPP_FILES=function_stubs.o HaskellPlugin.o


main: test.o unpack $(O_CPP_FILES) 
	ghc  -g  $(GHC_STATIC_FLAGS) -fPIC -no-hs-main  $^ -o main -lstdc++

%.o : %.cpp 
	g++  -I./hs/ -I./include -I./include/mathlibra -I`ghc --print-libdir`/include $< 

%.o : hs/%.hs
	ghc -g  -c  $(GHC_STATIC_FLAGS) -fPIC -optc-static   -fforce-recomp  $<  

#extract needed headers 
unpack: plugin_api.zip
	unzip -d include/mathlibra/  plugin_api.zip	

clean:
	rm -rf *.o 
	rm -rf hs/*.hi
	rm -rf hs/*_stub.h
	rm -rf hs/*.o
