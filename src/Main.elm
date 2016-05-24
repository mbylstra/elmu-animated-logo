import Collage exposing (collage, circle, outlined, defaultLine)
import Html exposing (Html, div, node, text)
import Html.Attributes exposing (class)
import Html.App as App
import Element exposing (toHtml)
import AnimationFrame

import LogoSvg exposing (logo)

type Model = Int

init = (0, Cmd.none)

type Msg = Tick Float

update msg model =
  case msg of
    Tick diff ->
      ((model + (round (diff / 16))) % 300, Cmd.none)

subscriptions model =
  AnimationFrame.diffs Tick

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
  |> toHtml

view model =
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

main =
  App.program
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }
