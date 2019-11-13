config:
    availability:
        offering_npc: 39
    requirements:
        quests_completed:
        - "WoodTools"
    rewards:
        items:
        - fishing_rod
    material: compass
messages:
    offer: "<darkgreen>Quest Master<white>: There's someone over at the docks that needs some help learning how to fish. Go talk to him and I'll give you a fishing pole so you can help him out."
    completion: "<gray>Fishing Newbie<white>: Hi there! Can you help me learn to fish? The Quest Master said to give you this fishing pole!"
player_data:
    FindFishingNewbie:
        name: Go find the Fishing Newbie
        description: "The Quest Master asked you to go find the Fishing Newbie by the docks."
        stages:
            1:
                description: "Meet the Fishing Newbie."
                objectives:
                    1:
                        name: "Speak to the Fishing Newbie"
                        progress: 0
                        total: 1
                progress: 0
                total: 1