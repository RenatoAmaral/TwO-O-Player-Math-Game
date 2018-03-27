class Questions
  attr_accessor :answer, :question

  def initialize
    @num1 = rand(1...50)
    @num2 = rand(1...50)
    @answer = @num1 + @num2
    @question = puts "What does #{@num1} plus #{@num2} equal?"
  end

end
