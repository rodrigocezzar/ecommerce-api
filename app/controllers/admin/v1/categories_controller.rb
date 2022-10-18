# frozen_string_literal: true

module Admin
  module V1
    # class categories
    class CategoriesController < ApiController
      def index
        @categories = Category.all

        render json: @categories, each_serializer: CategoriesSerializer
      end
    end
  end
end
