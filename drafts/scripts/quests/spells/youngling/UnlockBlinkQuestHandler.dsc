UnlockBlinkQuestDeliveryHandler:
    type: task
    debug: false
    script:
    - define stage:1
    - define quest_internalname:UnlockBlink
    - choose <player.item_in_hand.material.name>:
        - case redstone:
            - define objective:1
        - case ender_pearl:
            - define objective:2
        - case gold_ingot:
            - define objective:3
        - case default:
            - narrate format:WiseWizardFormat "Whenever you've got the items I'm looking for, just hand them over."
            - run QuestProgressHandler def:UnlockBlink
            - stop
    - inject QuestItemDeliveryHandler
    - if <[InProgress]>:
        - narrate format:StoicSageFormat <proc[ItemDescriptionHandler].context[<[delivery_item]>]>

UnlockBlinkQuestExperienceDeliveryHandler:
    type: task
    debug: false
    script:
    - define stage:2
    - define quest_internalname:UnlockBlink
    - if <player.item_in_hand.scriptname||null> == crystallizedexperiencesliver:
        - define objective:1
        - inject QuestItemDeliveryHandler
    - else:
        - narrate format:WiseWizardFormat "You can get a Sliver of Crystallized Experience from the Arch Artificer. When you've got one, bring it over."

UnlockBlinkCompletion:
    type: task
    debug: false
    script:
    - zap BlinkUnlocked s@WiseWizardInteract
    - execute as_server "cast teach <player.name> Blink"