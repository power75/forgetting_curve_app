# frozen_string_literal: true

class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top how_to_use]
  def top; end

  def how_to_use; end
end
