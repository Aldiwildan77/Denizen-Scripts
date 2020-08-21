5g_pouch:
    type: item
    debug: false
    material: bowl
    display name: <&6>5g pouch
    lore_list:
    - <&f>You found a pouch with 5g inside!
    - <&f>Right-click while holding it to open it take the coins.
    enchantments:
    - MENDING:1
    hides:
    - enchants
    mechanisms:
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>
        nbt:
        - uncraftable/true

10g_pouch:
    type: item
    debug: false
    material: bowl
    display name: <&6>10g pouch
    lore_list:
    - <&f>You found a pouch with 10g inside!
    - <&f>Right-click while holding it to open it take the coins.
    enchantments:
    - MENDING:1
    hides:
    - enchants
    mechanisms:
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>
        nbt:
        - uncraftable/true

25g_pouch:
    type: item
    debug: false
    material: bowl
    display name: <&6>25g pouch
    lore_list:
    - <&f>You found a pouch with 25g inside!
    - <&f>Right-click while holding it to open it take the coins.
    enchantments:
    - MENDING:1
    hides:
    - enchants
    mechanisms:
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>
        nbt:
        - uncraftable/true

50g_pouch:
    type: item
    debug: false
    material: bowl
    display name: <&6>50g pouch
    lore_list:
    - <&f>You found a pouch with 50g inside!
    - <&f>Right-click while holding it to open it take the coins.
    enchantments:
    - MENDING:1
    hides:
    - enchants
    mechanisms:
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>
        nbt:
        - uncraftable/true

100g_pouch:
    type: item
    debug: false
    material: bowl
    display name: <&6>100g pouch
    lore_list:
    - <&f>You found a pouch with 100g inside!
    - <&f>Right-click while holding it to open it take the coins.
    enchantments:
    - MENDING:1
    hides:
    - enchants
    mechanisms:
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>
        nbt:
        - uncraftable/true

gold_pouch_opener:
    type: world
    debug: false
    events:
        on player clicks block with:5g_pouch:
        - take 5g_pouch
        - narrate "<&6>You open the pouch and take the 5 gold inside!"
        - give money quantity:5
        on player clicks block with:10g_pouch:
        - take 10g_pouch
        - narrate "<&6>You open the pouch and take the 10 gold inside!"
        - give money quantity:10
        on player clicks block with:25g_pouch:
        - take 25g_pouch
        - narrate "<&6>You open the pouch and take the 25 gold inside!"
        - give money quantity:25
        on player clicks block with:50g_pouch:
        - take 50g_pouch
        - narrate "<&6>You open the pouch and take the 50 gold inside!"
        - give money quantity:50
        on player clicks block with:100g_pouch:
        - take 100g_pouch
        - narrate "<&6>You open the pouch and take the 100 gold inside!"
        - give money quantity:100

veteran_gold_drop_list:
    type: data
    debug: false
    list:
    - 5g_pouch
    - 5g_pouch
    - 5g_pouch
    - 5g_pouch
    - 5g_pouch
    - 10g_pouch
    - 10g_pouch
    - 10g_pouch
    - 25g_pouch

elite_gold_drop_list:
    type: data
    debug: false
    list:
    - 10g_pouch
    - 10g_pouch
    - 10g_pouch
    - 10g_pouch
    - 10g_pouch
    - 25g_pouch
    - 25g_pouch
    - 25g_pouch
    - 50g_pouch
    - 50g_pouch
    - 100g_pouch

veteran_gold_explosion:
    type: world
    debug: false
    events:
        on entity dies:
        - if !<context.entity.name.starts_with[<&9>]||null>:
            - stop
        - else if <context.entity.name.starts_with[<&9>]||null>:
            - if <script[gold_rate_data].data_key[gold_multiplier_active]>:
                - define multiplier <script[gold_rate_data].data_key[gold_rate_multiplier].mul[<player.flag[player_gold_rate]>||1>
            - else:
                - stop
            - if <util.random.int[1].to[250]> <= <[multiplier]>:
                - define location <context.entity.location>
                - narrate "<&6>The slain monster drops some pouches of gold!" targets:<context.killer>
                - repeat <script[gold_rate_data].data_key[gold_amount_multiplier]>:
                    - drop <script[veteran_gold_drop_list].data_key[list].random[1]> location:<cuboid[<[location].world>,<[location].add[-2,-2,-2].xyz>,<[location].add[2,2,2].xyz>].spawnable_blocks.random>
                    - wait 20t

elite_gold_explosion:
    type: world
    debug: false
    events:
        on entity dies:
        - if !<context.entity.name.starts_with[<&d>]||null>:
            - stop
        - else if <context.entity.name.starts_with[<&d>]||null>:
            - if <script[gold_rate_data].data_key[gold_multiplier_active]>:
                - define multiplier <script[gold_rate_data].data_key[gold_rate_multiplier].mul[<player.flag[player_gold_rate]>||1>
            - else:
                - stop
            - if <util.random.int[1].to[100]> <= <[multiplier]>:
                - define location <context.entity.location>
                - narrate "<&6>The slain monster drops some pouches of gold!" targets:<context.killer>
                - repeat <script[gold_rate_data].data_key[gold_amount_multiplier]>:
                    - drop <script[elite_gold_drop_list].data_key[list].random[1]> location:<cuboid[<[location].world>,<[location].add[-2,-2,-2].xyz>,<[location].add[2,2,2].xyz>].spawnable_blocks.random>
                    - wait 20t