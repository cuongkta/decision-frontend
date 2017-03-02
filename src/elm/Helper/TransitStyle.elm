-- Thanks for Etaqu https://github.com/etaqu
-- will continue from here


module Helper.TransitStyle
    exposing
        ( fadeSlide
        , slide
        , slideOut
        , slideIn
        , fade
        , fadeOut
        , fadeIn
        , compose
        , Style
        )

{-| Animations for elm-transit, to be used on elm-html `style` attribute.

    div
      [ style (fadeSlide 100 model.transition) ]
      [ text "Some content" ]

# Combinations
@docs fadeSlide

# Slide left
@docs slide, slideOut, slideIn

# Fade
@docs fade, fadeOut, fadeIn

# Tooling to create animations
@docs compose, Style
-}

import Transit exposing (..)
import Ease exposing (..)


{-| Just an alias for elm-html style value
-}
type alias Style =
    List ( String, String )


{-| Compose an animation with `exit` and `enter` phases.
-}
compose : (Float -> Style) -> (Float -> Style) -> Transition -> Style
compose exit enter transition =
    case ( getStep transition, getValue transition ) of
        ( Exit, v ) ->
            exit v

        ( Enter, v ) ->
            enter v

        _ ->
            []


{-| Combine fade and slideLeft with the specified offset
-}
fadeSlide : Float -> Transition -> Style
fadeSlide offset t =
    (slide offset t) ++ (fade t)


{-| Slide animation, with the specified offset.
Greater than 0 to right, lesser to left.
-}
slide : Float -> Transition -> Style
slide offset =
    compose (slideOut offset) (slideIn offset)


{-| Slide out (exit) by translating on X for desired offset
-}
slideOut : Float -> Float -> Style
slideOut offset v =
    (Ease.outCubic (1 - v))
        * offset
        |> translateX


{-| Slide in (enter) by translating on X for desired offset
-}
slideIn : Float -> Float -> Style
slideIn offset v =
    (Ease.inCubic (v - 1))
        * offset
        |> translateX


{-| Fade animation
-}
fade : Transition -> Style
fade =
    compose fadeOut fadeIn


{-| Fade out (exit).
-}
fadeOut : Float -> Style
fadeOut v =
    inCubic v
        |> opacity


{-| Fade in (enter).
-}
fadeIn : Float -> Style
fadeIn v =
    outCubic v
        |> opacity



-- CSS styles


{-| Opacity style
-}
opacity : Float -> Style
opacity v =
    [ ( "opacity", toString v ) ]


{-| translateX style
-}
translateX : Float -> Style
translateX v =
    [ ( "transform", "translateX(" ++ toString v ++ "px)" )
    ]
