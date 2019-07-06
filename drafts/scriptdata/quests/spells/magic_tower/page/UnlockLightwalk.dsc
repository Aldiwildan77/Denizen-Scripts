config:
    availability:
        offering_npc: 192
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.lightwalk
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Stoic Sage<white>: The Lightwalk spell puts a light beneath your feet as you walk around. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Stoic Sage<white>: Congratulations, you're ready to learn Lightwalk! Give it a try with <&dq>/cast lightwalk.<&dq>"
player_data:
    UnlockLightwalk:
        name: Learn the Lightwalk spell
        description: "Bring reagents to the Stoic Sage and learn the Lightwalk spell!"
        stages:
            1:
                description: "Bring magical reagents to the Stoic Sage."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 128
                    2:
                        name: "Deliver glowstone"
                        progress: 0
                        total: 1024
                    3:
                        name: "Deliver diamonds"
                        progress: 0
                        total: 32
                    4:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 64
            2:
                description: "Bring crystallized experience to the Stoic Sage."
                objectives:
                    1:
                        name: "Deliver a chunk of crystallized experience"
                        progress: 0
                        total: 1