#ifndef TESTA_H
#define TESTA_H

#include <stdarg.h>
#include "Test.h"

#define TRACE(...) printf(__VA_ARGS__)
#include "testA_sm.h"

class TestA : public Test {
 public:
  TestA();
  virtual ~TestA();

  void sayHello(const char * who);
  void sayGoodbye(const char * who);

  // state machine and associated variable
  testAContext _fsm;

};
#endif /* TESTA_H */
