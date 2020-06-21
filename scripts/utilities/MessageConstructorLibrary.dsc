################################################################################
#                                                                              #
#                    M e s s a g e   C o n s t r u c t o r                     #
#                              L I B R A R Y                                   #
#                                                                              #
#     A set of utilities to make displaying text pretty, uniform, and easy     #
#                                                                              #
#   Authors: |Anthony|                                                         #
#   Version: 0.5                                                               #
#   dScript Version: 1.0.3-DEV_b691                                            #
#                                                                              #
#   For bleeding-edge code, bug reports, code contributions, and feature       #
#    requests, visit the GitHub project:                                       #
#    - github.com/AnthonyAMC/Public-Denizen-Scripts/blob/master/MessageConstructors.yml
#                                                                              #
#   Has my work helped you in some way? Show your support by clicking the      #
#    Like button.                                                              #
#   Feeling generous? Get me a coffee :D                                       #
#    https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=NPXKHCNMTGSUG
#                                                                              #
#--------------------------------------                                        #
#                                                                              #
#--- About this script                                                         #
#                                                                              #
#                                                                              #
#  This library will be a dependency for nearly all of my scripts. Mainly so   #
#  I don't have to duplicate the code so much, but also because it makes       #
#  development and maintenance easier.                                         #
#                                                                              #
#  Other scripters are free to implement this library in their own scripts.    #
#  Just make sure you credit the author. If you are releasing a script that    #
#  uses this library, be sure to tell your users to install it from here.      #
#  Do not include this library, or parts of it, directly in your public        #
#  scripts.                                                                    #
#                                                                              #
#                                                                              #
################################################################################
#
#  Example Usages:
#
#    - narrate "click <&e><proc[msgUrl].context[<&e>this|google.com/search|<&9>click]><&f> link"
#
#    - narrate "read the <&e><proc[msgCommand].context[<&e>help|help|<&a>click here fool!]><&f> docs"
#
#    - narrate "hover your mouse on the <&e><proc[msgHover].context[<&e>secret|<&6>gold star!]><&f> message"
#
#    - narrate "click <&e><proc[msgChat].context[<&e>yes|yes|Click this]><&f> to make your player say yes in chat"
#
#    - narrate "Give the player a <&e><proc[msgHint].context[<&e>Command|command|Click this]><&f> hint"
#
#    - narrate " <&e><proc[msgSuggest].context[<&e>Suggest|Maybe say this|Click this]><&f> something for your player to type"
#
################################################################################
#
#  Message Constructor Library Version
#
#  Handles Versioning Checks
#
#
#---------------------------------------
#
MCL_Events:
  type: world
  debug: false
  events:
    on system time hourly:
#    - if !<yaml[MCL_config].read[config.stats.useStats]||true>:
#      - stop
#
    - if <queue.list> !contains 'q@MCL_UpdateCheck':
      - run locally delay:1t updateCheck 'id:MCL_UpdateCheck'

    on server start:
    - if <queue.list> !contains 'q@MCL_UpdateCheck':
      - run locally delay:1t updateCheck 'id:MCL_UpdateCheck'

    on script reload:
    - if <queue.list> !contains 'q@MCL_UpdateCheck':
      - run locally delay:1t updateCheck 'id:MCL_UpdateCheck'

  updateCheck:
    - ^if !<server.has_flag[MCL.Version.Repo]>:
#      - ~webget "https://raw.githubusercontent.com/AnthonyAMC/Public-Denizen-Scripts/master/versions/MCL.txt" save:page
      - ~webget "https://one.denizenscript.com/denizen/repo/version/<s@MSG_Version.data_key[id]>" save:page
      - ^define result '<entry[page].result.trim||unknown>'
      - ^if !<[result].is[matches].to[number]>:
        - define result 'unknown'
      - ^flag server "MCL.Version.Repo:<[result]>" d:1h
    - ^define repoVersion '<server.flag[MCL.Version.Repo]||unknown>'
    - ^define currentVersion '<s@MSG_Version.data_key[version]>'
    - ^if '<[repoVersion]>' == 'unknown':
      - run s@msgPrefixed instantly 'def:MCL|<&7>Unable to check for update! <&7><&o><[currentVersion]><&7> is installed!'
    - else if '<[repoVersion]>' > '<[currentVersion]>':
      - run s@msgPrefixed instantly 'def:MCL|<&7>Update from version <&o><[currentVersion]><&7> to <&o><[repoVersion]><&7>!'
    - else if '<[repoVersion]>' != '<[currentVersion]>':
      - run s@msgPrefixed instantly 'def:MCL|<&7>What happened? You are on version <&o><[currentVersion]><&7> and the repo says <&o><[repoVersion]><&7>!'

