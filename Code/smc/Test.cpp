#include "Test.h"
#include <stdio.h>

Test::Test():
  _fsm(*this) {
}

Test::~Test() {
}

void Test::sayHello(const char * who) {
  printf("Hello %s\n", who);
}

void Test::sayGoodbye(const char * who) {
  printf("Goodbye %s\n", who);
}
