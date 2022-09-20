# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :investor

  validates :pokemon_name, :pokemon_id, :base_experience, :usd_value, presence: true
end