#
#---------------------------------------
#
################################################################################
#
#
#--------------------------------------
#
#  Message Prefixer
#
# - Pop-Up on hover shows your script title and 'Click for Help'
# - Clicking the prefix runs /<[title]> help
# - Long messages are automatically linewrapped
#
#  Usage:
#    - run s@msgPrefixed 'def:<[yourScriptTitle]>|<&c><[yourMessageHere]>'
#
msgPrefixed:
  type: item
  debug: false
  definitions: title|msg
  material: i@human_skull
  display name: "<&4>     [<&6>---<&4>]"
  lore:
  - <&5>Click for Help
  script:
    - ^define text '<&4>[<&6><[title]><&4>]'
    - ^if !<player.is_player||false>:
      - announce to_console "<[text]>  <[msg]>"
      - goto 'end'

    - ^define icon 'i@human_skull[display_name=<proc[msgCentered].context[19|<[title]>]>]'
    - ^adjust <[icon]> 'lore:<&sp>|<&5> Click for Help' save:item
    - ^define hover '{<entry[item].result.json>}'
    - ^define click '/<[title]> help'
    - ^define button '"text":"<[text]>","clickEvent":{"action":"run_command","value":"<[click]>"},"hoverEvent":{"action":"show_item","value":"<[hover]>"}'
    - ^define spacer '"text":"  "'
    - ^foreach '<proc[lineWrap].context[<parse:<[msg]>>|<el@val[70].sub[<[text].length>]>]>':
      - ^execute as_server 'tellraw <player.name> {"text":"","extra":[{<[button]>},{<[spacer]>},{"text":"<[value].unescaped>"}]}'
    - mark 'end'
