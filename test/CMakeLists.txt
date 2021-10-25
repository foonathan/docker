cmake_minimum_required(VERSION 3.18)
project(docker_test)

add_executable(app main.cpp)

enable_testing()
add_test(NAME test COMMAND app)

