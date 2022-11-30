cmake_minimum_required(VERSION 3.1)

# configure compiler
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED on)

if(MINGW)
  # COMPILER-SETTINGS FOR MINGW
  SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fexceptions")
elseif(MSVC)
  # COMPILER-SETTINGS FOR MS VISUAL C++
  SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHsc")
  # To fix error: C2338: va_start argument must not
  # have reference type and must not be parenthesized
  add_definitions(/D_CRT_NO_VA_START_VALIDATION)
  add_definitions(/DNOMINMAX)
endif()


# akm: this seems to be causing a problem for us with Conda's 5.15.4 Qt
# akm: See https://github.com/SCIInstitute/ShapeWorks/issues/1858
#if(NOT APPLE)
#    set(CMAKE_INSTALL_RPATH $ORIGIN)
#endif()
