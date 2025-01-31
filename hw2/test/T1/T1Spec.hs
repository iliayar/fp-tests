module T1Spec
  where
import Test.T1Annotated (hspecAnnotated, propAnnotated)
import Test.T1Except (hspecExcept, propExcept)
import Test.T1Option (hspecOption, propOption)
import Test.T1Pair (hspecPair, propPair)
import Test.T1Prioritised (hspecPrioritised, propPrioritised)
import Test.T1Quad (hspecQuad, propQuad)
-- import Test.T1Stream
import Test.T1Fun
import Test.T1List (hspecList, propList)
import Test.T1Tree (hspecTree, propTree)
import Test.Tasty (TestTree, testGroup)


tests :: IO TestTree
tests = do
    option <- hspecOption
    pair <- hspecPair

    quad <- hspecQuad
    annotated <- hspecAnnotated
    except <- hspecExcept
    prioritised <- hspecPrioritised
    -- stream <- hspecStream
    list <- hspecList
    fun <- funProp
    tree <- hspecTree
    return $ testGroup "HW2.T1" [option, pair, quad, annotated, except, prioritised, list, fun, tree,
     propAnnotated, propExcept, propList, propOption, propPair, propPrioritised, propQuad, propTree, propFun]
