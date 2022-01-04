class Tea
  attr_reader :title, :description, :temperature, :brew_time
  def initialize(tea_data)
    @title = tea_data[:name]
    @description = tea_data[:description]
    @temperature = tea_data[:temperature]
    @brew_time = tea_data[:brew_time]
  end
end
