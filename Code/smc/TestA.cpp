#include "TestA.h"
#include <stdio.h>

TestA::TestA():
  _fsm(*this) {
}

TestA::~TestA() {
}

void TestA::sayHello(const char * who) {
  printf("Hello %s\n", who);
}

void TestA::sayGoodbye(const char * who) {
  printf("Goodbye %s\n", who);
}
