config:
    availability:
        offering_npc: 194
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.roar
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Skilled Sorcerer<white>: The Roar spell taunts all nearby monsters to attack you. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Skilled Sorcerer<white>: Congratulations, you're ready to learn Roar! Give it a try with <&dq>/cast roar.<&dq>"
player_data:
    UnlockRoar:
        name: Learn the Roar spell
        description: "Bring reagents to the Skilled Sorcerer and learn the Roar spell!"
        stages:
            1:
                description: "Bring magical reagents to the Skilled Sorcerer."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 512
                    2:
                        name: "Deliver chorus fruit"
                        progress: 0
                        total: 512
                    3:
                        name: "Deliver sulphur"
                        progress: 0
                        total: 64
                    4:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 256
            2:
                description: "Bring crystallized experience to the Skilled Sorcerer."
                objectives:
                    1:
                        name: "Deliver a billet of crystallized experience"
                        progress: 0
                        total: 1