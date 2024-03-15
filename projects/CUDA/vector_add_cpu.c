#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <stdint.h>

// CPU function to add elements of two arrays
void add(int n, float *x, float *y) {
    for (int i = 0; i < n; i++)
        y[i] = x[i] + y[i];
}

int main(void) {
    // int N = 1<<20; // 1M elements
    int64_t N = 1LL<<30; // 1 billion elements

    float *x = (float*)malloc(N * sizeof(float));
    float *y = (float*)malloc(N * sizeof(float));

    // Initialize x and y arrays on the host
    for (int64_t i = 0; i < N; i++) {
        x[i] = 1.0f;
        y[i] = 2.0f;
    }

    // Add vectors on the CPU
    add(N, x, y);

    // Check for errors (all values should be 3.0f)
    float maxError = 0.0f;
    for (int i = 0; i < N; i++)
        maxError = fmax(maxError, fabs(y[i]-3.0f));
    printf("Max error: %f\n", maxError);

    // Free memory
    free(x);
    free(y);

    return 0;
}
