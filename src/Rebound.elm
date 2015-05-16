module Rebound where

import Signal
import Native.Rebound
import Time


spring : Signal.Signal Float -> Signal.Signal Float
spring = Native.Rebound.spring
