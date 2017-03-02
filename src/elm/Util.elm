module Util exposing (cmdsForModelRoute)

import Model exposing (Model)
import Msg exposing (Msg(..))
import Decisions.API as DecisionAPI
import Route exposing (Location(..))
import Decisions.Msg exposing (DecisionMsg(..))


cmdsForModelRoute : Model -> List (Cmd Msg)
cmdsForModelRoute model =
    case model.route of
        Just Users ->
            [ DecisionAPI.fetchUsers model (DecisionMsg_ << GotUsers) ]

        _ ->
            []
