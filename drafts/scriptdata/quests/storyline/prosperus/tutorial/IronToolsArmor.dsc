config:
    availability:
        offering_npc: 39
    requirements:
        quests_completed:
        - "FindReinwald"
    rewards:
        money: 50
        items:
        - iron_helmet[enchantments=li@DURABILITY,1]
        - iron_chestplate[enchantments=li@DURABILITY,1]
        - iron_leggings[enchantments=li@DURABILITY,1]
        - iron_boots[enchantments=li@DURABILITY,1]
        - iron_axe[enchantments=li@DURABILITY,1]
        - iron_pickaxe[enchantments=li@DURABILITY,1]
        - iron_spade[enchantments=li@DURABILITY,1]
        - iron_sword[enchantments=li@DURABILITY,1]
        - iron_hoe[enchantments=li@DURABILITY,1]
        scripts:
        - IronToolsArmorCompletion
    material: iron_chestplate
messages:
    offer: "<darkgreen>Quest Master<white>: You've got some stone tools and some leather armor. Ready for an upgrade to both of those? That's right - it's time for you to hunt down some iron. You'll need to mine iron ore, smelt it in a furnace, and craft it into tools and armor. Bring me a full set of armor and some iron tools to prove you know what you're doing. As usual, I'll enchant them to reward you for your trouble."
    completion: "<darkgreen>Quest Master<white>: Well, would you look at that? You're really making your way out there. Here's all your stuff, plus the enchantments - as promised. Now get out there and use it! Don't forget to keep checking in with Warmaster Reinwald."
player_data:
    IronToolsArmor:
        name: The iron price
        description: "Now that you're more established, the Quest Master wants you to mine and smelt iron ore. Use it to craft armor and tools, then bring them to him and he'll enchant them for you."
        stages:
            1:
                description: "Craft iron armor and tools."
                objectives:
                    1:
                        name: "Craft an iron helmet"
                        progress: 0
                        total: 1
                    2:
                        name: "Craft an iron chestplate"
                        progress: 0
                        total: 1
                    3:
                        name: "Craft iron leggings"
                        progress: 0
                        total: 1
                    4:
                        name: "Craft iron boots"
                        progress: 0
                        total: 1
                    5:
                        name: "Craft an iron axe"
                        progress: 0
                        total: 1
                    6:
                        name: "Craft an iron pickaxe"
                        progress: 0
                        total: 1
                    7:
                        name: "Craft an iron shovel"
                        progress: 0
                        total: 1
                    8:
                        name: "Craft an iron sword"
                        progress: 0
                        total: 1
                    9:
                        name: "Craft an iron hoe"
                        progress: 0
                        total: 1
                progress: 0
                total: 9
            2:
                description: "Bring iron tools and armor to the Quest Master."
                objectives:
                    1:
                        name: "Bring an iron helmet to the Quest Master"
                        progress: 0
                        total: 1
                    2:
                        name: "Bring an iron chestplate to the Quest Master"
                        progress: 0
                        total: 1
                    3:
                        name: "Bring iron leggings to the Quest Master"
                        progress: 0
                        total: 1
                    4:
                        name: "Bring iron boots to the Quest Master"
                        progress: 0
                        total: 1
                    5:
                        name: "Bring an iron axe to the Quest Master"
                        progress: 0
                        total: 1
                    6:
                        name: "Bring an iron pickaxe to the Quest Master"
                        progress: 0
                        total: 1
                    7:
                        name: "Bring an iron shovel to the Quest Master"
                        progress: 0
                        total: 1
                    8:
                        name: "Bring an iron sword to the Quest Master"
                        progress: 0
                        total: 1
                    9:
                        name: "Bring an iron hoe to the Quest Master"
                        progress: 0
                        total: 1
                progress: 0
                total: 9