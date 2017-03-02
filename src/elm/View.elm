module View exposing (view)

import Model exposing (Model)
import Msg exposing (Msg(..))
import Route exposing (Location(..))
import Html exposing (Html, text, div, span, node)
import Html.Attributes exposing (attribute, style, class)
import Html as Html
import Main.Home


view : Model -> Html Msg
view model =
    div
        [ style [ ( "margin", "auto" ), ( "max-width", "800px" ), ( "padding-top", "10px" ) ] ]
        [ body model ]


body : Model -> Html Msg
body model =
    case model.route of
        Just (Route.Home) ->
            Main.Home.view model

        Just Users ->
            Main.Home.view model

        Nothing ->
            text "404"
