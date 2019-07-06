config:
    availability:
        offering_npc: 192
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.enchantarrows-nature
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Stoic Sage<white>: The Enchant Arrows: Nature spell enchants your arrows with nature magic, allowing you to briefly root enemies hit by them for its duration. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Stoic Sage<white>: Congratulations, you're ready to learn Enchant Arrows: Nature! Give it a try with <&dq>/cast enchantarrows-nature.<&dq>"
player_data:
    UnlockEnchantArrows-Nature:
        name: "Learn the Enchant Arrows: Nature spell"
        description: "Bring reagents to the Stoic Sage and learn the Enchant Arrows: Nature spell!"
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
            2:
                description: "Bring crystallized experience to the Stoic Sage."
                objectives:
                    1:
                        name: "Deliver a chunk of crystallized experience"
                        progress: 0
                        total: 1