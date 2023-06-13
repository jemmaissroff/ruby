// This files must be required before any system header
// as it influences which functions system headers declare.

#ifndef YARP_DEFINES_H
#define YARP_DEFINES_H

// For strnlen(), strncasecmp()
#ifndef _XOPEN_SOURCE
#define _XOPEN_SOURCE 700
#endif

#ifndef RUBY_FUNC_EXPORTED
#ifndef YP_EXPORTED_FUNCTION
#if defined(_WIN32)
# define YP_EXPORTED_FUNCTION __declspec(dllexport) extern
#else
# define YP_EXPORTED_FUNCTION __attribute__((__visibility__("default"))) extern
#endif
#endif
#else
#if defined(_WIN32)
# define YP_EXPORTED_FUNCTION __declspec(dllexport) extern
#else
# define YP_EXPORTED_FUNCTION RUBY_FUNC_EXPORTED
#endif
#endif

#if defined(_WIN32)
# define YP_ATTRIBUTE_UNUSED
#else
# define YP_ATTRIBUTE_UNUSED __attribute__((unused))
#endif

#endif
