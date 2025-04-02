# frozen_string_literal: true

class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top how_to_use privacy_policy terms_of_service]
  def top; end

  def how_to_use; end

  def privacy_policy; end

  def terms_of_service; end
end
