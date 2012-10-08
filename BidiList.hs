module BidiList (
  BidiList,
  addHead,
  addLast,
  delHeadIf,
  delLastWhile,
  getHead,
) where

data BidiList a = BidiList { headList :: [a], lastList :: [a] }

addHead x list = list { headList = x:(headList list) }
addLast x list = list { lastList = x:(lastList list) }
delHeadIf p list 
  | p x       = list { headList = dropWhile p (headList list) }
  | otherwise = list
  where x = head . headList $ list

delLastWhile p list = list { lastList = dropWhile p (lastList list) }
getHead = head . headList 

main = do 
  print "BidiList Test"
