project "VKBootstrap"
	kind "StaticLib"
	language "C++"

	cppdialect "C++17"

	targetdir ("%{wks.location}/bin/" ..outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" ..outputdir .. "/%{prj.name}")

	postbuildmessage "Recompiling VK Bootstrap"

	files
	{
		"src/**.h",
		"src/**.cpp",
	}

	includedirs
	{
		"%{IncludeDir.VulkanSDK}"
	}

	links
	{
		"%{Library.Vulkan}"
	}
	
	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
