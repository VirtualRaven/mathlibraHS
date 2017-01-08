module Test where
import Foreign.C.Types

foreign export ccall foo :: CDouble -> CDouble

foo :: CDouble -> CDouble
foo x = x*x
