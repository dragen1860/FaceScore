# -*-cmake-*-
add_executable(score
  main.cpp)
target_link_libraries(score
  utilities
  clmTracker
  ${LIBS})
