#include <iostream>

using namespace std;

int main(void) {
  cout << "Hello World" << endl;
  return;
}


/*

FROM jenkins
USER root
RUN apt-get update && apt-get install -y build-essential cppcheck
USER jenkins

*/
