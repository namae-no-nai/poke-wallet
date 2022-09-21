# frozen_string_literal: true

class WalletLog < ApplicationRecord
  belongs_to :investor

  validates :pokemon_id, :pokemon_name, :usd_value, :investor_id, presence: true
  validates :usd_value, numericality: true
end
