config:
    availability:
        offering_npc: 192
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.gust
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Stoic Sage<white>: The Gust spell forces back enemies in a line in front of you, damaging them both initially and when they fall. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Stoic Sage<white>: Congratulations, you're ready to learn Gust! Give it a try with <&dq>/cast gust.<&dq>"
player_data:
    UnlockGust:
        name: Learn the Gust spell
        description: "Bring reagents to the Stoic Sage and learn the Gust spell!"
        stages:
            1:
                description: "Bring magical reagents to the Stoic Sage"
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 128
                    2:
                        name: "Deliver feathers"
                        progress: 0
                        total: 512
                    3:
                        name: "Deliver ender pearls"
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