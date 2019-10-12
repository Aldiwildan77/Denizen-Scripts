config:
    availability:
        offering_npc: 39
    rewards:
        money: 50
        quest_points: 1
messages:
    offer: "<darkgreen>Quest Master<white>: You'll need more than just a sharp head on your shoulders to survive the wild - let me teach you a trick to help you out. First, set your home with /sethome. Then, go to spawn - either walk or use /spawn - then use /home to get back. I'll give you another quest."
    completion: "<darkgreen>Quest Master<white>: Great job! You can use /sethome and /home as often as you like, and you can have one home on each world."
player_data:
    SetHome:
        name: Setting your first home
        description: "Set your home with /sethome, visit the Dawn's Landing spawn with /spawn, and then return to the Quest Master with /home."
        stages:
            1:
                description: "Set your home."
                objectives:
                    1:
                        name: "Use the /sethome command"
                        progress: 0
                        total: 1
            2:
                description: "Return to spawn."
                objectives:
                    1:
                        name: "Use the /spawn command"
                        progress: 0
                        total: 1
            3:
                description: "Visit your home."
                objectives:
                    1:
                        name: "Use the /home command"
                        progress: 0
                        total: 1