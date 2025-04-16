#include "d_s_lib.h"
#include "./pr-demo/pr_demo.h"


#include <stdio.h>


void static_lib_print()
{
	printf("%s \n", __func__);
	pr_test();
}
