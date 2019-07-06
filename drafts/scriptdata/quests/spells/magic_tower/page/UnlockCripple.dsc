config:
    availability:
        offering_npc: 192
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.cripple
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Stoic Sage<white>: The Cripple spell allows you to dramatically slow down an enemy. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Stoic Sage<white>: Congratulations, you're ready to learn Cripple! Give it a try with <&dq>/cast cripple.<&dq>"
player_data:
    UnlockCripple:
        name: Learn the Cripple spell
        description: "Bring reagents to the Stoic Sage and learn the Cripple spell!"
        stages:
            1:
                description: "Bring magical reagents to the Stoic Sage."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 128
                    2:
                        name: "Deliver soul sand"
                        progress: 0
                        total: 256
                    3:
                        name: "Deliver fermented spider eyes"
                        progress: 0
                        total: 128
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