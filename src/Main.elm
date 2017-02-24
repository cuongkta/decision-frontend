module Main exposing (..)

import Html exposing (Html, text, div, span, a, h3, h4, p, img, h2, select, option, node)
import Html.Attributes exposing (attribute, style, class, src, href, style, class, value, alt, selected)


main : Html.Html msg
main =
    div [ class "card", attribute "style" "width: 20rem;" ]
        [ img [ alt "Card image cap", class "card-img-top" ]
            []
        , div [ class "card-block" ]
            [ h4 [ class "card-title" ]
                [ text "Card title" ]
            , p [ class "card-text" ]
                [ text "Some quick example text to build on the card title and make up the bulk of the card's content." ]
            , a [ class "btn btn-primary", href "#" ]
                [ text "Go somewhere" ]
            ]
        ]
