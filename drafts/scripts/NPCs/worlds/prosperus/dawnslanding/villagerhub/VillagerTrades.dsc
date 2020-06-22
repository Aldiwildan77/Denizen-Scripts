# WIP script to handle villager NPCs at spawn for centralized trading

WeaponSmith_Inventory_Buyer:
    type: task
    debug: false
    script:
    - opentrades trade[max_uses=1000;inputs=coal[quantity=24];result=emerald]|trade[max_uses=1000;inputs=iron_ingot[quantity=9];result=emerald]

ToolSmith_Inventory_Buyer:
    type: task
    debug: false
    script:
    - opentrades trade[max_uses=1000;inputs=coal[quantity=24];result=emerald]|trade[max_uses=1000;inputs=iron_ingot[quantity=9];result=emerald]|trade[max_uses=1000;inputs=diamond[quantity=4];result=emerald]

Leatherworker_Inventory_Buyer:
    type: task
    debug: false
    script:
    - opentrades trade[max_uses=1000;inputs=leather[quantity=12];result=emerald]

Farmer_Inventory_Buyer:
    type: task
    debug: false
    script:
    - opentrades trade[max_uses=1000;inputs=wheat[quantity=22];result=emerald]|trade[max_uses=1000;inputs=potato[quantity=19];result=emerald]|trade[max_uses=1000;inputs=carrot[quantity=19];result=emerald]|trade[max_uses=1000;inputs=pumpkin[quantity=13];result=emerald]|trade[max_uses=1000;inputs=melon[quantity=12];result=emerald]

Fisherman_Inventory_Buyer:
    type: task
    debug: false
    script:
    - opentrades trade[max_uses=1000;inputs=coal[quantity=24];result=emerald]|trade[max_uses=1000;inputs=string[quantity=20];result=emerald]

Fletcher_Inventory_Buyer:
    type: task
    debug: false
    script:
    - opentrades trade[max_uses=1000;inputs=string[quantity=20];result=emerald]

Shepherd_Inventory_Buyer:
    type: task
    debug: false
    script:
    - opentrades trade[max_uses=1000;inputs=white_wool[quantity=22];result=emerald]

Armorer_Inventory_Buyer:
    type: task
    debug: false
    script:
    - opentrades trade[max_uses=1000;inputs=coal[quantity=24];result=emerald]|trade[max_uses=1000;inputs=iron_ingot[quantity=9];result=emerald]|trade[max_uses=1000;inputs=diamond[quantity=4];result=emerald]

Butcher_Inventory_Buyer:
    type: task
    debug: false
    script:
    - opentrades trade[max_uses=1000;inputs=porkchop[quantity=18];result=emerald]|trade[max_uses=1000;inputs=chicken[quantity=18];result=emerald]|trade[max_uses=1000;inputs=coal[quantity=24];result=emerald]

Cleric_Inventory_Buyer:
    type: task
    debug: false
    script:
    - opentrades trade[max_uses=1000;inputs=rotten_flesh[quantity=40];result=emerald]|trade[max_uses=1000;inputs=gold_ingot[quantity=10];result=emerald]

Cartographer_Inventory_Buyer:
    type: task
    debug: false
    script:
    - opentrades trade[max_uses=1000;inputs=paper[quantity=36];result=emerald]|trade[max_uses=1000;inputs=compass;result=emerald]

Librarian_Inventory_Buyer:
    type: task
    debug: false
    script:
    - opentrades trade[max_uses=1000;inputs=paper[quantity=36];result=emerald]|trade[max_uses=1000;inputs=book[quantity=10];result=emerald]

# Emeralds for items go here

Farmer_Inventory_Seller:
    type: task
    debug: false
    script:
    - opentrades trade[max_uses=1000;inputs=emerald;result=bread[quantity=2]|trade[max_uses=1000;inputs=emerald;result=pumpkin_pie[quantity=2]|trade[max_uses=1000;inputs=emerald;result=apple[quantity=5]|trade[max_uses=1000;inputs=emerald;result=cookie[quantity=6]|trade[max_uses=1000;inputs=emerald;result=cake]

Librarian_Inventory_Seller_Tools:
    type: task
    debug: false
    definitions: ench_lvl1_price|ench_lvl3_price|ench_lv5_price
    script:
    - inject Trade_Pricing
    - opentrades trade[max_uses=1000;inputs=emerald[quantity=<[ench_lv1_price]>];result=enchanted_book[enchantments=MENDING,1]|trade[max_uses=1000;inputs=emerald[quantity=<[ench_lv5_price]>];result=enchanted_book[enchantments=DIG_SPEED,5]|trade[max_uses=1000;inputs=emerald[quantity=<[ench_lv3_price]>];result=enchanted_book[enchantments=DURABILITY,3]]

Librarian_Inventory_Seller_Combat:
    type: task
    debug: false
    definitions: ench_lvl1_price|ench_lvl3_price|ench_lv5_price
    script:
    - inject Trade_Pricing
    - opentrades trade[max_uses=1000;inputs=emerald[quantity=<[ench_lv1_price]>];result=enchanted_book[enchantments=MENDING,1]|trade[max_uses=1000;inputs=emerald[quantity=<[ench_lv5_price]>];result=enchanted_book[enchantments=ARROW_DAMAGE,5]|trade[max_uses=1000;inputs=emerald[quantity=<[ench_lv5_price]>];result=enchanted_book[enchantments=DAMAGE_ALL,5]|trade[max_uses=1000;inputs=emerald[quantity=<[ench_lv5_price]>];result=enchanted_book[enchantments=DAMAGE_ARTHROPODS,5]|trade[max_uses=1000;inputs=emerald[quantity=<[ench_lv5_price]>];result=enchanted_book[enchantments=DAMAGE_UNDEAD,5]|trade[max_uses=1000;inputs=emerald[quantity=<[ench_lv3_price]>];result=enchanted_book[enchantments=DURABILITY,3]]
