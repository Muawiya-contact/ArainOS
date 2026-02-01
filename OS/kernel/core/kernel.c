#include "../../include/kernel/panic.h"
#include "../../include/libk/stdio.h"

void kernel_main(void)
{
    kprintf("Hello ArainOS\n");
    kernel_panic("halt");
}
