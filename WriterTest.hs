import Control.Monad.Writer

type Book = Writer [String] Int

add :: Int -> Book
add x = do
  tell ["add " ++ show x]
  return x

run :: Book
run = do
    x <- add 1
    y <- add 2
    return (x+y)

main = do
  let (answer, log) = runWriter $ run 
  putStrLn $ "answer " ++ show answer
  forM_ log $ putStrLn
