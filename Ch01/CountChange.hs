{-
 - Count_Change.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Count the number of ways to make change
 - (Example from 1.2.2 - Tree Recursion)
 -
 -}

module Count_Change (countChange) where

countChange :: Int -> Int
countChange = cc 5
  where
    zero x = x == 0
    cc kindsOfCoins amt
      | zero amt          = 1
      | amt < 0           = 0
      | zero kindsOfCoins = 0
      | otherwise         = cc (kindsOfCoins-1) amt + cc kindsOfCoins newAmt
        where
          firstDenomination 1 = 1
          firstDenomination 2 = 5
          firstDenomination 3 = 10
          firstDenomination 4 = 25
          firstDenomination 5 = 50
          newAmt              = amt-firstDenomination kindsOfCoins

