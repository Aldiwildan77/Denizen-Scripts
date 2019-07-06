config:
    availability:
        offering_npc: 192
    requirements:
        quests_completed:
        - "UnlockSun"
        permissions:
        - magicspells.learn.sun-heavens
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Stoic Sage<white>: ecause you already know the spell to summon the sun in Prosperus, I can teach you the spell to summon it in the Heavens. I just need a few more ingredients. Bring me redstone and gold bars."
    completion: "<darkgreen>Stoic Sage<white>: Congratulations, you're ready to learn Sun-Heavens! Give it a try with <&dq>/cast sun-heavens.<&dq>"
player_data:
    UnlockSun-Heavens:
        name: Learn the Sun-Heavens spell
        description: "Bring reagents to the Stoic Sage and learn the Sun-Heavens spell!"
        stages:
            1:
                description: "Bring magical reagents to the Stoic Sage."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 64
                    2:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 32