class SponsorStudentsController < ApplicationController
  def index
    @sponsor_students = SponsorStudent.all
  end

  def new
    @sponsor_student = SponsorStudent.new
  end

  def show
    @sponsor_student = SponsorStudent.find(params[:id])
  end

  def create
    @sponsor_student = SponsorStudent.create(sponsors_student_params)

    if @sponsor_student.save
      redirect_to @sponsor_student, notice: 'Student was successfully created.'
    else
      flash.now[:error] = 'Could not save client'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def sponsors_student_params
    params.require(:sponsor_student).permit(:name, :description, :age, :grade, :fav_food, :sponsored_status, :fav_color, :main_image, :secondary_image, :hobbies)
  end
end
