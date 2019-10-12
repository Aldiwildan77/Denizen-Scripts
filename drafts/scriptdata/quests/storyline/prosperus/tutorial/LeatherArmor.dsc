config:
    availability:
        offering_npc: 39
    requirements:
        quests_completed:
        - "Mining"
    rewards:
        money: 50
        items:
        - leather_helmet[enchantments=li@DURABILITY,1]
        - leather_chestplate[enchantments=li@DURABILITY,1]
        - leather_leggings[enchantments=li@DURABILITY,1]
        - leather_boots[enchantments=li@DURABILITY,1]
        scripts:
        - LeatherArmorCompletion
messages:
    offer: "<darkgreen>Quest Master<white>: I reckon you'll want to start heading down deeper to mine some iron. But those caves can be dangerous! Why don't you make some armor? Hunt some cows, use their hides to craft a set of leather armor, and then bring it to me. You know what happens then, right? You guessed it - I'll enchant it!"
    completion: "<darkgreen>Quest Master<white>: Hey, that's the stuff. Here's your armor back, with a little touch of magic to boot!"
player_data:
    LeatherArmor:
        name: MOOving on up
        description: "Before you start fighting monsters, you'll want some leather armor to protect yourself. Find and kill cows in Dawn's Landing and around Prosperus to get leather, then use it to craft a set of armor. Then, bring that armor to the Quest Master."
        stages:
            1:
                description: "Craft leather armor."
                objectives:
                    1:
                        name: "Craft a leather helmet"
                        progress: 0
                        total: 1
                    2:
                        name: "Craft a leather chestplate"
                        progress: 0
                        total: 1
                    3:
                        name: "Craft leather leggings"
                        progress: 0
                        total: 1
                    4:
                        name: "Craft leather boots"
                        progress: 0
                        total: 1
            2:
                description: "Bring leather armor to the Quest Master."
                objectives:
                    1:
                        name: "Bring a leather helmet to the Quest Master"
                        progress: 0
                        total: 1
                    2:
                        name: "Bring a leather chestplate to the Quest Master"
                        progress: 0
                        total: 1
                    3:
                        name: "Bring leather leggings to the Quest Master"
                        progress: 0
                        total: 1
                    4:
                        name: "Bring leather boots to the Quest Master"
                        progress: 0
                        total: 1