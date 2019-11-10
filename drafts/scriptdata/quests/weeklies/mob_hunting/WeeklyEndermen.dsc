config:
    availability:
        offering_npc: 31
    reset:
        period: 7d
        day: friday
        time: "19:00"
    rewards:
        money: 250
        quest_points: 3
messages:
    offer: "<darkgreen>Lady Brightsword<white>: We need assistance fighting the endermen attack, take out 350 for us!"
    completion: "<darkgreen>Lady Brightsword<white>: Well done citizen, your contributions are invaluable."
player_data:
    WeeklyEndermen:
        name: Eliminate the endermen (Weekly)
        description: "Lady Brightsword needs your help hunting down endermen."
        stages:
            1:
                description: "Cross the universe and hunt down endermen wherever they are."
                objectives:
                    1:
                        name: "Slay 350 endermen"
                        progress: 0
                        total: 350
                progress: 0
                total: 1