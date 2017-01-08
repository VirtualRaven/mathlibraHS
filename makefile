GHC_LIB_DIR=$(shell ghc --print-libdir)
GHC_LIB_RTS_DIR=$(GHC_LIB_DIR)/rts
GHC_RTS_LIB= HSrts
OUT_DIR=./build
GHC_STATIC_FLAGS=-static -optl-static -optl-pthread -fPIC -optc-static
GHC_DYNAMIC_FLAGS=-dynamic -fPIC
GHC_FLAGS=$(GHC_DYNAMIC_FLAGS)
GHC_RTS_DIR=$(GHC_LIB_DIR)/rts/
GHC_RTS_LIB=HSrts-ghc7.10.3
O_CPP_FILES=function_stubs.o HaskellPlugin.o
BINARY_NAME=libHaskellPlugin.so

main: hs/test.o $(O_CPP_FILES) 
	ghc  -shared   $(GHC_FLAGS)  -no-hs-main  $^ -o $(BINARY_NAME) -L$(GHC_RTS_DIR) -l $(GHC_RTS_LIB) -lstdc++ 
	mkdir -p test/plugins/
	cp $(BINARY_NAME) test/plugins/

%.o : %.cpp 
	g++  -c -fPIC -I./hs/ -I./include -I./include/mathlibra  -I$(GHC_LIB_DIR)/include $< -o $@

#compile haskell files
hs/%.o : hs/%.hs
	ghc   -c  $(GHC_FLAGS)     -fforce-recomp  $<  

#extract needed headers 
unpack: plugin_api.zip
	unzip -o -d include/mathlibra/  plugin_api.zip	

clean:
	rm -rf $(BINARY_NAME)
	rm -rf *.o 
	rm -rf hs/*.hi
	rm -rf hs/*_stub.h
	rm -rf hs/*.o
	rm -rf test/plugins/
