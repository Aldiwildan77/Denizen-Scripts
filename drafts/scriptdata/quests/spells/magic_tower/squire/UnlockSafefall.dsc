config:
    availability:
        offering_npc: 194
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.safefall
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Skilled Sorcerer<white>: The Safefall spell allows you to temporarily resist fall damage. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Skilled Sorcerer<white>: Congratulations, you're ready to learn Safefall! Give it a try with <&dq>/cast safefall.<&dq>"
player_data:
    UnlockSafefall:
        name: Learn the Safefall spell
        description: "Bring reagents to the Skilled Sorcerer and learn the Safefall spell!"
        stages:
            1:
                description: "Bring magical reagents to the Skilled Sorcerer"
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 512
                    2:
                        name: "Deliver feathers"
                        progress: 0
                        total: 1024
                    3:
                        name: "Deliver rabbits' feet"
                        progress: 0
                        total: 128
                    4:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 256
            2:
                description: "Bring crystallized experience to the Skilled Sorcerer"
                objectives:
                    1:
                        name: "Deliver a billet of crystallized experience"
                        progress: 0
                        total: 1