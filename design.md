focuses on manipulating and moving mana around

mana is never created or destroyed, only changed in form

mana comes in a few types:
- celestine, associated with the sky
- chthonic, associated with the earth and underground
- motive, associated with life, death, and motion
- still
- quintessent, a perfectly balanced mix of the other four

and a few forms:
- global (glob): Nauvis' planet core or its upper atmosphere
- atmospheric (at): hanging out in a chunk
- crystal (cr): crystals of pure mana (items)
- liquid (liq): duh
- bound (bd): bound into some (magical) item

each chunk has a store of atmospheric mana of each type, which is initially 0.

machines and their processes might transform one kind of atmospheric mana into another,
or use up atmospheric mana to create items, or release mana from items into the atmosphere.

some types of atmospheric mana spread between chunks.
- still and chthonic mana don't move
- celestine moves to wherever there is more chthonic mana
- motive moves towards more living/moving things (biters, trees, the player, machines)
- celestine and chthonic in the same chunk transmute into still and motive (in equal proportion) and vice versa

important machines:
- mana condenser: takes atmospheric mana and spits out crystals (mana in item form)
- mana evaporator: the reverse
- mana reactor: performs the conversion reactions (set a recipe) on mana crystals

startup: harvest mana from the environment, comes in a few forms
- mining rocks sometimes drops mana crystals, mostly chthonic and still
- telluric fissures (autoplaced entities) draw chthonic and motive mana from Nauvis' core.
  this mana slowly seeps into the chunk, or can be extracted more forcefully with machines.
- an excess of chthonic mana draws celestine mana from Nauvis' upper atmosphere

useful applications:
- better steam turbine: steam + still mana (cr) => water (partial) + motive mana (at)
- barrier generator: still mana (liq) generates a wall, damage to wall evaporates the mana
- misc. weapons
- celestial wrath rod: takes in electricity + motive (bd), builds up, lightning strike => more electricity, mana converts into celestine (at/glob mix)