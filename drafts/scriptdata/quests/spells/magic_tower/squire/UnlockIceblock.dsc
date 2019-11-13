config:
    availability:
        offering_npc: 194
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.iceblock
    rewards:
        money: 100
        quest_points: 3
    material: ice
messages:
    offer: "<darkgreen>Skilled Sorcerer<white>: The Iceblock spell temporarily encases you in ice, but makes you invulnerable. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Skilled Sorcerer<white>: Congratulations, you're ready to learn Iceblock! Give it a try with <&dq>/cast iceblock.<&dq>"
player_data:
    UnlockIceblock:
        name: Learn the Iceblock spell
        description: "Bring reagents to the Skilled Sorcerer and learn the Iceblock spell!"
        stages:
            1:
                description: "Bring magical reagents to the Skilled Sorcerer."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 512
                    2:
                        name: "Deliver ice"
                        progress: 0
                        total: 512
                    3:
                        name: "Deliver diamonds"
                        progress: 0
                        total: 64
                    4:
                        name: "Deliver totems of undying"
                        progress: 0
                        total: 4
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