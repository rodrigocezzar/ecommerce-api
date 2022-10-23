# frozen_string_literal: true

module Admin
  module V1
    # class categories
    class CategoriesController < ApiController
      def index
        @categories = Category.all

        render json: @categories, each_serializer: CategoriesSerializer
      end

      def create
        @category = Category.new
        @category.attributes = category_params

        save_category!
      end

      def update
        @category = Category.find(params[:id])
        @category.attributes = category_params

        save_category!
      end

      private

      def category_params
        return {} unless params.key?(:category)

        params.require(:category).permit(:id, :name)
      end

      def save_category!
        @category.save!
        render json: @category, serializer: CategoriesSerializer
      rescue
        render_error(fields: @category.errors.messages)
      end
    end
  end
end
