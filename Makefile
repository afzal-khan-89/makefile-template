SRC_DIR = src
INCLUDE_DIR = inc

EXECUTABLE_NAME=make_template 




CC=gcc 
CXX=g++
CFLAGS = -Wall -Wextra -Wpedantic 
CXXFLAGS = -Wall -Wextra -Wpedantic --std=c++17
CPPFLAGS = -I$(INCLUDE_DIR) 
LDFLAGS = -lmath 

DEBUG = 1

ifeq ($(DEBUG), 1)
  BUILD_DIR = build/debug
  CFLAGS +=-g -o0 
  CXXFLAGS += -o3 
else
  BUILD_DIR = build/release
  CFLAGS += -o3 
  CXXFLAGS += -o3 
endif

SRC = $(wildcard  $(SRC_DIR)/*.c   $(SRC_DIR)/*/*.c   $(SRC_DIR)/*/*/*.c   $(SRC_DIR)/*/*/*/*.c)
#OBJECTS = $(patsubst %.c,%.o,$(SRC))
#OBJECTS = $(patsubst %.c, out/%.o,$(SRC))
VPATH = $(sort $(dir $(SRC)))

TARGET_SRC = $(notdir $(SRC))
TARGET_OBJ = $(TARGET_SRC:%.c=$(BUILD_DIR)/%.o)

all: $(BUILD_DIR) $(BUILD_DIR)/$(EXECUTABLE_NAME)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/$(EXECUTABLE_NAME): $(TARGET_OBJ)
	echo $(VPATH)
	echo $(TARGET_SRC)
	echo $(TARGET_OBJ)
	$(CC)  $^ -o $@ 
	echo "---------build done ----------"
	
create_dir:
	mkdir -p build
	
$(BUILD_DIR)/%.o : %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@	
	
clean:
	rm -rf $(BUILD_DIR)/*.o
	

		
