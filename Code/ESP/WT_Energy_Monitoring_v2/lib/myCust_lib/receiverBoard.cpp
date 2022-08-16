#include "Arduino.h"

#include "myCommon.h"
//#include "Communication.h"
#include "receiverBoard.h"


 void getBoard_ID() {
   Serial.println(ESP.getEfuseMac());
 }


