DEBUG ?= 1

EXECUTABLE_NAME=make_template 

ROOT_DIR := .
BUILD_DIR := $(ROOT_DIR)/build 
SRC_DIR := $(ROOT_DIR)/src
INCLUDE_DIR = $(ROOT_DIR)/inc

BUILD_TIMESTAMP = $(shell date +'%d-%m-%y.%H-%M-%S.%N')

DEFINES = -DBUILD-TIMESTAMP_STR=\"$(BUILD_TIMESTAMP)\" \
	  -DDEBUG_NEXT=ASDF

WARNS = -Wall -Wextra -Werror -Wwrite-strings -Wno-parentheses -pedantic \
       -Warray-bounds -Wno-unused-variable -Wno-unused-function -Wno-unused-parameter -Wno-unused-result

INC_PATHS := -I$(INCLUDE_DIR)       	

CXX=g++
CC=gcc       
CFLAGS = $(INC_PATHS) $(WARNS)   #-Wall -Wpedantic # -Wunused-variable #-Wextra  -Wuninitialized 
CXXFLAGS = $(INC_PATHS) -Wall -Wextra -Wpedantic --std=c++17
#LDFLAGS = -lsmq -L.  


ifeq ($(DEBUG), 1)
  OUT_DIR := $(addsuffix /debug,$(BUILD_DIR))
  CFLAGS +=-g -o0 
  CXXFLAGS += -g -o0  
else
  OUT_DIR := $(addsuffix /release,$(BUILD_DIR))
  CFLAGS += -o3 
  CXXFLAGS += -o3 
endif


SRC = $(wildcard  $(SRC_DIR)/*.c   $(SRC_DIR)/*/*.c   $(SRC_DIR)/*/*/*.c   $(SRC_DIR)/*/*/*/*.c)
#OBJECTS = $(patsubst %.c,%.o,$(SRC))
#OBJECTS = $(patsubst %.c, out/%.o,$(SRC))
VPATH = $(sort $(dir $(SRC)))

TARGET_SRC = $(notdir $(SRC))
TARGET_OBJ_ALL = $(TARGET_SRC:%.c=$(OUT_DIR)/%.o)


all : $(OUT_DIR) build

build : $(OUT_DIR)/$(EXECUTABLE_NAME)


$(OUT_DIR):
	@mkdir -p $(OUT_DIR)
ifeq ($(DEBUG), 1)
	@echo "Debug build ."
else
	@echo "Release build."
endif	
	@echo "Created $(OUT_DIR) directory ."
#	@echo "\n"
#	@echo "[ vpath    ] : $(VPATH)"
#	@echo "[ src list ] : $(TARGET_SRC)"
#	@echo "[ obj list ] : $(TARGET_OBJ_ALL)"
	@echo "\n"
	@echo "Compiling ... "
	
$(OUT_DIR)/$(EXECUTABLE_NAME): $(TARGET_OBJ_ALL)
	@echo "\n"	
	@echo "linking ... "
	$(CC)  $^ -o $@  $(LDFLAGS) 
	@echo "\n"
	@echo "build successful. "

		
$(OUT_DIR)/%.o : %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@	
		
clean:
	@rm -rf $(BUILD_DIR)
	@echo "deleted $(BUILD_DIR) directory.clean ok ."
	@echo "clean ok ."

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

		
