# see ruby-autogen-win.rb

# Possible methods:
# item.getType()

# item.getMakerRace()
# item.getItemDescription()
# item.getCurrencyValue()
# item.getCaste()

# Item < MemHack::Compound
# ItemActual < Item
# ItemConstructed < ItemCrafted
# ItemCoinst < ItemConstructed
# CoinBatch < MemHack::Compound

# df.world.coin_batches.each{ |batch|
#     puts batch.class.to_s
#     throw :script_finished
# }

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

        $total_coins[item.mat_index] += item.stack_size
        # puts item.history_info.to_s
    end
}

puts "Total coins: %s" % ($total_coins * " ")