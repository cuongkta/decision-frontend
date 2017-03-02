port module Update exposing (update, storageInput, urlUpdate, fileContentRead)

import Model exposing (Model)
import Navigation
import Route exposing (Location(..))
import Transit
import Util
import Msg exposing (Msg(..))
import Types exposing (User, ImagePortData)
import Decisions.Update exposing (..)


port storageInput : (String -> msg) -> Sub msg


port setStorage : String -> Cmd msg


port removeStorage : String -> Cmd msg


port setLanguage : String -> Cmd msg


port removeLanguage : String -> Cmd msg


port fileSelected : String -> Cmd msg


port fileContentRead : (ImagePortData -> msg) -> Sub msg


urlUpdate : Navigation.Location -> Model -> ( Model, Cmd Msg )
urlUpdate location oldModel =
    let
        router =
            Route.locFor location

        newModel =
            { oldModel | route = router }
    in
        newModel ! (Util.cmdsForModelRoute newModel)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    --case Debug.log "msg: " msg of
    case msg of
        UrlChange loc ->
            urlUpdate loc model

        SetPage maybeLocation ->
            case maybeLocation of
                Nothing ->
                    model ! []

                Just location ->
                    ( { model | route = Route.init maybeLocation }, Navigation.newUrl (Route.urlFor location) )

        DecisionMsg_ subMsg ->
            let
                ( updatedDecision, cmd ) =
                    Decisions.Update.update subMsg model model.decisions
            in
                ( { model | decisions = updatedDecision }
                , Cmd.map DecisionMsg_ cmd
                )

        TransitMsg transitMsg ->
            Transit.tick TransitMsg transitMsg model

        Goto page ->
            Transit.start TransitMsg (SetPage page) ( 300, 200 ) model

        NoOp ->
            model ! []
