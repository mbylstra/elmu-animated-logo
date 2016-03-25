module LogoSvg where

import Svg exposing (clipPath, svg, node, clipPath, text, Svg, defs, circle)
import Svg.Attributes exposing (width, viewBox, id, height, cx, cy, r, fill, stroke)
import Html.Attributes exposing (attribute)

logo : Svg
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
