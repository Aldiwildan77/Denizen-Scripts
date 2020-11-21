LadyBrightswordAssignment:
    type: assignment
    debug: false
    interact scripts:
    - LadyBrightswordInteract
    actions:
        on assignment:
        - teleport npc location:<npc.anchor[LadyBrightsword]>
        - trigger name:proximity state:true
        - trigger state:true

LadyBrightswordFormat:
    type: format
    debug: false
    format: "<dark_green>Lady Brightsword<white><&co> <text>"

LadyBrightswordInteract:
    type: interact
    debug: false
    steps:
        Greeting*:
            proximity trigger:
                entry:
                    script:
                    - narrate format:LadyBrightswordFormat "Hail, <player.name>!"
            click trigger:
                script:
                - define data <player.uuid>_quest_data
                - if <proc[QuestsAvailableHandler].context[LadyBrightsword]>:
                    - inject QuestInventoryGUIHandler def:LadyBrightsword
                - else:
                    - narrate format:LadyBrightswordFormat "I'm sorry, I don't have any quests available for you right now."