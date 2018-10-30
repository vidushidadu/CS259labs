/************************************************************************************
 *  (c) Copyright 2014-2015 Falcon Computing Solutions, Inc. All rights reserved.
 *
 *  This file contains confidential and proprietary information
 *  of Falcon Computing Solutions, Inc. and is protected under U.S. and
 *  international copyright and other intellectual property laws.
 *
 ************************************************************************************/

#include "memcpy_128.h"
#define c_get_range(tmp, x, y) merlin_get_range_128(&tmp, y, x)
#define c_set_range(tmp, x, y, val) merlin_set_range_128(&tmp, y, x, val)
#define LARGE_BUS 128
#define MARS_WIDE_BUS_TYPE merlin_uint_128
#include "mars_wide_bus_4d.h"
#undef LARGE_BUS
#undef MARS_WIDE_BUS_TYPE
#undef c_get_range
#undef c_set_range
