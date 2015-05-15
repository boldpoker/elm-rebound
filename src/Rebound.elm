module Rebound where

import Task exposing (Task)
import Native.Rebound

spring : (Float -> Task () ()) -> Task error ()
spring = Native.Rebound.spring
