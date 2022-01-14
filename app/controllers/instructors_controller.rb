class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def create
        instructor = Instructor.create(instructor_params)
        render json: instructor, status: :created
    end

    def show
        render json: find_instructor
    end

    def index
        render json: Instructor.all
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

    def find_instructor
        Instructor.find(params[:id])
    end

    def instructor_params
        params.permit(:name)
    end

    def render_not_found
        render json: { error: "Instructor not found" }, status: :not_found
    end


end
