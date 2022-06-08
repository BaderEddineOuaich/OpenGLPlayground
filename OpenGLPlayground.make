# Alternative GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild

SHELLTYPE := posix
ifeq (.exe,$(findstring .exe,$(ComSpec)))
	SHELLTYPE := msdos
endif

# Configurations
# #############################################

RESCOMP = windres
PCH = Source/pch.hpp
PCH_PLACEHOLDER = $(OBJDIR)/$(notdir $(PCH))
GCH = $(PCH_PLACEHOLDER).gch
INCLUDES += -ISource -IDependencies/glfw/include -IDependencies/glad/include -IDependencies/imgui -IDependencies/glm/include -IDependencies/stb/include
FORCE_INCLUDE +=
ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
define PREBUILDCMDS
endef
define PRELINKCMDS
endef
define POSTBUILDCMDS
endef

ifeq ($(config),debug)
TARGETDIR = Bin/Debug-linux-x86_64/OpenGLPlayground
TARGET = $(TARGETDIR)/OpenGLPlayground
OBJDIR = Bin-Intermediate/Debug-linux-x86_64/OpenGLPlayground
DEFINES += -DPLATFORM_LINUX -DDEBUG
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -Werror -O0 -g
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -Werror -O0 -g -std=c++20
LIBS += Dependencies/glfw/Bin/Debug-linux-x86_64/glfw/libglfw.a Dependencies/glad/Bin/Debug-linux-x86_64/glad/libglad.a Dependencies/imgui/Bin/Debug-linux-x86_64/imgui/libimgui.a Dependencies/glm/Bin/Debug-linux-x86_64/glm/libglm.a Dependencies/stb/Bin/Debug-linux-x86_64/stb/libstb.a -lGL -lX11 -ldl -lpthread -lstdc++fs
LDDEPS += Dependencies/glfw/Bin/Debug-linux-x86_64/glfw/libglfw.a Dependencies/glad/Bin/Debug-linux-x86_64/glad/libglad.a Dependencies/imgui/Bin/Debug-linux-x86_64/imgui/libimgui.a Dependencies/glm/Bin/Debug-linux-x86_64/glm/libglm.a Dependencies/stb/Bin/Debug-linux-x86_64/stb/libstb.a
ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64

else ifeq ($(config),release)
TARGETDIR = Bin/Release-linux-x86_64/OpenGLPlayground
TARGET = $(TARGETDIR)/OpenGLPlayground
OBJDIR = Bin-Intermediate/Release-linux-x86_64/OpenGLPlayground
DEFINES += -DPLATFORM_LINUX -DRELEASE
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -Werror -flto -O2
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -Werror -flto -O2 -std=c++20
LIBS += Dependencies/glfw/Bin/Release-linux-x86_64/glfw/libglfw.a Dependencies/glad/Bin/Release-linux-x86_64/glad/libglad.a Dependencies/imgui/Bin/Release-linux-x86_64/imgui/libimgui.a Dependencies/glm/Bin/Release-linux-x86_64/glm/libglm.a Dependencies/stb/Bin/Release-linux-x86_64/stb/libstb.a -lGL -lX11 -ldl -lpthread -lstdc++fs
LDDEPS += Dependencies/glfw/Bin/Release-linux-x86_64/glfw/libglfw.a Dependencies/glad/Bin/Release-linux-x86_64/glad/libglad.a Dependencies/imgui/Bin/Release-linux-x86_64/imgui/libimgui.a Dependencies/glm/Bin/Release-linux-x86_64/glm/libglm.a Dependencies/stb/Bin/Release-linux-x86_64/stb/libstb.a
ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64 -flto -s

else ifeq ($(config),dist)
TARGETDIR = Bin/Dist-linux-x86_64/OpenGLPlayground
TARGET = $(TARGETDIR)/OpenGLPlayground
OBJDIR = Bin-Intermediate/Dist-linux-x86_64/OpenGLPlayground
DEFINES += -DPLATFORM_LINUX -DDIST
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -Werror -flto -O3
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -Werror -flto -O3 -std=c++20
LIBS += Dependencies/glfw/Bin/Dist-linux-x86_64/glfw/libglfw.a Dependencies/glad/Bin/Dist-linux-x86_64/glad/libglad.a Dependencies/imgui/Bin/Dist-linux-x86_64/imgui/libimgui.a Dependencies/glm/Bin/Dist-linux-x86_64/glm/libglm.a Dependencies/stb/Bin/Dist-linux-x86_64/stb/libstb.a -lGL -lX11 -ldl -lpthread -lstdc++fs
LDDEPS += Dependencies/glfw/Bin/Dist-linux-x86_64/glfw/libglfw.a Dependencies/glad/Bin/Dist-linux-x86_64/glad/libglad.a Dependencies/imgui/Bin/Dist-linux-x86_64/imgui/libimgui.a Dependencies/glm/Bin/Dist-linux-x86_64/glm/libglm.a Dependencies/stb/Bin/Dist-linux-x86_64/stb/libstb.a
ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64 -flto -s

