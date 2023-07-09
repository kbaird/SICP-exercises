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
    cc kindsOfCoins amt
      | amt == 0          = 1
      | amt <  0          = 0
      | kindsOfCoins == 0 = 0
      | otherwise         = cc (kindsOfCoins-1) amt + cc kindsOfCoins newAmt
        where
          firstDenomination 1 = 1
          firstDenomination 2 = 5
          firstDenomination 3 = 10
          firstDenomination 4 = 25
          firstDenomination 5 = 50
          newAmt              = amt-firstDenomination kindsOfCoins

