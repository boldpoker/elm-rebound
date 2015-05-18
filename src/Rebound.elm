module Rebound where

import Signal
import Native.Rebound

type OnSpring
  = UpdateValue Float
  | AtRestValue Float

type alias SpringConfig =
  { tension  : Maybe Int
  , friction : Maybe Int
  }

type alias BouncySpringConfig =
  { bounciness : Maybe Int
  , speed      : Maybe Int
  }

type alias Velocity = Maybe Float

spring : SpringConfig -> Signal.Signal (Float, Velocity) -> Signal.Signal OnSpring
spring = Native.Rebound.spring

springWithBouncinessAndSpeed : BouncySpringConfig -> Signal.Signal (Float, Velocity) -> Signal.Signal OnSpring
springWithBouncinessAndSpeed = Native.Rebound.springWithBouncinessAndSpeed
