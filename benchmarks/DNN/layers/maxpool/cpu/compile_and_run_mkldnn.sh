#set -x

source ../../../../configure_paths.sh

CXXFLAGS="-std=c++11 -O3 -fno-rtti"

INCLUDES="-I${MKL_PREFIX}/include/"
LIBRARIES=" ${MKL_FLAGS} -lz -lpthread"
LIBRARIES_DIR="-L${MKL_PREFIX}/lib/${MKL_LIB_PATH_SUFFIX} "

echo "MKL-DNN maxpool "

g++ ${LANKA_OPTIONS} $CXXFLAGS ${INCLUDES} maxpool_layer_generator_mkldnn.cpp ${LIBRARIES_DIR} ${LIBRARIES} -lmkldnn -o maxpool_layer_mkldnn_result
LD_LIBRARY_PATH=${MKL_PREFIX}/build/src/:${MKL_PREFIX}/lib/${MKL_LIB_PATH_SUFFIX} DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:${MKL_PREFIX}/lib/${MKL_LIB_PATH_SUFFIX} ./maxpool_layer_mkldnn_result
