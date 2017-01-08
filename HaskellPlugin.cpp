#include "HaskellPlugin.h"
#include "function_stubs.h"
#include "HsFFI.h"
using namespace plugin;
    unsigned int HaskellPlugin::function_size() {
        return 1;
    }

    plugin::function *HaskellPlugin::get_funcs() {
        return &func;
    }

    void HaskellPlugin::plugin_init_event() {
        hs_init(NULL,NULL);
    }

    void HaskellPlugin::plugin_destruction_event() {
        hs_exit(); 
        delete(this);
    }

    const char *HaskellPlugin::version_minor() {
        return "0";
    }

    const char *HaskellPlugin::version_major() {
        return "1";
    }

    const char *HaskellPlugin::plugin_name() {
        return "Haskell proxy plugin";
    }

    HaskellPlugin::HaskellPlugin(){

        func.ptr = test_proxy;
        func.disp_name = "Haskell test func";
        func.doc="";
        func.name="bar";
        func.tag="Haskell plugin";
    }




















#ifdef __cplusplus
extern "C"
{
#endif
plugin::function_plugin_base *PLUGIN_ENTRY() {
    return new HaskellPlugin();
}
#ifdef __cplusplus
}
#endif
