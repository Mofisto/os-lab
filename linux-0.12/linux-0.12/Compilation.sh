#本脚本是修改 Linux 0.12 源码之后
#使得源码能够在gcc 3.4的情况下编译
#请将该脚本放在 Liunx 0.12 源码目录执行
#sudo apt-get update 
#sudo apt-get install bin86
#处理 Makefile
find . -name "Makefile" -type f |xargs sed -i 's/gar/ar/g'
find . -name "Makefile" -type f |xargs sed -i 's/gas/as/g'
find . -name "Makefile" -type f |xargs sed -i 's/gld/ld/g'
find . -name "Makefile" -type f |xargs sed -i 's/-fcombine-regs//g'
find . -name "Makefile" -type f |xargs sed -i 's/-mstring-insns//g'
find . -name "Makefile" -type f |xargs sed -i 's/$(AS)/$(AS) --32/g'
find . -name "Makefile" -type f |xargs sed -i 's/$(LD)/$(LD) -m elf_i386/g'
find . -name "Makefile" -type f |xargs sed -i 's/-Wall/-Wall -m32 /g'

#处理汇编语法
sed -i 's/.align 2/.align 4/g' boot/head.s
sed -i 's/.align 3/.align 8/g' boot/head.s

sed -i '176s/:"ax"//g' init/main.c
sed -i '34s/:"si","di","ax"//g' include/string.h
sed -i '50s/:"si","di","ax","cx"//g' include/string.h
sed -i '64s/:"si","di","ax","cx"//g' include/string.h
sed -i '84s/:"si","di","ax","cx"//g' include/string.h
sed -i '103s/:"si","di"//g' include/string.h
sed -i '124s/:"si","di","cx"//g' include/string.h
sed -i '141s/:"si"//g' include/string.h
sed -i '157s/:"ax","si"//g' include/string.h
sed -i '181s/:"ax","cx","dx","di"//g' include/string.h
sed -i '205s/:"ax","cx","dx","di"//g' include/string.h
sed -i '232s/:"ax","cx","dx","di"//g' include/string.h
sed -i '259s/:"cx","dx","di","si"//g' include/string.h
sed -i '271s/:"di"//g' include/string.h
sed -i '332s/:"ax","cx","dx","di"//g' include/string.h
sed -i '342s/:"cx","si","di"//g' include/string.h
sed -i '353s/:"cx","si","di"//g' include/string.h
sed -i '359s/:"cx","si","di"//g' include/string.h
sed -i '375s/:"si","di","cx"//g' include/string.h
sed -i '391s/:"cx"//g' include/string.h
sed -i '401s/:"cx","di"//g' include/string.h
sed -i '248s/:"dx"//g' include/linux/sched.h
sed -i '45s/:"cx","di","si"//g' mm/memory.c
sed -i '191s/:"di","cx","dx"//g' mm/swap.c
sed -i '288s/:"cx","di","si"//g' fs/buffer.c
sed -i '27s/"r"/"q"/g' include/asm/segment.h
sed -i '260s/:"dx"//g' include/linux/sched.h
sed -i '82s/:"cx","di","si"//g' fs/namei.c
sed -i '17s/:"cx","di"//g' fs/bitmap.c
sed -i '44s/:"ax","dx","si"//g' fs/bitmap.c
sed -i '159s/:"cx","di","si"//g' kernel/blk_drv/floppy.c
sed -i '65s/:"cx","di"//g' kernel/blk_drv/hd.c
sed -i '68s/:"cx","si"//g' kernel/blk_drv/hd.c
sed -i '12s/:"di","si","cx"//g' include/asm/memory.h
sed -i '5s/"=r"/"=q"/g' include/asm/segment.h
sed -i '209s/:"cx","di","si"//g' kernel/chr_drv/console.c
sed -i '220s/:"cx","di"//g' kernel/chr_drv/console.c
sed -i '234s/:"cx","di","si"//g' kernel/chr_drv/console.c
sed -i '249s/:"cx","di","si"//g' kernel/chr_drv/console.c
sed -i '270s/:"ax","cx","di","si"//g' kernel/chr_drv/console.c
sed -i '285s/:"ax","cx","di","si"//g' kernel/chr_drv/console.c
sed -i '350s/:"cx","di"//g' kernel/chr_drv/console.c
sed -i '381s/:"cx","di"//g' kernel/chr_drv/console.c
sed -i '604s/:"ax"//g' kernel/chr_drv/console.c
sed -i '1020s/:"ax"//g' kernel/chr_drv/console.c

