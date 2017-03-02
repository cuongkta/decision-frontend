module Model exposing (Model, initialModel)

import Route
import Transit
import Msg exposing (Msg)
import Types
    exposing
        ( User
        , ValidateUser
        )
import Decisions.Model exposing (..)
import Translation.Utils exposing (..)


type alias Model =
    Transit.WithTransition
        { baseUrl : String
        , apiUrl : String
        , route : Route.Model
        , decisions : Decisions.Model.Model
        , currentLanguage : Language
        , token : String
        }


initialModel : Maybe Route.Location -> Model
initialModel location =
    { transition = Transit.empty
    , baseUrl = "http://localhost:4000"
    , apiUrl = "http://localhost:5000"
    , route = Route.init location
    , decisions = Decisions.Model.initialModel
    , currentLanguage = English
    , token = ""
    }
