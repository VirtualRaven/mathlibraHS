#include "includes/SkeletonPlugin.h"


using namespace plugin;

    

    unsigned int SkeletonPlugin::function_size() {
        return 1;
    }

    plugin::function *SkeletonPlugin::get_funcs() {
        return &func;
    }

    void SkeletonPlugin::plugin_init_event() {

    }

    void SkeletonPlugin::plugin_destruction_event() {
        delete(this);
    }

    const char *SkeletonPlugin::version_minor() {
        return "0";
    }

    const char *SkeletonPlugin::version_major() {
        return "1";
    }

    const char *SkeletonPlugin::plugin_name() {
        return "SkeletonPlugin";
    }

    SkeletonPlugin::SkeletonPlugin(){

        func.ptr = &identity;
        func.disp_name = "Identity Function";
        func.doc="";
        func.name="identity";
        func.tag="Skeleton plugin";
    }




















#ifdef __cplusplus
extern "C"
{
#endif
plugin::function_plugin_base *PLUGIN_ENTRY() {
    return new SkeletonPlugin();
}
#ifdef __cplusplus
}
#endif
