#pragma once

#include <AN505.h>

#define check(cond) do { if (!cond) { __BKPT(0); } } while (0)
