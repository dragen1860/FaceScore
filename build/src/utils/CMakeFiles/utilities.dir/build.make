# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/i/facescore

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/i/facescore/build

# Include any dependencies generated for this target.
include src/utils/CMakeFiles/utilities.dir/depend.make

# Include the progress variables for this target.
include src/utils/CMakeFiles/utilities.dir/progress.make

# Include the compile flags for this target's objects.
include src/utils/CMakeFiles/utilities.dir/flags.make

src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.o: src/utils/CMakeFiles/utilities.dir/flags.make
src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.o: ../src/utils/command-line-arguments.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/i/facescore/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.o"
	cd /home/i/facescore/build/src/utils && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/utilities.dir/command-line-arguments.cpp.o -c /home/i/facescore/src/utils/command-line-arguments.cpp

src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utilities.dir/command-line-arguments.cpp.i"
	cd /home/i/facescore/build/src/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/i/facescore/src/utils/command-line-arguments.cpp > CMakeFiles/utilities.dir/command-line-arguments.cpp.i

src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utilities.dir/command-line-arguments.cpp.s"
	cd /home/i/facescore/build/src/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/i/facescore/src/utils/command-line-arguments.cpp -o CMakeFiles/utilities.dir/command-line-arguments.cpp.s

src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.o.requires:
.PHONY : src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.o.requires

src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.o.provides: src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.o.requires
	$(MAKE) -f src/utils/CMakeFiles/utilities.dir/build.make src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.o.provides.build
.PHONY : src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.o.provides

src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.o.provides.build: src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.o

src/utils/CMakeFiles/utilities.dir/helpers.cpp.o: src/utils/CMakeFiles/utilities.dir/flags.make
src/utils/CMakeFiles/utilities.dir/helpers.cpp.o: ../src/utils/helpers.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/i/facescore/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/utils/CMakeFiles/utilities.dir/helpers.cpp.o"
	cd /home/i/facescore/build/src/utils && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/utilities.dir/helpers.cpp.o -c /home/i/facescore/src/utils/helpers.cpp

src/utils/CMakeFiles/utilities.dir/helpers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utilities.dir/helpers.cpp.i"
	cd /home/i/facescore/build/src/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/i/facescore/src/utils/helpers.cpp > CMakeFiles/utilities.dir/helpers.cpp.i

src/utils/CMakeFiles/utilities.dir/helpers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utilities.dir/helpers.cpp.s"
	cd /home/i/facescore/build/src/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/i/facescore/src/utils/helpers.cpp -o CMakeFiles/utilities.dir/helpers.cpp.s

src/utils/CMakeFiles/utilities.dir/helpers.cpp.o.requires:
.PHONY : src/utils/CMakeFiles/utilities.dir/helpers.cpp.o.requires

src/utils/CMakeFiles/utilities.dir/helpers.cpp.o.provides: src/utils/CMakeFiles/utilities.dir/helpers.cpp.o.requires
	$(MAKE) -f src/utils/CMakeFiles/utilities.dir/build.make src/utils/CMakeFiles/utilities.dir/helpers.cpp.o.provides.build
.PHONY : src/utils/CMakeFiles/utilities.dir/helpers.cpp.o.provides

src/utils/CMakeFiles/utilities.dir/helpers.cpp.o.provides.build: src/utils/CMakeFiles/utilities.dir/helpers.cpp.o

src/utils/CMakeFiles/utilities.dir/points.cpp.o: src/utils/CMakeFiles/utilities.dir/flags.make
src/utils/CMakeFiles/utilities.dir/points.cpp.o: ../src/utils/points.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/i/facescore/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/utils/CMakeFiles/utilities.dir/points.cpp.o"
	cd /home/i/facescore/build/src/utils && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/utilities.dir/points.cpp.o -c /home/i/facescore/src/utils/points.cpp

