# -*-cmake-*-
add_executable(score
  main.cpp)
target_link_libraries(score
  utilities
  clmTracker
  ${LIBS})

 set(TRACKER_FILES
 "main.cpp"
 )

ADD_LIBRARY(FaceScore SHARED ${TRACKER_FILES}) 
