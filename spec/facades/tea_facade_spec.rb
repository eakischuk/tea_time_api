require 'rails_helper'

RSpec.describe TeaFacade do
  it 'returns tea poros', :vcr do
    teas = TeaFacade.all_teas

    expect(teas).to be_an(Array)
    expect(teas.first).to be_a(Tea)
  end
end
