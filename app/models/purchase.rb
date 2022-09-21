# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :investor

  validates :pokemon_name, :pokemon_id, :base_experience, :usd_value, :investor_id, presence: true
  validates :base_experience, numericality: { only_integer: true }
  validates :usd_value, numericality: true
end
