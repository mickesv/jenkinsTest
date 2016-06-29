#include <iostream>

using namespace std;

int main(int argc, char** argv) {
  cout << "Hello World" << endl;

  if (argc==1) {
    return 0;
  } else {
    return -1;
  }
}


/*

FROM jenkins
USER root
RUN apt-get update && apt-get install -y build-essential cppcheck
USER jenkins

*/
