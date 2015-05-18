import Debug
import Rebound
import Graphics.Element exposing (..)
import Color
import Mouse
import Signal
import Time

main : Signal Element
main =
  Signal.map (\progress ->
    case progress of
      Rebound.Value val -> view val
      Rebound.Complete val -> view val
  ) (Rebound.spring  (Signal.foldp (\_ s -> s+0.1) 0.0 (Time.every 1000)))

view : Float -> Element
view progress =
  empty
    |> size (truncate (300 * progress)) (truncate (300 * progress))
    |> color Color.blue
