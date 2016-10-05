module Meetups exposing (Meetup, Talk, nextMeetup, pastMeetups)

import Speakers exposing (..)


type alias Talk =
    { speaker : Speaker
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
        [ { speaker = tbrisbout
          , title = "elm-css"
          , link = "https://slides.com/thomasbrisbout/elm-css/fullscreen#/"
          , description = "Nous verrons dans ce talk comment un système de type peut aider à faire du CSS de manière fiable: Imaginez par exemple être notifié sur une typo dans un nom de classe..."
          }
        , { speaker = n_umiastowski
          , title = "Donner et recevoir avec la communauté Elm sur Slack"
          , link = "http://slides.com/numiastowski/deck/fullscreen"
          , description = "Nous verrons dans ce talk comment un système de type peut aider à faire du CSS de manière fiable: Imaginez par exemple être notifié sur une typo dans un nom de classe..."
          }
        , { speaker = klebrun
          , title = "Elm + Polymer = <3"
          , description = "Après ce talk vous aurez tous les outils en main pour intégrer des composants tiers avec votre application Elm. Le cas d'étude portera sur les interactions entre Elm et des composants Polymer."
          , link = "http://slides.com/kevinlebrun/elm-polymer-3/fullscreen"
          }
        , { speaker = tibastral
          , title = "Video Game in Elm without any framework"
          , description = "How reactive programming will take over the world !!"
          , link = ""
          }
        ]
    }


pastMeetups : List Meetup
pastMeetups =
    [ meetup1, meetup2, meetup3 ]


meetup1 : Meetup
meetup1 =
    { date = "2016-03-24"
    , location = "Meetic"
    , lineUp =
        [ { speaker = tbrisbout
          , title = "Elm Language and Tooling overview"
          , description = "Ce talk est une introduction au langage, avec un tour d'horizon de la syntaxe, des outils et de la communauté."
          , link = "http://slides.com/thomasbrisbout/elm-intro/fullscreen"
          }
        , { speaker = jumichot
          , title = "Elm Livecoding"
          , description = "Après la théorie, place à la pratique. L'idée est d'explorer et de comprendre l'architecture Elm avec un cas d'usage sur un live-coding d'une nouvelle application"
          , link = "http://slides.com/jumichot/elm-signals/fullscreen"
          }
        , { speaker = klebrun
          , title = "Real World Elm"
          , description = "Ce talk fera un retour d’expérience de différentes expérimentations pour intégrer des composants en Elm dans une application existante, en passant sur les différentes problématiques d'appels HTTP, de traitement de payload et d'échange de message avec du code JS."
          , link = "http://slides.com/kevinlebrun/real-world-elm/fullscreen"
          }
        ]
    }


meetup2 : Meetup
meetup2 =
    { date = "2016-05-04"
    , location = "BeMyApp"
    , lineUp =
        [ { speaker = tbrisbout
          , title = "Elm sur le desktop avec Electron"
          , description = ""
          , link = "http://slides.com/thomasbrisbout/elm-electron/fullscreen"
          }
        , { speaker = jumichot
          , title = "Elm Livecoding: JSON & API Call"
          , description = ""
          , link = "http://slides.com/jumichot/elm-signals/fullscreen"
          }
        , { speaker = abaumann
          , title = "Elm et Graphisme"
          , description = ""
          , link = ""
          }
        ]
    }


meetup3 : Meetup
meetup3 =
    { date = "2016-06-21"
    , location = "LeBonCoin"
    , lineUp =
        [ { speaker = tbrisbout
          , title = "Testing en Elm"
          , description = "Ce lightning talk tentera de répondre au questions suivantes: Quels outils sont disponibles pour faire des tests en elm, qu'est ce qui marche en 0.17, et pourquoi faire des tests quand on a un compilateur aussi pratique ?"
          , link = "http://slides.com/thomasbrisbout/elm-testing/fullscreen"
          }
        , { speaker = tellijo
          , title = "Routeur SPA en Elm"
          , description = ""
          , link = "http://slides.com/tellijo/routing-elm/fullscreen"
          }
        , { speaker = klebrun
          , title = "Migration d'une application vers Elm 0.17"
          , description = "Ce talk fera le point sur les nouveautés de la version 0.17 via un retour d'expérience pratique sur la mise à jour d'une application de elm 0.16 à 0.17, comment migrer les signaux vers les subscriptions / commandes / messages, en décrivant les nouveaux patterns à utiliser."
          , link = "http://slides.com/kevinlebrun/from-elm016-to-elm017/fullscreen"
          }
        , { speaker = abaumann
          , title = "Live coding d'un algorithme de génération de donjon en elm"
          , description = "Ce talk parlera de gaming avec le coding d'un algorithme de génération procédural et aléatoire de donjon avec sa représentation graphique. "
          , link = "https://youtu.be/w11dtJawNE0?list=PLFmYNJ_DUU2DPZH2Vfok0jdfkGPcrL0JA"
          }
        ]
    }
