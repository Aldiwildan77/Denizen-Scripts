config:
    availability:
        offering_npc: 192
    requirements:
        quests_completed:
        - "UnlockNight"
        permissions:
        - magicspells.learn.night-heavens
    rewards:
        money: 100
        quest_points: 3
    material: sea_lantern
messages:
    offer: "<darkgreen>Stoic Sage<white>: Because you already know the spell to summon night in Prosperus, I can teach you the spell to summon it in the Heavens. I just need a few more ingredients. Bring me redstone and gold bars."
    completion: "<darkgreen>Stoic Sage<white>: Congratulations, you're ready to learn Night-Heavens! Give it a try with <&dq>/cast night-heavens.<&dq>"
player_data:
    UnlockNight-Heavens:
        name: Learn the Night-Heavens spell
        description: "Bring reagents to the Stoic Sage and learn the Night-Heavens spell!"
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
                progress: 0
                total: 2