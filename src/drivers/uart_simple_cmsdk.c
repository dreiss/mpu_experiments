#include <AN505.h>
#include <check.h>

#include "uart_simple.h"
#include "uart_cmsdk_drv.h"

static struct uart_cmsdk_dev_cfg_t dev_cfg = {
  .base = AN505_UART0_BASE,
  .default_baudrate = 115200,
};

static struct uart_cmsdk_dev_data_t dev_data;

static struct uart_cmsdk_dev_t dev = {
  .cfg = &dev_cfg,
  .data = &dev_data,
};


void uart_init() {
  enum uart_cmsdk_error_t ret = uart_cmsdk_init(&dev, SystemCoreClock);
  check(ret == UART_CMSDK_ERR_NONE);
}

void uart_putchar(uint8_t c) {
  while (!uart_cmsdk_tx_ready(&dev)) /* WAIT */ ;
  enum uart_cmsdk_error_t ret = uart_cmsdk_write(&dev, c);
  check(ret == UART_CMSDK_ERR_NONE);
}

void uart_puts(const char* s) {
  while (*s) {
    uart_putchar((uint8_t)*s++);
  }
}
