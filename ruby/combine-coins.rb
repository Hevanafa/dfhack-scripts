# based on inspect-coins.rb

# Done: combine coins to the first found stack
# Done: remove all coins if not included in the ids
# Done: prevent moving coins if not on Z 130
# Todo: find a way to get player pos

$ids = [0] * 4;
$total_coins = [0] * 4;

df.world.items.all.each{ |item|
    if item.getType().to_s == "COIN" then
        # puts item.class.to_s
        # throw :script_finished

        puts "Coin ID: %d\nbatch ID: %d\nmat_index: %d\nstack size: [%d]\npos: %s\n\n" % [
            item.id,
            item.coin_batch,
            item.mat_index,
            item.stack_size,
            [item.pos.x, item.pos.y, item.pos.z] * " "
        ]

        if item.pos.z == 130 then
            if $ids[item.mat_index] == 0 then
                $ids[item.mat_index] = item.id
            end

            $total_coins[item.mat_index] += item.stack_size
        end
    end
}

puts "ids: " + ($ids * " ")
puts "Total coins: " + ($total_coins * " ")

df.world.items.all.each{ |item|
    if item.getType().to_s == "COIN" then
        if $ids.include?(item.id) then
            idx = $ids.index(item.id)
            item.stack_size = $total_coins[idx]

            puts "%d %d %d" % [item.pos.x, item.pos.y, item.pos.z]
        else

            # Todo: destroy item
            
            # if !$ids.include?(item.id) then
            # only works in Lua
            # dfhack.items.delete(item.id)

            item.pos.x = -30000
            item.pos.y = -30000
            item.pos.z = -30000
        end
    end
}

