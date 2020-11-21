# Youngling guy

WiseWizardAssignment:
    type: assignment
    debug: false
    interact scripts:
    - WiseWizardInteract
    actions:
        on assignment:
        - teleport npc location:<npc.anchor[WiseWizard]>
        - trigger name:proximity state:true
        - trigger state:true

WiseWizardFormat:
    type: format
    debug: false
    format: "<dark_green>Wise Wizard<white><&co> <text>"

WiseWizardInteract:
    type: interact
    debug: false
    steps:
        Greeting*:
            proximity trigger:
                entry:
                    script:
                    - define data <player.uuid>_quest_data
                    - if <yaml[<[data]>].contains[quests.completed.UnlockBlink]>:
                        - narrate format:WiseWizardFormat "Greetings, <player.name>."
                        - zap BlinkUnlocked
                    - else:
                        - narrate format:WiseWizardFormat "Greetings, <player.name>. Have you come to begin your journey of mastering the magical arts? The first spell I can teach you is Blink, and it allows you to teleport short distances."
                        - zap UnlockBlinkOffer
        UnlockBlinkOffer:
            proximity trigger:
                entry:
                    script:
                    - narrate format:WiseWizardFormat "Greetings, <player.name>. Have you come to begin your journey of mastering the magical arts? The first spell I can teach you is Blink, and it allows you to teleport short distances."
            click trigger:
                script:
                - narrate format:PlayerChatFormat "Magic? Sounds awesome, I'm in!"
                - run QuestAcceptHandler def:UnlockBlink
            chat trigger:
                UnlockBlinkAcceptance:
                    trigger: /yes|sure|okay|great/
                    hide trigger message: true
                    script:
                    - narrate format:PlayerChatFormat "Magic? Sounds awesome, I'm in!"
                    - run QuestAcceptHandler def:UnlockBlink
                    - zap UnlockBlinkActive
        UnlockBlinkActive:
            proximity trigger:
                entry:
                    script:
                    - narrate format:WiseWizardFormat "How's it going finding those magical materials?"
                    - run QuestProgressHandler def:UnlockBlink
            click trigger:
                script:
                - define data <player.uuid>_quest_data
                - define quest_internalname:UnlockBlink
                - if <yaml[<[data]>].read[quests.active.<[quest_internalname]>.current_stage]> == 1:
                    - inject UnlockBlinkQuestDeliveryHandler
                - if <yaml[<[data]>].read[quests.active.<[quest_internalname]>.current_stage]> == 2:
                    - inject UnlockBlinkQuestExperienceDeliveryHandler
        BlinkUnlocked:
            proximity trigger:
                entry:
                    script:
                    - define data <player.uuid>_quest_data
                    - narrate format:WiseWizardFormat "Greetings, <player.name>."
                    - if <proc[QuestsAvailableHandler].context[WiseWizard]>:
                        - narrate format:WiseWizardformat "Ready to learn some more spells?"
                    - else:
                        - narrate format:WiseWizardFormat "For now, I've taught you all I can."
            click trigger:
                script:
                - define data <player.uuid>_quest_data
                - if <proc[QuestsAvailableHandler].context[WiseWizard]>:
                    - inject QuestInventoryGUIHandler def:WiseWizard
                - else:
                    - narrate format:WiseWizardFormat "I'm sorry, I don't have any quests available for you right now."