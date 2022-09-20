# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Purchase, type: :model do
  subject do
    Purchase.new(
      pokemon_id: '1',
      pokemon_name: 'bulbasaur',
      base_experience: 123,
      usd_value: 123.12345
    )
  end
  before { subject.save }

  it 'pokemon_id should be present' do
    subject.pokemon_id = nil
    expect(subject).to_not be_valid
  end

  it 'pokemon_name should be present' do
    subject.pokemon_name = nil
    expect(subject).to_not be_valid
  end

  it 'base_experience should be present' do
    subject.base_experience = nil
    expect(subject).to_not be_valid
  end

  it 'usd_value should be present' do
    subject.usd_value = nil
    expect(subject).to_not be_valid
  end
end
