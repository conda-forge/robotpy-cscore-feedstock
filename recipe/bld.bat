@echo on
setlocal

rem Use conda-forge pybind11
del /s /q pybind11

rem Workaround C++20 breakage
del cscore_src\wpiutil\src\main\native\cpp\PortForwarder.cpp

rem Ignore inadvertently picked up JNI stuff
del cscore_src\cscore\src\main\native\cpp\jni\CameraServerJNI.cpp
del cscore_src\wpiutil\src\main\native\cpp\jni\WPIUtilJNI.cpp

set CL=/I%LIBRARY_PREFIX%\include
set LIB=%LIBRARY_PREFIX%\lib;%LIB%

%PYTHON% -m pip install . -vv
