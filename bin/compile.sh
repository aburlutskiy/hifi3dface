#!/bin/bash

TF_INC=$(python3 -c "import tensorflow as tf; print(tf.sysconfig.get_include())")
TF_LIB=$(python3 -c "import tensorflow as tf; print(tf.sysconfig.get_lib())")

echo "TF_INC: $TF_INC" >&2
echo "TF_LIB: $TF_LIB" >&2

(cd $TF_LIB && ln -sf libtensorflow_framework.so.2 libtensorflow_framework.so)

# you might need the following to successfully compile the third-party library

TF_MESH_RENDERER_PATH=$PWD/third_party/kernels/

g++ -std=c++11 \
    -shared \
        $TF_MESH_RENDERER_PATH/rasterize_triangles_grad.cc \
        $TF_MESH_RENDERER_PATH/rasterize_triangles_op.cc \
        $TF_MESH_RENDERER_PATH/rasterize_triangles_impl.cc \
        $TF_MESH_RENDERER_PATH/rasterize_triangles_impl.h \
    -o $TF_MESH_RENDERER_PATH/rasterize_triangles_kernel.so \
    -fPIC -D_GLIBCXX_USE_CXX11_ABI=0 \
    -I$TF_INC -L$TF_LIB -ltensorflow_framework -O2

if [ "$?" -ne 0 ]; then echo "compile rasterizer failed"; exit 1; fi
