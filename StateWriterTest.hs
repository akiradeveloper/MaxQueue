import Control.Monad.State
import Control.Monad.Writer

add :: Int -> State (Writer [String] [Int]) ()
add x = do
    wxs <- get
    let (xs, log) = runWriter wxs
    put $ writer (x:xs, ["add " ++ show x] ++ log)

run :: State (Writer [String] [Int]) ()
run = do
    add 1
    add 2
    add 3

f :: Writer [String] [Int] -> ((), Writer [String] [Int])
f = runState run

main = do
    putStrLn "StateWriter Test"
    let (v, s) = f $ writer ([], [])
    print v
    let (v, log) = runWriter s
    print v
    print log
