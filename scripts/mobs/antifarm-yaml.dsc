AntiFarm_Proc:
    type: procedure
    defintions: entity
    usage: <proc[AntiFarm_Proc].context[<EntityTag>]>
    script:
    - if <yaml[antifarm-flags].read[expirations.<[entity].location.simple>].as_list.size||0> >= 3:
        - determine true
    - else:
        - determine false

YAML_AntiFarm:
    type: world
    debug: false
    events:
        on server start:
        - wait 5s
        - yaml create id:antifarm-flags
        on shutdown:
        - yaml unload id:antifarm-flags

        on entity dies:
        # Check to see if entity was a player
        - if <context.entity.is_player>:
            # If so, cancel all below checks
            - stop

        # Check to see if any timers exist on this block
        - if <yaml[antifarm-flags].contains[expirations.<context.entity.location.simple>]>:
        # If yes, clear any old timers
            - yaml id:antifarm-flags set expirations.<context.entity.location.simple>:<yaml[antifarm-flags].read[expirations.<context.entity.location.simple>].as_list.filter[in_seconds.is[more].than[<util.date.time.duration.in_seconds>]]>

        # Add a timer for this mob's death
        - yaml id:antifarm-flags set expirations.<context.entity.location.simple>:<list[<util.date.time.duration.add[30m]>].include[<yaml[antifarm-flags].read[expirations.<context.entity.location.simple>]||li@>]>

        # Check to see whether there are too many timers on this block
        - if <yaml[antifarm-flags].read[expirations.<context.entity.location.simple>].as_list.size||0> >= 3:
            # Debug messages
#            - announce to_console "[DEBUG] Normal mobs YAML same location: <context.entity.location.simple>"
#            - announce to_console "[DEBUG] Normal mobs YAML same location size: <yaml[antifarm-flags].read[expirations.<context.entity.location.simple>].as_list.size>"

            # Cancel drops and experience
            - determine NO_DROPS_OR_XP
            - stop

        on mythicmob mob dies:

        # Check to see if any timers exist on this block
        - if <yaml[antifarm-flags].contains[expirations.<context.entity.location.simple>]>:
        # If yes, clear any old timers
            - yaml id:antifarm-flags set expirations.<context.entity.location.simple>:<yaml[antifarm-flags].read[expirations.<context.entity.location.simple>].as_list.filter[in_seconds.is[more].than[<util.date.time.duration.in_seconds>]]>

        # Add a timer for this mob's death
        - yaml id:antifarm-flags set expirations.<context.entity.location.simple>:<list[<util.date.time.duration.add[30m]>].include[<yaml[antifarm-flags].read[expirations.<context.entity.location.simple>]||<list[]>>]>

        # Check to see whether there are too many timers on this block
        - if <yaml[antifarm-flags].read[expirations.<context.entity.location.simple>].as_list.size||0> >= 3:
            # Debug messages
#            - announce to_console "[DEBUG] MythicMobs YAML same location: <context.entity.location.simple>"
#            - announce to_console "[DEBUG] MythicMobs YAML same location size: <yaml[antifarm-flags].read[expirations.<context.entity.location.simple>].as_list.size>"

            # Cancel drops and experience
            - determine passively xp:0
            - determine passively currency:0
            - determine passively <list[]>

        on mythicmobs lootdrop:
        - if <yaml[antifarm-flags].contains[expirations.<context.activemob.location.simple>]>:
            - yaml id:antifarm-flags set expirations.<context.activemob.location.simple>:<yaml[antifarm-flags].read[expirations.<context.activemob.location.simple>].as_list.filter[in_seconds.is[more].than[<util.date.time.duration.in_seconds>]]>
        - yaml id:antifarm-flags set expirations.<context.activemob.location.simple>:<list[<util.date.time.duration.add[30m]>].include[<yaml[antifarm-flags].read[expirations.<context.activemob.location.simple>]||li@>]>
        - if <yaml[antifarm-flags].read[expirations.<context.activemob.location.simple>].as_list.size||0> >= 3:
            - determine li@
            - stop

        # Check for and cancel an empty gold message
        on player receives message:
        - if <context.message> contains "dropped 0.0 gold":
            - determine CANCELLED

"YAML Anti-Spawner Script":
    type: world
    debug: false
    events:
        on server start:
        - wait 5s
        - yaml create id:antispawner-flags
        - yaml id:antispawner-flags set entities.spawned-by-spawner:!
        on shutdown:
        - yaml unload id:antispawner-flags

        on entity spawns:
        - if <context.entity.is_player>:
            - stop
#        - announce to_console "[DEBUG] context.entity.location.find.blocks[mob_spawner].within[8] is <context.entity.location.find.blocks[mob_spawner].within[8]>"
#        - if <context.entity.location.find.blocks[mob_spawner].within[8]> != li@:
#            - wait 1t
##            - announce to_console "[DEBUG] Mob spawned within 8 blocks of spawner, reason is <context.reason>"
#            - yaml id:antispawner-flags set entities.spawned-by-spawner:->:<context.entity.uuid>
        - if <context.reason> == SPAWNER:
            - wait 1t
#            - announce to_console "mob with reason SPAWNER spawned"
            - yaml id:antispawner-flags set entities.spawned-by-spawner:->:<context.entity.uuid>
#            - announce to_console <context.entity.uuid>
#        - if <context.reason> == CUSTOM:
#            - wait 1t
#            - yaml id:antispawner-flags set entities.spawned-by-spawner:->:<context.entity.uuid>

        on entity dies:
        - define entity <context.entity>
        - if <[entity].is_player>:
            - stop

        #- announce to_console <[entity].uuid>
        - if <yaml[antispawner-flags].read[entities.spawned-by-spawner].contains[<[entity].uuid>]||null>:
#            - announce to_console "[DEBUG] Normal mobs YAML spawner"
            - determine NO_DROPS_OR_XP
            - yaml id:antispawner-flags set entities.spawned-by-spawner:<-:<[entity].uuid>



        on mythicmob mob dies:
        - if <yaml[antispawner-flags].read[entities.spawned-by-spawner].contains[<context.entity.uuid||null>]||null>:
#            - announce to_console "[DEBUG] MythicMobs YAML spawner"
            - determine passively xp:0
            - determine passively currency:0
            - determine passively <list[]>
            - yaml id:antispawner-flags set entities.spawned-by-spawner:<-:<context.entity.uuid>

        on mythicmobs lootdrop:
        - if <yaml[antispawner-flags].read[entities.spawned-by-spawner].contains[<context.activemob.uuid||null>]||null>:
#            - announce to_console "[DEBUG] MythicMobs YAML spawner"
            - determine li@
            - yaml id:antispawner-flags set entities.spawned-by-spawner:<-:<context.activemob.uuid>