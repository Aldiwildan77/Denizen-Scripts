PotatoPatrickAssignment:
    type: assignment
    interact scripts:
    - PotatoPatrickInteract
    actions:
        on assignment:
        - teleport npc location:<npc.anchor[PotatoPatrick]>
        - trigger name:proximity toggle:true
        - trigger name:chat toggle:true

PotatoPatrickFormat:
    type: format
    format: "<gray>Potato Patrick<white><&co> <text>"

PotatoPatrickInteract:
    type: interact
    steps:
        PotatoQuestOffer*:
            proximity trigger:
                entry:
                    script:
                    - define data <player.uuid>_quest_data
                    - if <yaml[<[data]>].contains[quests.active.DailyGathering_Potatoes]>:
                        - narrate format:PotatoPatrickFormat "Hey <player.name>, got some potatoes for me?"
                        - zap PotatoQuestDeliver
                    - else if <yaml[<[data]>].contains[quests.active.DailyGathering_Potatoes].not> && <proc[QuestAvailabilityHandler].context[DailyGathering_Potatoes]>:
                        - narrate format:PotatoPatrickFormat "Hey <player.name>, we need some potatoes to feed the people of Dawn's Landing. Can you help out?"
            click trigger:
                script:
                - define data <player.uuid>_quest_data
                - if <yaml[<[data]>].contains[quests.active.DailyGathering_Potatoes].not> && <proc[QuestAvailabilityHandler].context[DailyGathering_Potatoes]>:
                    - run QuestAcceptHandler def:DailyGathering_Potatoes
            chat trigger:
                DailyGathering_PotatoesAccept:
                    trigger: /yes|sure|okay|great/
                    hide trigger message: true
                    script:
                    - define data <player.uuid>_quest_data
                    - if <yaml[<[data]>].contains[quests.active.DailyGathering_Potatoes].not> && <proc[QuestAvailabilityHandler].context[DailyGathering_Potatoes]>:
                        - run QuestAcceptHandler def:DailyGathering_Potatoes
        PotatoQuestDelivery:
            proximity trigger:
                entry:
                    script:
                    - define data <player.uuid>_quest_data
                    - if <yaml[<[data]>].contains[quests.active.DailyGathering_Potatoes]>:
                        - narrate format:PotatoPatrickFormat "Hey <player.name>, got those potatoes for me?"
                    - else:
                        - zap PotatoQuestOffer

DailyGathering_PotatoesQuestDeliveryHandler:
    type: task
    debug: false
    script:
    - define stage 1
    - define quest_internalname DailyGathering_Potatoes
    - if <player.item_in_hand.material.name> == Potato:
        - define objective 1
        - inject QuestItemDeliveryHandler
        - if <[InProgress]>:
            - narrate format:PotatoPatrickFormat <proc[ItemDescriptionHandler_Gathering].context[<[delivery_item]>]>