module Main.Home exposing (view)

import Model exposing (Model)
import Msg exposing (Msg(..))
import Html exposing (Html, text, div, span)
import Html.Events exposing (onClick)
import Route exposing (Location(..))


view : Model -> Html Msg
view model =
    div [ onClick <| Goto (Just Users) ] [ text "Main layout" ]
