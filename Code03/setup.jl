#!/usr/bin/env julia
#
isinstalled(pkg::String) = any(x -> x.name == pkg && x.is_direct_dep, values(Pkg.dependencies()))
const PKGS = ["BenchmarkTools","Match","StaticArrays","LinearAlgebra"]

using Pkg
Pkg.activate(".")
println("Installing required packages ...")

for p in PKGS
  isinstalled(p) || Pkg.add(p)
end

println("Done!")

