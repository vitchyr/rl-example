-- Analyze how NNSarsa does on BlackJack
require 'rl'
require 'BlackJackOneHotSAFE'
require 'BlackJack_constants'
local as = require 'analyze_sarsa'

local fe = BlackJackOneHotSAFE()
local explorer = rl.ConstExplorer(DEFAULT_EXPLORE_EPS)
local factory = rl.NNSarsaFactory(nil, nil, explorer, fe, DEFAULT_STEP_SIZE)
factory:set_feature_extractor(fe)
as.analyze_sarsa(factory, 'nn_sarsa')
