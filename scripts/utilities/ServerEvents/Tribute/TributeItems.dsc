GodsTribute:
    type: item
    debug: false
    material: gold_nugget
    display name: <&a>Tribute to the Gods
    lore_list:
    - <&a>Event Item
    - <&f>A token that radiates a divine presence.
    enchantments:
    - MENDING:1
    mechanisms:
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>
        hides:
        - ENCHANTS
        nbt:
        - event_item/gods_tribute
        - uncraftable/true
        - expiration/<util.time_now.next_day_of_week[monday]>

GodsTributeOld:
    type: item
    debug: false
    material: gold_nugget
    display name: <&a>Tribute to the Gods
    lore_list:
    - <&a>Event Item
    - <&f>A token that radiates a divine presence.
    enchantments:
    - MENDING:1
    mechanisms:
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>
        hides:
        - ENCHANTS
        nbt:
        - event_item/gods_tribute
        - uncraftable/true
        - expiration/<util.time_now.next_day_of_week[monday].sub[7d]>

TokenExpiration:
    type: world
    debug: true
    events:
        on player opens inventory:
        - define day <util.time_now>
        - if <context.inventory.list_contents.filter[has_nbt[expiration]].filter_tag[<time[<[filter_value].nbt[expiration]>].is_before[<[day]>]>].size> > 0:
            - foreach <context.inventory.list_contents.filter[has_nbt[expiration]].filter_tag[<time[<[filter_value].nbt[expiration]>].is_before[<[day]>]>]>:
                - take scriptname:<[value]> quantity:<[value].quantity> from:<player.inventory>
            - narrate "<&7><&o>The Tribute to the Gods fades away before your eyes..."
        - else if <context.inventory.list_contents.filter[has_nbt[expiration]].filter_tag[<time[<[filter_value].nbt[expiration]>].is_before[<[day]>]>].size> == 0:
            - stop
        - else:
            - foreach <context.inventory.list_contents.filter[has_nbt[expiration]].filter_tag[<time[<[filter_value].nbt[expiration]>].is_before[<[day]>]>]>:
                - take scriptname:<[value]> quantity:<[value].quantity> from:<context.inventory>
            - narrate "<&7><&o>The Tribute to the Gods fades away before your eyes..."
        on player clicks in inventory:
        - define day <util.time_now>
        - if <context.inventory.list_contents.filter[has_nbt[expiration]].filter_tag[<time[<[filter_value].nbt[expiration]>].is_before[<[day]>]>].size> > 0:
            - foreach <context.inventory.list_contents.filter[has_nbt[expiration]].filter_tag[<time[<[filter_value].nbt[expiration]>].is_before[<[day]>]>]>:
                - take scriptname:<[value]> quantity:<[value].quantity> from:<player.inventory>
            - narrate "<&7><&o>The Tribute to the Gods fades away before your eyes..."
        - else if <context.inventory.list_contents.filter[has_nbt[expiration]].filter_tag[<time[<[filter_value].nbt[expiration]>].is_before[<[day]>]>].size> == 0:
            - stop
        - else:
            - foreach <context.inventory.list_contents.filter[has_nbt[expiration]].filter_tag[<time[<[filter_value].nbt[expiration]>].is_before[<[day]>]>]>:
                - take scriptname:<[value]> quantity:<[value].quantity> from:<context.inventory>
            - narrate "<&7><&o>The Tribute to the Gods fades away before your eyes..."