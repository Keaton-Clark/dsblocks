#!/bin/dash
pacmd list-sinks | awk '
    BEGIN {
        mp = 0
    }
    /\* index: /,0 {
        if ($1 == "index:") {
            exit
        } else if ($1 == "muted:" && $2 == "yes") {
            mp += 1
        } else if ($1 == "volume:") {
            volumela = $3
            volumelp = $5
            volumera = $10
            volumerp = $12
        } else if ($1 == "active" && $2 == "port:" && $3 ~ /headphones/) {
            mp += 2
        }
    }
    END {
        if (volumela == volumera) {
            printf "%d%s", mp, volumelp
        } else {
            printf "%dL%s R%s", mp, volumelp, volumerp
        }
    }
'
