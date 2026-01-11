
SMODS.Seal {
    key = 're9',
    pos = { x = 8, y = 0 },
    config = {
        extra = {
            retrigger_times0 = 9,
            retrigger_times = 9
        }
    },
    badge_colour = HEX('00209e'),
    loc_txt = {
        name = 'Re: 9',
        label = 'Re: 9',
        text = {
            [1] = 'Retrigger Card 9 Times'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    sound = { sound = "multhit2", per = 1.2, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 9
        end
        if context.cardarea == G.hand and context.main_scoring then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 9
        end
    end
}