#
#  END msgPrefixed
#--------------------------------------
#
#  Boxed Message
#
# - Encapsulate your messages in a neat and tidy box format
#   Messages sent through will be linewrapped and given a header and footer
# - Header displays specified script title, page title, and page number(s)
# - Page numbers are clickable to ease navigation
# - Footer can display clickable buttons for your script authors
#   - You must have a valid author item script named <[script]>_Author_<[authorname]>
#
# Definitions Explained:
#
#  <[script]>      - The prefix used to find your authors
#  <[title]>       - The title to display in the Header
#  <[subTitle]>    - The subtitle to display in the Header
#  <[command]>     - The command to run when the page buttons are clicked
#  <[page]>        - The current page to display
#  <[pageWidth]>   - How many characters (roughly) to display on one line
#  <[pageHeight]>  - How many lines in the body of the message should be on one page
#  <[entries]>     - The complete contents of the document your are working with.
#                  Every entry in the list is displayed on its own line. Long
#                  entries are automatically linewrapped to fit the box message.
#
#  Usage:
#    - run s@msgBoxed 'def:<[script]>|<[title]>|<[subTitle]>|<[command]>|<[page]>|<[pageWidth]>|<[pageHeight]>|<[entries]>'
#
msgBoxed:
  type: task
  debug: false
  definitions: script|title|subTitle|command|page|pageWidth|pageHeight
  script:
    - ^define entries '<[raw_context].split[|].remove[1|2|3|4|5|6|7]>'
    - ^foreach 'li@script|title|subTitle|command|page|pageWidth|pageHeight':
      - define <[value]> '<[raw_context].split[|].get[<[loop_index]>]>'
    - ^define paragraphs '<proc[paragraph].context[<[pageWidth]>|<[entries].separated_by[|]>]>'
    - ^if <[page]> < 1:
      - define page '1'
    - ^define pageInfo '<proc[pagination].context[<[page]>|<[pageHeight]>|<[paragraphs].separated_by[|]>]>'
    - ^define pageTotal '<[pageInfo].get[2]>'
    - ^if <[page]> > <[pageTotal]>:
      - define page '<[pageTotal]>'
    - ^define lines '<[pageInfo].get[3].to[<[pageInfo].size>]>'
    - ^define cList 'li@0/black|1/dark_blue|2/dark_green|3/dark_aqua|4/dark_red|5/dark_purple|6/gold|7/gray|8/dark_gray|9/blue|a/green|b/aqua|c/red|d/light_purple|e/yellow|f/white|k/obfuscated|l/bold|m/strikethrough|n/underline|o/italic|r/reset'

    - ^define i 0
    - ^foreach 'li@title|subTitle':
      - define this '<[value]>'
      - define thisValue '<[<[this]>]>'
      - define clean<[this]> 'li@'
      - foreach '<[thisValue].split[ ]>':
        - define i <[i].add[1]>
        - define word '<[value]>'
        - if '<[word]>' == '':
          - define clean<[this]> '<[clean<[this]>].include[<&sp>]>'
          - foreach next
        - if !<[word].starts_with[<&r><&ss>@<&ss><&chr[260f]>]>:
          - define clean<[this]> '<[clean<[this]>].include[<[word]>]>'
          - foreach next
        - define text '<[word].after[<&r><&ss>@<&ss><&chr[260f]>].split[_-_].get[2].replace[\u0026].with[&].unescaped>'
        - define <[text]> '<[word].replace[&].with[<&bs><&bs>u0026]>'
        - define clean<[this]> '<[clean<[this]>].include[<[text]>]>'
      - define clean<[this]> '<[clean<[this]>].separated_by[<&sp>]>'
    - ^define hpad '<[cleanTitle].length.max[10].as_int>'
    - ^define heading '<[cleanTitle].pad_right[<[hpad]>].with[<&sp>]>  <[cleansubTitle]>'
    - ^define pagesInfo '<&7><&o>Page <&f><[page]> <&7><&o>of <&f><[pageTotal]>'
    - ^define pad '<[pageWidth].sub[<[heading].strip_color.length>].sub[<[pagesInfo].strip_color.length>].mul[1.5].round>'
    - ^if !<player.is_player||false>:
      - ^announce to_console "<&5>|<&5.pad_left[<[pageWidth]>].with[-]>|"
      - ^announce to_console "<&5>|<&sp><&sp><&sp><&6><[heading]> <&7.pad_right[<[pad]>].with[ ]><[pagesInfo]>"
      - ^announce to_console "<&5>|<&f>"
      - ^foreach <[lines]>:
        - announce to_console "<&5>|<&f><&sp><&sp><[value].unescaped>"
      - ^announce to_console "<&5>|"
      - ^inject locally msgsFooter
      - ^stop

    - ^define finalHeading 'li@'
    - ^foreach '<[heading].split[ ]>':
      - define c '<[value].last_color.escaped.after[&ss]>'
      - if '<[c]>' == '':
        - if <[lc].exists>:
          - define c '<[lc]>'
        - else:
          - define c 'white'
      - else:
        - define c '<[cList].map_get[<[c]>]>'
      - define lc '<[c]>'
      - if <[<[value]>].exists>:
        - define split '<[<[value]>].after[<&ss>@<&ss><&chr[260f]>].split[_-_]>'
        - define type '<[split].get[1].unescaped>'
        - define text '<[split].get[2].replace[\u0026].with[&].unescaped> '
        - if '<[type]>' == 'URL':
          - define url 'http<&co>//<[split].get[3].replace[\u0026].with[&].unescaped>'
          - define hover '<[split].get[4].replace[\u0026].with[&].unescaped>'
          - define button '"color":"<[c]>","text":"<[text]>","clickEvent":{"action":"open_url","value":"<[url]>"},"hoverEvent":{"action":"show_text","value":"<[hover]>"}'
        - else if '<[type]>' == 'command':
          - define tcommand '/<[split].get[3].replace[\u0026].with[&].unescaped>'
          - define hover '<[split].get[4].replace[\u0026].with[&].unescaped>'
          - define button '"color":"<[c]>","text":"<[text]>","clickEvent":{"action":"run_command","value":"<[tcommand]>"},"hoverEvent":{"action":"show_text","value":"<[hover]>"}'
        - else if '<[type]>' == 'hint':
          - define hint '/<[split].get[3].replace[\u0026].with[&].unescaped>'
          - define hover '<[split].get[4].before_last[<&dq>].replace[\u0026].with[&].unescaped>'
          - define button '"text":"<[text]>","clickEvent":{"action":"suggest_command","value":"<[hint]>"},"hoverEvent":{"action":"show_text","value":"<[hover]>"}'
        - else if '<[type]>' == 'suggest':
          - define suggest '<[split].get[3].replace[\u0026].with[&].unescaped>'
          - define hover '<[split].get[4].before_last[<&dq>].replace[\u0026].with[&].unescaped>'
          - define button '"text":"<[text]>","clickEvent":{"action":"suggest_command","value":"<[suggest]>"},"hoverEvent":{"action":"show_text","value":"<[hover]>"}'
        - else if '<[type]>' == 'chat':
          - define chat '<[split].get[3].replace[\u0026].with[&].unescaped>'
          - define hover '<[split].get[4].replace[\u0026].with[&].unescaped>'
          - define button '"text":"<[text]>","clickEvent":{"action":"run_command","value":"<[chat]>"},"hoverEvent":{"action":"show_text","value":"<[hover]>"}'
        - else if '<[type]>' == 'hover':
          - define hover '<[split].get[3].replace[\u0026].with[&].unescaped>'
          - define button '"color":"<[c]>","text":"<[text]>","hoverEvent":{"action":"show_text","value":"<[hover]>"}'

        - define finalHeading '<[finalHeading].include[{<[button]>}]>'
      - else:
        - if '<[value]>' == '':
          - define value '&sp'
        - define finalHeading '<[finalHeading].include[{"text":"<[value].strip_color>","color":"<[c]>"}|{"text":"<&sp>"}]>'
    - ^define finalHeading '<[finalHeading].separated_by[,].unescaped>'

    - ^inject locally msgsHeader
    - ^inject locally msgsBody
    - ^inject locally msgsFooter

  msgsHeader:
    - ^if <[page]> == 1:
      - define buttonThis '"text":"1"'
    - else:
      - define iconThis 'i@human_skull[display_name=<proc[msgCentered].context[19|Previous Page]>]'
      - define hoverThis '{<[iconThis].json>}'
      - define clickThis '/<[command]> <[page].sub[1]>'
      - define buttonThis '"text":"<[page]>","clickEvent":{"action":"run_command","value":"<[clickThis]>"},"hoverEvent":{"action":"show_item","value":"<[hoverThis]>"}'
    - ^if <[page]> == <[pageTotal]>:
      - define buttonNext '"text":"<[pageTotal]>"'
    - else:
      - define iconNext 'i@human_skull[display_name=<proc[msgCentered].context[19|Next Page]>]'
      - define hoverNext '{<[iconNext].json>}'
      - define clickNext '/<[command]> <[page].add[1]>'
      - define buttonNext '"text":"<[pageTotal]>","clickEvent":{"action":"run_command","value":"<[clickNext]>"},"hoverEvent":{"action":"show_item","value":"<[hoverNext]>"}'
    - ^define prefix '"text":"<&5>|<&sp><&sp><&sp><&6>"'
    - ^define tpad '"text":"<&7.pad_right[<[pad]>].with[ ]>"'
    - ^define p '"text":"<&7><&o>Page<&sp>"'
    - ^define o '"text":"<&7><&o><&sp>of<&sp>"'
    - ^narrate "<&5>|<&5.pad_left[<[pageWidth]>].with[-]>|"
    - ^execute as_server 'tellraw <player.name> {"text":"","extra":[{<[prefix]>},<[finalHeading]>,{<[tpad]>},{<[p]>},{<[buttonThis]>},{<[o]>},{<[buttonNext]>}]}'
    - ^narrate "<&5>|"

  msgsBody:
    - ^foreach <[lines]>:
      - narrate "<&5>|<&f><&sp><&sp><[value].unescaped>"
    - ^repeat <[pageHeight].sub[<[lines].size>].as_int>:
      - narrate "<&5>|"
    - ^if <server.list_scripts> contains 's@<[script]>_Version':
      - define repoVersion '<server.flag[<[script]>.Version.Repo]||unknown>'
      - define currentVersion '<s@<[script]>_Version.data_key[version]>'
      - define vString '<&7>Version<&co> <&b><[currentVersion]>'
      - define vPad '<[pageWidth].sub[<[vString].strip_color.length>].add[1].mul[1.5].round>'
      - narrate "<&5>|<&f.pad_right[<[vPad]>]><[vString]>"
      - if '<[repoVersion]>' != '<[currentVersion]>':
        - define uString '<&c><&o>Repo Version<&co> <&b><[repoVersion]>'
        - define uPad '<[pageWidth].sub[<[uString].strip_color.length>].add[1].mul[1.5].round>'
        - define url 'http://one.denizenscript.com/denizen/repo/entry/<s@<[script]>_Version.data_key[id]>'
        - narrate "<&5>|<&f.pad_right[<[uPad]>]><&c><&o>Repo Version<&co> <proc[msgUrl].context[<&a><[repoVersion]>|<[url]>|Click to go to repo!]>"
    - else:
      - narrate "<&5>|"

  msgsFooter:
    - ^define authors '<server.list_scripts.filter[starts_with[s@<[script]>_Author_]]||li@>'
    - ^if <[authors].is_empty>:
      - goto 'end'
    - ^define list 'li@'
    - ^define spacer '"text":"  "'
    - ^define prefix '"text":"<&5>|  <&f>Authors<&co>  "'
    - ^foreach <[authors]>:
      - define text '<[value].data_key[text_name].escaped>'
      - define url '<[value].data_key[url].escaped>'
      - define entry '"text":"<&7><[text]>","clickEvent":{"action":"open_url","value":"<[url]>"},"hoverEvent":{"action":"show_item","value":"{<[value].name.as_item.json>}"}'
      - if <[loop_index]> == <[authors].size>:
        - define list '<[list].include[<&lc><[entry]><&rc>]>'
      - else:
        - define list '<[list].include[<&lc><[entry]><&rc>|<&lc><[spacer]><&rc>]>'
    - ^if <player.is_player||false>:
      - execute as_server 'tellraw <player.name> {"text":"","extra":[{<[prefix]>},<[list].separated_by[,].unescaped>]}'
    - else:
      - announce to_console "<&5>|  <&f>Authors:  <&7><[authors].parse[.data_key[text_name]].split[<&sp><&sp><&7>]>"
    - ^mark 'end'
    - ^define scroll '<&d>S<&5>-<&d>c<&5>-<&d>r<&5>-<&d>o<&5>-<&d>l<&5>-<&d>l<&5>---<&d>U<&5>-<&d>p<&5>'
    - ^define pad '<[pageWidth].sub[<[scroll].strip_color.length>].div[2].round_up>'
    - ^narrate "<&5><&5.pad_right[<[pad]>].with[-]>|-<[scroll]><&5.pad_left[<[pad]>].with[-]>|"
