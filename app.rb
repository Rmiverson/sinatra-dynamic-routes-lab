require_relative 'config/environment'

class App < Sinatra::Base
  get '/reversename/:name' do
    @name = params[:name]
    "#{@name.reverse}"
  end

  get '/square/:number' do
    @input_number = params[:number]
    "#{@input_number.to_i ** 2}"
  end

  get '/say/:number/:phrase' do
    @input_number = params[:number]
    @input_phrase = params[:phrase]

    ans = []

    @input_number.to_i.times {ans << @input_phrase}

    "#{ans.join(" ")}"
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    ans = []
    params.each {|key, value| ans << value}
    "#{ans.join(" ")}."
  end

  get '/:operation/:number1/:number2' do
    @op = params[:operation]
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i

    if @op == "add"
      ans = @num1 + @num2
    elsif @op == "subtract"
      ans = @num1 - @num2
    elsif @op == "multiply"
      ans = @num1 * @num2
    elsif @op == "divide"
      ans = @num1 / @num2
    end

    "#{ans}"
  end
end