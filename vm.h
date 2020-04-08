#ifndef clox_vm_h
#define clox_vm_h

#include "chunk.h"

typedef struct {
  Chunk* chunk;
  u_int8_t* ip;
} VM;

typedef enum {
  INTERPRETER_OK,
  INTERPRETER_COMPILE_ERROR,
  INTERPRETER_RUNTIME_ERROR
} InterpretResult;

void initVM();
void freeVM();
InterpretResult interpret(Chunk* chunk);

#endif