#
#  END msgBoxed
#--------------------------------------
#
#  URL Parser
#
# - Allow scripters to easily have clickable text to open urls, run commands, or just show messages on hover
#
#  Example usages at the top of this file.
#
msgParser:
  type: world
  debug: false

  events:
    on player receives message:
    - if !<context.message.contains_text[<&ss>@<&ss><&chr[260f]>]>:
      - stop
    - define message '<context.raw_json.after[<&lb>].before_last[<&rb>]>'
    - foreach '<[message].after[<&lc>].before_last[<&rc>].split[<&rc>,<&lc>].escape_contents>':
      - define element '<[value].unescaped>'
      - foreach '<[element].split[<&dq>,<&dq>]>':
        - define node '<[value]>'
        - define attribute '<[node].before[<&co>]>'
        - define aValue '<[node].after[<&co>]>'
        - if '<[attribute]>' != '<&dq>text<&dq>':
          - foreach next
        - if !<[aValue].starts_with[<&dq><&ss>@<&ss><&chr[260f]>]>:
          - foreach next
        - define split '<[aValue].after[<&dq><&ss>@<&ss><&chr[260f]>].split[_-_]>'
        - define type '<[split].get[1].unescaped>'
        - define text '<[split].get[2].replace[\\u0026].with[&].replace[\u0026].with[&].unescaped>'
        - choose '<[split].get[1].unescaped>':
          - case 'URL':
            - define url 'http<&co>//<[split].get[3].replace[\\u0026].with[&].replace[\u0026].with[&].unescaped>'
            - define hover '<[split].get[4].before_last[<&dq>].replace[\\u0026].with[&].replace[\u0026].with[&].unescaped>'
            - define button '"text":"<[text]>","clickEvent":{"action":"open_url","value":"<[url]>"},"hoverEvent":{"action":"show_text","value":"<[hover]>"}'
          - case 'command':
            - define command '/<[split].get[3].replace[\\u0026].with[&].replace[\u0026].with[&].unescaped>'
            - define hover '<[split].get[4].before_last[<&dq>].replace[\\u0026].with[&].replace[\u0026].with[&].unescaped>'
            - define button '"text":"<[text]>","clickEvent":{"action":"run_command","value":"<[command]>"},"hoverEvent":{"action":"show_text","value":"<[hover]>"}'
          - case 'hint':
            - define command '/<[split].get[3].replace[\\u0026].with[&].replace[\u0026].with[&].unescaped>'
            - define hover '<[split].get[4].before_last[<&dq>].replace[\\u0026].with[&].replace[\u0026].with[&].unescaped>'
            - define button '"text":"<[text]>","clickEvent":{"action":"suggest_command","value":"<[command]>"},"hoverEvent":{"action":"show_text","value":"<[hover]>"}'
          - case 'suggest':
            - define command '<[split].get[3].replace[\\u0026].with[&].replace[\u0026].with[&].unescaped>'
            - define hover '<[split].get[4].before_last[<&dq>].replace[\\u0026].with[&].replace[\u0026].with[&].unescaped>'
            - define button '"text":"<[text]>","clickEvent":{"action":"suggest_command","value":"<[command]>"},"hoverEvent":{"action":"show_text","value":"<[hover]>"}'
          - case 'chat':
            - define chat '<[split].get[3].replace[\\u0026].with[&].replace[\u0026].with[&].unescaped>'
            - define hover '<[split].get[4].before_last[<&dq>].replace[\\u0026].with[&].replace[\u0026].with[&].unescaped>'
            - define button '"text":"<[text]>","clickEvent":{"action":"run_command","value":"<[chat]>"},"hoverEvent":{"action":"show_text","value":"<[hover]>"}'
          - case 'hover':
            - define hover '<[split].get[3].before_last[<&dq>].replace[\\u0026].with[&].replace[\u0026].with[&].unescaped>'
            - define button '"text":"<[text]>","hoverEvent":{"action":"show_text","value":"<[hover]>"}'
        - define message '<[message].before[<[node]>]><[button]><[message].after[<[node]>]>'
    - determine 'RAW_JSON:{"extra":[<[message]>],"text":""}'
