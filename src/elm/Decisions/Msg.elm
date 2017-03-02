module Decisions.Msg exposing (DecisionMsg(..))

import Transit
import Http
import Types exposing (User)


type DecisionMsg
    = NoOp
    | TransitDecisionMsg (Transit.Msg DecisionMsg)
    | SearchInput String
    | GotUsers (Result Http.Error (List User))
