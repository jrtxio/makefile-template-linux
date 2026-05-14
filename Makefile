TARGET_EXEC := bin2hex

BUILD_DIR := ./build
SRC_DIRS := ./src

CC = gcc
CXX = g++

# Find all the C and C++ files we want to compile
SRCS := $(shell find $(SRC_DIRS) -name '*.cpp' -or -name '*.c' -or -name '*.s')

# String substitution: hello.cpp → ./build/hello.cpp.o
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)

# String substitution: ./build/hello.cpp.o → ./build/hello.cpp.d
DEPS := $(OBJS:.o=.d)

# Add -I prefix to each include directory
INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

# -MMD and -MP together generate dependency makefiles (.d)
CPPFLAGS := $(INC_FLAGS) -MMD -MP

CFLAGS += -g
CXXFLAGS += -g

.PHONY: all clean

all: $(BUILD_DIR)/$(TARGET_EXEC)

$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS)
	$(CC) $(OBJS) -o $@ $(LDFLAGS)

$(BUILD_DIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.cpp.o: %.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

-include $(DEPS)