#
#  END URL Parser
#--------------------------------------
#
#  Line Wrapping utility
#
# - Turn a long string into a list of smaller strings
#   Treats the <&nl> symbol as intended
#   Preserves the last color used from the previous line
#
#  Usage: <proc[lineWrap].context[string|targetLen]>
#
lineWrap:
  type: procedure
  definitions: string|targetLen
  debug: false

  script:
    - define cleanString 'li@'
    - foreach '<[string].split[ ]>':
      - if '<[value]>' == '':
        - define cleanString '<[cleanString].include[&sp]>'
        - foreach next
      - define word '<[value]>'
      - if !<[word].starts_with[<&r><&ss>@<&ss><&chr[260f]>]>:
        - define cleanString '<[cleanString].include[<[word]>]>'
        - foreach next
      - define text '<[word].after[<&r><&ss>@<&ss><&chr[260f]>].split[_-_].get[2].replace[\u0026].with[&].unescaped>'
      - define <[loop_index]> '<[word].replace[&].with[<&bs><&bs>u0026]>'
      - define cleanString '<[cleanString].include[<[text]>]>'

    - if <[cleanString].is_empty>:
      - determine 'li@ '
    - define cleanString '<[cleanString].separated_by[ ]>'
    - define stringLen '<[cleanString].unescaped.length>'
    - if <[stringLen]> <= <[targetLen]>:
      - define finalString 'li@'
      - foreach '<[cleanString].split[ ]>':
        - if <[<[loop_index]>].exists>:
          - define finalString '<[finalString].include[<[<[loop_index]>]>]>'
        - else:
          - if '<[value]>' == '':
            - define value '&sp'
          - define finalString '<[finalString].include[<[value]>]>'
      - determine '<[finalString].separated_by[<&sp>].as_list>'
    - define c '<&f>'
    - define lines 'li@'
    - while '<[stringLen].is[MORE].than[0]>':
      - define low '<[increment].add[1].as_int||1>'
      - define hi '<[increment].add[<[targetLen].add[1]>].as_int||<[targetLen]>>'
      - define pass '<[cleanString].unescaped.substring[<[low]>,<[hi]>]>'
      - if <[pass].length> == <[stringLen]>:
        - define lines '<[lines].include[<[c]><[pass].escaped>]>'
        - while stop
      - else:
        - define brake '<tern[<[pass].contains[<&nl>]>]:<[pass].index_of[<&nl>]>||<[pass].last_index_of[<&sp>]>>'
        - define increment '<[increment].add[<[brake]>]||<[brake]>>'
        - define passtrim '<[c]><[pass].unescaped.substring[1,<tern[<[brake].is[MORE].than[0]>]:<[brake]>||<[pass].length>>]>'
        - define lines '<[lines].include[<[passtrim].escaped>]||<[lines]>>'
        - define c '<[passtrim].last_color||<&f>>'
        - define stringLen '<[stringLen].sub[<[brake]>]>'
      - if <[loop_index].is[MORE].than[10]>:
        - while stop
    - define i '0'
    - define finalLines 'li@'
    - foreach '<[lines]>':
      - define finalString 'li@'
      - foreach '<[value].split[ ]>':
        - define i '<[i].add[1].as_int>'
        - if <[<[i]>].exists>:
          - define finalString '<[finalString].include[<[<[i]>]>]>'
        - else:
          - if '<[value]>' == '':
            - define value '<&sp>'
          - define finalString '<[finalString].include[<[value]>]>'
      - define finalLines '<[finalLines].include[<[finalString].separated_by[<&sp>]>]>'
    - determine '<[finalLines].as_list>'
