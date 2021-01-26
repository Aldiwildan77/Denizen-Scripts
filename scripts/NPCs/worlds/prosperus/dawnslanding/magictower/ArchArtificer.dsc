ArchArtificerAssignment:
    type: assignment
    debug: false
    interact scripts:
    - Artificing
    actions:
        on assignment:
        - trigger name:proximity toggle:true
        - trigger name:chat toggle:true

ArchArtificerFormat:
    type: format
    debug: false
    format: "<dark_green>Arch Artificer<white><&co> <text>"

CrystallizedExperienceSliver:
    type: item
    debug: false
    material: emerald
    display name: <&a>Sliver of Crystallized Experience
    lore_list:
    - <&6>The Arch Artificer Created this by crystallizing a small number of levels.
    enchantments:
    - MENDING:1
    mechanisms:
        hides:
        - enchants
        nbt:
        - experiencecrystal/sliver
        - uncraftable/true
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>

CrystallizedExperienceChunk:
    type: item
    debug: false
    material: emerald
    display name: <&a>Chunk of Crystallized Experience
    lore_list:
    - <&6>The Arch Artificer Created this by crystallizing a fair number of levels.
    enchantments:
    - MENDING:1
    mechanisms:
        hides:
        - enchants
        nbt:
        - experiencecrystal/chunk
        - uncraftable/true
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>

CrystallizedExperienceBillet:
    type: item
    debug: false
    material: emerald
    display name: <&a>Billet of Crystallized Experience
    lore_list:
    - <&6>The Arch Artificer Created this by crystallizing a sizable number of levels.
    enchantments:
    - MENDING:1
    mechanisms:
        hides:
        - enchants
        nbt:
        - experiencecrystal/billet
        - uncraftable/true
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>

CrystallizedExperienceBloom:
    type: item
    debug: false
    material: emerald
    display name: <&a>Bloom of Crystallized Experience
    lore_list:
    - <&6>The Arch Artificer Created this by crystallizing a large number of levels.
    enchantments:
    - MENDING:1
    mechanisms:
        hides:
        - enchants
        nbt:
        - experiencecrystal/bloom
        - uncraftable/true
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>

CrystallizedExperienceIngot:
    type: item
    debug: false
    material: emerald
    display name: <&a>Ingot of Crystallized Experience
    lore_list:
    - <&6>The Arch Artificer Created this by crystallizing a tremendous number of levels.
    enchantments:
    - MENDING:1
    mechanisms:
        hides:
        - enchants
        nbt:
        - experiencecrystal/ingot
        - uncraftable/true
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>

ArtificingInventory:
    type: inventory
    inventory: chest
    debug: false
    title: Artificing
    size: 45
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [ArtificingSliver] [] [ArtificingChunk] [] [ArtificingBillet] [] [ArtificingBloom] [] [ArtificingIngot]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

ArtificingSliver:
    type: item
    debug: false
    material: emerald
    display name: <&a>Sliver of Crystallized Experience
    lore_list:
    - <&6>Craft a <&a>Sliver of Crystallized Experience
    - <&6>Requires 30 levels
    enchantments:
    - MENDING:1
    mechanisms:
        hides:
        - enchants
        flags:
            experiencecrystal: sliver
            uncraftable: true
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>

