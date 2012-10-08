import Control.Monad.State
import Control.Monad.Writer

add :: Int -> Writer [String] (State [Int] ())
add x = do
    tell ["add " ++ show x]
    return $ get >>= \xs -> put $ x:xs
    
run :: Writer [String] (State [Int] ())
run = do
    s1 <- add 1
    s2 <- add 2
    s3 <- add 3
    return $ s1 >> s2 >> s3

main :: IO ()
main = do
    putStrLn "WriterState Test"
    let (state, log) = runWriter $ run 
    print log
    let (v, s) = runState state $ []
    print v
    print s
