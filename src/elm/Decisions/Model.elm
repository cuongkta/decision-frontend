module Decisions.Model exposing (..)

import Transit


type alias Model =
    Transit.WithTransition
        { total_decisions : Int
        }


initialModel : Model
initialModel =
    { transition = Transit.empty
    , total_decisions = 0
    }
