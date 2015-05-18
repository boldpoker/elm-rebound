import Debug
import Rebound
import Graphics.Element exposing (..)
import Color
import Mouse
import Signal
import Time

main : Signal Element
main =
  Signal.map (\onSpring ->
    view onSpring
  ) (Rebound.spring springConfig targetValueSignal)

targetValueSignal : Signal.Signal (Float, Float)
targetValueSignal =
  Signal.foldp (\_ s -> (fst s + 0.1, snd s)) (0.0, 3.0) (Time.every 2000)

view : Rebound.OnSpring -> Element
view onSpring =
  let
    fill = case onSpring of
      Rebound.UpdateValue _ -> Color.blue
      Rebound.AtRestValue _ -> Color.green
    length = case onSpring of
      Rebound.UpdateValue val -> Debug.watch "update value" (truncate (300 * val))
      Rebound.AtRestValue val -> Debug.watch "at rest value" (truncate (300 * val))
  in
    empty
      |> size length length
      |> color fill

springConfig =
  { tension = Just 8, friction = Just 3 }
