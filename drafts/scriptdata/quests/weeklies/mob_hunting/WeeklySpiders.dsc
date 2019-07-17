config:
    availability:
        offering_npc: 31
    reset:
        period: weekly
        day: friday
        time: "19:00"
    rewards:
        money: 250
        quest_points: 3
messages:
    offer: "<darkgreen>Lady Brightsword<white>: We need assistance fighting the spider onslaught, take out 500 for us!"
    completion: "<darkgreen>Lady Brightsword<white>: Well done citizen, your contributions are invaluable."
player_data:
    WeeklySpiders:
        name: Sever the spiders (Weekly)
        description: "Lady Brightsword needs your help hunting down spiders."
        stages:
            1:
                description: "Cross the universe and hunt down spiders wherever they are."
                objectives:
                    1:
                        name: "Slay 500 spiders"
                        progress: 0
                        total: 500