module Main.Home exposing (view)

import Model exposing (Model)
import Msg exposing (Msg(..))
import Html exposing (Html, text, div, span)


view : Model -> Html Msg
view model =
    div [] [ text "Main layout" ]
