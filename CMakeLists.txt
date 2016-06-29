cmake_minimum_required (VERSION 2.6)
project (JenkinsTest)
add_executable (tst1 main.cc)

enable_testing()
add_test(NAME Start-app COMMAND tst1)
add_test(NAME Error COMMAND tst1 1)
