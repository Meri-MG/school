# frozen_string_literal: true

class SponsoredStudentsController < ApplicationController
  def index
    @students = Student.where(status: 'sponsored').order(created_at: :asc)
    @pagy, @students = pagy(@students)
  end
end