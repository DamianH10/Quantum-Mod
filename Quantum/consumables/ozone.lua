
SMODS.Consumable {
    key = 'ozone',
    set = 'chemical',
    pos = { x = 8, y = 0 },
    loc_txt = {
        name = 'Ozone ',
        text = {
            [1] = 'Select 2 Cards to raise their value',
            [2] = 'by 3. Ozone or Oxygen 3 (O3) is a',
            [3] = 'strong oxidizer, chemicals burn hotter',
            [4] = 'under Ozone too. It also has a very',
            [5] = 'high toxicity: Ozone has a direct lethal',
            [6] = 'exposure (for 60 min) at 50ppm, for',
            [7] = 'comparison chlorine gas has a lethal',
            [8] = 'exposure at 400ppm. its main way of',
            [9] = 'synthesis is via electricity, with plasma',
            [10] = 'arcs and discharges, so high power el-',
            [11] = 'ectronics have a risk to create ozone',
            [12] = 'on accident. It smells similar to chlorine.'
        }
    },
    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if to_big(#G.hand.highlighted) == to_big(2) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        assert(SMODS.modify_rank(G.hand.highlighted[i], 3))
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        return (to_big(#G.hand.highlighted) == to_big(2))
    end
}