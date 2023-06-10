# Unit < MemHack::Compound
# .name: LanguageName < MemHack::Compound

# puts df.world.units.all.class.to_s
# throw :script_finished

# pos: global Coord
def posToStr(pos)
    [pos.x, pos.y, pos.z] * ", "
end

longestNameLen = 1
names = []
longestPosLen = 1

df.world.units.all.each{ |unit|
    name = unit.name.has_name ? unit.name.to_s : "(unnamed)"
    names << name
    longestNameLen = [longestNameLen, name.length].max

    pos = unit.pos
    longestPosLen = [
        longestPosLen,
        posToStr(pos).length + 5
    ].max
}

idx = -1
df.world.units.all.each{ |unit|
    idx += 1

    name = names[idx]
    pos = unit.pos
    race = unit.race

    puts "%s%s\trace: %d" % [
        name.to_s.ljust(longestNameLen + 2),
        ("pos: %s" % [posToStr(pos)]).ljust(longestPosLen),
        race
    ]
}