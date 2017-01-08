
#include "functions_external_interface.h"

#include "PluginFunctions.h"

class HaskellPlugin : public plugin::function_plugin_base {
    
    function func;

public:
    virtual unsigned int function_size();

    virtual plugin::function *get_funcs();

    virtual void plugin_init_event();

    virtual void plugin_destruction_event();

    virtual const char *version_minor();

    virtual const char *version_major();

    virtual const char *plugin_name();

    HaskellPlugin();
};

