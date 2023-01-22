# frozen_string_literal: true

module Admin
  module V1
    # Class ApiController
    class ApiController < ApplicationController
      class ForbiddenAccess < StandardError; end

      include Authenticable
      include SimpleErrorRenderable

      before_action :restrict_access_form_admin!

      rescue_from ForbiddenAccess do
        render_error(message: 'Forbidden access', status: :forbidden)
      end

      private

      def restrict_access_form_admin!
        raise ForbiddenAccess unless current_user.admin?
      end
    end
  end
end
