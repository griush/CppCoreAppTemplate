project "Core"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    targetdir "Binaries/%{cfg.buildcfg}"
    staticruntime "off"

    files { 
        "Source/**.h",
        "Source/**.cpp",
    }

    includedirs {
       "Source"
    }

    targetdir ("../Binaries/" .. OutputDir .. "/%{prj.name}")
    objdir ("../Binaries/Intermediates/" .. OutputDir .. "/%{prj.name}")

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        defines { "DEBUG" }
        runtime "Debug"
        symbols "On"

    filter "configurations:Development"
        defines { "DEV" }
        runtime "Release"
        optimize "On"
        symbols "On"

    filter "configurations:Distribution"
        defines { "DIST" }
        runtime "Release"
        optimize "On"
        symbols "Off"
