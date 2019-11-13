config:
    availability:
        offering_npc: 192
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.flamebolt
    rewards:
        money: 100
        quest_points: 3
    material: blaze_powder
messages:
    offer: "<darkgreen>Stoic Sage<white>: The Flamebolt spell hurls a bolt of flame magic ahead of you, damaging the first enemy hit. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Stoic Sage<white>: Congratulations, you're ready to learn Flamebolt! Give it a try with <&dq>/cast flamebolt.<&dq>"
player_data:
    UnlockFlamebolt:
        name: Learn the Flamebolt spell
        description: "Bring reagents to the Stoic Sage and learn the Flamebolt spell!"
        stages:
            1:
                description: "Bring magical reagents to the Stoic Sage."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 128
                    2:
                        name: "Deliver blaze rods"
                        progress: 0
                        total: 128
                    3:
                        name: "Deliver fire charges"
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