#
#  END lineWrap
#--------------------------------------
#
#  Pagination utility
#
#  - Return a list of entries for display on a specific page
#    Pagination simply takes a list of entries, and the desired page length and
#    returns only the entries for the desired page number.
#
#  Usage: <proc[pagination].context[page|pageLen|list|...]>
#
pagination:
  type: procedure
  definitions: page|pageSize
  debug: false

  script:
    - define entries '<[raw_context].split[|].remove[1|2]>'
    - foreach 'li@page|pageSize':
      - define <[value]> '<[raw_context].split[|].get[<[loop_index]>]>'
    - if <[page].is[MATCHES].to[number].not>:
      - define page '1'
    - else:
      - define page '<[page].abs.round>'
    - define pages '<[entries].size.div[<[pageSize]||5>].round_up||1>'
    - if <[page].is[MORE].than[<[pages]>]>:
      - define page '<[pages]>'
    - define highNumber '<[page].mul[<[pageSize]||5>].as_int>'
    - define lowNumber '<[highNumber].sub[<[pageSize].sub[1]||4>].as_int>'
    - determine 'li@<[page]>|<[pages]>|<[entries].get[<[lowNumber]>].to[<[highNumber]>].separated_by[|]||li@>'
#
#  END pagination
#--------------------------------------
#
#  Paragraph utility
#
#  Turns a list of entries into a list of lines limited in length.
#  - Useful if you want to limit total page size not just entries per page.
#
#  Usage: <proc[paragraph].context[lineLen|list|...]>
#
paragraph:
  type: procedure
  definitions: lineLen
  debug: false

  script:
    - define paragraphs '<[raw_context].split[|].remove[1]>'
    - define lineLen '<[raw_context].split[|].get[1]>'
    - define lineLen '<tern[<[lineLen].is[matches].to[number].and[<[lineLen].is[MORE].than[0]>]>]:<[lineLen]>||44>'
    - define result 'li@'
    - foreach '<[paragraphs]>':
      - define lines '<proc[lineWrap].context[<[value]>|<[lineLen]||44>]>'
      - foreach '<[lines]>':
        - define result '<[result].include[<[value]>]>'
    - determine '<[result]>'
