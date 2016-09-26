#ifndef TEST_H
#define TEST_H

#include <stdarg.h>

#define TRACE(...) printf(__VA_ARGS__)
#include "test_sm.h"

class Test {
 public:
  Test();
  virtual ~Test();

  void sayHello(const char * who);
  void sayGoodbye(const char * who);

  // state machine and associated variable
  testContext _fsm;

};
#endif /* TEST_H */
