#include "Test.h"

int main(int argc, char *argv[])
{
  Test test;

  test._fsm.leaveInit();
  test._fsm.backToInit();
  
  return 0;
}
