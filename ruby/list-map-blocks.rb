df.each_map_block{ |block|
    puts block.class.to_s
    throw :script_finished
}