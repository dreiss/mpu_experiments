#include <uart_simple.h>

int main() {
  uart_init();
  uart_puts("Hello, world!\n");
  return 0;
}
