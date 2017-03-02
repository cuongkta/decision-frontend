module Users.API
    exposing
        ( fetchUsers
        )

import Model exposing (Model)
import Types exposing (User)
import Http
import Decoders
import Json.Decode as JD


fetchUsers : Model -> (Result Http.Error (List User) -> msg) -> Cmd msg
fetchUsers model msg =
    get model "/api/v1/users/" Decoders.usersDecoder msg


get : Model -> String -> JD.Decoder a -> (Result Http.Error a -> msg) -> Cmd msg
get model path decoder msg =
    Http.request
        { method = "GET"
        , url = model.apiUrl ++ path
        , body = Http.emptyBody
        , headers = [ (Http.header "Content-Type" "application/json"), (Http.header "Authorization" model.token) ]
        , expect =
            Http.expectJson
                (JD.field "data" decoder)
        , timeout = Nothing
        , withCredentials = False
        }
        |> Http.send msg
