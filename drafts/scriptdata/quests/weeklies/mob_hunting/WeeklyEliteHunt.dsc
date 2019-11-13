config:
    availability:
        offering_npc: 190
    reset:
        period: 7d
        day: friday
        time: "19:00"
    requirements:
        quests_completed:
        - "EliteHunt"
    rewards:
        money: 750
        quest_points: 3
        items:
        - diamond[quantity=32]
        commands:
        - "mm i give -s <player> QuestEliteDrops 20"
        - "mm i give -s <player> QuestEliteMeleeDrops 10"
        - "mm i give -s <player> QuestEliteRangedDrops 10"
    material: diamond_sword
messages:
    offer: "<darkgreen>Warmaster Reinwald<white>: Elite monsters continue to pose a threat. If you get out there and take them down, we'll give you some rewards from our supply cache."
    completion: "<darkgreen>Warmaster Reinwald<white>: Excellent work."
player_data:
    WeeklyEliteHunt:
        name: Exterminate Elites (Weekly)
        description: "Hunt down Elite monsters for Warmaster Reinwald."
        stages:
            1:
                description: "Hunt Elites in the Prosperus wilderness and beyond. Elite monsters are more common in other, more dangerous dimensions."
                objectives:
                    1:
                        name: "Kill Elite monsters"
                        progress: 0
                        total: 50
                progress: 0
                total: 1