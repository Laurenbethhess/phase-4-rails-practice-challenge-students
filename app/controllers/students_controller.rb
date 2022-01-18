class StudentsController < ApplicationController

    def index
        render json: Student.all
    end

    def show
        render json: find_student
    end

    def create
        render json: Student.create!(student_params), status: :created
    end

    def update
        student = find_student
        student.update(student_params)
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
        params.permit(:name, :age, :instructor_id, :major)
    end
end
