using SatelliteToolbox
using Plots
using BlackBoxOptim

include("simulators/objectives/objective_functions.jl")

plotly()


Irange = (0., 180.)
Hrange = (200., 1000.)

# a: Semimajor axis
# e: Eccentricity 
e = 0.
# i: Inclination 
# Ω: Longitude of the ascending node
Ω = 0.
# ω: Argument of periapsis 
ω = 0.
# f: True anomaly
f = 0.

# Objective function   
function average_objective_07(x)
    alpha = 0.7
    beta = 0.3

    H = x[1]
    I = x[2]
    h = H + 200
    i =  I* pi / 180

    #println("height:", h) 
    #println("inclination:", i)
    
    orbit = Orbit(Rm + h * 1000., e, i, Ω, ω, f) 
    cost = orbit_cost(orbit)/200
    revisit = mean_coverage_gap(orbit)/(60*50)


    #println("cost 07: ", cost)
    #println("revisit 07: ", revisit)
    return (alpha*cost + beta*revisit)
end

function average_objective_06(x)
    alpha = 0.6
    beta = 0.4

    H = x[1]
    I = x[2]
    h = H + 200
    i =  I* pi / 180

    #println("height:", h) 
    #println("inclination:", i)
    
    orbit = Orbit(Rm + h * 1000., e, i, Ω, ω, f) 
    cost = orbit_cost(orbit)/200
    revisit = mean_coverage_gap(orbit)/(60*50)


    #println("cost 06: ", cost)
    #println("revisit 06: ", revisit)
    return (alpha*cost + beta*revisit)
end

function average_objective_05(x)
    alpha = 0.5
    beta = 0.5

    H = x[1]
    I = x[2]
    h = H + 200
    i =  I* pi / 180

    #println("height:", h) 
    #println("inclination:", i)
    
    orbit = Orbit(Rm + h * 1000., e, i, Ω, ω, f) 
    cost = orbit_cost(orbit)/200
    revisit = mean_coverage_gap(orbit)/(60*50)

    #println("cost 05: ", cost)
    #println("revisit 05: ",revisit)
    return (alpha*cost + beta*revisit)
end

function average_objective_04(x)
    alpha = 0.4
    beta = 0.6

    H = x[1]
    I = x[2]
    h = H + 200
    i =  I* pi / 180

    #println("height:", h) 
    #println("inclination:", i)
    
    orbit = Orbit(Rm + h * 1000., e, i, Ω, ω, f) 
    cost = orbit_cost(orbit)/200
    revisit = mean_coverage_gap(orbit)/(60*50)


    #println("cost 04: ", cost)
    #println("revisit 04: ",revisit)
    return (alpha*cost + beta*revisit)
end

function average_objective_03(x)
    alpha = 0.3
    beta = 0.7

    H = x[1]
    I = x[2]
    h = H + 200
    i =  I* pi / 180

    #println("height:", h) 
    #println("inclination:", i)
    
    orbit = Orbit(Rm + h * 1000., e, i, Ω, ω, f) 
    cost = orbit_cost(orbit)/200
    revisit = mean_coverage_gap(orbit)/(60*50)


    #println("cost 03: ", cost)
    #println("revisit 03: ",revisit)
    return (alpha*cost + beta*revisit)
end


#compare = compare_optimizers(average_objective_05; SearchRange = [Hrange, Irange], NumDimensions = 2, MaxTime = 120.0);

#res7 = bboptimize(average_objective_07; SearchRange =  [Hrange, Irange], NumDimensions = 2, MaxTime = 600.0, TraceMode=:verbose)
#res6 = bboptimize(average_objective_06; SearchRange =  [Hrange, Irange], NumDimensions = 2, MaxTime = 600.0, TraceMode=:verbose)
#res5 = bboptimize(average_objective_05; SearchRange =  [Hrange, Irange], NumDimensions = 2, MaxTime = 600.0, TraceMode=:verbose)
#res4 = bboptimize(average_objective_04; SearchRange =  [Hrange, Irange], NumDimensions = 2, MaxTime = 600.0, TraceMode=:verbose)
#res3 = bboptimize(average_objective_03; SearchRange =  [Hrange, Irange], NumDimensions = 2, MaxTime = 600.0, TraceMode=:verbose)
 
println("## 0.7 Cost ##")
println("Best Pair")
println(best_candidate(res7))
println("Fitness")
println(best_fitness(res7))
orbit = Orbit(Rm + (best_candidate(res7)[1] +200 )* 1000., e, best_candidate(res7)[2] * pi / 180, Ω, ω, f) 
println("Cost")
println(orbit_cost(orbit))
println("MCG")
println(mean_coverage_gap(orbit)/60)

println("## 0.6 Cost ##")
println("Best Pair")
println(best_candidate(res6))
println("Fitness")
println(best_fitness(res6))
orbit = Orbit(Rm + (best_candidate(res6)[1] +200 )* 1000., e, best_candidate(res6)[2] * pi / 180, Ω, ω, f) 
println("Cost")
println(orbit_cost(orbit))
println("MCG")
println(mean_coverage_gap(orbit)/60)


println("## 0.5 Cost ##")
println("Best Pair")
println(best_candidate(res5))
println("Fitness")
println(best_fitness(res5))
orbit = Orbit(Rm + (best_candidate(res5)[1] +200 )* 1000., e, best_candidate(res5)[2] * pi / 180, Ω, ω, f) 

println("Cost")
println(orbit_cost(orbit))
println("MCG")
println(mean_coverage_gap(orbit)/60)

println("## 0.4 Cost ##")
println("Best Pair")
println(best_candidate(res4))
println("Fitness")
println(best_fitness(res4))
orbit = Orbit(Rm + (best_candidate(res4)[1] +200 )* 1000., e, best_candidate(res4)[2] * pi / 180, Ω, ω, f) 

println("Cost")
println(orbit_cost(orbit))
println("MCG")
println(mean_coverage_gap(orbit)/60)

println("## 0.3 Cost ##")
println("Best Pair")
println(best_candidate(res3))
println("Fitness")
println(best_fitness(res3))
orbit = Orbit(Rm + (best_candidate(res3)[1] +200 )* 1000., e, best_candidate(res3)[2] * pi / 180, Ω, ω, f) 

println("Cost")
println(orbit_cost(orbit))
println("MCG")
println(mean_coverage_gap(orbit)/60)