module Meetups exposing (Meetup, Talk, nextMeetup, pastMeetups)


type alias Talk =
    { speaker : String
    , title : String
    , description : String
    , link : String
    }


type alias Meetup =
    { date : String
    , location : String
    , lineUp : List Talk
    }


nextMeetup : Meetup
nextMeetup =
    { date = "2016-09-16"
    , location =
        "JS-Republic"
    , lineUp =
        [ { speaker = "@tbrisbout"
          , title = "elm-css"
          , link = ""
          , description = "Presentation of the elm-css preprocessor and the advantage of a statically typed approach to CSS"
          }
        ]
    }


pastMeetups : List Meetup
pastMeetups =
    [ meetup1 ]


meetup1 : Meetup
meetup1 =
    { date = "2016-03-24"
    , location = "Meetic"
    , lineUp =
        [ { speaker = "@tbrisbout"
          , title = "Elm Language and Tooling overview"
          , description = "Ce talk est une introduction au langage, avec un tour d'horizon de la syntaxe, des outils et de la communauté."
          , link = "http://slides.com/thomasbrisbout/elm-intro/fullscreen"
          }
        , { speaker = "@jumichot"
          , title = "Elm Livecoding"
          , description = "Après la théorie, place à la pratique. L'idée est d'explorer et de comprendre l'architecture Elm avec un cas d'usage sur un live-coding d'une nouvelle application"
          , link = "http://slides.com/jumichot/elm-signals/fullscreen"
          }
        , { speaker = "@klebrun"
          , title = "Real World Elm"
          , description = "Ce talk fera un retour d’expérience de différentes expérimentations pour intégrer des composants en Elm dans une application existante, en passant sur les différentes problématiques d'appels HTTP, de traitement de payload et d'échange de message avec du code JS."
          , link = "http://slides.com/kevinlebrun/real-world-elm/fullscreen"
          }
        ]
    }
