# This thing handles the east guard in the fire temple
# It was written by Wahrheit and you better believe it
# @author Wahrheit
# @version 1.0
# @last-updated July 1 2013

"East Guard":
    type: assignment
    interact scripts:
    - JP Finished
    actions:
        on assignment:
        - runtask 'script:East Challenge' instant
        
"East Challenge":
    type: task
    script:
    - teleport npc location:<npc.anchor[fteast]>
    - trigger name:proximity toggle:true cooldown:0.1s radius:3

"Fire Guard Format":
    type: format
    format: "<red>Fire Guard<white><&co> <text>"
    
"JP Finished":
    type: interact
    steps:
        'Entry*':
            proximity trigger:
                entry:
                    radius: 3
                    script:
                    - narrate "format:Fire Guard Format" "Well done, <player.name>. I have placed my key."
                    - switch state:on location:1,74,4,ultimatus

            click trigger:
                script:
                - narrate "format:Fire Guard Format" "You have done well and made it across the pillars - return and face the rest of the temple."
            chat trigger:
                'Repeat':
                    trigger: 'Please /repeat/ the challenge.'
                    script:
                    - narrate "format:Fire Guard Format" "Very well. Challenge reset."
                    - switch state:off location:1,74,4,ultimatus
                    - zap step:Entry