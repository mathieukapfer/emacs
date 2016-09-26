#include "TestA.h"

int main(int argc, char *argv[])
{
  TestA test;

  test._fsm.leaveInit();
  test._fsm.backToInit();

  test._fsm.goInside();
  test._fsm.goState2();
  test._fsm.goBack();

  return 0;
}
