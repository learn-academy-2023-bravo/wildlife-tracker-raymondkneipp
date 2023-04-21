require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'is not valid without a latitude' do
    cat = Sighting.create(longitude: 56.3456, date: '2024-04-21')
    expect(cat.errors[:latitude]).to_not be_empty
  end

  it 'is not valid without a longitude' do
    cat = Sighting.create(latitude: 56.3456, date: '2024-04-21')
    expect(cat.errors[:longitude]).to_not be_empty
  end

  it 'is not valid without a date' do
    cat = Sighting.create(latitude: 56.3456, longitude: 45.2345)
    expect(cat.errors[:date]).to_not be_empty
  end
end
