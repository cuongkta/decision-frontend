module Util exposing (cmdsForModelRoute)

import Model exposing (Model)
import Msg exposing (Msg(..))


cmdsForModelRoute : Model -> List (Cmd Msg)
cmdsForModelRoute model =
    case model.route of
        {- Just (NewInitiative id) ->
           [ Cmd.batch
               [ API.fetchCategories model (DecisionMsg_ << GotCategories) {- , setTab model 3   ( InitiativeMsg_ << SelectTab) -}
               ]
           ]
        -}
        _ ->
            []
