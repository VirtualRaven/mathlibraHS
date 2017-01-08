#include "test_stub.h"
#include<iostream>

int main(){
    int argc=0;
    char** argv = {};
    hs_init(NULL,NULL); 
    std::cout << "Start\n";
    std::cout << foo(2) << std::endl; 
    std::cout << "End\n";
    hs_exit();
}
