module Msg exposing (Msg(..))

import Route
import Navigation
import Route
import Transit
import Decisions.Msg exposing (DecisionMsg(..))


type Msg
    = UrlChange Navigation.Location
    | NoOp
    | SetPage (Maybe Route.Location)
    | TransitMsg (Transit.Msg Msg)
    | DecisionMsg_ DecisionMsg
