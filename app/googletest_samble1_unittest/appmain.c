/*
 * Copyright (c) 2023 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "gtest_main.h"

typedef struct _root_arg_t
{
    int argc;
    char ** argv;
} root_arg_t;

root_arg_t g_root_arg;

static void root_func(void *arg);

int appmain(int argc, char * argv[])
{
    int r;
    (void) r;

    g_root_arg.argc = argc;
    g_root_arg.argv = argv;

#if defined(UBINOS_PRESENT)
    r = task_create(NULL, root_func, &g_root_arg, task_getmiddlepriority(), 0, "root");
    ubi_assert(r == 0);

    ubik_comp_start();
#else
    root_func(&g_root_arg);
    r = 0;
#endif /* defined(UBINOS_PRESENT) */

    return r;
}

static void root_func(void *arg)
{
    int r;
    (void) r;
    root_arg_t * ra = (root_arg_t *) arg;

    printf("\n\n\n");
    printf("================================================================================\n");
    printf("googletest_samble1_unittest (build time: %s %s)\n", __TIME__, __DATE__);
    printf("================================================================================\n");
    printf("\n");

    r = gtest_main(ra->argc, ra->argv);
    ubi_assert(r == 0);
}
