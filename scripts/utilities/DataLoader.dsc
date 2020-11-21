Data_Loader:
    type: world
    debug: false
    events:
        on server start:
        - yaml load:scriptdata/Events.yml id:events
        - yaml load:scriptdata/Rates.yml id:rates
        - yaml load:scriptdata/DropTables.yml id:droptables
        - yaml load:scriptdata/quests/QuestNPCList.yml id:quest_npc_list
        # Daily quests
        - foreach <server.list_files[scriptdata/quests/dailies]> as:file:
            - yaml load:scriptdata/quests/dailies/<[file]> id:<[file].before_last.[.]>
        # Weekly quests
        ## Mob hunting
        - foreach <server.list_files[scriptdata/quests/weeklies]> as:file:
            - yaml load:scriptdata/quests/weeklies/<[file]> id:<[file].before_last.[.]>
        # Magic Tower
        ## Youngling
        - foreach <server.list_files[scriptdata/quests/spells/magic_tower/youngling]> as:file:
            - yaml load:scriptdata/quests/spells/youngling/<[file]> id:<[file].before_last.[.]>
        ## Page
        - foreach <server.list_files[scriptdata/quests/spells/magic_tower/[page]]> as:file:
            - yaml load:scriptdata/quests/spells/page/<[file]> id:<[file].before_last.[.]>
        ## Squire
        - foreach <server.list_files[scriptdata/quests/spells/magic_tower/squire]> as:file:
            - yaml load:scriptdata/quests/spells/squire/<[file]> id:<[file].before_last.[.]>
        ## Apprentice
        - foreach <server.list_files[scriptdata/quests/spells/magic_tower/apprentice]> as:file:
            - yaml load:scriptdata/quests/spells/apprentice/<[file]> id:<[file].before_last.[.]>
        # Storyline
        ## Prosperus
        ### Geographer
        - foreach <server.list_files[scriptdata/quests/storyline/prosperus/geographer]> as:file:
            - yaml load:scriptdata/quests/storyline/prosperus/geographer/<[file]> id:<[file].before_last.[.]>
        ### Reinwald
        - foreach <server.list_files[scriptdata/quests/storyline/prosperus/reinwald]> as:file:
            - yaml load:scriptdata/quests/storyline/prosperus/reinwald/<[file]> id:<[file].before_last.[.]>
        ### Tutorial
        - foreach <server.list_files[scriptdata/quests/storyline/prosperus/tutorial]> as:file:
            - yaml load:scriptdata/quests/storyline/prosperus/tutorial/<[file]> id:<[file].before_last.[.]>
        ## Avenfeld
        - foreach <server.list_files[scriptdata/quests/storyline/prosperus]> as:file:
            - yaml load:scriptdata/quests/storyline/prosperus/<[file]> id:<[file].before_last.[.]>