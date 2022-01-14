class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    def show
        render json: find_student
    end

    def index
        render json: Student.all
    end

    def update
        student = find_student
        Student.update(student_params)
        render json: student
    end

    def destroy
        find_student.destroy
        head :no_content
    end

    private

    def find_student
        Student.find(params[:id])
    end

    def student_params
        params.permit(:name, :instructor_id, :age, :major)
    end

    def render_not_found
        render json: { error: "student not found" }, status: :not_found
    end

    def render_unprocessable_entity(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end
