GodsTribute:
    type: item
    debug: false
    material: gold_nugget
    display name: "<&a>Tribute to the Gods"
    lore_list:
    - "<&a>Event Item"
    - "<&f>A token that radiates a divine presence."
    enchantments:
    - MENDING:1
    mechanisms:
        lore: <proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>
        flags:
        - HIDE_ENCHANTS
        nbt:
        - event_item/gods_tribute
        - uncraftable/true
        - expiration/<util.date.time.duration.sub[<util.date.time.day_of_week>d].sub[<util.date.time.hour>h].sub[<util.date.time.minute>m].sub[<util.date.time.second>s].add[9d].in_days.round_down>

GodsTributeOld:
    type: item
    debug: false
    material: gold_nugget
    display name: "<&a>Tribute to the Gods"
    lore_list:
    - "<&a>Event Item"
    - "<&f>A token that radiates a divine presence."
    enchantments:
    - MENDING:1
    mechanisms:
        lore: <proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>
        flags:
        - HIDE_ENCHANTS
        nbt:
        - event_item/gods_tribute
        - uncraftable/true
        - expiration/<util.date.time.duration.sub[<util.date.time.day_of_week>d].sub[<util.date.time.hour>h].sub[<util.date.time.minute>m].sub[<util.date.time.second>s].add[2d].in_days.round_down>

TokenExpiration:
    type: world
    debug: false
    events:
        on player opens inventory:
        - if <player.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<util.date.time.duration.in_days.round_down>]].size> > 0:
            - foreach <player.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<util.date.time.duration.in_days.round_down>]]>:
                - take <def[value]> quantity:<def[value].quantity> from:<player.inventory>
            - narrate "<&7><&o>The Tribute to the Gods fades away before your eyes..."
        - else if <context.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<util.date.time.duration.in_days.round_down>]].size> == 0:
            - stop
        - else:
            - foreach <context.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<util.date.time.duration.in_days.round_down>]]>:
                - take <def[value]> quantity:<def[value].quantity> from:<context.inventory>
            - narrate "<&7><&o>The Tribute to the Gods fades away before your eyes..."
        on player clicks in inventory:
        - if <player.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<util.date.time.duration.in_days.round_down>]].size> > 0:
            - foreach <player.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<util.date.time.duration.in_days.round_down>]]>:
                - take <def[value]> quantity:<def[value].quantity> from:<player.inventory>
            - narrate "<&7><&o>The Tribute to the Gods fades away before your eyes..."
        - else if <context.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<util.date.time.duration.in_days.round_down>]].size> == 0:
            - stop
        - else:
            - foreach <context.inventory.list_contents.filter[nbt[expiration].is[or_less].than[<util.date.time.duration.in_days.round_down>]]>:
                - take <def[value]> quantity:<def[value].quantity> from:<context.inventory>
            - narrate "<&7><&o>The Tribute to the Gods fades away before your eyes..."