module LogoSvg exposing (..)

import Svg exposing (Svg, clipPath, svg, node, clipPath, text, defs, circle)
import Svg.Attributes exposing (width, height, id, cx, cy, fill)
import Html.Attributes exposing (attribute)

logo : Svg msg
logo =
  svg
    [ id "logo"
    , height "0"
    , width "0"
    ]
    [ defs []
      [ clipPath
        [id "logo-clip-path" ]
        [ node "text"
            [ attribute "font-family" "Rubik"
            , attribute "font-size" "200px"
            , attribute "font-weight" "500"
            , attribute "x" "0"
            , attribute "y" "150"
            , fill "black"
            ]
            [ text "elmu" ]
        ]
      ]
    ]
