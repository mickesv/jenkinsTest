#include <iostream>

using namespace std;

int main(int argc, char** argv) {
  cout << "Hello World or DIE" << endl;

  if (argc==1) {
    cout << "HW  " << endl;
    return 0;
  } else {
    cout << "DIE" << endl;    
    return -1;
  }
}


/*

FROM jenkins
USER root
RUN apt-get update && apt-get install -y build-essential cppcheck
USER jenkins

*/
