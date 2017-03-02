module Decisions.View.ListDecision exposing (view)

import Decisions.Model exposing (..)
import Decisions.Msg exposing (DecisionMsg(..))
import Translation.Utils exposing (..)
import Html exposing (Html, text, div, form, a, select, option)
import Html.Attributes exposing (style, class, value)
import Helper.TransitStyle as TransitStyle


view : Model -> Language -> Translator -> Html DecisionMsg
view model language translate =
    div [ style <| (TransitStyle.fadeSlide 200 model.transition) ]
        [ text "List Decisions" ]
