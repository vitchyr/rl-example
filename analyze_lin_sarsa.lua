-- Analyze how LinSarsa does on BlackJack
require 'rl'
require 'BlackJackBoxSAFE'
require 'BlackJack_constants'
local as = require 'analyze_sarsa'

local fe = BlackJackBoxSAFE()
local explorer = rl.ConstExplorer(DEFAULT_EXPLORE_EPS)
local factory = rl.NNSarsaFactory(nil, nil, explorer, fe, DEFAULT_STEP_SIZE)
factory:set_feature_extractor(fe)
as.analyze_sarsa(factory, 'lin_sarsa')
