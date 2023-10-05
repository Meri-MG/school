# frozen_string_literal: true


  def index
    @sponsor_students = SponsorStudent.where(sponsored_status: 'unsponsored').order(created_at: :asc)
    @pagy, @sponsor_students = pagy(@sponsor_students)
  end

  def new
    @sponsor_student = SponsorStudent.new
  end

  def show
    @sponsor_student = SponsorStudent.find(params[:id])
  end

  def edit
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

  def update
    @sponsor_student = SponsorStudent.find(params[:id])

    @sponsor_student.update(sponsors_student_params)

    redirect_to sponsor_student_path(@sponsor_student)
  end

  def destroy
    @sponsor_student = SponsorStudent.find(params[:id])
    @sponsor_student.destroy!

    redirect_to sponsor_students_path
  end

  def sponsor_individual_student
    @sponsor_student = SponsorStudent.find(params[:id])
  end
  private

  def sponsors_student_params
    params.require(:sponsor_student)
          .permit(:name, :description, :age, :grade, :fav_food, :sponsored_status, 
                  :fav_color, :main_image, :secondary_image, :hobbies)
  end
end
