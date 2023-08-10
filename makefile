#!/bin/bash

# Makefile生成器脚本

# 搜索当前目录中的.c和.cpp文件
C_SOURCES=$(wildcard *.c)
CPP_SOURCES=$(wildcard *.cpp)

# 设置编译器和编译选项
CC=gcc
CXX=g++
CFLAGS=-Wall
CXXFLAGS=-Wall -std=c++17

# 目标文件
C_OBJECTS=$(C_SOURCES:.c=.o)
CPP_OBJECTS=$(CPP_SOURCES:.cpp=.o)

# 可执行文件名
EXECUTABLE=main

# 默认目标：生成可执行文件
all: $(EXECUTABLE)

# 生成可执行文件
$(EXECUTABLE): $(C_OBJECTS) $(CPP_OBJECTS)
	$(CXX) $(CXXFLAGS) $(C_OBJECTS) $(CPP_OBJECTS) -o $@

# 编译.c文件为.o文件
.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

# 编译.cpp文件为.o文件
.cpp.o:
	$(CXX) $(CXXFLAGS) -c $< -o $@

# 清除编译生成的文件
clean:
	rm -f $(C_OBJECTS) $(CPP_OBJECTS) $(EXECUTABLE)
