module Test exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Svg exposing (Svg, svg, rect, circle, line)
import Svg.Attributes exposing (width, height, viewBox, x, y, rx, ry, cx, cy, r, fill, x1, x2, y1, y2, stroke, strokeWidth, transform)

main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model = Float

model : Model
model =
  0

-- UPDATE
type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + pi / 30

    Decrement ->
      model - pi / 30

-- VIEW
view : Model -> Html Msg
view model = 
    div []
    -- SVG
    [ svg
        [ width "200"
        , height "200"
        , viewBox "-2 -2 4 4"
        ]
        [ 
            -- 単位円
            circle 
            [
            cx "0"
            , cy "0"
            , r "1"
            , fill "#dc143c55"
            ]
            []

            -- 楕円
            , circle 
            [
            cx "0"
            , cy "0"
            , r "1"
            , transform "scale(0.5 1.5)"
            , fill "#00800055"
            ]
            []

            -- 楕円
            , circle 
            [
            cx "0"
            , cy "0"
            , r "1"
            , transform "scale(1.5 0.5)"
            , fill "#e4007f55"
            ]
            []
            
            -- 円周上を動く点
            , circle 
            [
            cx (toString (cos model))
            -- 数学のy軸とは反転しているため-1倍
            ,cy (toString (sin -model))
            , r "0.1"
            , fill "crimson"
            ]
            []

            -- 楕円軌道する
            , circle 
            [
            cx (toString (0.5 *  cos model))
            ,cy (toString (1.5 * sin -model))
            , r "0.1"
            , fill "green"
            ]
            []

            -- 楕円軌道する(その2)
            , circle 
            [
            cx (toString (1.5 *  cos model))
            ,cy (toString (0.5 * sin -model))
            , r "0.1"
            , fill "magenta"
            ]
            []

            -- y軸の線
            , line 
            [
            x1 "0"
            , x2 "0"
            , y1 "-2"
            , y2 "2"
            , strokeWidth "0.01"
            , stroke "black"
            ]
            []
            
            -- x軸の線
            , line 
            [
            x1 "-2"
            , x2 "2"
            , y1 "0"
            , y2 "0"
            , strokeWidth "0.01"
            , stroke "black"
            ]
            []

            -- x軸の補助線
            , line 
            [
            x1 "1"
            , x2 "1"
            , y1 "0.2"
            , y2 "-0.2"
            , strokeWidth "0.01"
            , stroke "black"
            ]
            []

            , line 
            [
            x1 "0.5"
            , x2 "0.5"
            , y1 "0.2"
            , y2 "-0.2"
            , strokeWidth "0.01"
            , stroke "black"
            ]
            []

            , line 
            [
            x1 "1.5"
            , x2 "1.5"
            , y1 "0.2"
            , y2 "-0.2"
            , strokeWidth "0.01"
            , stroke "black"
            ]
            []

            , line 
            [
            x1 "-1"
            , x2 "-1"
            , y1 "0.2"
            , y2 "-0.2"
            , strokeWidth "0.01"
            , stroke "black"
            ]
            []

            , line 
            [
            x1 "-0.5"
            , x2 "-0.5"
            , y1 "0.2"
            , y2 "-0.2"
            , strokeWidth "0.01"
            , stroke "black"
            ]
            []

            , line 
            [
            x1 "-1.5"
            , x2 "-1.5"
            , y1 "0.2"
            , y2 "-0.2"
            , strokeWidth "0.01"
            , stroke "black"
            ]
            []
            -- x軸の補助線

            -- y軸の補助線
            , line 
            [
            x1 "0.2"
            , x2 "-0.2"
            , y1 "0.5"
            , y2 "0.5"
            , strokeWidth "0.01"
            , stroke "black"
            ]
            []

            , line 
            [
            x1 "0.2"
            , x2 "-0.2"
            , y1 "1"
            , y2 "1"
            , strokeWidth "0.01"
            , stroke "black"
            ]
            []

            , line 
            [
            x1 "0.2"
            , x2 "-0.2"
            , y1 "1.5"
            , y2 "1.5"
            , strokeWidth "0.01"
            , stroke "black"
            ]
            []

            , line 
            [
            x1 "0.2"
            , x2 "-0.2"
            , y1 "-0.5"
            , y2 "-0.5"
            , strokeWidth "0.01"
            , stroke "black"
            ]
            []

            , line 
            [
            x1 "0.2"
            , x2 "-0.2"
            , y1 "-1"
            , y2 "-1"
            , strokeWidth "0.01"
            , stroke "black"
            ]
            []

            , line 
            [
            x1 "0.2"
            , x2 "-0.2"
            , y1 "-1.5"
            , y2 "-1.5"
            , strokeWidth "0.01"
            , stroke "black"
            ]
            []
            -- y軸の補助線
        ]
    , button [ onClick Increment ] [ text "clockwise" ]
    , button [ onClick Decrement ] [ text "Counterclockwise" ]
    , div [] [ text ("t = " ++ toString model) ]
    ]