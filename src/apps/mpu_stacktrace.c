#include "AN505.h"

#include <assert.h>

static void do_some_work(uint8_t* work_list);

int main() {
  // Random-ish data to make some stack frames for testing.
  uint8_t work_items[8];
  uint8_t* work = work_items;
  *work++ = 1;
  *work++ = 2;
  *work++ = 2;
  *work++ = 1;
  *work++ = 2;
  *work++ = 1;
  *work++ = 1;
  *work++ = 0;
  assert(work - work_items <= sizeof(work_items));

  do_some_work(work_items);
  return 0;
}

// Just some pretend functions to create a deep stack
// and (hopefully)avoid compiler inlining and tail call elision.

static uint32_t handle_data(uint8_t* next_work);

static uint32_t base_case(uint8_t* next_work) {
  (void)next_work;
  return 0;
}

static uint32_t xform1(uint8_t* next_work) {
  uint32_t val = handle_data(next_work);
  return val + 1;
}

static uint32_t xform2(uint8_t* next_work) {
  uint32_t val = handle_data(next_work);
  return val * 2;
}

static const uint32_t(*fn_ptrs[3])(uint8_t*) = {
  base_case,
  xform1,
  xform2,
};

static uint32_t handle_data(uint8_t* next_work) {
  uint32_t(*fn_ptr)(uint8_t*) = fn_ptrs[*next_work];
  return fn_ptr(next_work + 1);
}

static volatile uint32_t result;

static void do_some_work(uint8_t* work_list) {
  uint32_t ret = handle_data(work_list);
  for (;;) {
    result = ret;
  }
}
