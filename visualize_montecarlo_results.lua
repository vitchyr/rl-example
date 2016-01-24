require 'rl'
require 'BlackJack'
require 'BlackJackQVAnalyzer'
local plot = require 'gnuplot'

math.randomseed(os.time())
local cmd = torch.CmdLine()
cmd:option('-ni', 4, 'log_10(# of iterations)')
cmd:option('-saveqto', '', 'save Q to this file if provided')
cmd:option('-nosave', false, 'do not save plots')
cmd:option('-show', false, 'show plots')
cmd:option('-loadqfrom', '', 'load monte carlo Q from this file if provided')
local opt = cmd:parse(arg)

local n_iters = 10^opt.ni
local discount_factor = 1

local function show_mc_plots(mdp, qv_analyzer)
    local mdp_config = rl.MdpConfig(mdp, discount_factor)
    -- use analyzer just to get q
    local sarsa_analyzer = rl.SarsaAnalyzer(opt, mdp_config, qv_analyzer)
    local q = sarsa_analyzer:get_true_q(n_iters)

    local v = qv_analyzer:v_from_q(q)

    if opt.show then
        gnuplot.figure()
        qv_analyzer:plot_v(v)
        gnuplot.figure()
        qv_analyzer:plot_best_action(q)
    end
    if not opt.nosave then
        gnuplot.epsfigure('images/montecarlo_v_plot.eps')
        qv_analyzer:plot_v(v)
        gnuplot.epsfigure('images/montecarlo_best_action_plot.eps')
        qv_analyzer:plot_best_action(q)
        gnuplot.plotflush()
    end

    if opt.saveqto ~= '' then
        torch.save(opt.saveqto, {q, q.__index})
    end
end

show_mc_plots(BlackJack(), BlackJackQVAnalyzer())
