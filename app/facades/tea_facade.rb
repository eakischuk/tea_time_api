class TeaFacade
  def self.all_teas
    tea_data = TeaService.all_teas

    tea_data.map do |tea|
      Tea.new(tea)
    end
  end
end
