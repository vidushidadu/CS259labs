#include <string.h>
#include <math.h>
#include <assert.h>

#pragma ACCEL kernel
void digitrec_kernel(
        unsigned long test_image,
        unsigned long* train_images,
        unsigned char* knn_mat) {

#pragma ACCEL interface variable=train_images depth=18000
#pragma ACCEL interface variable=knn_mat depth=30

    unsigned char buf_knn_mat[10][3];

#pragma ACCEL parallel factor=5
    for (int x = 0; x < 10; ++x) {
        for (int y = 0; y < 3; ++y) {
            buf_knn_mat[x][y] = 50;
        }
    }

// #pragma ACCEL parallel factor=5
#pragma ACCEL parallel reduction=dis factor=1800
    for (int x = 0; x < 10; ++x) {
// #pragma ACCEL parallel reduction=dis factor=1800
        for (int y = 0; y < 1800; ++y) {
            unsigned long temp = train_images[x * 1800 + y] ^ test_image;
            unsigned char dis = 0;
#pragma ACCEL parallel
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

#pragma ACCEL parallel factor=5
    for (int x = 0; x < 10; ++x) {
        for (int y = 0; y < 3; ++y) {
            knn_mat[x * 3 + y] = buf_knn_mat[x][y];
        }
    }
}
