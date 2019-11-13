config:
    availability:
        offering_npc: 39
    requirements:
        quests_completed:
        - "MeetSkillTrainers"
    rewards:
        money: 50
        quest_points: 1
    material: compass
messages:
    offer: "<darkgreen>Quest Master<white>: The post office has some directions to other towns. Why don't you go find the postmaster?"
    completion: "<darkgreen>Quest Master<white>: Well done, that wasn't so bad."
player_data:
    MeetPostmaster:
        name: Meet the Postmaster
        description: "The post office has some directions to other towns. Head there and find the Postmaster."
        stages:
            1:
                description: "Meet the Postmaster."
                objectives:
                    1:
                        name: "Speak to the Postmaster"
                        progress: 0
                        total: 1
                progress: 0
                total: 1