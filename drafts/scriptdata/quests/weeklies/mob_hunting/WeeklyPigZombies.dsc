config:
    availability:
        offering_npc: 27
    reset:
        period: 7d
        day: friday
        time: "19:00"
    rewards:
        money: 250
        quest_points: 3
    material: iron_sword
messages:
    offer: "<darkgreen>Sir Firestride<white>: We need assistance fighting the pig zombie infestation, take out 350 for us!"
    completion: "<darkgreen>Sir Firestride<white>: Well done citizen, your contributions are invaluable."
player_data:
    WeeklyPigZombies:
        name: Pulverize the pig zombies (Weekly)
        description: "Sir Firestride needs your help hunting down pig zombies."
        stages:
            1:
                description: "Cross the universe and hunt down pig zombies wherever they are."
                objectives:
                    1:
                        name: "Slay 350 pig zombies"
                        progress: 0
                        total: 350
                progress: 0
                total: 1