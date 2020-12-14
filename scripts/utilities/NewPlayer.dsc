NewPlayerJoin:
    type: world
    debug: false
    events:
        on player logs in for the first time:
        - wait 5s
        - narrate "<&a>The Gods welcome you to Prosperus! Check your pockets for a book with some useful information..."
        - narrate "<&a>If you'd like to go start building, use a boat to sail down the river. You can get more boats from the docks."
        - narrate "<&a>Be sure to use <&b>/sethome <&a>once you get to where you want to build. You can <&b>/home<&a> to it later. (Say, if you happened to die. Not that you would.)"
        - give NewPlayerBook to:<player.inventory>
        - give oak_boat to:<player.inventory>