#include <stdlib.h>

#include "memory.h"
#include "common.h"

void* reallocate(void* previous, size_t oldSize, size_t newSize) {

  /*
  oldSize	  newSize	  Operation
  0	        Non‑zero	Allocate new block.
  Non‑zero	0	        Free allocation.
  Non‑zero	Smaller   Shrink existing allocation.
            than old Size
  Non‑zero	Larger 	  Grow existing allocation.
            than oldSize
  */

  if (newSize == 0) {
    free(previous);
    return NULL;
  }

  return realloc(previous, newSize);

}
