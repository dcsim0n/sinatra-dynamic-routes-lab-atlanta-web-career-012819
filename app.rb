require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get "/reversename/:name" do
    params[:name].reverse
  end

  get "/square/:number" do
    num = params[:number].to_i
    (num ** 2).to_s
  end

  get "/say/:number/:phrase" do
    num = params[:number].to_i

    (1..num).map do
      "#{params[:phrase]}\n"
    end
  end

  get "/:operation/:number1/:number2" do
    num1 = params[:number1].to_i
    num2 = params[:number2].to_i
    result = nil
    case params[:operation]
    when 'add'
      result = num1 + num2
    when 'subtract'
      result = num1 - num2
    when 'multiply'
      result = num1 * num2
    when 'divide'
      result = num1 / num2
    else
      result = "WTF did you do?"
    end

    result.to_s
  end

  get "/say/*/*/*/*/*" do
  params[:splat].join(" ") + "."
  end
end
