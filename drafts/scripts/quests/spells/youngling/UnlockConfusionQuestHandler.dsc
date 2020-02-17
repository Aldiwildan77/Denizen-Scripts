UnlockConfusionQuestDeliveryHandler:
    type: task
    debug: false
    script:
    - define stage:1
    - define quest_internalname:UnlockConfusion
    - choose <player.item_in_hand.material.name>:
        - case redstone:
            - define objective:1
        - case ghast_tear:
            - define objective:2
        - case magma_cream:
            - define objective:3
        - case gold_ingot:
            - define objective:4
        - case default:
            - narrate format:WiseWizardFormat "Whenever you've got the items I'm looking for, just hand them over."
            - run QuestProgressHandler def:UnlockConfusion
            - stop
    - inject QuestItemDeliveryHandler
    - if <[InProgress]>:
        - narrate format:StoicSageFormat <proc[ItemDescriptionHandler].context[<[delivery_item]>]>

UnlockConfusionQuestExperienceDeliveryHandler:
    type: task
    debug: false
    script:
    - define stage:2
    - define quest_internalname:UnlockConfusion
    - if <player.item_in_hand.scriptname||null> == crystallizedexperiencesliver:
        - define objective:1
        - inject QuestItemDeliveryHandler
    - else:
        - narrate format:WiseWizardFormat "You can get a Sliver of Crystallized Experience from the Arch Artificer. When you've got one, bring it over."
        
UnlockConfusionCompletion:
    type: task
    debug: false
    script:
    - execute as_server "cast teach <player.name> Confusion"