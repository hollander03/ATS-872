### A Pluto.jl notebook ###
# v0.14.4

using Markdown
using InteractiveUtils

# ╔═╡ 53021700-ff29-11eb-3dc6-9f06cdeb3572
using LinearAlgebra, Statistics, Distributions

# ╔═╡ aebb3152-91f5-4f21-90e3-7e4f97952ff8
html"""
<div style="
position: absolute;
width: calc(100% - 30px);
border: 50vw solid #2e3440;
border-top: 200px solid #2e3440;
border-bottom: none;
box-sizing: content-box;
left: calc(-50vw + 15px);
top: -100px;
height: 100px;
pointer-events: none;
"></div>

<div style="
height: 200px;
width: 100%;
background: #2e3440;
color: #fff;
padding-top: 50px;
">
<span style="
font-family: Vollkorn, serif;
font-weight: 700;
font-feature-settings: 'lnum', 'pnum';
"> <p style="
font-size: 1.5rem;
opacity: 0.8;
">ATS 872: Lecture 0</p>
<p style="text-align: center; font-size: 1.8rem;">
 Introduction to Julia (live coding)
</p>

<style>
body {
overflow-x: hidden;
}
</style>"""

# ╔═╡ 8113df30-ff28-11eb-05dc-93f378709f25
md""" This is our first Julia session. $x + y = 5$ """

# ╔═╡ 43e57ce0-ff28-11eb-0c67-e754e99e5842
x = 2 + 2

# ╔═╡ 57c3b330-ff28-11eb-3078-754efd7a8ba4
y=5

# ╔═╡ 5db48b20-ff28-11eb-2373-49199a96e40a
x+y

# ╔═╡ 60b15062-ff28-11eb-1dd8-ed6c8bb99995
md""" Let's load some packages """

# ╔═╡ 5ee8a8e0-ff29-11eb-0a61-bfaa22e2f4bc
md""" Containers """

# ╔═╡ 1569ae96-5f18-47dd-af86-d5243b1edb32
t_1 = ("foo","bar") # Immutable

# ╔═╡ c9a5e377-8145-4b6a-a460-9e03e58d1535


# ╔═╡ Cell order:
# ╟─aebb3152-91f5-4f21-90e3-7e4f97952ff8
# ╠═8113df30-ff28-11eb-05dc-93f378709f25
# ╠═43e57ce0-ff28-11eb-0c67-e754e99e5842
# ╠═57c3b330-ff28-11eb-3078-754efd7a8ba4
# ╠═5db48b20-ff28-11eb-2373-49199a96e40a
# ╟─60b15062-ff28-11eb-1dd8-ed6c8bb99995
# ╠═53021700-ff29-11eb-3dc6-9f06cdeb3572
# ╟─5ee8a8e0-ff29-11eb-0a61-bfaa22e2f4bc
# ╠═1569ae96-5f18-47dd-af86-d5243b1edb32
# ╠═c9a5e377-8145-4b6a-a460-9e03e58d1535
