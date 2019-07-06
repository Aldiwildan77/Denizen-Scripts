config:
    availability:
        offering_npc: 193
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.itemsummon
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Magnificent Mage<white>: The Item Summon spell allows you to manipulate spacial magic and bring all nearby items on the ground to you. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Magnificent Mage<white>: Congratulations, you're ready to learn Item Summon! Give it a try with <&dq>/cast itemsummon.<&dq>"
player_data:
    UnlockItemSummon:
        name: Learn the Item Summon spell
        description: "Bring reagents to the Magnificent Mage and learn the Item Summon spell!"
        stages:
            1:
                description: "Bring magical reagents to the Magnificent Mage."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 1024
                    2:
                        name: "Deliver ender pearls"
                        progress: 0
                        total: 512
                    3:
                        name: "Deliver feathers"
                        progress: 0
                        total: 2048
                    4:
                        name: "Deliver string"
                        progress: 0
                        total: 2048
                    5:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 512
            2:
                description: "Bring crystallized experience to the Magnificent Mage."
                objectives:
                    1:
                        name: "Deliver a bloom of crystallized experience"
                        progress: 0
                        total: 1