Swabby:
    type: assignment
    interact scripts:
    - WelcomeToProsperus
    actions:
        on assignment:
        - teleport npc location:<npc.anchor[shipSwabby]>
        - trigger name:proximity state:true
        - trigger name:chat state:true

"SwabbyFormat":
    type: format
    format: "<dark_green>Swabby<white><&co> <text>"

WelcomeToProsperus:
    type: interact
    steps:
        WakingUp*:
            proximity trigger:
                entry:
                    script:
                    - narrate format:SwabbyFormat "Rise and shine, <player.name>! We made it to Dawn's Landing."
                    - wait 0.7s
                    - narrate format:SwabbyFormat "You came here to build a new life for yourself, right?"
                    - zap step:AdventurePrompt
                    - if <server.current_bossbars.contains[<player.uuid>_swabby]>:
                        - bossbar update <player.uuid>_swabby players:<player> "title:Right click or chat to NPCs to talk to them! Try saying 'yes' to Swabby!" progress:1 color:blue style:solid
                    - else:
                        - bossbar create <player.uuid>_swabby players:<player> "title:Right click or chat to NPCs to talk to them! Try saying 'yes' to Swabby!" progress:1 color:blue style:solid
        AdventurePrompt:
            proximity trigger:
                entry:
                    script:
                    - narrate format:SwabbyFormat "Hey again, <player.name>. You came here to build a new life for yourself, right?"
                    - if <server.current_bossbars.contains[<player.uuid>_swabby]>:
                        - bossbar update <player.uuid>_swabby players:<player> "title:Right click or chat to NPCs to talk to them! Try saying 'yes' to Swabby!" progress:1 color:blue style:solid
                    - else:
                        - bossbar create <player.uuid>_swabby players:<player> "title:Right click or chat to NPCs to talk to them! Try saying 'yes' to Swabby!" progress:1 color:blue style:solid
                exit:
                    script:
                    - bossbar remove <player.uuid>_swabby

            click trigger:
                script:
                - narrate format:SwabbyFormat "I can't think of a better place to do it."
                - wait 0.7s
                - narrate format:SwabbyFormat "We call these lands Prosperus. As the name implies, every day is full and bright."
                - wait 0.7s
                - narrate format:SwabbyFormat "You've got a heck of an adventure ahead of you."
                - wait 0.7s
                - narrate format:SwabbyFormat "If you want to get out of town and start your adventure right away, there are boats over on that dock."
                - wait 0.7s
                - narrate format:SwabbyFormat "There are all kinds of ways out of the valley, but the river is the quickest, and a boat will take you damn near anywhere."
                - wait 0.7s
                - narrate format:SwabbyFormat "If you've got some time before you go, mind stopping by the Quest Master for me? I'll make it worth your while."
                - wait 0.7s
                - narrate format:SwabbyFormat "He's not very far, just over there in the Questing Hall. You can see it on the right when you stand on the ship's plank. Just past the inn. <green>Think you can make some time for me?"
                - zap SwabbyDeliveryOffer

        SwabbyDeliveryCompleted:
            proximity trigger:
                entry:
                    script:
                    - narrate format:SwabbyFormat "Hey, nice to see you <player.name>! How's that adventure going?"
                    - wait 0.7s
                    - narrate format:SwabbyFormat "You met the Quest Master, right? Done all those quests? Bet you can find some more to do."
                    - wait 0.7s
                    - narrate format:SwabbyFormat "If you need some inspiration, why not ask your fellow adventurers?"
                exit:
                    script:
                    - narrate format:SwabbyFormat "Happy travels!"
        SwabbyDeliveryOffer:
            click trigger:
                script:
                - narrate format:PlayerChatFormat "<green>Sure, I'll deliver your package to the Quest Master."
                - run QuestAcceptHandler def:SwabbyDelivery
                - zap SwabbyDeliveryActive
            chat trigger:
                StoneToolsAcceptance:
                    trigger: /yes|sure|okay|great/
                    hide trigger message: true
                    script:
                    - narrate format:PlayerChatFormat "<green>Sure, I'll deliver your package to the Quest Master."
                    - run QuestAcceptHandler def:SwabbyDelivery
                    - zap SwabbyDeliveryActive
        SwabbyDeliveryActive:
            proximity trigger:
                entry:
                    script:
                    - narrate format:SwabbyFormat "Ahoy, <player.name>!"
                    - wait 0.7s
                    - narrate format:SwabbyFormat "Having trouble finding the Quest Master? He's just over in the Questing Hall, a bit east of the inn."
                    - run QuestProgressHandler def:SwabbyDelivery
                exit:
                    script:
                    - bossbar remove <player.uuid>_swabby
                    - narrate format:SwabbyFormat "Happy travels!"
        VisitedButNoQuest:
            proximity trigger:
                entry:
                    script:
                    - narrate format:SwabbyFormat "Hey there, <player.name>! Hope your adventure is going well!"
                    - wait 0.7s
                    - narrate format:SwabbyFormat "If you've got some time before you go, mind stopping by the Quest Master for me? I'll make it worth your while."
                    - wait 0.7s
                    - narrate format:SwabbyFormat "He's not very far, just over there in the Questing Hall. You can see it on the right when you stand on the ship's plank. Just past the inn."
                    - if <server.current_bossbars.contains[<player.uuid>_swabby]>:
                        - bossbar update <player.uuid>_swabby players:<player> "title:Right click or chat to NPCs to talk to them! Try saying 'yes' to Swabby!" progress:1 color:blue style:solid
                    - else:
                        - bossbar create <player.uuid>_swabby players:<player> "title:Right click or chat to NPCs to talk to them! Try saying 'yes' to Swabby!" progress:1 color:blue style:solid
                    - zap SwabbyDeliveryOffer
                exit:
                    script:
                    - bossbar remove <player.uuid>_swabby
                    - narrate format:SwabbyFormat "Happy travels!"