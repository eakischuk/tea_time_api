require 'rails_helper'

RSpec.describe Tea do
  it 'exists and has attributes' do
    tea_data = {
        _id: "5fa3fd48d5ba620017ec1c09",
        name: "green",
        image: "uploads/green.png",
        description: "Rich in antioxidants and reduces inflammation.",
        keywords: "aroma, calm, china",
        origin: "China",
        brew_time: 2,
        temperature: 80,
        comments: []
    }
    tea = Tea.new(tea_data)

    expect(tea.title).to eq("green")
    expect(tea.description).to eq("Rich in antioxidants and reduces inflammation.")
    expect(tea.temperature).to eq(80)
    expect(tea.brew_time).to eq(2)
  end
end
