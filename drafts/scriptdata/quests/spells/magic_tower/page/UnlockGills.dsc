config:
    availability:
        offering_npc: 192
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.gills
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Stoic Sage<white>: The Gills spell allows you to breathe underwater while channelling it. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Stoic Sage<white>: Congratulations, you're ready to learn Gills! Give it a try with <&dq>/cast gills.<&dq>"
player_data:
    UnlockGills:
        name: Learn the Gills spell
        description: "Bring reagents to the Stoic Sage and learn the Gills spell!"
        stages:
            1:
                description: "Bring magical reagents to the Stoic Sage."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 128
                    2:
                        name: "Deliver prismarine crystals"
                        progress: 0
                        total: 512
                    3:
                        name: "Deliver raw fish"
                        progress: 0
                        total: 128
                    4:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 64
                progress: 0
                total: 4
            2:
                description: "Bring crystallized experience to the Stoic Sage."
                objectives:
                    1:
                        name: "Deliver a chunk of crystallized experience"
                        progress: 0
                        total: 1
                progress: 0
                total: 1