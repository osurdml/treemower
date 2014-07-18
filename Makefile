# Output file name (without extension)
OUTPUT=treemower
OUTPUT_DIR=.

# Source Files
SOURCES = main.cpp decisiontree.cpp
SRCDIR = src
INCLUDE_DIRS = include
OBJDIR = build

# Define programs
CC = clang++

# Compiler flags
CFLAGS  = -O2
CFLAGS += -Wall
CFLAGS += $(patsubst %,-I%,$(INCLUDE_DIRS))

# Define object files
OBJS = $(patsubst %.cpp, $(OBJDIR)/%.o, $(SOURCES))

# Targets
all: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(OUTPUT_DIR)/$(OUTPUT)

$(OBJDIR)/%.o : $(SRCDIR)/%.cpp
	@echo
	@echo Building $<
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS)
	rm -f $(OUTPUT_DIR)/$(OUTPUT)

# Special targets
.PRECIOUS: $(OBJS)
.PHONY: all clean

