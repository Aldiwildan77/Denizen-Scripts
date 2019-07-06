config:
    availability:
        offering_npc: 11
    reset:
        period: daily
        time: "19:00"
    requirements:
        quests_completed:
        - "TeachFishing"
    rewards:
        money: 50
        quest_points: 1
messages:
    offer: "<gray>Fishing Newbie<white>: Could you show me a little more of your fishing skills?"
    completion: "<gray>Fishing Newbie<white>: Awesome! Maybe someday I'll be as good as you are!"
player_data:
    DailyFishing:
        name: Demonstrate your fishing skills (Daily)
        description: "The Fishing Newbie is looking for someone to teach him to fish. Do a little fishing and he'll give you some gold!"
        stages:
            1:
                description: "Teach the Newbie to fish"
                objectives:
                    1:
                        name: "Catch 16 fish"
                        progress: 0
                        total: 16