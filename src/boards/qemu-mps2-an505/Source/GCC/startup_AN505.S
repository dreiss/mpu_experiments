/**************************************************************************//**
 * @file     startup_AN505.S
 * @brief    CMSIS-Core(M) Device Startup File for
 *           Device QEMU-mps2-an505
 * @version  V1.0.0
 * @date     20. January 2021
 ******************************************************************************/
/*
 * Copyright (c) 2009-2021 Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifdef USING_UNWIND
#define FNSTART .fnstart
#define FNEND .fnend
#else
#define FNSTART
#define FNEND
#endif

                .syntax  unified
                .arch    armv8-m.main

                #define __INITIAL_SP     __StackTop
                #define __STACK_LIMIT    __StackLimit
                #if defined (__ARM_FEATURE_CMSE) && (__ARM_FEATURE_CMSE == 3U)
                #define __STACK_SEAL     __StackSeal
                #endif

                .section .vectors
                .align   2
                .globl   __Vectors
                .globl   __Vectors_End
                .globl   __Vectors_Size
__Vectors:
                .long    __INITIAL_SP                       /*     Initial Stack Pointer */
                .long    Reset_Handler                      /*     Reset Handler */
                .long    NMI_Handler                        /* -14 NMI Handler */
                .long    HardFault_Handler                  /* -13 Hard Fault Handler */
                .long    MemManage_Handler                  /* -12 MPU Fault Handler */
                .long    BusFault_Handler                   /* -11 Bus Fault Handler */
                .long    UsageFault_Handler                 /* -10 Usage Fault Handler */
                .long    SecureFault_Handler                /*  -9 Secure Fault Handler */
                .long    0                                  /*     Reserved */
                .long    0                                  /*     Reserved */
                .long    0                                  /*     Reserved */
                .long    SVC_Handler                        /*  -5 SVCall Handler */
                .long    DebugMon_Handler                   /*  -4 Debug Monitor Handler */
                .long    0                                  /*     Reserved */
                .long    PendSV_Handler                     /*  -2 PendSV Handler */
                .long    SysTick_Handler                    /*  -1 SysTick Handler */

                .long    Interrupt0_Handler                 /*   0 */
                .long    Interrupt1_Handler                 /*   1 */
                .long    Interrupt2_Handler                 /*   2 */
                .long    Interrupt3_Handler                 /*   3 */
                .long    Interrupt4_Handler                 /*   4 */
                .long    Interrupt5_Handler                 /*   5 */
                .long    Interrupt6_Handler                 /*   6 */
                .long    Interrupt7_Handler                 /*   7 */
                .long    Interrupt8_Handler                 /*   8 */
                .long    Interrupt9_Handler                 /*   9 */
                .long    Interrupt10_Handler                /*  10 */
                .long    Interrupt11_Handler                /*  11 */
                .long    Interrupt12_Handler                /*  12 */
                .long    Interrupt13_Handler                /*  13 */
                .long    Interrupt14_Handler                /*  14 */
                .long    Interrupt15_Handler                /*  15 */
                .long    Interrupt16_Handler                /*  16 */
                .long    Interrupt17_Handler                /*  17 */
                .long    Interrupt18_Handler                /*  18 */
                .long    Interrupt19_Handler                /*  19 */
                .long    Interrupt20_Handler                /*  20 */
                .long    Interrupt21_Handler                /*  21 */
                .long    Interrupt22_Handler                /*  22 */
                .long    Interrupt23_Handler                /*  23 */
                .long    Interrupt24_Handler                /*  24 */
                .long    Interrupt25_Handler                /*  25 */
                .long    Interrupt26_Handler                /*  26 */
                .long    Interrupt27_Handler                /*  27 */
                .long    Interrupt28_Handler                /*  28 */
                .long    Interrupt29_Handler                /*  29 */
                .long    Interrupt30_Handler                /*  30 */
                .long    Interrupt31_Handler                /*  31 */
                .long    Interrupt32_Handler                /*  32 */
                .long    Interrupt33_Handler                /*  33 */
                .long    Interrupt34_Handler                /*  34 */
                .long    Interrupt35_Handler                /*  35 */
                .long    Interrupt36_Handler                /*  36 */
                .long    Interrupt37_Handler                /*  37 */
                .long    Interrupt38_Handler                /*  38 */
                .long    Interrupt39_Handler                /*  39 */
                .long    Interrupt40_Handler                /*  40 */
                .long    Interrupt41_Handler                /*  41 */
                .long    Interrupt42_Handler                /*  42 */
                .long    Interrupt43_Handler                /*  43 */
                .long    Interrupt44_Handler                /*  44 */
                .long    Interrupt45_Handler                /*  45 */
                .long    Interrupt46_Handler                /*  46 */
                .long    Interrupt47_Handler                /*  47 */
                .long    Interrupt48_Handler                /*  48 */
                .long    Interrupt49_Handler                /*  49 */
                .long    Interrupt50_Handler                /*  50 */
                .long    Interrupt51_Handler                /*  51 */
                .long    Interrupt52_Handler                /*  52 */
                .long    Interrupt53_Handler                /*  53 */
                .long    Interrupt54_Handler                /*  54 */
                .long    Interrupt55_Handler                /*  55 */
                .long    Interrupt56_Handler                /*  56 */
                .long    Interrupt57_Handler                /*  57 */
                .long    Interrupt58_Handler                /*  58 */
                .long    Interrupt59_Handler                /*  59 */
                .long    Interrupt60_Handler                /*  60 */
                .long    Interrupt61_Handler                /*  61 */
                .long    Interrupt62_Handler                /*  62 */
                .long    Interrupt63_Handler                /*  63 */
                .long    Interrupt64_Handler                /*  64 */
                .long    Interrupt65_Handler                /*  65 */
                .long    Interrupt66_Handler                /*  66 */
                .long    Interrupt67_Handler                /*  67 */
                .long    Interrupt68_Handler                /*  68 */
                .long    Interrupt69_Handler                /*  69 */
                .long    Interrupt70_Handler                /*  70 */
                .long    Interrupt71_Handler                /*  71 */
                .long    Interrupt72_Handler                /*  72 */
                .long    Interrupt73_Handler                /*  73 */
                .long    Interrupt74_Handler                /*  74 */
                .long    Interrupt75_Handler                /*  75 */
                .long    Interrupt76_Handler                /*  76 */
                .long    Interrupt77_Handler                /*  77 */
                .long    Interrupt78_Handler                /*  78 */
                .long    Interrupt79_Handler                /*  79 */
                .long    Interrupt80_Handler                /*  80 */
                .long    Interrupt81_Handler                /*  81 */
                .long    Interrupt82_Handler                /*  82 */
                .long    Interrupt83_Handler                /*  83 */
                .long    Interrupt84_Handler                /*  84 */
                .long    Interrupt85_Handler                /*  85 */
                .long    Interrupt86_Handler                /*  86 */
                .long    Interrupt87_Handler                /*  87 */
                .long    Interrupt88_Handler                /*  88 */
                .long    Interrupt89_Handler                /*  89 */
                .long    Interrupt90_Handler                /*  90 */
                .long    Interrupt91_Handler                /*  91 */
                .long    Interrupt92_Handler                /*  92 */
                .long    Interrupt93_Handler                /*  93 */
                .long    Interrupt94_Handler                /*  94 */
                .long    Interrupt95_Handler                /*  95 */
                .long    Interrupt96_Handler                /*  96 */
                .long    Interrupt97_Handler                /*  97 */
                .long    Interrupt98_Handler                /*  98 */
                .long    Interrupt99_Handler                /*  99 */
                .long    Interrupt100_Handler               /* 100 */
                .long    Interrupt101_Handler               /* 101 */
                .long    Interrupt102_Handler               /* 102 */
                .long    Interrupt103_Handler               /* 103 */
                .long    Interrupt104_Handler               /* 104 */
                .long    Interrupt105_Handler               /* 105 */
                .long    Interrupt106_Handler               /* 106 */
                .long    Interrupt107_Handler               /* 107 */
                .long    Interrupt108_Handler               /* 108 */
                .long    Interrupt109_Handler               /* 109 */
                .long    Interrupt110_Handler               /* 110 */
                .long    Interrupt111_Handler               /* 111 */
                .long    Interrupt112_Handler               /* 112 */
                .long    Interrupt113_Handler               /* 113 */
                .long    Interrupt114_Handler               /* 114 */
                .long    Interrupt115_Handler               /* 115 */
                .long    Interrupt116_Handler               /* 116 */
                .long    Interrupt117_Handler               /* 117 */
                .long    Interrupt118_Handler               /* 118 */
                .long    Interrupt119_Handler               /* 119 */
                .long    Interrupt120_Handler               /* 120 */
                .long    Interrupt121_Handler               /* 121 */
                .long    Interrupt122_Handler               /* 122 */
                .long    Interrupt123_Handler               /* 123 */

                // Shouldn't be necessary since we filled up the table.
                // .space   (x * 4)                          /* Interrupts x .. 480 are left out */
