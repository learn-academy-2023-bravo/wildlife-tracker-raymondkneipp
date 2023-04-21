require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is not valid without a common_name' do
    cat = Animal.create(scientific_binomial: 'Felis catus')
    expect(cat.errors[:common_name]).to_not be_empty
  end

  it 'is not valid without a scientific_binomial' do
    cat = Animal.create(common_name: 'Cat')
    expect(cat.errors[:scientific_binomial]).to_not be_empty
  end

  it 'is not valid if common_name is the same as scientific_binomial' do
    cat = Animal.create(common_name: 'Cat', scientific_binomial: 'Cat')
    expect(cat.errors[:common_name]).to_not be_empty
  end

  it 'is not valid if common_name is not unique' do
    cat1 = Animal.create(common_name: 'Cat', scientific_binomial: 'Felis catus')
    cat2 = Animal.create(common_name: 'Cat', scientific_binomial: 'Felis catus2')
    expect(cat2.errors[:common_name]).to_not be_empty
  end

  it 'is not valid if scientific_binomial is not unique' do
    cat1 = Animal.create(common_name: 'Cat', scientific_binomial: 'Felis catus')
    cat2 = Animal.create(common_name: 'Cat2', scientific_binomial: 'Felis catus')
    expect(cat2.errors[:scientific_binomial]).to_not be_empty
  end
end
