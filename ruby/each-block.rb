df.each_map_block{ |block|
    puts block.class.to_s
    # puts block.tiletype
    throw :script_finished
}