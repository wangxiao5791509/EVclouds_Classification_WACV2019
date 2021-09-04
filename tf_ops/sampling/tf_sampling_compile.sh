#/bin/bash
/usr/local/cuda-11.2/bin/nvcc tf_sampling_g.cu -o tf_sampling_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC

TF_LIB=$(python2.7 -c 'import tensorflow as tf; print(tf.sysconfig.get_lib())')

#g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I /usr/local/lib/python3.5/dist-packages/tensorflow/include -I /usr/local/cuda-9.0/include -lcudart -L /usr/local/cuda-9.0/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0

# g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I /home/wangxiao/anaconda3/envs/evclound/lib/python2.7/site-packages/tensorflow/include -I /home/wangxiao/.conda/envs/tensorflow-gpu/lib/python2.7/site-packages/tensorflow/include/external/nsync/public -I /usr/local/cuda-11.2/include -lcudart -L /usr/local/cuda-11.2/lib64/ -L$TF_LIB -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0

g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I /home/wangxiao/anaconda3/envs/evclound/lib/python2.7/site-packages/tensorflow/include -I /usr/local/cuda-11.2/include -lcudart -L /usr/local/cuda-11.2/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0
