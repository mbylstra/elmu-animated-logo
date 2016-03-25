import Graphics.Collage as Collage exposing (collage, circle, outlined, defaultLine)
import Html exposing (Html, fromElement, div, node, text)
import Html.Attributes exposing (class)
import Time


import Effects exposing (Never)
import StartApp

import LogoSvg exposing (logo)

type Model = Int
init = (0, Effects.none)

type Action
  = ClockTick

clockTickSignal = Signal.map (\_ -> ClockTick) (Time.fps 60)

update action model =
  case action of
    ClockTick ->
      ((model + 1) % 300, Effects.none)

styleString = """
  @import url(https://fonts.googleapis.com/css?family=Rubik:500,400,300,700);

  .canvas {
    margin: 100px;
  }
  canvas {
    -webkit-clip-path: url(#logo-clip-path);
    clip-path: url(#logo-clip-path);
  }

"""

canvas width =
  collage 600 200 (circles (toFloat width))
  |> fromElement

view address model =
  div []
    [ node "style" [] [ text styleString ]
    , logo
    , div
      [ class "canvas" ]
      [ canvas (model + 5) ]
    ]

circles number =
  let
    width = (1.0 / number) * 1500
  in
    List.map (\i -> defaultCircle (i * (width / 5.0))) [1..number]

defaultCircle radius =
  circle radius
      |> outlined { defaultLine | width = 1 }

app =
  StartApp.start
    { init = init
    , update = update
    , view = view
    , inputs = [clockTickSignal]
    }

main =
  app.html
