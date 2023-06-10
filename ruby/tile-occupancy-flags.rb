if df.cursor.x == -30000 then
    throw :script_finished
end

# puts df.map_tile_at().occupancy.class.to_s
occupancyNum = df.map_tile_at().occupancy._whole
puts (
    [occupancyNum]
    .pack("L")
    .unpack("L")[0]
    .to_s(2)
    .rjust(32, "0")
    .scan(/\d{4}/)
    .join(" ")
)
