-- Testing State

import Control.Monad.State
import qualified Data.List as L

type Box a b = State [a] b

boxAdd :: a -> Box a ()
boxAdd x = get >>= \xs -> put $ x:xs

boxDel :: (Eq a) => a -> Box a ()
boxDel x = get >>= \xs -> put $ L.delete x xs

run :: Box Int [Int]
run = do
    boxAdd 4
    boxAdd 5
    boxDel 3
    get

main = do
  print $ runState run $ [1,2,3] 
