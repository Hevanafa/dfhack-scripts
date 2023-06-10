# puts $script_args.class.to_s
$script_args.each_with_index{ |arg, idx|
    puts "%d: %s" % [idx, arg]
}