#
sed -i 's/extern inline/static inline/g' include/linux/mm.h
sed -i 's/extern inline/static inline/g' include/asm/segment.h
sed -i 's/extern inline/static inline/g'  include/string.h

#处理函数，去除下划线
find . -type f |xargs sed -i 's/stack_start/stack_start/g'
find . -type f |xargs sed -i 's/main/main/g'
find . -type f |xargs sed -i 's/printk/printk/g'
find . -type f |xargs sed -i 's/current/current/g'
find . -type f |xargs sed -i 's/lasttask_used_math/lasttask_used_math/g'
find . -type f |xargs sed -i 's/gdt/gdt/g'
find . -type f |xargs sed -i 's/timer_interrupt/timer_interrupt/g'
find . -type f |xargs sed -i 's/idt/idt/g'
find . -type f |xargs sed -i 's/system_call/system_call/g'
find . -type f |xargs sed -i 's/schedule/schedule/g'
find . -type f |xargs sed -i 's/NR_syscalls/NR_syscalls/g'
find . -type f |xargs sed -i 's/sys_call_table/sys_call_table/g'
find . -type f |xargs sed -i 's/task/task/g'
find . -type f |xargs sed -i 's/do_signal/do_signal/g'
find . -type f |xargs sed -i 's/math_error/math_error/g'
find . -type f |xargs sed -i 's/math_state_restore/math_state_restore/g'
find . -type f |xargs sed -i 's/math_emulate/math_emulate/g'
find . -type f |xargs sed -i 's/jiffies/jiffies/g'
find . -type f |xargs sed -i 's/do_timer/do_timer/g'
find . -type f |xargs sed -i 's/do_execve/do_execve/g'
find . -type f |xargs sed -i 's/find_empty_process/find_empty_process/g'
find . -type f |xargs sed -i 's/copy_process/copy_process/g'
find . -type f |xargs sed -i 's/hd_timeout/hd_timeout/g'
find . -type f |xargs sed -i 's/do_hd/do_hd/g'
find . -type f |xargs sed -i 's/unexpectedhd_interrupt/unexpectedhd_interrupt/g'
find . -type f |xargs sed -i 's/do_floppy/do_floppy/g'
find . -type f |xargs sed -i 's/unexpectedfloppy_interrupt/unexpectedfloppy_interrupt/g'
find . -type f |xargs sed -i 's/divide_error/divide_error/g'
find . -type f |xargs sed -i 's/debug/debug/g'
find . -type f |xargs sed -i 's/nmi/nmi/g'
find . -type f |xargs sed -i 's/int3/int3/g'
find . -type f |xargs sed -i 's/overflow/overflow/g'
find . -type f |xargs sed -i 's/bounds/bounds/g'
find . -type f |xargs sed -i 's/invalid_op/invalid_op/g'
find . -type f |xargs sed -i 's/device_not_available/device_not_available/g'
find . -type f |xargs sed -i 's/double_fault/double_fault/g'
find . -type f |xargs sed -i 's/coprocessor_segment_overrun/coprocessor_segment_overrun/g'
find . -type f |xargs sed -i 's/invalid_TSS/invalid_TSS/g'
find . -type f |xargs sed -i 's/segment_not_present/segment_not_present/g'
find . -type f |xargs sed -i 's/stack_segment/stack_segment/g'
find . -type f |xargs sed -i 's/general_protection/general_protection/g'
find . -type f |xargs sed -i 's/page_fault/page_fault/g'
find . -type f |xargs sed -i 's/reserved/reserved/g'
find . -type f |xargs sed -i 's/coprocessor_error/coprocessor_error/g'
find . -type f |xargs sed -i 's/alignment_check/alignment_check/g'
find . -type f |xargs sed -i 's/irq13/irq13/g'
find . -type f |xargs sed -i 's/parallel_interrupt/parallel_interrupt/g'
find . -type f |xargs sed -i 's/dodivide_error/dodivide_error/g'
find . -type f |xargs sed -i 's/doint3/doint3/g'
find . -type f |xargs sed -i 's/donmi/donmi/g'
find . -type f |xargs sed -i 's/doint3/doint3/g'
find . -type f |xargs sed -i 's/dooverflow/dooverflow/g'
find . -type f |xargs sed -i 's/dobounds/dobounds/g'
find . -type f |xargs sed -i 's/doinvalid_op/doinvalid_op/g'
find . -type f |xargs sed -i 's/docoprocessor_segment_overrun/docoprocessor_segment_overrun/g'
find . -type f |xargs sed -i 's/doreserved/doreserved/g'
find . -type f |xargs sed -i 's/dodouble_fault/dodouble_fault/g'
find . -type f |xargs sed -i 's/doinvalid_TSS/doinvalid_TSS/g'
find . -type f |xargs sed -i 's/dosegment_not_present/dosegment_not_present/g'
find . -type f |xargs sed -i 's/dostack_segment/dostack_segment/g'
find . -type f |xargs sed -i 's/dogeneral_protection/dogeneral_protection/g'
find . -type f |xargs sed -i 's/doalignment_check/doalignment_check/g'
find . -type f |xargs sed -i 's/pg_dir/pg_dir/g'
find . -type f |xargs sed -i 's/sys_fork/sys_fork/g'
find . -type f |xargs sed -i 's/sys_execve/sys_execve/g'
find . -type f |xargs sed -i 's/do_no_page/do_no_page/g'
find . -type f |xargs sed -i 's/do_wp_page/do_wp_page/g'
find . -type f |xargs sed -i 's/tmp_floppy_area/tmp_floppy_area/g'
find . -type f |xargs sed -i 's/floppy_interrupt/floppy_interrupt/g'
find . -type f |xargs sed -i 's/hd_interrupt/hd_interrupt/g'
find . -type f |xargs sed -i 's/video_num_columns/video_num_columns/g'
find . -type f |xargs sed -i 's/keyboard_interrupt/keyboard_interrupt/g'
find . -type f |xargs sed -i 's/rs1_interrupt/rs1_interrupt/g'
find . -type f |xargs sed -i 's/rs2_interrupt/rs2_interrupt/g'
find . -type f |xargs sed -i 's/blankinterval/blankinterval/g'
find . -type f |xargs sed -i 's/blankcount/blankcount/g'
find . -type f |xargs sed -i 's/do_tty_interrupt/do_tty_interrupt/g'
find . -type f |xargs sed -i 's/table_list/table_list/g'
find . -type f |xargs sed -i 's/show_mem/show_mem/g'
find . -type f |xargs sed -i 's/show_state/show_state/g'
find . -type f |xargs sed -i 's/change_console/change_console/g'


