#include "yarp/defines.h"
#ifndef _WIN32
#include <strings.h>
#endif

int main() {
#if defined(_WIN32)
    return 1;
#else
    strncasecmp("", "", 0);
    return 0
#endif
}
