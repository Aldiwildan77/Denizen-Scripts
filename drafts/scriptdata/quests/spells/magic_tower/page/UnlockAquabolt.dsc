config:
    availability:
        offering_npc: 192
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.aquabolt
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Stoic Sage<white>: The Aquabolt spell hurls a bolt of water magic ahead of you, damaging and slowing the first enemy hit. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Stoic Sage<white>: Congratulations, you're ready to learn Aquabolt! Give it a try with <&dq>/cast aquabolt.<&dq>"
player_data:
    UnlockAquabolt:
        name: Learn the Aquabolt spell
        description: "Bring reagents to the Stoic Sage and learn the Aquabolt spell!"
        stages:
            1:
                description: "Bring magical reagents to the Stoic Sage."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 128
                    2:
                        name: "Deliver raw fish"
                        progress: 0
                        total: 256
                    3:
                        name: "Deliver arrows"
                        progress: 0
                        total: 512
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