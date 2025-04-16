DEBUG = 0

LIB_NAME=d_s_lib.a 
SRC_DIR = src
BUILD_DIR = ar
INCLUDE_DIR = -Iinc


CC=gcc
CFLAGS = -fPIC -Wall -Wpedantic $(INCLUDE_DIR)
LDFLAGS =  


ifeq ($(DEBUG), 1)
  CFLAGS +=-g -o0 
  CXXFLAGS += -g -o0  
else
  CFLAGS += -o3 
  CXXFLAGS += -o3 
endif


SRC = $(wildcard  $(SRC_DIR)/*.c   $(SRC_DIR)/*/*.c)
VPATH = $(sort $(dir $(SRC)))

TARGET_SRC = $(notdir $(SRC))
TARGET_OBJ_ALL = $(TARGET_SRC:%.c=$(BUILD_DIR)/%.o)


all : $(BUILD_DIR) build

build : $(BUILD_DIR)/$(LIB_NAME)


$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)
ifeq ($(DEBUG), 1)
	@echo "Debug build ."
else
	@echo "Release build."
endif	
	@echo "Created $(BUILD_DIR) directory ."
	@echo "\n"
	@echo "[ vpath    ] : $(VPATH)"
	@echo "[ src list ] : $(TARGET_SRC)"
	@echo "[ obj list ] : $(TARGET_OBJ_ALL)"
	@echo "\n"
	@echo "Compiling ... "
	
$(BUILD_DIR)/$(LIB_NAME): $(TARGET_OBJ_ALL)
	@echo "\n"	
	@echo "linking ... "
	ar rcs  $@  $^  
	@echo "\n"
	@echo "build successful. "

		
$(BUILD_DIR)/%.o : %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@	

		
clean:
	@rm -rf $(BUILD_DIR)
	@echo "deleted $(BUILD_DIR) directory.clean ok ."
	@echo "clean ok ."
.PHONY :
	clean 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

		
