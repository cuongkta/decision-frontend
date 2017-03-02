module Main exposing (..)

import Navigation
import View
import Update
import Model exposing (Model)
import Route
import Msg exposing (Msg(..))
import Transit
import Translation.Utils exposing (Language(..))
import String
import Decisions.Msg exposing (DecisionMsg(..))
import Translation.Utils exposing (Language(..))


type alias ProgramFlags =
    { token : Maybe String
    , language : String
    }


main : Program ProgramFlags Model Msg
main =
    Navigation.programWithFlags UrlChange
        { init = init
        , update = Update.update
        , view = View.view
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Transit.subscriptions TransitMsg model
        , Sub.map DecisionMsg_ (Transit.subscriptions TransitDecisionMsg model.decisions) {- , Update.storageInput Set -}
        ]


init : ProgramFlags -> Navigation.Location -> ( Model, Cmd Msg )
init programFlags location =
    let
        router =
            Route.locFor location

        initialModel =
            Model.initialModel router

        initialLanguage =
            initLanguage programFlags.language
    in
        --model ! Util.cmdsForModelRoute model
        case programFlags.token of
            Nothing ->
                Update.urlUpdate location <| { initialModel | currentLanguage = initialLanguage }

            Just token ->
                Update.urlUpdate location <| { initialModel | token = token }


initLanguage : String -> Language
initLanguage lang =
    if String.startsWith "fr" lang then
        French
    else if String.startsWith "de" lang then
        German
    else if String.startsWith "it" lang then
        Italian
    else
        English
