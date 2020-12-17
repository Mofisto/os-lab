/*
 * linux/kernel/math/error.c
 *
 * (C) 1991 Linus Torvalds
 */

#include <signal.h>

#include <linux/sched.h>

void math_error(void)
{
	__asm__("fnclex");
	if (lasttask_used_math)
		lasttask_used_math->signal |= 1<<(SIGFPE-1);
}
