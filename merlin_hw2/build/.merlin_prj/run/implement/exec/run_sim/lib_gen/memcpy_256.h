/************************************************************************************
 *  (c) Copyright 2014-2015 Falcon Computing Solutions, Inc. All rights reserved.
 *
 *  This file contains confidential and proprietary information
 *  of Falcon Computing Solutions, Inc. and is protected under U.S. and
 *  international copyright and other intellectual property laws.
 *
 ************************************************************************************/

#ifndef __MERLING_MEMCPY_256_INTERFACE_H_
#define __MERLING_MEMCPY_256_INTERFACE_H_
#include <assert.h>
typedef struct merlin_uint_256 {
  unsigned char data[256 / 8];
} merlin_uint_256;
static unsigned long long merlin_get_range_256(merlin_uint_256 *tmp, int low,
                                               int len) {
#pragma HLS INLINE SELF
  unsigned long long ret = 0;
  int i;
  int start = low;
  switch (len) {
  case 1:
    for (i = 0; i >= 0; --i) {
      ret <<= 8;
      ret |= tmp->data[i + start];
    }
    break;
  case 2:
    for (i = 1; i >= 0; --i) {
      ret <<= 8;
      ret |= tmp->data[i + start];
    }
    break;
  case 4:
    for (i = 3; i >= 0; --i) {
      ret <<= 8;
      ret |= tmp->data[i + start];
    }
    break;
  case 8:
    for (i = 7; i >= 0; --i) {
      ret <<= 8;
      ret |= tmp->data[i + start];
    }
    break;
  default:
    assert(0);
  }
  return ret;
}

static void merlin_set_range_256(merlin_uint_256 *tmp, int low, int len,
                                 unsigned long long val) {
#pragma HLS INLINE SELF
  int i;
  int start = low;
  switch (len) {
  case 1:
    for (i = 0; i < 1; ++i) {
      tmp->data[start + i] = val & 0xff;
      val >>= 8;
    }
    break;
  case 2:
    for (i = 0; i < 2; ++i) {
      tmp->data[start + i] = val & 0xff;
      val >>= 8;
    }
    break;
  case 4:
    for (i = 0; i < 4; ++i) {
      tmp->data[start + i] = val & 0xff;
      val >>= 8;
    }
    break;
  case 8:
    for (i = 0; i < 8; ++i) {
      tmp->data[start + i] = val & 0xff;
      val >>= 8;
    }
    break;
  default:
    assert(0);
  }
}
#endif
