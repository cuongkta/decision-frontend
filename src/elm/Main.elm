module Main exposing (..)

import Html exposing (Html, text, div, span, a, nav, form, h3, h4, input, p, img, h1, h2, select, option, node, button, ul, li)
import Html.Attributes exposing (attribute, style, id, class, src, href, placeholder, style, class, value, alt, selected)


main : Html.Html msg
main =
    div []
        [ nav [ class "navbar navbar-toggleable-md navbar-inverse bg-inverse mb-4" ]
            [ button [ attribute "aria-controls" "navbarCollapse", attribute "aria-expanded" "false", attribute "aria-label" "Toggle navigation", class "navbar-toggler navbar-toggler-right", attribute "data-target" "#navbarCollapse", attribute "data-toggle" "collapse" ]
                [ span [ class "navbar-toggler-icon" ]
                    []
                ]
            , a [ class "navbar-brand", href "#" ]
                [ text "Top navbar" ]
            , div [ class "collapse navbar-collapse", id "navbarCollapse" ]
                [ ul [ class "navbar-nav mr-auto" ]
                    [ li [ class "nav-item active" ]
                        [ a [ class "nav-link", href "#" ]
                            [ text "Home "
                            , span [ class "sr-only" ]
                                [ text "(current)" ]
                            ]
                        ]
                    , li [ class "nav-item" ]
                        [ a [ class "nav-link", href "#" ]
                            [ text "Link" ]
                        ]
                    , li [ class "nav-item" ]
                        [ a [ class "nav-link disabled", href "#" ]
                            [ text "Disabled" ]
                        ]
                    ]
                , form [ class "form-inline mt-2 mt-md-0" ]
                    [ input [ class "form-control mr-sm-2", placeholder "Search" ]
                        []
                    , button [ class "btn btn-outline-success my-2 my-sm-0" ]
                        [ text "Search" ]
                    ]
                ]
            ]
        , div
            [ class "container" ]
            [ div [ class "jumbotron" ]
                [ h1 []
                    [ text "Navbar example" ]
                , p [ class "lead" ]
                    [ text "This example is a quick exercise to illustrate how the top-aligned navbar works. As you scroll, this navbar remains in its original position and moves with the rest of the page." ]
                , a [ class "btn btn-lg btn-primary", href "../../components/navbar/", attribute "role" "button" ]
                    [ text "View navbar docs &raquo;" ]
                ]
            ]
        ]
