# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.12.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.12.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/indikernick/Dev/Projects/C++/Games/EnTT Example"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/indikernick/Dev/Projects/C++/Games/EnTT Example/build"

# Include any dependencies generated for this target.
include CMakeFiles/Game.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Game.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Game.dir/flags.make

CMakeFiles/Game.dir/src/main.cpp.o: CMakeFiles/Game.dir/flags.make
CMakeFiles/Game.dir/src/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/indikernick/Dev/Projects/C++/Games/EnTT Example/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Game.dir/src/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Game.dir/src/main.cpp.o -c "/Users/indikernick/Dev/Projects/C++/Games/EnTT Example/src/main.cpp"

CMakeFiles/Game.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Game.dir/src/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/indikernick/Dev/Projects/C++/Games/EnTT Example/src/main.cpp" > CMakeFiles/Game.dir/src/main.cpp.i

CMakeFiles/Game.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Game.dir/src/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/indikernick/Dev/Projects/C++/Games/EnTT Example/src/main.cpp" -o CMakeFiles/Game.dir/src/main.cpp.s

# Object files for target Game
Game_OBJECTS = \
"CMakeFiles/Game.dir/src/main.cpp.o"

# External object files for target Game
Game_EXTERNAL_OBJECTS =

example: CMakeFiles/Game.dir/src/main.cpp.o
example: CMakeFiles/Game.dir/build.make
example: /usr/lib/libncurses.dylib
example: /usr/lib/libform.dylib
example: CMakeFiles/Game.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/indikernick/Dev/Projects/C++/Games/EnTT Example/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable example"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Game.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Game.dir/build: example

.PHONY : CMakeFiles/Game.dir/build

CMakeFiles/Game.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Game.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Game.dir/clean

CMakeFiles/Game.dir/depend:
	cd "/Users/indikernick/Dev/Projects/C++/Games/EnTT Example/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/indikernick/Dev/Projects/C++/Games/EnTT Example" "/Users/indikernick/Dev/Projects/C++/Games/EnTT Example" "/Users/indikernick/Dev/Projects/C++/Games/EnTT Example/build" "/Users/indikernick/Dev/Projects/C++/Games/EnTT Example/build" "/Users/indikernick/Dev/Projects/C++/Games/EnTT Example/build/CMakeFiles/Game.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/Game.dir/depend
