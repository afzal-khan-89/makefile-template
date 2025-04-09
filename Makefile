EXECUTABLE_NAME=make_template 
BUILD_DIR=build

CC=gcc 
CFLAGS = -Wall -Wpedantic


SRC = $(wildcard *.c */*.c */*/*.c */*/*/*.c)
#OBJECTS = $(patsubst %.c,%.o,$(SRC))
#OBJECTS = $(patsubst %.c, out/%.o,$(SRC))
VPATH = $(sort $(dir $(SRC)))

TARGET_SRC = $(notdir $(SRC))
TARGET_OBJ = $(TARGET_SRC:%.c=$(BUILD_DIR)/%.o)

create:
	mkdir build

$(BUILD_DIR)/$(EXECUTABLE_NAME): create $(TARGET_OBJ)
	echo $(VPATH)
	echo $(TARGET_SRC)
	echo $(TARGET_OBJ)

	$(CC) $^ -o $@ 

	
$(BUILD_DIR)/%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@	
	
clean:
	rm -rf $(BUILD_DIR)/*.o
	rm  $(BUILD_DIR)/$(EXECUTABLE_NAME)	

		
