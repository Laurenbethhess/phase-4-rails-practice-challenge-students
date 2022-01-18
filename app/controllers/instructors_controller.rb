class InstructorsController < ApplicationController

    def index
        render json: Instructor.all
    end

    def show
        render json: find_instructor
    end

    def create
        render json: Instructor.create!(instructor_params), status: :created
    end

    def update
        instructor = find_instructor
        instructor.update(instructor_params)
        render json: instructor
    end

    def destroy
        find_instructor.destroy
        head :no_content
    end

    private 

    def instructor_params
        params.permit(:name)
    end

    def find_instructor
        Instructor.find(params[:id])
    end
end
