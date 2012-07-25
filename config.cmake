# CMake build system for QuantLib 
# 2012, Joao Paulo Magalhaes <jpmagalhaes@ist.utl.pt>

include ( CheckIncludeFileCXX )
include ( CheckCXXSourceCompiles )

#------------------------------------------------
# Miscellaneous info

# Name of package
set ( PACKAGE "QuantLib" )
# Define to the address where bug reports for this package should be sent.
set ( PACKAGE_BUGREPORT "quantlib-dev@lists.sourceforge.net" )
# Define to the full name of this package.
set ( PACKAGE_NAME "${PACKAGE}" )
# Define to the version of this package.
set ( PACKAGE_VERSION "${QuantLib_VERSION_STRING}" )
# Define to the full name and version of this package.
set ( PACKAGE_STRING "${PACKAGE_NAME} ${PACKAGE_VERSION}" )
# Define to the one symbol short name of this package.
set ( PACKAGE_TARNAME "${PACKAGE}" )
# Define to the home page for this package.
set ( PACKAGE_URL "http://quantlib.org/" )
# Define to the version of this package.
set ( VERSION "${QuantLib_VERSION_STRING}" )


#------------------------------------------------
# process user options

macro ( ql_process_option option symbol )
  if ( ${option} )
    set ( ${symbol} "#define ${symbol}" )
  else ()
    set ( ${symbol} "#undef ${symbol}" )
  endif ()
endmacro ()

ql_process_option ( QuantLib_ENABLE_INDEXED_COUPONS QL_USE_INDEXED_COUPON )
ql_process_option ( QuantLib_ENABLE_NEGATIVE_RATES QL_NEGATIVE_RATES )
ql_process_option ( QuantLib_ENABLE_EXTRA_SAFETY_CHECKS QL_EXTRA_SAFETY_CHECKS )
ql_process_option ( QuantLib_ENABLE_SESSIONS QL_ENABLE_SESSIONS )
ql_process_option ( QuantLib_ENABLE_MSG_ERROR_LINES QL_ERROR_LINES )
ql_process_option ( QuantLib_ENABLE_MSG_FUNCTIONS QL_ERROR_FUNCTIONS )
ql_process_option ( QuantLib_ENABLE_MSG_TRACING QL_ENABLE_TRACING )

# this one must be switched
if ( QuantLib_ENABLE_DEPRECATED_CODE )
  set ( ql_disable_depr OFF )
else ()
  set ( ql_disable_depr ON )
endif ()
ql_process_option ( ql_disable_depr QL_DISABLE_DEPRECATED )


#------------------------------------------------
# check for existence of include files


macro ( ql_check_include include symbol )
  check_include_file_cxx ( ${include} inc_EXISTS )
  if ( inc_EXISTS )
    set ( ${symbol} "#define HAVE_${symbol} 1" )
  else ()
    set ( ${symbol} "#undef HAVE_${symbol}" )
  endif ()
  unset ( inc_exists )
endmacro ()

ql_check_include ( dlfcn.h HAVE_DLFCN_H )
ql_check_include ( inttypes.h HAVE_INTTYPES_H )
ql_check_include ( memory.h HAVE_MEMORY_H )
ql_check_include ( stdint.h HAVE_STDINT_H )
ql_check_include ( stdlib.h HAVE_STDLIB_H )
ql_check_include ( strings.h HAVE_STRINGS_H )
ql_check_include ( string.h HAVE_STRING_H )
ql_check_include ( sys/stat.h HAVE_SYS_STAT_H )
ql_check_include ( sys/types.h HAVE_SYS_TYPES_H )
ql_check_include ( unistd.h HAVE_UNISTD_H )



#------------------------------------------------
# check if the compiler supports the long long type

check_cxx_source_compiles ( "
int main ( int argc, char *argv[] )
{
  long long i = static_cast< long long >(100);
  return static_cast< int >(i);
}
"
HAVE_LONG_LONG
)

if ( HAVE_LONG_LONG )
  set ( QL_HAVE_LONG_LONG "#define QL_HAVE_LONG_LONG" )
else ()
  set ( QL_HAVE_LONG_LONG "#undef QL_HAVE_LONG_LONG" )
endif ()


#------------------------------------------------
# check if the compiler defines ::asinh in <cmath>

check_cxx_source_compiles ( "
#include <cmath>

int main ( int argc, char *argv[] )
{
  double a = ::asinh(0.5); // 0.4812118
  return 0;
}
"
HAVE_ASINH
)

if ( HAVE_ASINH )
  set ( QL_HAVE_ASINH "#define QL_HAVE_ASINH" )
else ()
  set ( QL_HAVE_ASINH "#undef QL_HAVE_ASINH" )
endif ()


#------------------------------------------------
# check if the compiler supports Boost::uBLAS

check_cxx_source_compiles ( "
#include <boost/numeric/ublas/matrix.hpp>
#include <boost/numeric/ublas/io.hpp>

int main ( int argc, char *argv[] )
{
  using namespace boost::numeric::ublas;
  matrix< double > m(3, 3);
  for ( unsigned i = 0; i < m.size1(); ++i )
    for ( unsigned j = 0; j < m.size2(); ++j )
      m(i, j) = 3*i + j;
  std::cout << m << std::endl;
  return 0;
}
"
UBLAS_OK
)

if ( UBLAS_OK )
  set ( QL_NO_UBLAS_SUPPORT "#undef QL_NO_UBLAS_SUPPORT" )
else ()
  set ( QL_NO_UBLAS_SUPPORT "#define QL_NO_UBLAS_SUPPORT 1" )
endif ()


#------------------------------------------------
# STDC_HEADERS

# WTF? a quick fix for now
# FIXME
if ( WIN32 OR UNIX )
  set ( STDC_HEADERS "#define STDC_HEADERS 1" )
else ()
  set ( STDC_HEADERS "#undef STDC_HEADERS" )
endif ()


#------------------------------------------------
# OS patches

if ( APPLE )
  set ( QL_PATCH_DARWIN "#define QL_PATCH_DARWIN 1" )
else ()
  set ( QL_PATCH_DARWIN "#undef QL_PATCH_DARWIN" )
endif ()

if ( ${CMAKE_SYSTEM_NAME} MATCHES "SunOS" )
  set ( QL_PATCH_SOLARIS "#define QL_PATCH_DARWIN 1" )
else ()
  set ( QL_PATCH_SOLARIS "#undef QL_PATCH_DARWIN" )
endif ()


#------------------------------------------------
# DONE - configure the file, creating ql/config.hpp

set ( CONFIG_HPP_CMAKE "ql/config.hpp . Generated by cmake from ql/config.hpp.cmake" )

configure_file ( ${QuantLib_SRC_DIR}/config.hpp.cmake ${QuantLib_SRC_DIR}/config.hpp )
 

