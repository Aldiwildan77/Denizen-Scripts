config:
    availability:
        offering_npc: 192
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.farm
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Stoic Sage<white>: The Farm spell allows you to magically summon crops around you. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Stoic Sage<white>: Congratulations, you're ready to learn Farm! Give it a try with <&dq>/cast farm.<&dq>"
player_data:
    UnlockFarm:
        name: Learn the Farm spell
        description: "Bring reagents to the Stoic Sage and learn the Farm spell!"
        stages:
            1:
                description: "Bring magical reagents to the Stoic Sage"
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 128
                    2:
                        name: "Deliver wheat seeds"
                        progress: 0
                        total: 1024
                    3:
                        name: "Deliver glowstone"
                        progress: 0
                        total: 256
                    4:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 64
            2:
                description: "Bring crystallized experience to the Stoic Sage"
                objectives:
                    1:
                        name: "Deliver a chunk of crystallized experience"
                        progress: 0
                        total: 1