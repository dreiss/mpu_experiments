#pragma once

#include <stdint.h>

void uart_init(void);
void uart_putchar(uint8_t c);
void uart_puts(const char* s);
