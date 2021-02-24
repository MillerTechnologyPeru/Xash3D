#if defined XASH_SDL && !defined REF_DLL
#ifdef __APPLE__
// FIXME: iOS Support
#include "/opt/homebrew/include/SDL2/SDL.h"
#else
#include <SDL2/SDL.h>
#endif
#endif
