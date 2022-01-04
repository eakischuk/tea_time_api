require 'rails_helper'

RSpec.describe TeaService do
  it 'returns teas' do
    response = TeaService.teas

    expect(response).to be_an(Array)
    response.each do |tea|
      expect(tea).to be_a(Hash)
      expect(tea).to have_key(:name)
      expect(tea[:name]).to be_a(String)
      expect(tea).to have_key(:description)
      expect(tea[:description]).to be_a(String)
      expect(tea).to have_key(:brew_time)
      expect(tea[:brew_time]).to be_an(Integer)
      expect(tea).to have_key(:temperature)
      expect(tea[:temperature]).to be_an(Integer)
    end
  end
end
