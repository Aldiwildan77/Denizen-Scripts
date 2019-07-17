config:
    availability:
        offering_npc: 33
    requirements:
        quests_completed:
        - "UnlockAvenfeld"
    rewards:
        money: 250
        quest_points: 5
messages:
    offer: "<darkgreen>Royal Geographer<white>: With the reports you've sent us from Avenfeld, we've learned a lot about the various realms we've been able to gain access to. It looks like there are some fluctuations in all of them - Avenfeld, the End, the Heavens, the Nether... occasionally, they radically shift, so we're going to need to actively maintain our records! We'd like to enlist you as an explorer - we'll pay you to keep sending us good information."
    completion: "<darkgreen>Royal Geographer<white>: Excellent! Happy to have you on board. Get out there and start exploring - we'll keep track of your progress, and make sure you get paid for it. If you're one of the first few explorers to reach each region, you'll get more than those who come after you. And, as you explore more and more, we'll even give you occasional bonuses to reward you for your progress."
player_data:
    BecomeExplorer:
        name: Become an Explorer
        description: "The Royal Geographer needs your help exploring Avenfeld. Go scout out a few locations for him, and he'll designate you as an official Explorer!"
        stages:
            1:
                description: "Scout out locations in Avenfeld"
                objectives:
                    1:
                        name: "Scout the central area of Avenfeld (0,0)"
                        progress: 0
                        total: 1
                    2:
                        name: "Scout the northern area of Avenfeld (0,-4000)"
                        progress: 0
                        total: 1
                    3:
                        name: "Scout the eastern area of Avenfeld (4000,0)"
                        progress: 0
                        total: 1
                    4:
                        name: "Scout the southern area of Avenfeld (0,4000)"
                        progress: 0
                        total: 1
                    5:
                        name: "Scout the western area of Avenfeld (-4000,0)"
                        progress: 0
                        total: 1