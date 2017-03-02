module Types exposing (..)

--import Dict exposing (Dict)


type alias User =
    { id : Maybe Int
    , name : String
    , given_name : String
    , email : String
    , password : String
    , password_confirmation : String
    , token : String
    , current_language : String
    , level : Int
    , sex : Int
    , birthdate : String
    , mobile : String
    , canton_id : Int
    , city_id : Int
    , certified : Bool
    , image_path : String
    , is_follow : Bool
    , permit : String
    }


type alias ValidateUser =
    { id : Maybe Int
    , name : String
    , given_name : String
    , email : String
    , password : String
    , password_confirmation : String
    , token : String
    , current_language : String
    , level : Int
    }


type alias ImagePortData =
    { contents : String
    , filename : String
    }
