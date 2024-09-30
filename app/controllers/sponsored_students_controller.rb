# frozen_string_literal: true

class SponsoredStudentsController < ApplicationController
  def index
    @sponsored_students = SponsorStudent.where(status: 'sponsored').order(created_at: :asc)
    @pagy, @sponsored_students = pagy(@sponsored_students)
  end
end