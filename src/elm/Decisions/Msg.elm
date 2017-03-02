module Decisions.Msg exposing (DecisionMsg(..))

import Transit


type DecisionMsg
    = NoOp
    | TransitDecisionMsg (Transit.Msg DecisionMsg)
    | SearchInput String
