#Face Score System

##How to build
the application requires the following library to be installed at first:
- OpenCV version 2.4 or above (See OpenCV build options for recommended settings).
- CMake version 2.8 or above.
- FFMPEG version 1.0.0 or above.
- Bash
- Qt version 4.7 or above (only required if building the GUI)
please refer to [face-analysis-sdk](https://github.com/ci2cv/face-analysis-sdk) for more details
preparing your operating system environment and 
```shell
cd build
cmake ..
make
```
after that, just copy some images from computer to build directory and 
```shell
face-fit test.jpg
```
and enjoy!


>author:dragen@live.cn, please see biyanzhi.com for more details.
