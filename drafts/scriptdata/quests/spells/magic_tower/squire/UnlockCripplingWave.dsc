config:
    availability:
        offering_npc: 194
    requirements:
        quests_completed:
        - "UnlockBlink"
        - "UnlockCripple"
        permissions:
        - magicspells.learn.cripplingwave
    rewards:
        money: 100
        quest_points: 3
    material: soul_sand
messages:
    offer: "<darkgreen>Skilled Sorcerer<white>: The Crippling Wave spell temporarily slows all enemies in a small area around you. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Skilled Sorcerer<white>: Congratulations, you're ready to learn Crippling Wave! Give it a try with <&dq>/cast cripplingwave.<&dq>"
player_data:
    UnlockCripplingWave:
        name: Learn the Crippling Wave spell
        description: "Bring reagents to the Skilled Sorcerer and learn the Crippling Wave spell!"
        stages:
            1:
                description: "Bring magical reagents to the Skilled Sorcerer."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 512
                    2:
                        name: "Deliver soul sand"
                        progress: 0
                        total: 512
                    3:
                        name: "Deliver fermented spider eyes"
                        progress: 0
                        total: 256
                    4:
                        name: "Deliver magma cream"
                        progress: 0
                        total: 256
                    5:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 256
                progress: 0
                total: 5
            2:
                description: "Bring crystallized experience to the Skilled Sorcerer."
                objectives:
                    1:
                        name: "Deliver a billet of crystallized experience"
                        progress: 0
                        total: 1
                progress: 0
                total: 1