#
sed -i '161,163d'  fs/exec.c
sed -i '162i\if (!pag && !(pag = (unsigned long *) get_free_page()))'  fs/exec.c

sed -i '156d' lib/malloc.c
sed -i '156i\cp = get_free_page();bdesc->freeptr = cp;bdesc->page = bdesc->freeptr;' lib/malloc.c

#
sed -i 's/extern inline/static inline/g' kernel/blk_drv/blk.h
sed -i '15s/.globl/.globl startup_32,/g' boot/head.s

sed -i '58s/$(LD)/$(LD) -e startup_32 -Ttext=0x0/g' Makefile

#解决 “puts"等错误
sed -i '14s/-Wall/-Wall -fno-builtin/g' Makefile

#解决”referencia a `MINOR' sin definir“错误
sed -i '1i\#define MAJOR(a) (((unsigned)(a))>>8)' tools/build.c
sed -i '2i\#define MINOR(a) ((a)&0xff)' tools/build.c

#解决 ”/dev/hd6: No such file or directory“错误
sed -i 's/\/dev\/hd6/FLOPPY/g' Makefile
sed -i 's/\/dev\/hd2//g' Makefile

#解决 ”Non-GCC header of 'system'“错误
sed -i '190s/^/\/\/&/' tools/build.c
sed -i '191s/^/\/\/&/' tools/build.c
sed -i '197s/^/\/\/&/' tools/build.c
sed -i '198s/^/\/\/&/' tools/build.c


#替换的格式可能不太好看，但是能用

#
sed -i 's/static inline/inline/g' init/main.c
sed -i 's/static int printf/int printf/g' init/main.c



