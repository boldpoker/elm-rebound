import Debug
import Rebound
import Graphics.Element exposing (..)
import Color
import Mouse
import Signal

main : Signal Element
main =
  Signal.map (\v -> view v) (Rebound.spring 1.0)

view : Float -> Element
view progress =
  empty
    |> size (truncate (300 * progress)) (truncate (300 * progress))
    |> color Color.blue