#
# Put this inside the second foreach just before it closes to automatically
# insert a newline at the end of each paragraph.
#      - define result '<[result].include[<&sp>]>'
#
#  END paragraph
#--------------------------------------
#
#  Center Justified Utility
#
#  Returns your text center justified based on target line length
#
#  Usage: <proc[msgCentered].context[lineLen|string]>
#
msgCentered:
  type: procedure
  definitions: lineLen|string
  debug: false

  script:
    - define pad '<el@val[<[lineLen]>].sub[<[string].length>].div[2].as_int>'
    - determine '<&6.pad_right[<[pad]>].with[<&sp>]><[string]><&6.pad_right[<[pad]>].with[<&sp>]>'
#
#  END msgCentered
#--------------------------------------
#
#  Trimmed Message Utility
#
#  Returns your text trimmed to fit a specified length.
#  Extra text is shown as an elipsis...
#
#  Usage: <proc[msgTrim].context[lineLen|string]>
#
msgTrim:
  type: procedure
  definitions: lineLen|string
  debug: false

  script:
    - if <[string].length> > <[linelen]>:
      - determine '<[string].unescaped.substring[1,<[lineLen].sub[3].as_int||40>].escaped>...'
    - determine '<[string]>'
#
#  END msgTrim
#--------------------------------------
#
#  URL Message Formatter
#
#  Returns your text formatted for automatic conversion to JSON.
#
#  Usage: <proc[msgUrl].context[<[display]>|<[url]>|<[hover]>]>
#
msgUrl:
  type: procedure
  definitions: display|url|hover
  debug: false

  script:
    - determine '<&r><&ss>@<&ss><&chr[260f]>URL_-_<[display].escaped.replace[ ].with[&sp]>_-_<[url].escaped.replace[ ].with[&sp]>_-_<[hover].escaped.replace[ ].with[&sp]><&r>'
