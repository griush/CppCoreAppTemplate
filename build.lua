-- project settings
wks_name = "my_workspace"
core_proj_name = "core"
app_proj_name = "app"

-- if you change these make sure to change the .gitignore
build_dir = "%{wks.location}/build/%{cfg.system}-%{cfg.architecture}/%{cfg.buildcfg}"
int_dir = "%{wks.location}/build/int/%{cfg.system}-%{cfg.architecture}/%{cfg.buildcfg}"

workspace (wks_name)
    architecture "x64"
    configurations { "debug", "development", "release" }
    startproject (app_proj_name)

    -- workspace-wide build options for MSVC
    filter "system:windows"
        buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus", "/utf-8" }


group "core"
    -- change here also if needed
    include "core/build.lua"
group ""

-- change here also if needed
include "app/build.lua"