src/utils/CMakeFiles/utilities.dir/points.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utilities.dir/points.cpp.i"
	cd /home/i/facescore/build/src/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/i/facescore/src/utils/points.cpp > CMakeFiles/utilities.dir/points.cpp.i

src/utils/CMakeFiles/utilities.dir/points.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utilities.dir/points.cpp.s"
	cd /home/i/facescore/build/src/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/i/facescore/src/utils/points.cpp -o CMakeFiles/utilities.dir/points.cpp.s

src/utils/CMakeFiles/utilities.dir/points.cpp.o.requires:
.PHONY : src/utils/CMakeFiles/utilities.dir/points.cpp.o.requires

src/utils/CMakeFiles/utilities.dir/points.cpp.o.provides: src/utils/CMakeFiles/utilities.dir/points.cpp.o.requires
	$(MAKE) -f src/utils/CMakeFiles/utilities.dir/build.make src/utils/CMakeFiles/utilities.dir/points.cpp.o.provides.build
.PHONY : src/utils/CMakeFiles/utilities.dir/points.cpp.o.provides

src/utils/CMakeFiles/utilities.dir/points.cpp.o.provides.build: src/utils/CMakeFiles/utilities.dir/points.cpp.o

# Object files for target utilities
utilities_OBJECTS = \
"CMakeFiles/utilities.dir/command-line-arguments.cpp.o" \
"CMakeFiles/utilities.dir/helpers.cpp.o" \
"CMakeFiles/utilities.dir/points.cpp.o"

# External object files for target utilities
utilities_EXTERNAL_OBJECTS =

lib/libutilities.so: src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.o
lib/libutilities.so: src/utils/CMakeFiles/utilities.dir/helpers.cpp.o
lib/libutilities.so: src/utils/CMakeFiles/utilities.dir/points.cpp.o
lib/libutilities.so: src/utils/CMakeFiles/utilities.dir/build.make
lib/libutilities.so: /usr/local/lib/libopencv_core.so.2.4.11
lib/libutilities.so: /usr/local/lib/libopencv_highgui.so.2.4.11
lib/libutilities.so: /usr/local/lib/libopencv_imgproc.so.2.4.11
lib/libutilities.so: /usr/local/lib/libopencv_objdetect.so.2.4.11
lib/libutilities.so: /usr/local/lib/libopencv_highgui.so.2.4.11
lib/libutilities.so: /usr/local/lib/libopencv_imgproc.so.2.4.11
lib/libutilities.so: /usr/local/lib/libopencv_core.so.2.4.11
lib/libutilities.so: src/utils/CMakeFiles/utilities.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library ../../lib/libutilities.so"
	cd /home/i/facescore/build/src/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/utilities.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/utils/CMakeFiles/utilities.dir/build: lib/libutilities.so
.PHONY : src/utils/CMakeFiles/utilities.dir/build

src/utils/CMakeFiles/utilities.dir/requires: src/utils/CMakeFiles/utilities.dir/command-line-arguments.cpp.o.requires
src/utils/CMakeFiles/utilities.dir/requires: src/utils/CMakeFiles/utilities.dir/helpers.cpp.o.requires
src/utils/CMakeFiles/utilities.dir/requires: src/utils/CMakeFiles/utilities.dir/points.cpp.o.requires
.PHONY : src/utils/CMakeFiles/utilities.dir/requires

src/utils/CMakeFiles/utilities.dir/clean:
	cd /home/i/facescore/build/src/utils && $(CMAKE_COMMAND) -P CMakeFiles/utilities.dir/cmake_clean.cmake
.PHONY : src/utils/CMakeFiles/utilities.dir/clean

src/utils/CMakeFiles/utilities.dir/depend:
	cd /home/i/facescore/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/i/facescore /home/i/facescore/src/utils /home/i/facescore/build /home/i/facescore/build/src/utils /home/i/facescore/build/src/utils/CMakeFiles/utilities.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/utils/CMakeFiles/utilities.dir/depend

