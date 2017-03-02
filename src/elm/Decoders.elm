module Decoders
    exposing
        ( usersDecoder
        , userDecoder
        )

import Json.Decode as JD
import Types exposing (User)
import Http
import Json.Decode.Pipeline exposing (decode, required, optional, hardcoded)
import Dict exposing (Dict)


usersDecoder : JD.Decoder (List User)
usersDecoder =
    JD.list userDecoder


userDecoder : JD.Decoder User
userDecoder =
    decode User
        |> required "id" (JD.nullable JD.int)
        |> required "name" JD.string
        |> required "given_name" JD.string
        |> required "email" JD.string
        |> required "password" JD.string
        |> required "password_confirmation" JD.string
        |> required "token" JD.string
        |> required "current_language" JD.string
        |> optional "level" JD.int 0
        |> optional "sex" JD.int 0
        |> optional "birthdate" JD.string ""
        |> optional "mobile" JD.string ""
        |> optional "canton_id" JD.int 0
        |> optional "city_id" JD.int 0
        |> optional "certified" JD.bool False
        |> optional "image_path" JD.string "N/A"
        |> optional "is_follow" JD.bool False
        |> optional "permit" JD.string ""
