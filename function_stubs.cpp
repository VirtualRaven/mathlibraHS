#include "test_stub.h"
#include "function_stubs.h"
type* test_proxy(node_base* b){
    return function_helper::forward<HsDouble>(&foo,b);
}

