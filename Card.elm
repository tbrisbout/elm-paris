module Card exposing (displayCard)

import Meetups exposing (Talk)
import Html exposing (..)
import Html.Attributes exposing (src, style, href, class, target)
import Css exposing (flex, color, padding, px, pc, textAlign, left)
import FontAwesome.Web as Icon
import FontAwesome.Brand as Brand
import Speakers exposing (Speaker)
import Styles exposing (..)


displayCard : Talk -> Html a
displayCard talk =
    li [ cardStyles ]
        [ displaySpeaker talk.speaker
        , displayTalkInfo talk
        ]


displaySpeaker : Speaker -> Html a
displaySpeaker { fullName, twitter } =
    let
        layout =
            styles [ flex (pc 25) ]

        attributes =
            [ class "speaker"
            , target "_blank"
            , styles
                [ color speakerLink
                , flex (pc 25)
                ]
            ]

        twitterUrl handle =
            "https://twitter.com/" ++ handle

        twitterPic handle =
            twitterUrl handle ++ "/profile_image?size=bigger"
    in
        case twitter of
            Just handle ->
                span [ layout ]
                    [ img [ src (twitterPic handle), avatarStyle ] []
                    , br [] []
                    , text fullName
                    , br [] []
                    , a ((handle |> twitterUrl |> href) :: attributes)
                        [ Brand.twitter
                        , text (" " ++ handle)
                        ]
                    ]

            Nothing ->
                span [ layout ]
                    [ img [ src "/images/elm-lang.png", avatarStyle ] []
                    , br [] []
                    , text fullName
                    ]


displayTalkInfo : Talk -> Html a
displayTalkInfo { title, description, link } =
    div
        [ styles
            [ padding (px 10)
            , flex (pc 75)
            ]
        ]
        [ h3 [ styles [ color talkTitle ] ] [ text title ]
        , br [] []
        , p [ styles [ textAlign left ] ]
            [ text description
            ]
        , a [ href link, target "_blank" ] [ Icon.desktop, text " Slides" ]
        , br [] []
        ]
