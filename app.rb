require "sinatra"
require "sinatra/reloader"
require "active_support/all"

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

get("/square") do
  if (params.fetch("num").to_i == params.fetch("num").to_f)
    @num = params.fetch("num").to_i
    @result = @num * @num
  else
    @num = params.fetch("num").to_f
    @result = (@num ** 2).to_fs(:percentage, { :precision => 4 } )
  end
  erb(:results)
end

get("/square_root") do
  @num = params.fetch("num").to_f

  @result = Math.sqrt(@num)
  if ( @result.to_i  == @result)
    @result = @result.to_i
  else
    @result = @result.to_fs(:percentage, { :precision => 4 } )
  end
  erb(:results)
end

get("/random") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f

  @result = rand(@min..@max)
  erb(:results3)
end

get("/payment") do
  @apr = (params.fetch("apr").to_f / 12 / 100)
  @period = params.fetch("years").to_i * 12
  @value = params.fetch("value").to_f

  numerator = @value * @apr
  denominator = 1 - ((1 + @apr) ** (-@period))
  @result = (numerator / denominator).to_fs(:currency, {:precision => 2})
  @apr = @apr.to_fs(:percentage, {:precision => 4})
  erb(:results4)
end
