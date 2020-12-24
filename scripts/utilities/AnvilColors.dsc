Anvil_Color_Fixer:
    type: world
    debug: true
    events:
        on player prepares anvil craft item:
        - if !<context.item.has_nbt[item_tier]>:
            - stop
        - else if <context.item.nbt[item_tier]> == veteran:
            - determine <context.item.with[display=<context.item.display.parse_color.strip_color.color[blue]>]>
        - else if <context.item.nbt[item_tier]> == elite:
            - determine <context.item.with[display=<context.item.display.parse_color.strip_color.color[light_purple]>]>
        - else if <context.item.nbt[item_tier]> == champion:
            - determine <context.item.with[display=<context.item.display.parse_color.strip_color.color[yellow]>]>