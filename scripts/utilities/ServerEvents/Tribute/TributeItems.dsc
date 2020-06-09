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
        lore: <proc[lore_builder].context[<list[40].include_single[<script.yaml_key[lore_list]>]>]>
        flags:
        - HIDE_ENCHANTS
        nbt:
        - event_item/gods_tribute
        - uncraftable/true
        - expiration/<duration[<util.time_now.epoch_millis.div[1000]>].in_days.round_down.sub[<util.time_now.day_of_week>d].add[8d]>

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
        lore: <proc[lore_builder].context[<list[40].include_single[<script.yaml_key[lore_list]>]>]>
        flags:
        - HIDE_ENCHANTS
        nbt:
        - event_item/gods_tribute
        - uncraftable/true
        - expiration/<duration[<util.time_now.epoch_millis.div[1000]>].in_days.round_down.sub[<util.time_now.day_of_week>d].add[1d]>

TokenExpiration:
    type: world
    debug: false
    events:
        on player opens inventory:
        - define day <duration[<util.time_now.epoch_millis.div[1000]>].in_days.round_down>
        - if <player.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<[day]>]].size> > 0:
            - foreach <player.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<[day]>]]>:
                - take <[value]> quantity:<[value].quantity> from:<player.inventory>
            - narrate "<&7><&o>The Tribute to the Gods fades away before your eyes..."
        - else if <context.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<[day]>]].size> == 0:
            - stop
        - else:
            - foreach <context.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<[day]>]]>:
                - take <[value]> quantity:<[value].quantity> from:<context.inventory>
            - narrate "<&7><&o>The Tribute to the Gods fades away before your eyes..."
        on player clicks in inventory:
        - define day <duration[<util.time_now.epoch_millis.div[1000]>].in_days.round_down>
        - if <player.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<[day]>]].size> > 0:
            - foreach <player.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<[day]>]]>:
                - take <[value]> quantity:<[value].quantity> from:<player.inventory>
            - narrate "<&7><&o>The Tribute to the Gods fades away before your eyes..."
        - else if <context.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<[day]>]].size> == 0:
            - stop
        - else:
            - foreach <context.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<[day]>]]>:
                - take <[value]> quantity:<[value].quantity> from:<context.inventory>
            - narrate "<&7><&o>The Tribute to the Gods fades away before your eyes..."