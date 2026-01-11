
SMODS.Seal {
    key = 're6',
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            retrigger_times0 = 6,
            retrigger_times = 6
        }
    },
    badge_colour = HEX('089b08'),
    loc_txt = {
        name = 'Re: 6',
        label = 'Re: 6',
        text = {
            [1] = 'Retrigger Card 6 Times'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    sound = { sound = "multhit1", per = 1.2, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 6
        end
        if context.cardarea == G.hand and context.main_scoring then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 6
        end
    end
}