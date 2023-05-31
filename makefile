LIB_NAME = libpl-srt-utils.so
CXX = g++
CXXFLAGS = -std=c++11 -Wall -DSRT_ENABLE_BINDTODEVICE -DENABLE_EXPERIMENTAL_BONDING
CFLAGS = $(INCLUDES) -fPIC
LD_FLAGS = 
RM = rm

AR = g++
AR_FLAGS = -shared -fPIC -Wl,-soname,${LIB_NAME}.1 -o 

MKDIR_P = mkdir -p 

INCLUDES = -Iinclude

SRC_DIR = src
OBJ_DIR = obj
OUT_DIR = bin

OBJS = $(OBJ_DIR)/uriparser.o $(OBJ_DIR)/socketoptions.o 


all : directories $(LIB_NAME) 

.PHONY:	directories
directories:	$(OBJ_DIR) $(OUT_DIR) 

$(OUT_DIR):
	@${MKDIR_P} $(OUT_DIR)

$(OBJ_DIR):
	@${MKDIR_P} $(OBJ_DIR)

$(LIB_NAME) : $(OBJS)
	$(AR) $(AR_FLAGS) $(OUT_DIR)/$(LIB_NAME).1.0.0 $(OBJS) -lc

$(OBJ_DIR)/%.o:	$(SRC_DIR)/%.cpp
	$(CXX) -c $(CFLAGS) $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

clean:
	$(RM) $(OBJS) $(OUT_DIR)/$(LIB_NAME).1.0.0
