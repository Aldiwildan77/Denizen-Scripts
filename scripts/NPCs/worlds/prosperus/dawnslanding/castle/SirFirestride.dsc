SirFirestrideAssignment:
    type: assignment
    debug: false
    interact scripts:
    - SirFirestrideInteract
    actions:
        on assignment:
        - teleport npc location:<npc.anchor[SirFirestride]>
        - trigger name:proximity toggle:true
        - trigger name:chat toggle:true

SirFirestrideFormat:
    type: format
    debug: false
    format: "<dark_green>Sir Firestride<white><&co> <text>"

SirFirestrideInteract:
    type: interact
    debug: false
    steps:
        Greeting*:
            proximity trigger:
                entry:
                    script:
                    - narrate format:SirFirestrideFormat "Hail, <player.name>!"
            click trigger:
                script:
                - define data <player.uuid>_quest_data
                - if <proc[QuestsAvailableHandler].context[SirFirestride]>:
                    - inject QuestInventoryGUIHandler def:SirFirestride
                - else:
                    - narrate format:SirFirestrideFormat "I'm sorry, I don't have any quests available for you right now."