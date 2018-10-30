/************************************************************************************
 *  (c) Copyright 2014-2015 Falcon Computing Solutions, Inc. All rights reserved.
 *
 *  This file contains confidential and proprietary information
 *  of Falcon Computing Solutions, Inc. and is protected under U.S. and
 *  international copyright and other intellectual property laws.
 *
 ************************************************************************************/

#ifndef __MERLING_MEMCPY_256_1D_INTERFACE_H_
#define __MERLING_MEMCPY_256_1D_INTERFACE_H_
#include "memcpy_256.h"
#define c_get_range(tmp, x, y) merlin_get_range_256(&tmp, y, x)
#define c_set_range(tmp, x, y, val) merlin_set_range_256(&tmp, y, x, val)
#define LARGE_BUS 256
#define MARS_WIDE_BUS_TYPE merlin_uint_256
#include "mars_wide_bus.h"
#undef LARGE_BUS
#undef MARS_WIDE_BUS_TYPE
#undef c_get_range
#undef c_set_range
#endif
