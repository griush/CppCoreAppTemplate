project (app_proj_name)
    kind "ConsoleApp"
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

        "%{wks.location}/" .. core_proj_name .. "/src",
    }

    links {
        "%{core_proj_name}",
    }


    filter "system:windows"
        systemversion "latest"

    filter "configurations:debug"
        defines { "DEBUG" }
        runtime "debug"
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
