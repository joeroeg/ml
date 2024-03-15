#include <stdio.h>

// CUDA kernel to add elements of two arrays
__global__ void add(int n, float *x, float *y) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (int i = index; i < n; i += stride)
        y[i] = x[i] + y[i];
}

int main(void) {

    // Create events for timing
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);

    // int N = 1<<20; // 1M elements
    int64_t N = 1LL<<30; // 1 billion elements

    float *x, *y;

    // Allocate Unified Memory – accessible from CPU or GPU
    cudaMallocManaged(&x, N*sizeof(float));
    cudaMallocManaged(&y, N*sizeof(float));

    cudaError_t cudaStatus;
    cudaStatus = cudaMallocManaged(&x, N*sizeof(float));
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "cudaMallocManaged failed!");
        return 1;
    }

    cudaStatus = cudaMallocManaged(&y, N*sizeof(float));
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "cudaMallocManaged failed!");
        cudaFree(x);
        return 1;
    }

    // Initialize x and y arrays on the host
    for (int64_t i = 0; i < N; i++) {
        x[i] = 1.0f;
        y[i] = 2.0f;
    }

    // Record the start event
    cudaEventRecord(start, NULL);

    // Run kernel on 1M elements on the GPU
    int blockSize = 256;
    int numBlocks = (N + blockSize - 1) / blockSize;
    add<<<numBlocks, blockSize>>>(N, x, y);


    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();

    cudaStatus = cudaDeviceSynchronize();
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "cudaDeviceSynchronize returned error code %d after launching add kernel!", cudaStatus);
        cudaFree(x);
        cudaFree(y);
        return 1;
    }

    // Record the stop event
    cudaEventRecord(stop, NULL);

    // Wait for the stop event to complete
    cudaEventSynchronize(stop);

    float milliseconds = 0;
    cudaEventElapsedTime(&milliseconds, start, stop);

    printf("GPU time taken: %f milliseconds\n", milliseconds);

    // Check for errors (all values should be 3.0f)
    float maxError = 0.0f;
    for (int i = 0; i < N; i++)
        maxError = fmax(maxError, fabs(y[i]-3.0f));
    printf("Max error: %f\n", maxError);

    // Free memory
    cudaFree(x);
    cudaFree(y);

    return 0;
}
