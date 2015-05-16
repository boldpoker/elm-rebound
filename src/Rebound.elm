module Rebound where

import Signal
import Native.Rebound
import Time


spring : Float -> Signal.Signal Float
spring = Native.Rebound.spring
