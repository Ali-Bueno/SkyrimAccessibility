-- include subprojects
includes("lib/commonlibsse")

-- set project constants
set_project("SkyrimAccessibility")
set_version("0.0.0")
set_license("GPL-3.0")
set_languages("c++23")
set_warnings("allextra")

-- add common rules
add_rules("mode.debug", "mode.releasedbg")
add_rules("plugin.vsxmake.autoupdate")

-- define targets
target("SkyrimAccessibility")
    add_rules("commonlibsse.plugin", {
        name = "SkyrimAccessibility",
        author = "Dio Kyrie",
        description = "Skyrim Accessibility SKSE plugin"
    })

    -- add src files
    add_files("src/**.cpp")
    add_headerfiles("src/**.h")
    add_includedirs("src")
    set_pcxxheader("src/pch.h")
