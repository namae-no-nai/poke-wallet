class Purchase < ApplicationRecord
  belongs_to :investor

  validates :pokemon_name, :pokemon_id, :base_experience, presence: true
end
