#include <gtest/gtest.h>

#include <gtest_main.h>

int gtest_main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
