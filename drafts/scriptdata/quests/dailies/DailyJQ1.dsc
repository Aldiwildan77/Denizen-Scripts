config:
    availability:
        offering_npc: 18
    reset:
        period: 1d
        time: "19:00"
    rewards:
        money: 100
        quest_points: 1
    material: leather_boots
messages:
    offer: "<gray>He Jumps Once<white>: You must think you're quite the parkour expert! Go and beat my challenge."
    completion: "<gray>He Jumped Once<white>: That wasn't so hard, was it? Here's some gold!"
player_data:
    DailyJQ1:
        name: Jumps and slides (Daily)
        description: "Conquer the jumping challenge!"
        stages:
            1:
                description: "Jump your way through the challenge."
                objectives:
                    1:
                        name: "Speak to He Jumped Once"
                        progress: 0
                        total: 1
                progress: 0
                total: 1