endif

# Per File Configurations
# #############################################


# File sets
# #############################################

GENERATED :=
OBJECTS :=

GENERATED += $(OBJDIR)/Application.o
GENERATED += $(OBJDIR)/BufferLayout.o
GENERATED += $(OBJDIR)/DynamicSquareScene.o
GENERATED += $(OBJDIR)/DynamicTriangleScene.o
GENERATED += $(OBJDIR)/ExercicesScene.o
GENERATED += $(OBJDIR)/ImGuiImpl.o
GENERATED += $(OBJDIR)/ImGuiRenderer.o
GENERATED += $(OBJDIR)/IndexBuffer.o
GENERATED += $(OBJDIR)/Input.o
GENERATED += $(OBJDIR)/Main.o
GENERATED += $(OBJDIR)/MainMenuScene.o
GENERATED += $(OBJDIR)/Shader.o
GENERATED += $(OBJDIR)/StaticSquareScene.o
GENERATED += $(OBJDIR)/StaticTriangleScene.o
GENERATED += $(OBJDIR)/Texture.o
GENERATED += $(OBJDIR)/VertexArray.o
GENERATED += $(OBJDIR)/VertexBuffer.o
GENERATED += $(OBJDIR)/Window.o
GENERATED += $(OBJDIR)/pch.o
OBJECTS += $(OBJDIR)/Application.o
OBJECTS += $(OBJDIR)/BufferLayout.o
OBJECTS += $(OBJDIR)/DynamicSquareScene.o
OBJECTS += $(OBJDIR)/DynamicTriangleScene.o
OBJECTS += $(OBJDIR)/ExercicesScene.o
OBJECTS += $(OBJDIR)/ImGuiImpl.o
OBJECTS += $(OBJDIR)/ImGuiRenderer.o
OBJECTS += $(OBJDIR)/IndexBuffer.o
OBJECTS += $(OBJDIR)/Input.o
OBJECTS += $(OBJDIR)/Main.o
OBJECTS += $(OBJDIR)/MainMenuScene.o
OBJECTS += $(OBJDIR)/Shader.o
OBJECTS += $(OBJDIR)/StaticSquareScene.o
OBJECTS += $(OBJDIR)/StaticTriangleScene.o
OBJECTS += $(OBJDIR)/Texture.o
OBJECTS += $(OBJDIR)/VertexArray.o
OBJECTS += $(OBJDIR)/VertexBuffer.o
OBJECTS += $(OBJDIR)/Window.o
OBJECTS += $(OBJDIR)/pch.o

# Rules
# #############################################

all: $(TARGET)
	@:

$(TARGET): $(GENERATED) $(OBJECTS) $(LDDEPS) | $(TARGETDIR)
	$(PRELINKCMDS)
	@echo Linking OpenGLPlayground
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning OpenGLPlayground
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(GENERATED)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(GENERATED)) rmdir /s /q $(subst /,\\,$(GENERATED))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild: | $(OBJDIR)
	$(PREBUILDCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) | $(PCH_PLACEHOLDER)
$(GCH): $(PCH) | prebuild
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
$(PCH_PLACEHOLDER): $(GCH) | $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) touch "$@"
else
	$(SILENT) echo $null >> "$@"
endif
else
$(OBJECTS): | prebuild
endif


# File Rules
# #############################################

$(OBJDIR)/Application.o: Source/Application/Application.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/BufferLayout.o: Source/Graphics/Buffer/BufferLayout/BufferLayout.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/IndexBuffer.o: Source/Graphics/Buffer/IndexBuffer/IndexBuffer.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/VertexArray.o: Source/Graphics/Buffer/VertexArray/VertexArray.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/VertexBuffer.o: Source/Graphics/Buffer/VertexBuffer/VertexBuffer.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/Shader.o: Source/Graphics/Shader/Shader.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/Texture.o: Source/Graphics/Texture/Texture.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/Input.o: Source/Input/Input.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/Main.o: Source/Main.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/DynamicSquareScene.o: Source/Scenes/DynamicSquareScene/DynamicSquareScene.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/DynamicTriangleScene.o: Source/Scenes/DynamicTriangleScene/DynamicTriangleScene.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/ExercicesScene.o: Source/Scenes/Exercices/ExercicesScene.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/MainMenuScene.o: Source/Scenes/MainMenuScene/MainMenuScene.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/StaticSquareScene.o: Source/Scenes/StaticSquareScene/StaticSquareScene.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/StaticTriangleScene.o: Source/Scenes/StaticTriangleScene/StaticTriangleScene.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/ImGuiImpl.o: Source/UI/ImGuiImpl.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/ImGuiRenderer.o: Source/UI/ImGuiRenderer.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/Window.o: Source/Window/Window.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/pch.o: Source/pch.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) -include $(PCH_PLACEHOLDER) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(PCH_PLACEHOLDER).d
endif