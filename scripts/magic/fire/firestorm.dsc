FireStorm_Power_Handler:
    type: world
    debug: false
    events:
        on magicspells player casts spell:
        - if <context.spell_name> != firestorm:
            - stop
        - else:
            - define fire_power <proc[Magic_Power_Handler].context[fire]>
            - determine power:<el@1.add[<[fire_power].sub[100].div[100].mul[0.5]>]>