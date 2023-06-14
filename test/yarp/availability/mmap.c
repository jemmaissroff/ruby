#include "yarp/defines.h"

int main() {
    mmap(NULL, 0, PROT_NONE, MAP_PRIVATE, -1, 0);
}