#
#  END msgUrl
#--------------------------------------
#
#  Command Message Formatter
#
#  Returns your text formatted for automatic conversion to JSON.
#
#  Usage: <proc[msgCommand].context[<[display]>|<[command]>|<[hover]>]>
#
msgCommand:
  type: procedure
  definitions: display|command|hover
  debug: false

  script:
    - determine '<&r><&ss>@<&ss><&chr[260f]>command_-_<[display].escaped.replace[ ].with[&sp]>_-_<[command].escaped.replace[ ].with[&sp]>_-_<[hover].escaped.replace[ ].with[&sp]><&r>'
#
#  END msgCommand
#--------------------------------------
#
#  Hover Message Formatter
#
#  Returns your text formatted for automatic conversion to JSON.
#
#  Usage: <proc[msgHover].context[<[display]>|<[hover]>]>
#
msgHover:
  type: procedure
  definitions: display|hover
  debug: false

  script:
    - determine '<&r><&ss>@<&ss><&chr[260f]>hover_-_<[display].escaped.replace[ ].with[&sp]>_-_<[hover].escaped.replace[ ].with[&sp]><&r>'
#
#  END msgHover
#--------------------------------------
#
#  Hint Message Formatter
#
#  Returns your text formatted for automatic conversion to JSON.
#
#  Usage: <proc[msgHint].context[<[display]>|<[hint]>|<[hover]>]>
#
msgHint:
  type: procedure
  definitions: display|hint|hover
  debug: false

  script:
    - determine '<&r><&ss>@<&ss><&chr[260f]>hint_-_<[display].escaped.replace[ ].with[&sp]>_-_<[hint].escaped.replace[ ].with[&sp]>_-_<[hover].escaped.replace[ ].with[&sp]><&r>'
#
#  END msgHint
#--------------------------------------
#
#  Suggest Message Formatter
#
#  Returns your text formatted for automatic conversion to JSON.
#
#  Usage: <proc[msgSuggest].context[<[display]>|<[suggest]>|<[hover]>]>
#
msgSuggest:
  type: procedure
  definitions: display|suggest|hover
  debug: false

  script:
    - determine '<&r><&ss>@<&ss><&chr[260f]>suggest_-_<[display].escaped.replace[ ].with[&sp]>_-_<[suggest].escaped.replace[ ].with[&sp]>_-_<[hover].escaped.replace[ ].with[&sp]><&r>'
#
#  END msgSuggest
#--------------------------------------
#
#  Chat Message Formatter
#
#  Returns your text formatted for automatic conversion to JSON.
#  This will make it so that a player chats the message they click.
#  Good for situations where an NPC is expecting chat input.
#
#  Usage: <proc[msgChat].context[<[display]>|<[chat]>|<[hover]>]>
#
msgChat:
  type: procedure
  definitions: display|chat|hover
  debug: false

  script:
    - determine '<&r><&ss>@<&ss><&chr[260f]>chat_-_<[display].escaped.replace[ ].with[&sp]>_-_<[chat].escaped.replace[ ].with[&sp]>_-_<[hover].escaped.replace[ ].with[&sp]><&r>'
#
#  END msgChat
#
#
#
################################################################################