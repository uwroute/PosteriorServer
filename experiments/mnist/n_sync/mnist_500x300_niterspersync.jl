# User experiment setting variables
method = "postserver"	# sgd distbayes sgld
dataset = "mnist" # mnist omniglot cifar-100
run_suffix = ""
(modelfactory, model_name) = make_dense_nn([500,300],10)
include("$(scripts_path)mnist_defaults.jl")
specs[:model] = "500x300"
specs[:nworkers] = 4
specs[:initparams] = :Xavier
specs[:initlikvar] = 0.01
specs[:priorvar] = .5
specs[:sampler] = :Adam
specs[:batchsize] = 100
specs[:averagepredprobs] = false

specs[:nitersinitialopt] = 0
specs[:learnrateinitialopt] = 2e-2
specs[:stepsizeinitialopt] = 1e-3

specs[:nitersinitial] = 0
specs[:learnrateinitial] = 2e-2
specs[:stepsizeinitial] = 1e-3
specs[:injectnoise] = 0.

specs[:nitersinitialmcmc] = 0
specs[:learnrateinitialmcmc] = 2e-2
specs[:stepsizeinitialmcmc] = 1e-3
specs[:injectnoisemcmc] = 0.1
specs[:averagegradmcmc] = false

specs[:niters] = 600*20
specs[:learnrate] = 2e-2
specs[:stepsize] = 1e-3
specs[:injectnoise] = 1.0
#specs[:averagegrad] = false
specs[:nitersstartaveraging]     = 600*15
specs[:synchronizedamping] = false
specs[:adaptation] = :none
# what parameters to vary for this experiment
varyparam = :niterspersync
varyvalues = [repmat([1],10); repmat([5],10); repmat([10],10); repmat([20],10); repmat([30],10); repmat([40],10); repmat([50],10); repmat([100],10)]
