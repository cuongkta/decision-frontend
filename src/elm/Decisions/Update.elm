module Decisions.Update exposing (..)

import Decisions.Msg exposing (DecisionMsg(..))
import Model exposing (Model)
import Transit
import Decisions.Model exposing (..)


update : DecisionMsg -> Model.Model -> Decisions.Model.Model -> ( Decisions.Model.Model, Cmd DecisionMsg )
update msg parentModel model =
    case msg of
        SearchInput keyword ->
            model ! []

        TransitDecisionMsg transitMsg ->
            Transit.tick TransitDecisionMsg transitMsg model

        Decisions.Msg.NoOp ->
            model ! []
