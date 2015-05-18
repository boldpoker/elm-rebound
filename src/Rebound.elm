module Rebound where

import Signal
import Native.Rebound

type OnSpring
  = UpdateValue Float
  | AtRestValue Float

spring : Signal.Signal Float -> Signal.Signal OnSpring
spring = Native.Rebound.spring
