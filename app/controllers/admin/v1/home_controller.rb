# frozen_string_literal: true

module Admin
  module V1
    # Class HomeController
    class HomeController < ApiController
      def index
        render json: { message: 'uhull' }
      end
    end
  end
end
