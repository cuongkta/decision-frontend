module View exposing (view)

import Html as App
import Model exposing (Model)
import Msg exposing (Msg(..))
import Route exposing (Location(..))
import Html exposing (Html, text, div, span, node)
import Html.Attributes exposing (attribute, style, class)
import Html as Html
import Main.Home
import Decisions.View.ListDecision
import Translation.Utils exposing (..)
import Helper.TransitStyle as TransitStyle


view : Model -> Html Msg
view model =
    div
        [ style [ ( "margin", "auto" ), ( "max-width", "800px" ), ( "padding-top", "10px" ) ] ]
        [ div [] [ text "Head" ]
        , div
            --[ style [ ("opacity", toString (Transit.getValue model.transition)) ]]
            [ style <| (TransitStyle.fadeSlide 200 model.transition) ++ [ ( "padding", "1rem" ) ] ]
            [ body model
            ]
        ]


body : Model -> Html Msg
body model =
    let
        translator =
            newtranslate model.currentLanguage
    in
        case model.route of
            Just (Route.Home) ->
                Main.Home.view model

            Just Users ->
                App.map DecisionMsg_ (Decisions.View.ListDecision.view model.decisions model.currentLanguage translator)

            Nothing ->
                text "404"
