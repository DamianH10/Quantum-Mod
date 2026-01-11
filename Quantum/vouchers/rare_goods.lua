
SMODS.Voucher {
    key = 'rare_goods',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            item_rate0 = 0.000001,
            item_rate = 0.01,
            item_rate2 = 0.0025,
            item_rate3 = 0.001,
            item_rate0 = 0.05
        } 
    },
    loc_txt = {
        name = 'Rare Goods',
        text = {
            [1] = 'Rarer Rarities are more common'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME._mod = G.GAME._mod + 0.000001               
                    return true
                end
            })),
            extra = {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME._mod = G.GAME._mod + 0.01               
                        return true
                    end
                })),
                colour = G.C.BLUE,
                extra = {
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME._mod = G.GAME._mod + 0.0025               
                            return true
                        end
                    })),
                    colour = G.C.BLUE,
                    extra = {
                        
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME._mod = G.GAME._mod + 0.001               
                                return true
                            end
                        })),
                        colour = G.C.BLUE,
                        extra = {
                            
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.rare_rate = G.GAME.rare_rate + 0.05               
                                    return true
                                end
                            })),
                            colour = G.C.BLUE
                        }
                    }
                }
            }
        }
    end
}