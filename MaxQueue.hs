module MaxQueue (
 MaxQueue,
 mk,
 dequeue,
 enqueue,
 max,
) where

import Control.Monad.State
import qualified BidiList as L
import Prelude hiding (max)

type MaxQueue a = State (MaxQueueState a) a
data MaxQueueState a = MaxQueue { dataQueue :: L.BidiList a, maxQueue :: L.BidiList a }

mk :: [a] -> MaxQueue a
mk = undefined

dequeue :: MaxQueue a 
dequeue = undefined

enqueue :: a -> MaxQueue a 
enqueue e = undefined

max :: [a] -> MaxQueue a -> a
max = undefined

