#ifndef TEST_H
#define TEST_H

class Test {
 public:
  Test();
  virtual ~Test();

  // commun services
  virtual void sayHello(const char * who);
  virtual void sayGoodbye(const char * who);
  virtual void say(const char * something);

};
#endif /* TEST_H */
