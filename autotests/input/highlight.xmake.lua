-- XMake build file test

set_project("myproject")
set_version("1.0.0")

add_requires("zlib", "openssl")

target("myapp")
    set_kind("binary")
    add_files("src/*.cpp")
    add_packages("zlib", "openssl")
    on_build(function(target)
        print("building " .. target:name())
    end)
    after_install(function(target)
        -- post-install
    end)

if is_plat("linux", "macosx") then
    add_defines("UNIX")
end

if is_mode("debug") then
    set_symbols("debug")
    set_optimize("none")
end
