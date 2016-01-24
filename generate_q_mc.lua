require 'rl'
require 'BlackJack'
require 'BlackJackQVAnalyzer'

-- Script for generating Q for Monte Carlo to save.
local cmd = torch.CmdLine()
cmd:option('-ni', 6, 'log_10(# of iterations)')
cmd:option('-saveqto', '', 'save Q to this file if provided')
local params = cmd:parse(arg)

if params.saveqto == '' then
    error('Must provide -saveqto [FILENAME] option')
end

local mdp = BlackJack()
local discount_factor = 1
local n_iters = 10^params.ni

local mdp_config = rl.MdpConfig(mdp, discount_factor)
local mc = rl.MonteCarloControl(mdp_config)
mc:improve_policy_for_n_iters(n_iters)

local q = mc:get_q()

rl.util.save_q(params.saveqto, q)