ArtificingChunk:
    type: item
    debug: false
    material: emerald
    display name: <&a>Chunk of Crystallized Experience
    lore_list:
    - <&6>Craft a <&a>Chunk of Crystallized Experience
    - <&6>Requires 50 levels
    enchantments:
    - MENDING:1
    mechanisms:
        hides:
        - enchants
        flags:
            experiencecrystal: chunk
            uncraftable: true
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>
ArtificingBillet:
    type: item
    debug: false
    material: emerald
    display name: <&a>Billet of Crystallized Experience
    lore_list:
    - <&6>Craft a <&a>Billet of Crystallized Experience
    - <&6>Requires 70 levels
    enchantments:
    - MENDING:1
    mechanisms:
        hides:
        - enchants
        flags:
            experiencecrystal: billet
            uncraftable: true
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>
ArtificingBloom:
    type: item
    debug: false
    material: emerald
    display name: <&a>Bloom of Crystallized Experience
    lore_list:
    - <&6>Craft a <&a>Bloom of Crystallized Experience
    - <&6>Requires 90 levels
    enchantments:
    - MENDING:1
    mechanisms:
        hides:
        - enchants
        flags:
            experiencecrystal: bloom
            uncraftable: true
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>
ArtificingIngot:
    type: item
    debug: false
    material: emerald
    display name: <&a>Ingot of Crystallized Experience
    lore_list:
    - <&6>Craft a <&a>Ingot of Crystallized Experience
    - <&6>Requires 110 levels
    enchantments:
    - MENDING:1
    mechanisms:
        hides:
        - enchants
        flags:
            experiencecrystal: ingot
            uncraftable: true
        lore: <proc[lore_builder].context[<list[40].include_single[<script.data_key[lore_list]>]>]>
ArtificingInventoryHandler:
    type: world
    debug: false
    events:
        on player clicks in ArtificingInventory priority:100:
        - determine cancelled
        on player drags in ArtifciingInventory priority:100:
        - determine cancelled
        on player clicks ArtificingSliver in ArtificingInventory:
        - if <player.xp.level> >= 30:
            - narrate format:ArchArtificerFormat "Sure thing, here you go!"
            - give CrystallizedExperienceSliver quantity:1
            #- execute as_server "xp -30l <player.name>"
            - experience take level 30
        - else:
            - narrate format:ArchArtificerFormat "Sorry, you don't seem to have enough levels! Come back when you've got at least 30."
        on player clicks ArtificingChunk in ArtificingInventory:
        - if <player.xp.level> >= 50:
            - narrate format:ArchArtificerFormat "Sure thing, here you go!"
            - give CrystallizedExperienceChunk quantity:1
            #- execute as_server "xp -50l <player.name>"
            - experience take level 50
        - else:
            - narrate format:ArchArtificerFormat "Sorry, you don't seem to have enough levels! Come back when you've got at least 50."
        on player clicks ArtificingBillet in ArtificingInventory:
        - if <player.xp.level> >= 70:
            - narrate format:ArchArtificerFormat "Sure thing, here you go!"
            - give CrystallizedExperienceBillet quantity:1
            #- execute as_server "xp -70l <player.name>"
            - experience take level 70
        - else:
            - narrate format:ArchArtificerFormat "Sorry, you don't seem to have enough levels! Come back when you've got at least 70."
        on player clicks ArtificingBloom in ArtificingInventory:
        - if <player.xp.level> >= 90:
            - narrate format:ArchArtificerFormat "Sure thing, here you go!"
            - give CrystallizedExperienceBloom quantity:1
            #- execute as_server "xp -90l <player.name>"
            - experience take level 90
        - else:
            - narrate format:ArchArtificerFormat "Sorry, you don't seem to have enough levels! Come back when you've got at least 90."
        on player clicks ArtificingIngot in ArtificingInventory:
        - if <player.xp.level> >= 110:
            - narrate format:ArchArtificerFormat "Sure thing, here you go!"
            - give CrystallizedExperienceIngot quantity:1
            #- execute as_server "xp -110l <player.name>"
            - experience take level 110
        - else:
            - narrate format:ArchArtificerFormat "Sorry, you don't seem to have enough levels! Come back when you've got at least 110."
Artificing:
    type: interact
    debug: false
    steps:
        "Player Seen*":
            proximity trigger:
                entry:
                    script:
                    - narrate format:ArchArtificerFormat "Hello, adventurer! What can I help you with?"
                    - narrate format:ArchArtificerFormat "I can take all of that magical experience you've earned from slaying monsters and crystallize it."
                    - narrate "<gray>Right-click the Arch Artificer to view crystallization options!"
                exit:
                    script:
                    - narrate format:ArchArtificerFormat "See you again, and good hunting!"
                click:
                    script:
                    - inventory open ArtificingInventory