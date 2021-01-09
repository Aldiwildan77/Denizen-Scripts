GolfBall:
    type: item
    material: snowball
    display name: Golf ball
    enchantments:
    - Mending
    mechanisms:
        hides:
        - all
        nbt:
        - uncraftable/true

GolfBall_Toss_Only:
    type: world
    events:
        on player right clicks block with:golfball:
        - determine cancelled