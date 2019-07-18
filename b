rm -rf build
if [ $? -ne 0 ]
then
    sudo rm -rf build
fi
mkdir build
cd build
cmake .. $@
make -j5
if [ $? -ne 0 ]
then
    echo "Building failed"
    exit 1
fi
make -j5 tests
if [ $? -ne 0 ]
then
    echo "Building tests failed"
    exit 1
fi
make -j5 test
cd ..
