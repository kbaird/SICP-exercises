###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.19 - Count the number of ways to make change,
    with the list of coins as an argument
###

usCoins = [50, 25, 10, 5, 1]
ukCoins = [100, 50, 20, 10, 5, 1, 0.5]

countChange = (amount) ->
  innerCountChange  = (amt, coins) ->
    return 1 if amt is 0
    # There is only one (empty) way to make change for no money at all.

    return 0 if coins.length is 0
    # There is no way to make change when there are no coin types available.

    return 0 if (amt < 0)
    # There is no way to make change for a negative amount of money.

    reducedAmt        = amt - coins[0]
    reducedResults    = innerCountChange(reducedAmt, coins)
    withoutFirstCoin  = innerCountChange(amt, coins[1..])

    reducedResults + withoutFirstCoin

  innerCountChange(amount, usCoins)

console.log countChange(100)