__Vectors_End:
                .equ     __Vectors_Size, __Vectors_End - __Vectors
                .size    __Vectors, . - __Vectors


                .thumb
                .section .text
                .align   2

                .thumb_func
                .type    Reset_Handler, %function
                .globl   Reset_Handler
                FNSTART
Reset_Handler:
                ldr      r0, =__INITIAL_SP
                msr      psp, r0

                ldr      r0, =__STACK_LIMIT
                msr      msplim, r0
                msr      psplim, r0

                #if defined (__ARM_FEATURE_CMSE) && (__ARM_FEATURE_CMSE == 3U)
                ldr      r0, =__STACK_SEAL
                ldr      r1, =0xFEF5EDA5U
                strd     r1,r1,[r0,#0]
                #endif

                bl       SystemInit

                ldr      r4, =__copy_table_start__
                ldr      r5, =__copy_table_end__

.L_loop0:
                cmp      r4, r5
                bge      .L_loop0_done
                ldr      r1, [r4]                /* source address */
                ldr      r2, [r4, #4]            /* destination address */
                ldr      r3, [r4, #8]            /* word count */
                lsl      r3, r3, #2              /* byte count */

.L_loop0_0:
                subs     r3, #4                  /* decrement byte count */
                ittt     ge
                ldrge    r0, [r1, r3]
                strge    r0, [r2, r3]
                bge      .L_loop0_0

                adds     r4, #12
                b        .L_loop0
.L_loop0_done:

                ldr      r3, =__zero_table_start__
                ldr      r4, =__zero_table_end__

.L_loop2:
                cmp      r3, r4
                bge      .L_loop2_done
                ldr      r1, [r3]                /* destination address */
                ldr      r2, [r3, #4]            /* word count */
                lsl      r2, r2, #2              /* byte count */
                movs     r0, 0

.L_loop2_0:
                subs     r2, #4                  /* decrement byte count */
                itt      ge
                strge    r0, [r1, r2]
                bge      .L_loop2_0

                adds     r3, #8
                b        .L_loop2
.L_loop2_done:

                bl       _start

                FNEND
                .size    Reset_Handler, . - Reset_Handler


/* The default macro is not used for HardFault_Handler
 * because this results in a poor debug illusion.
 */
                .thumb_func
                .type    HardFault_Handler, %function
                .weak    HardFault_Handler
                FNSTART
HardFault_Handler:
                b        .
                FNEND
                .size    HardFault_Handler, . - HardFault_Handler

                .thumb_func
                .type    Default_Handler, %function
                .weak    Default_Handler
                FNSTART
Default_Handler:
                b        .
                FNEND
                .size    Default_Handler, . - Default_Handler

/* Macro to define default exception/interrupt handlers.
 * Default handler are weak symbols with an endless loop.
 * They can be overwritten by real handlers.
 */
                .macro   Set_Default_Handler  Handler_Name
                .weak    \Handler_Name
                .set     \Handler_Name, Default_Handler
                .endm


/* Default exception/interrupt handler */
                Set_Default_Handler  NMI_Handler
                Set_Default_Handler  MemManage_Handler
                Set_Default_Handler  BusFault_Handler
                Set_Default_Handler  UsageFault_Handler
                Set_Default_Handler  SecureFault_Handler
                Set_Default_Handler  SVC_Handler
                Set_Default_Handler  DebugMon_Handler
                Set_Default_Handler  PendSV_Handler
                Set_Default_Handler  SysTick_Handler

                Set_Default_Handler  Interrupt0_Handler
                Set_Default_Handler  Interrupt1_Handler
                Set_Default_Handler  Interrupt2_Handler
                Set_Default_Handler  Interrupt3_Handler
                Set_Default_Handler  Interrupt4_Handler
                Set_Default_Handler  Interrupt5_Handler
                Set_Default_Handler  Interrupt6_Handler
                Set_Default_Handler  Interrupt7_Handler
                Set_Default_Handler  Interrupt8_Handler
                Set_Default_Handler  Interrupt9_Handler
                Set_Default_Handler  Interrupt10_Handler
                Set_Default_Handler  Interrupt11_Handler
                Set_Default_Handler  Interrupt12_Handler
                Set_Default_Handler  Interrupt13_Handler
                Set_Default_Handler  Interrupt14_Handler
                Set_Default_Handler  Interrupt15_Handler
                Set_Default_Handler  Interrupt16_Handler
                Set_Default_Handler  Interrupt17_Handler
                Set_Default_Handler  Interrupt18_Handler
                Set_Default_Handler  Interrupt19_Handler
                Set_Default_Handler  Interrupt20_Handler
                Set_Default_Handler  Interrupt21_Handler
                Set_Default_Handler  Interrupt22_Handler
                Set_Default_Handler  Interrupt23_Handler
                Set_Default_Handler  Interrupt24_Handler
                Set_Default_Handler  Interrupt25_Handler
                Set_Default_Handler  Interrupt26_Handler
                Set_Default_Handler  Interrupt27_Handler
                Set_Default_Handler  Interrupt28_Handler
                Set_Default_Handler  Interrupt29_Handler
                Set_Default_Handler  Interrupt30_Handler
                Set_Default_Handler  Interrupt31_Handler
                Set_Default_Handler  Interrupt32_Handler
                Set_Default_Handler  Interrupt33_Handler
                Set_Default_Handler  Interrupt34_Handler
                Set_Default_Handler  Interrupt35_Handler
                Set_Default_Handler  Interrupt36_Handler
                Set_Default_Handler  Interrupt37_Handler
                Set_Default_Handler  Interrupt38_Handler
                Set_Default_Handler  Interrupt39_Handler
                Set_Default_Handler  Interrupt40_Handler
                Set_Default_Handler  Interrupt41_Handler
                Set_Default_Handler  Interrupt42_Handler
                Set_Default_Handler  Interrupt43_Handler
                Set_Default_Handler  Interrupt44_Handler
                Set_Default_Handler  Interrupt45_Handler
                Set_Default_Handler  Interrupt46_Handler
                Set_Default_Handler  Interrupt47_Handler
                Set_Default_Handler  Interrupt48_Handler
                Set_Default_Handler  Interrupt49_Handler
                Set_Default_Handler  Interrupt50_Handler
                Set_Default_Handler  Interrupt51_Handler
                Set_Default_Handler  Interrupt52_Handler
                Set_Default_Handler  Interrupt53_Handler
                Set_Default_Handler  Interrupt54_Handler
                Set_Default_Handler  Interrupt55_Handler
                Set_Default_Handler  Interrupt56_Handler
                Set_Default_Handler  Interrupt57_Handler
                Set_Default_Handler  Interrupt58_Handler
                Set_Default_Handler  Interrupt59_Handler
                Set_Default_Handler  Interrupt60_Handler
                Set_Default_Handler  Interrupt61_Handler
                Set_Default_Handler  Interrupt62_Handler
                Set_Default_Handler  Interrupt63_Handler
                Set_Default_Handler  Interrupt64_Handler
                Set_Default_Handler  Interrupt65_Handler
                Set_Default_Handler  Interrupt66_Handler
                Set_Default_Handler  Interrupt67_Handler
                Set_Default_Handler  Interrupt68_Handler
                Set_Default_Handler  Interrupt69_Handler
                Set_Default_Handler  Interrupt70_Handler
                Set_Default_Handler  Interrupt71_Handler
                Set_Default_Handler  Interrupt72_Handler
                Set_Default_Handler  Interrupt73_Handler
                Set_Default_Handler  Interrupt74_Handler
                Set_Default_Handler  Interrupt75_Handler
                Set_Default_Handler  Interrupt76_Handler
                Set_Default_Handler  Interrupt77_Handler
                Set_Default_Handler  Interrupt78_Handler
                Set_Default_Handler  Interrupt79_Handler
                Set_Default_Handler  Interrupt80_Handler
                Set_Default_Handler  Interrupt81_Handler
                Set_Default_Handler  Interrupt82_Handler
                Set_Default_Handler  Interrupt83_Handler
                Set_Default_Handler  Interrupt84_Handler
                Set_Default_Handler  Interrupt85_Handler
                Set_Default_Handler  Interrupt86_Handler
                Set_Default_Handler  Interrupt87_Handler
                Set_Default_Handler  Interrupt88_Handler
                Set_Default_Handler  Interrupt89_Handler
                Set_Default_Handler  Interrupt90_Handler
                Set_Default_Handler  Interrupt91_Handler
                Set_Default_Handler  Interrupt92_Handler
                Set_Default_Handler  Interrupt93_Handler
                Set_Default_Handler  Interrupt94_Handler
                Set_Default_Handler  Interrupt95_Handler
                Set_Default_Handler  Interrupt96_Handler
                Set_Default_Handler  Interrupt97_Handler
                Set_Default_Handler  Interrupt98_Handler
                Set_Default_Handler  Interrupt99_Handler
                Set_Default_Handler  Interrupt100_Handler
                Set_Default_Handler  Interrupt101_Handler
                Set_Default_Handler  Interrupt102_Handler
                Set_Default_Handler  Interrupt103_Handler
                Set_Default_Handler  Interrupt104_Handler
                Set_Default_Handler  Interrupt105_Handler
                Set_Default_Handler  Interrupt106_Handler
                Set_Default_Handler  Interrupt107_Handler
                Set_Default_Handler  Interrupt108_Handler
                Set_Default_Handler  Interrupt109_Handler
                Set_Default_Handler  Interrupt110_Handler
                Set_Default_Handler  Interrupt111_Handler
                Set_Default_Handler  Interrupt112_Handler
                Set_Default_Handler  Interrupt113_Handler
                Set_Default_Handler  Interrupt114_Handler
                Set_Default_Handler  Interrupt115_Handler
                Set_Default_Handler  Interrupt116_Handler
                Set_Default_Handler  Interrupt117_Handler
                Set_Default_Handler  Interrupt118_Handler
                Set_Default_Handler  Interrupt119_Handler
                Set_Default_Handler  Interrupt120_Handler
                Set_Default_Handler  Interrupt121_Handler
                Set_Default_Handler  Interrupt122_Handler
                Set_Default_Handler  Interrupt123_Handler


                // By default, it seems the linker treats .copy.table and
                // .zero.table as mode RWX, which triggers a linker warning.
                // However, if we create empty readonly sections here,
                // we can include them in those output sections, which
                // forces them to be readonly, eliminating the warning.
                .section .force_readonly_copy
                .section .force_readonly_zero


                .end
