###
Kevin C. Baird
SICP in CoffeeScript:
  Count the number of ways to make change
###

# Assume US coinage (five types of coins), and call inner function.

countChange = (amount) ->
  firstDenomination = { 0: 0, 1: 1, 2: 5, 3: 10, 4: 25, 5: 50 }
  innerCountChange  = (amt, coinTypes) ->
    return 1 if amt is 0
    # There is only one (empty) way to make change for no money at all.

    return 0 if coinTypes is 0
    # There is no way to make change when there are no coin types available.

    return 0 if (amt < 0)
    # There is no way to make change for a negative amount of money.

    reducedAmt        = amt - firstDenomination[coinTypes]
    reducedResults    = innerCountChange(reducedAmt, coinTypes)
    withoutFirstCoin  = innerCountChange(amt, coinTypes-1)

    reducedResults + withoutFirstCoin

  innerCountChange(amount, 5)

console.log countChange(100)
