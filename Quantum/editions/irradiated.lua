
SMODS.Shader({ key = 'sepia', path = 'sepia.fs' })

SMODS.Edition {
    key = 'irradiated',
    shader = 'sepia',
    config = {
        extra = {
            currentchiptotal = 0
        }
    },
    in_shop = true,
    weight = 1,
    extra_cost = 4,
    apply_to_float = true,
    badge_colour = HEX('24e578'),
    sound = { sound = "holo1", per = 1.2, vol = 0.4 },
    disable_shadow = true,
    disable_base_shader = true,
    loc_txt = {
        name = 'Irradiated',
        label = 'Irradiated',
        text = {
            [1] = 'Raises current Chips by',
            [2] = '^1.125 when scored.'
        }
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {(G.GAME.chips or 0)}}
    end,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            local exponent_value = card.ability.extra.exponent
            card.ability.extra.exponent = G.GAME.chips
            card.ability.extra.exponent = math.sqrt(card.ability.extra.exponent)
            card.ability.extra.exponent = math.sqrt(card.ability.extra.exponent)
            card.ability.extra.exponent = math.sqrt(card.ability.extra.exponent)
            return {
                x_chips = card.ability.edition.exponent_value
            }
        end
    end
}