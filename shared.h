#include <limits.h>
#include <X11/Xlib.h>

#define BLOCKLENGTH                     25
#define NILL                            INT_MIN

#define LENGTH(X)                       (sizeof X / sizeof X[0])

void cleanup(void);

extern pid_t pid;
