module Speakers exposing (..)


type alias Speaker =
    { fullName : String
    , twitter : Maybe String
    }


tbrisbout : Speaker
tbrisbout =
    { fullName = "Thomas Brisbout"
    , twitter = Just "tbrisbout"
    }


jumichot : Speaker
jumichot =
    { fullName = "Julien Michot"
    , twitter = Just "jumichot"
    }


klebrun : Speaker
klebrun =
    { fullName = "Kevin Le Brun"
    , twitter = Nothing
    }


abaumann : Speaker
abaumann =
    { fullName = "Adrien Baumann"
    , twitter = Nothing
    }


alickonrails : Speaker
alickonrails =
    { fullName = "Alick Paul"
    , twitter = Just "alickonrails"
    }


tellijo : Speaker
tellijo =
    { fullName = "Joel Matëlli"
    , twitter = Just "telllijo"
    }


n_umiastowski : Speaker
n_umiastowski =
    { fullName = "Nicolas Umiastowski"
    , twitter = Just "n_umiastowski"
    }


tibastral : Speaker
tibastral =
    { fullName = "Thibault Assus"
    , twitter = Just "tibastral"
    }
