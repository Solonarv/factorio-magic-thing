require("constants")

Manasphere = {}

-- @param surface LuaSurface
function Manasphere.get_manasphere_for_surface(surface)
    if global.manaspheres == nil then global.manaspheres = {} end
    if global.manaspheres[surface.name] == nil then global.manaspheres[surface.name] = {pending = {}, chunks = {}} end
    return global.manaspheres[surface.name]
end

function Manasphere.get_chunk_for_pos(manasphere, x, y)
    manasphere.chunks[y] = manasphere.chunks[y] or {}
    manasphere.chunks[y][x] = manasphere.chunks[y][x] or {
        mana = {
            chthonic = 0,
            celestine = 0,
            still = 0,
            motive = 0
        }
    }
    return manasphere.chunks[y][x]
end

function Manasphere.add_mana(target, packet)
    if packet.chthonic then target.chthonic = (target.chthonic or 0) + packet.chthonic end
    if packet.celestine then target.celestine = (target.celestine or 0) + packet.celestine end
    if packet.still then target.still = (target.still or 0) + packet.still end
    if packet.motive then target.motive = (target.motive or 0) + packet.motive end
end

function Manasphere.mana_multiplied(packet, factor)
    return {
        chthonic = packet.chthonic * factor,
        celestine = packet.celestine * factor,
        still = packet.still * factor,
        motive = packet.motive * factor
    }
end

function Manasphere.add_pending_mana(manasphere, x, y, packet)
    manasphere.pending[y] = manasphere.pending[y] or {}
    manasphere.pending[y][x] = manasphere.pending[y][x] or {}
    Manasphere.add_mana(manasphere.pending[y][x], packet)
end

-- @param surface LuaSurface
function Manasphere.tick_manasphere_of_surface(surface)
    log("hello from manasphere tick for "..surface.name)

    local manasphere = Manasphere.get_manasphere_for_surface(surface)
    for y, row in pairs(manasphere.chunks) do for x, chunk in pairs(row) do
        local avail_chthonic_celestine = math.min(chunk.mana.chthonic, chunk.mana.celestine)
        local avail_still_motive = math.min(chunk.mana.still, chunk.mana.motive)
        local transmute_amount = (avail_chthonic_celestine - avail_still_motive) * MANA_TRANSMUTE_RATE
        Manasphere.add_mana(chunk.mana, {chthonic = -transmute_amount, celestine = -transmute_amount, still = transmute_amount, motive = transmute_amount})
        local packet = Manasphere.mana_multiplied(chunk.mana, MANA_TRANSFER_RATE/4)
        Manasphere.add_pending_mana(manasphere, x+1, y, packet)
        Manasphere.add_pending_mana(manasphere, x-1, y, packet)
        Manasphere.add_pending_mana(manasphere, x, y+1, packet)
        Manasphere.add_pending_mana(manasphere, x, y-1, packet)
    end end
    for y, row in pairs(manasphere.pending) do for x, packet in pairs(row) do
        Manasphere.add_mana(Manasphere.get_chunk_for_pos(manasphere, x, y).mana, packet)
    end end
end