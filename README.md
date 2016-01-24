# rl-example
An example of how to use [torch-rl](https://github.com/vpong/torch-rl).

## Black Jack
BlackJack is an example MDP that gives you an idea of how to implement a
non-trival MDP.

Some simple scripts you can run:
* `visualize_montecarlo_results.lua` - See the Q-function and policy that Monte
  Carlo Learns.
* `test_montecarlo.lua` - See how Monte Carlo Control does on BlackJack and
  TestMdp.
* `test_tablesarsa.lua` - See how Table-Lookup Sarsa Lambda does on BlackJack
  and TestMdp.
* `test_thresholdpolicy.lua` - See how a super simple policy does on BlackJack.

This MDP is based on Easy 21 by Johannes.

### Visualization
The plot below shows the (greedy) policy that Monte Carlo learns. It shows what
the best action (z axis) to take is given a state (xy axis)A value of 1 means
the player should "hit", and 2 means that the player should "stick".

![Best action plot based on Monte Carlo
control](images/montecarlo_best_action_plot.png) "Best action action based on
Monte Carlo")

The plot below shows the learned value of different states.  ![Value function
plot based on Monte Carlo control](images/montecarlo_v_plot.png) "Value function
plot based on Monte Carlo")
