import T3Spec

import Test.Tasty (defaultMain, testGroup)

main :: IO ()
main = do
  test <- tests
  defaultMain test
