GolfProAssignment:
    type: assignment
    debug: false
    interact scripts:
    - GolfProInteract
    actions:
        on assignment:
        - trigger name:proximity toggle:true radius:4
        - trigger name:click toggle:true

GolfProFormat:
    type: format
    debug: false
    format: "<dark_green>Golf Pro Gary<white><&co> <text>"

GolfProInteract:
    type: interact
    debug: false
    steps:
        Greeting*:
            proximity trigger:
                entry:
                    script:
                    - if <player.inventory.contains.flagged[golfball]>:
                        - narrate format:GolfProFormat "Here to return some golf balls?"
                        - narrate "<gray>Right-click the Golf Pro to return your extra golf balls and get some of your gold back!"
                        - zap ReturnBalls
                    - else:
                        - narrate format:GolfProFormat "Well hey there <player.name>, you here for some mini-golf? I've got plenty of golf balls here for you!"
                        - wait 0.5s
                        - narrate format:GolfProFormat "Just a note - they're enchanted! They'll fizzle away after a little while and plop back into these buckets. Not that you'd ever try to steal my golf balls, I'm sure."
                        - wait 0.5s
                        - narrate format:GolfProFormat "It's only 25 gold to check out a golf ball! What do you say?"
                        - narrate "<gray>Right-click the Golf Pro to see the golf balls he has available!"
                exit:
                    script:
                    - narrate format:GolfProFormat "Good to see you!"
            click trigger:
                script:
                - if <player.money> >= 25:
                    - inventory open d:GolfBallInventory_Base
                - else:
                    - narrate format:GolfProFormat "Trying to get yourself a free golf ball, are you? Come back when you've got 25 gold!"
        ReturnBalls:
            click trigger:
                script:
                - define quantity <player.inventory.quantity.flagged[golfball]>
                - take flagged:golfball
                - give money quantity:<[quantity].mul[5]>
                - narrate format:GolfProFormat "Thanks for returning those golf balls! Here's <[quantity].mul[5]> gold for your trouble."
                - zap Greeting
            proximity trigger:
                exit:
                    script:
                    - narrate format:GolfProFormat "Good to see you!"
                    - zap Greeting

GolfBallInventory_Base:
    type: inventory
    inventory: chest
    debug: false
    title: Mini-Golf Balls
    size: 45
    slots:
    - [GolfBall_White] [GolfBall_Red] [GolfBall_Orange [GollfBall_Yellow] [GolfBall_Green] [GolfBall_Sky] [GolfBall_Blue] [GolfBall_Violet] [GolfBall_Purple]
    - [GolfBall_Gray] [GolfBall_Brown] [GolfBall_Goldenrod] [GolfBall_Lime] [GolfBall_Olive] [GolfBall_Cyan] [GolfBall_Black] [GolfBall_Beige] [GolfBall_Pink]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] [Patron_GolfBall_Inventory_Ball]

Patron_GolfBall_Inventory_ball:
    type: item
    material: GolfBall_base
    debug: false
    lore_list:
    - <&6>Coming soon to a Golf Pro near you - exclusive golf ball skins for Patrons! Become a patron via <&b>/patreon
    mechanisms:
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>

GolfBallInventoryHandler:
    type: world
    debug: false
    events:
        on player clicks GolfBall_* in GolfBallInventory*:
        - inventory close
        - if <player.money> >= 25:
            - take money quantity:25
            - give <context.item>
            - narrate format:GolfProFormat "Happy golfing!"
        on player clicks in GolfBallInventory* priority:100:
        - determine cancelled
        on player drags in GolfBallInventory* priority:100:
        - determine cancelled