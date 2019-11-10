config:
    availability:
        offering_npc: 191
    requirements:
        quests_completed:
        - "MeetSkillTrainers"
        permissions:
        - magicspells.learn.blink
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Wise Wizard<white>: You look like you'd like to get your feet wet dabbling in practical magic, does that sound about right? Great. I can teach you your first spell, Blink. It'll let you teleport small distances!"
    completion: "<darkgreen>Wise Wizard<white>: Congratulations, you're ready to learn Blink! Give it a try with <&dq>/cast blink.<&dq>"
player_data:
    UnlockBlink:
        name: Learn the Blink spell
        description: "Bring reagents to the Wise Wizard and learn the Blink spell!"
        stages:
            1:
                description: "Bring magical reagents to the Wise Wizard."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 128
                    2:
                        name: "Deliver enderpearls"
                        progress: 0
                        total: 64
                    3:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 64
                progress: 0
                total: 3
            2:
                description: "Bring crystallized experience to the Wise Wizard."
                objectives:
                    1:
                        name: "Deliver a sliver of crystallized experience"
                        progress: 0
                        total: 1
                progress: 0
                total: 1