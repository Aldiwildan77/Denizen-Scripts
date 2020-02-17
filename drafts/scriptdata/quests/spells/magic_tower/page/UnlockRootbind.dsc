config:
    availability:
        offering_npc: 192
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.rootbind
    rewards:
        money: 100
        quest_points: 3
    material: oak_log
messages:
    offer: "<darkgreen>Stoic Sage<white>: The Rootbind spell runs roots across the ground in front of you, damaging and rooting enemies it hits. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Stoic Sage<white>: Congratulations, you're ready to learn Rootbind! Give it a try with <&dq>/cast rootbind.<&dq>"
player_data:
    UnlockRootbind:
        name: Learn the Rootbind spell
        description: "Bring reagents to the Stoic Sage and learn the Rootbind spell!"
        stages:
            1:
                description: "Bring magical reagents to the Stoic Sage."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 128
                    2:
                        name: "Deliver oak saplings"
                        progress: 0
                        total: 128
                    3:
                        name: "Deliver brick blocks"
                        progress: 0
                        total: 256
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