#include <string.h>
#include <math.h>
#include <assert.h>

// void update_knn_mat(unsigned char (&buf_knn_mat)[10][3], char t, int x){
void update_knn_mat(unsigned char (*buf_knn_mat)[3], char t, int x){
  unsigned char max_id = 0;
   unsigned char max_val = 0;
   for (int i1 = 0; i1 < 3; ++i1) {
       if (max_val < buf_knn_mat[x][i1]) {
           max_id = i1;
           max_val = buf_knn_mat[x][i1];
       }
   }
   if (t < max_val) {
       buf_knn_mat[x][max_id] = t;
   }
}


#pragma ACCEL kernel
void digitrec_kernel(
        unsigned long test_image,
        unsigned long* train_images,
        unsigned char* knn_mat) {

#pragma ACCEL interface variable=train_images depth=18000
#pragma ACCEL interface variable=knn_mat depth=30

    unsigned char buf_knn_mat[10][3];

#pragma ACCEL parallel factor=5
// init:
    for (int x = 0; x < 10; ++x) {
        for (int y = 0; y < 3; ++y) {
            buf_knn_mat[x][y] = 50;
        }
    }

unsigned char dis[10][1800];
unsigned long temp[18000];
// #pragma ACCEL parallel factor=1800
#pragma ACCEL parallel factor=900
// #pragma ACCEL parallel factor=100
  for(int y=0; y<1800; ++y) {
for(int x=0; x<10; ++x) {
    dis[x][y]=0;
    temp[x * 1800 + y] = train_images[x * 1800 + y] ^ test_image;
  }
}


// dist:
// #pragma ACCEL parallel reduction=dis factor=1800
        for (int y = 0; y < 1800; ++y) {
    for (int x = 0; x < 10; ++x) {
// #pragma ACCEL parallel factor=49
#pragma ACCEL parallel factor=7
 for (int i = 0; i < 49; ++i) {
                dis[x][y] += (temp[x * 1800 + y] & (1L << i)) >> i;
            }
   }
}
// #pragma ACCEL parallel factor=1800
#pragma ACCEL pipeline flatten
    for (int x = 0; x < 10; ++x) {
// #pragma ACCEL parallel factor=10
        for (int y = 0; y < 1800; ++y) {

            // update_knn_mat(&buf_knn_mat[0], dis[x][y], x);
            unsigned char max_id = 0;
            unsigned char max_val = 0;
            for (int i1 = 0; i1 < 3; ++i1) {
                if (max_val < buf_knn_mat[x][i1]) {
                    max_id = i1;
                    max_val = buf_knn_mat[x][i1];
                }
            }
            if (dis[x][y] < max_val) {
                buf_knn_mat[x][max_id] = dis[x][y];
            }
        }
    }
/*
   for (int x = 0; x < 10; ++x) {
        for (int y = 0; y < 1800; ++y) {
            unsigned long temp = train_images[x * 1800 + y] ^ test_image;
            unsigned char dis = 0;
            for (int i = 0; i < 49; ++i) {
                dis += (temp & (1L << i)) >> i;
            }

            unsigned char max_id = 0;
            unsigned char max_val = 0;
            for (int i1 = 0; i1 < 3; ++i1) {
                if (max_val < buf_knn_mat[x][i1]) {
                    max_id = i1;
                    max_val = buf_knn_mat[x][i1];
                }
            }
            if (dis < max_val) {
                buf_knn_mat[x][max_id] = dis;
            }
        }
    }
*/


// #pragma ACCEL parallel reduction=dis factor=10
#pragma ACCEL parallel reduction=dis factor=5
    for (int x = 0; x < 10; ++x) {
        for (int y = 0; y < 3; ++y) {
            knn_mat[x * 3 + y] = buf_knn_mat[x][y];
        }
    }
}
