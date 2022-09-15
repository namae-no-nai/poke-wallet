# frozen_string_literal: true

class HomeController < ApplicationController
    before_action :authenticate_investor!

    def index; end

end
