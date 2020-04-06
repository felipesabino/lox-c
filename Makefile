# Makefile for building a single configuration of the C interpreter. It expects
# variables to be passed in for:
#
# MODE         "debug" or "release".
# NAME         Name of the output executable (and object file directory).
# SOURCE_DIR   Directory where source files and headers are found.

BUILD_DIR := build

# Files.
HEADERS := $(wildcard $(SOURCE_DIR)/*.h)
SOURCES := $(wildcard $(SOURCE_DIR)/*.c)
OBJECTS := $(addprefix $(BUILD_DIR)/$(NAME)/, $(notdir $(SOURCES:.c=.o)))

# Compile the C interpreter.
default:
	@ $(MAKE) -f ./c.make NAME=clox MODE=release SOURCE_DIR=.
	@ cp build/clox clox # For convenience, copy the interpreter to the top level.

# Compile a debug build of clox.
debug:
	@ $(MAKE) -f ./c.make NAME=cloxd MODE=debug SOURCE_DIR=.
	@ cp build/cloxd clox # For convenience, copy the interpreter to the top level.
