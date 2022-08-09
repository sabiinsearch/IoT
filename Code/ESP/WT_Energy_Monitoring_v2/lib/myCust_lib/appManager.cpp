#include "appManager.h"
#include "connectionManager.h"

connectionManager conManagerr;
/* constructor implementation */

void appManager_ctor(appManager * const me) {
  me->conManager = connectionManager_ctor(&conManagerr);
}

