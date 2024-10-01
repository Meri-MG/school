# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @students = Student.where(status: 'unsponsored').order(created_at: :asc)
    @pagy, @students = pagy(@students)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.create(student_params)

    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
    else
      flash.now[:error] = 'Could not save client'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @student = Student.find(params[:id])

    @student.update(student_params)

    redirect_to student_path(@student)
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy!

    redirect_to students_path
  end

  def sponsor_individual_student
    @student = Student.find(params[:id])
  end

  private

  def student_params
    params.require(:student)
          .permit(:name, :description, :age, :grade, :fav_food, :status,
                  :fav_color, :main_image, :secondary_image, :hobbies)
  end
end
