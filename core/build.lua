project (core_proj_name)
    kind "StaticLib"
    -- kind "SharedLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    targetdir (build_dir .. "/%{prj.name}")
    objdir (int_dir .. "/%{prj.name}")

    files {
        "src/**.hpp",
        "src/**.cpp",
    }

    includedirs {
        "src",
    }

    -- uncomment if building as shared library
    -- postbuildcommands {
    --     ("{COPY} %{cfg.buildtarget.relpath} \"" .. build_dir .. "/%{app_proj_name}/\"")
    -- }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:debug"
        defines { "DEBUG" }
        runtime "Debug"
        symbols "on"

    filter "configurations:development"
        defines { "DEV" }
        runtime "Release"
        optimize "on"
        symbols "on"

    filter "configurations:release"
        defines { "RELEASE" }
        runtime "Release"
        optimize "on"
        symbols "off"
