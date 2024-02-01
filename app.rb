require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:home)
end

get("/square/new") do
  erb(:square)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/random/new") do
  erb(:random)
end

get("/payment/new") do
  erb(:payment)
end

get("/square?num=:num") do
  num = params.fetch("num").to_i

  @result = pow(num, 2)
  erb(:results)
end

get("/square_root?num=:num") do
  num = params.fetch("num").to_i

  @result = pow(num, 0.5)
  erb(:results)
end

get("/random?min=:min&max=:max") do
  min = params.fetch("min").to_i
  max = params.fetch("max").to_i

  @result = rand(min..max)
  erb(:results)
end

get("/payment?apr=:apr&years=:years&value=:value") do
  apr = params.fetch("apr").to_f / 12 / 100
  period = params.fetch("years").to_i * 12
  value = params.fetch("value").to_i

  numerator = value * apr
  denominator = 1 - pow(1 + apr, -period)
  @result = numerator / denominator
  erb(:results)
end
