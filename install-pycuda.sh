#!/bin/bash -e

apt-get update -y 
apt-get install -y build-essential cmake
apt-get install -y libboost-all-dev
apt-get install -y python python-dev python-pip python-numpy

# some packages (tensorflow?) have trouble linking if libcuda.so.1 is not found
ln -s /usr/lib/x86_64-linux-gnu/libcuda.so.396.44 /usr/local/cuda-9.0/targets/x86_64-linux/lib/libcuda.so
ln -s /usr/lib/x86_64-linux-gnu/libcuda.so.396.44 /usr/local/cuda-9.0/targets/x86_64-linux/lib/libcuda.so.1
ln -s /usr/lib/x86_64-linux-gnu/libcuda.so.396.44 /usr/local/cuda-9.0/targets/x86_64-linux/lib/libcuda.so.396.44
ldconfig

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-9.0/targets/x86_64-linux/lib/
export PATH=/usr/local/cuda-9.0/bin:$PATH
# install cuda support
cd /tmp
git clone --recursive http://git.tiker.net/trees/pycuda.git
cd pycuda
python configure.py --cuda-root=/usr/local/cuda-9.0
make install
# cuda not visible at build time
#PATH=/usr/local/cuda-9.0/bin:$PATH
#python test/test_driver.py
#python test/test_gpuarray.py
#python test/test_cumath.py
cd /tmp
#rm -Rf pycuda
#python -c 'import pycuda; print "Successfully installed pycuda"'

rm -rf /var/lib/apt/lists/*



