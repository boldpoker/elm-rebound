module Rebound where

import Signal
import Native.Rebound
import Time

type Progress
  = Value Float
  | Complete Float


spring : Signal.Signal Float -> Signal.Signal Progress
spring = Native.Rebound.spring
