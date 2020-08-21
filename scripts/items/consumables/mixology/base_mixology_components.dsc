
# Reference links

# http://www.madehow.com/Volume-5/Vodka.html

# Refinement components

yeast:
    type: item
    debug: false
    display name: Yeast
    material: yellow_dye
    mechanisms:
        nbt:
        - craftingtype/mixology
malt_meal:
    type: item
    debug: false
    display name: Malt meal
    material: brown_dye
    mechanisms:
        nbt:
        - craftingtype/mixology
sugar_cane_juice:
    type: item
    debug: false
    display name: Sugar cane juice
    material: potion
    mechanisms:
        nbt:
        - craftingtype/mixology
        hides:
        - item_data
molasses:
    type: item
    debug: false
    display name: Molasses
    material: potion
    mechanisms:
        nbt:
        - craftingtype/mixology
        hides:
        - item_data
juniper:
    type: item
    debug: false
    display name: Juniper
    material: fern
    mechanisms:
        nbt:
        - craftingtype/mixology
        hides:
        - item_data
angelica:
    type: item
    debug: false
    display name: Angelica
    material: fern
    mechanisms:
        nbt:
        - craftingtype/mixology
        hides:
        - item_data
coriander:
    type: item
    debug: false
    display name: Coriander
    material: fern
    mechanisms:
        nbt:
        - craftingtype/mixology
        hides:
        - item_data
agave:
    type: item
    debug: false
    display name: Agave
    material: cactus
    mechanisms:
        nbt:
        - crafting_type/mixology
wormwood:
    type: item
    debug: false
    display name: Wormwood
    material: fern
    mechanisms:
        nbt:
        - craftingtype/mixology

# Refinement products

pina:
    type: item
    debug: false
    display name: Piña
    material: fern
    mechanisms:
        nbt:
        - craftingtype/mixology
        hides:
        - item_data
roasted_pina:
    type: item
    debug: false
    display name: Roasted piña
    material: fern
    mechanisms:
        nbt:
        - craftingtype/mixology
        hides:
        - item_data


# Cocktail components

simple_syrup:
    type: item
    debug: false
    display name: Simple syrup
    material: potion
    mechanisms:
        nbt:
        - crafting_type/mixology
        hides:
        - item_data

# Spirits

vodka:
    type: item
    debug: false
    display name: Vodka
    material: potion
    enchantments:
    - mending:1
    mechanisms:
        nbt:
        - crafting_type/mixology
        hides:
        - item_data
        - enchants

white_rum:
    type: item
    debug: false
    display name: White rum
    material: potion
    enchantments:
    - mending:1
    mechanisms:
        nbt:
        - crafting_type/mixology
        hides:
        - item_data
        - enchants

dark_rum:
    type: item
    debug: false
    display name: Dark rum
    material: potion
    enchantments:
    - mending:1
    mechanisms:
        nbt:
        - crafting_type/mixology
        hides:
        - item_data
        - enchants
    data:
        crafting type:
        - mixology

gin:
    type: item
    debug: false
    display name: Gin
    material: potion
    enchantments:
    - mending:1
    mechanisms:
        nbt:
        - crafting_type/mixology
        hides:
        - item_data
        - enchants

tequila:
    type: item
    debug: false
    display name: Tequila
    material: potion
    enchantments:
    - mending:1
    mechanisms:
        nbt:
        - crafting_type/mixology
        hides:
        - item_data
        - enchants

malort:
    type: item
    debug: false
    display name: Malort
    material: potion
    enchantments:
    - mending:1
    mechanisms:
        nbt:
        - craftingtype/mixology
        hides:
        - item_data
        - enchants