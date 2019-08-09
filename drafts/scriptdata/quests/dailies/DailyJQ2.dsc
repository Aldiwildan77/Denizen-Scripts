config:
    availability:
        offering_npc: 40
    reset:
        period: 1d
        time: "19:00"
    rewards:
        money: 100
        quest_points: 1
messages:
    offer: "<gray>He Jumps Twice<white>: Show me what you've got!"
    completion: "<gray>He Jumped Twice<white>: You beat the heat! Nice job!"
player_data:
    DailyJQ1:
        name: Beat the heat (Daily)
        description: "Conquer the jumping challenge!"
        stages:
            1:
                description: "Jump your way through the challenge."
                objectives:
                    1:
                        name: "Speak to He Jumped Twice"
                        progress: 0
                        total: 1