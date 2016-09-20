module Styles exposing (..)

import Html exposing (Html, node)
import Html.Attributes exposing (style, attribute)
import Css exposing (..)


styles : List Css.Mixin -> Html.Attribute a
styles =
    Css.asPairs >> style


headerBg : Color
headerBg =
    hex "#3ca0b8"


headerColor : Color
headerColor =
    hex "#ffffff"


talkTitle : Color
talkTitle =
    hex "#e33e57"


eventTitle : Color
eventTitle =
    hex "#7fd13b"


speakerLink : Color
speakerLink =
    hex "#4343ff"


viewStyles : Html.Attribute a
viewStyles =
    styles
        [ height (pc 100)
        , margin (px 0)
        , textAlign center
        , fontFamilies [ "Montserrat", "Arial" ]
        , backgroundColor (hex "#ffggff")
        ]


headerStyles : Html.Attribute a
headerStyles =
    styles
        [ backgroundColor headerBg
        , color headerColor
        , padding (px 20)
        ]


cardStyles : Html.Attribute a
cardStyles =
    ( "box-shadow", "0 35px 37px rgba(0, 0, 0, 0.1)" )
        :: ([ backgroundColor (hex "#ffffff")
            , color (hex "#000000")
            , width (pc 50)
            , margin3 (px 0) auto (px 25)
            , padding (px 10)
            ]
                |> Css.asPairs
           )
        |> style



-- Hack for external stylesheet in reactor


loadStylesheet : String -> Html a
loadStylesheet url =
    let
        tag =
            "link"

        attrs =
            [ attribute "rel" "stylesheet"
            , attribute "property" "stylesheet"
            , attribute "href" url
            ]

        children =
            []
    in
        node tag attrs children


fontAwesome : Html a
fontAwesome =
    loadStylesheet "https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"


bootstrap : Html a
bootstrap =
    loadStylesheet "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"


externalStylesheets : List (Html a)
externalStylesheets =
    [ fontAwesome, bootstrap ]
