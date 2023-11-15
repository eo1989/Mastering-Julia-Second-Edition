#!/usr/local/bin/julia
#
isinstalled(pkg::String) = any(x -> x.name == pkg && x.is_direct_dep, values(Pkg.dependencies()))

const PKGS = ["Distributions","PyPlot","Plots","FFTW","DSP","OrdinaryDiffEq","Sundials","Roots",
              "Sundials","DifferentialEquations","Calculus","ForwardDiff","SymPy","QuadGK",
              "HCubature","JuMP","Clp","GLPK","Optim","SimJulia","ResumableFunctions"]

using Pkg
Pkg.activate(".")

println("Installing required packages ...")
for p in PKGS
  isinstalled(p) || Pkg.add(p)
end
println("Done!")