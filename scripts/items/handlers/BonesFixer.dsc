Bones_Fixer_Join:
    type: world
    debug: true
    events:
        after player joins:
        - inject Bones_Fixer

Bones_Fixer:
    type: task
    debug: true
    script:
    - define list <player.inventory.list_contents.filter_tag[<[filter_value].scriptname.is[==].to[VeteranToken]||null>]>
    - foreach <[list]>:
        - if <[value].all_raw_nbt> == <item[VeteranToken].all_raw_nbt>:
            - foreach skip
        - else:
            - flag player bone_update
    - if <player.has_flag[bone_update]>:
        - define quantity <player.inventory.quantity.scriptname[VeteranToken]>
        - take scriptname:VeteranToken quantity:<[quantity]>
        - give VeteranToken quantity:<[quantity]>