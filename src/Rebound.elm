module Rebound where

{-| This modules uses the javascript library rebound-js to provide spring
phyics in Elm

# Definition
@docs OnSpring, SpringConfig, BouncySpringConfig, spring, springWithBouncinessAndSpeed, Velocity


-}
import Signal
import Native.Rebound

{-| OnSpring callback
-}
type OnSpring
  = UpdateValue Float
  | AtRestValue Float

{-| tension and friction for the spring
-}
type alias SpringConfig =
  { tension  : Maybe Int
  , friction : Maybe Int
  }

{-| bounicness and speed for the spring
-}
type alias BouncySpringConfig =
  { bounciness : Maybe Int
  , speed      : Maybe Int
  }

{-| the springs velocity
-}
type alias Velocity = Maybe Float

{-| create a spring with default config
-}
spring : SpringConfig -> Signal.Signal (Float, Float, Velocity) -> Signal.Signal OnSpring
spring = Native.Rebound.spring

{-| create a spring passing bouncyness and speed
-}
springWithBouncinessAndSpeed : BouncySpringConfig -> Signal.Signal (Float, Velocity) -> Signal.Signal OnSpring
springWithBouncinessAndSpeed = Native.Rebound.springWithBouncinessAndSpeed
