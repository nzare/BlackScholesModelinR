# Black Scholes Option Pricing Model
### A project on implementing Black Scholes Model in R as a part of course Applied Stochastic Process

The Black-Scholes formula is often used in the finance sector to estimate option prices.

The Black-Scholes formula is often used in the finance sector to estimate option prices.

**Option:** An option is a security that gives the right to buy or sell an asset within a specified period of time. 

- A **call option** is the kind of option that gives the right, but not the obligation to buy a single share of common stock. 
- A **put option** is the kind of option that gives the right, but not the obligation to sell a single share of common stock. 

**Striking Price:** The striking price is the price that is paid for the asset when the option is exercised, i.e it is the price at which the stock is bought when the call option is exercised, or it is the price at which the stock is sold when the put option is exercised.

**Volatility:** Volatility of a stock price represents how much the asset’s price swings around the mean price. 

The price of a stock option is a function of the underlying stock’s price and time. More generally, we can say that the price of any option is a function of the stochastic variables underlying the derivative and time.

## Ito’s Lemma and the Black Scholes equation

Stock prices follow a Wiener process, also called **Geometric Brownian Motion**. A process {X(t)} is a Wiener process with mean μt (called **drift**) and variance σ^2 t and has the following properties-
- {X(t)} has independent incremements.
- Every increment X (t) − X (s) is normally distributed with mean μ(t − s) and variance σ^2 * (t − s).

It is a **continuous time continuous state Markov process**. Standard Brownian Motion has drift parameter μ = 0 and σ^2 = t, it is denoted as B(t) where B(0) = 0. Standard Brownian Motion follows normal distribution with mean 0 and variance t. Moreover, any Wiener process X(t) can be written as

X(t) = μt + X(0) + σB(t)

where B(t) is standard Brownian motion.

Geometric Brownian motion is used to model stock prices in the Black–Scholes
model and is the most widely used model of stock price behavior. It is used because of several reasons-
- The expected returns of GBM are independent of the value of the process (stock price), which agrees with what we would expect in reality.
- A GBM process only assumes positive values, just like real stock prices.
- A GBM process shows the same kind of ’roughness’ in its paths as we see in real stock prices.

Calculations with GBM processes are relatively easy. However, GBM is not a completely realistic model, in particular it falls short of reality in the following ways-
- In real stock prices, volatility changes over time (possibly stochastically), but in GBM, volatility is assumed constant.
- In real life, stock prices often show jumps caused by unpredictable events or news, but in GBM, the path is continuous (no discontinuity).

An important result required to derive the Black-Scholes equation for option pricing is **Ito’s Lemma**. An Ito process is a Wiener process where the parameters μ and σ depend on the underlying variable x and time t. Thus, an Ito process can be written as-

X(t) = μ(x, t)t + σ(x, t)B(t)

## Assumptions

The Black-Scholes equation is obtained as a solution of the Black-Scholes differential equation, with the boundary condition that f = max{St − X, 0} which is the return on the stock. The equation also has the following assumptions-

- The short-term interest rate is known and is constant through time.
- The stock price follows a random walk in continuous time with a variance rate proportional to the square of the stock price. Thus the distribution of possible stock prices at the end of any fortnite interval is log-normal. The variance rate of the return on the stock is constant.
- The stock pays no dividends or other distributions.
- The option is ”European,” that is, it can only be exercised at maturity.
- There are no transaction costs in buying or selling the stock or the option.
- It is possible to borrow any fraction of the price of a security to buy it or to hold it, at the short-term interest rate.
- There are no penalties to short selling. A seller who does not own a security will simply accept the price of the security from a buyer, and will agree to settle with the buyer on some future date by paying him an amount equal to the price of the security on that date.

## Implementation in R

The data is for the period of 1 Jan - 1 March 2018, with options expiring on 28 March 2018. The **National Stock Exchange (NSE)** website was used to obtain the historical data. It was calculated for three different values of striking price (k).

The R code which utilised the Black-Scholes equation for calculating call option prices for the Tata Motors stock prices gave the outputs as depicted in the following figures. 


[Project Report](https://github.com/nzare/BlackScholesModelinR/blob/master/Project%20Black-Scholes.pdf)
