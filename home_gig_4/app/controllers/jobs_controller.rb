class JobsController < ApplicationController
    def index
        @jobs = Job.all
    end

    def create
        @job = Job.new(job_params)

        if @job.save
            redirect_to @job
        else
            flash[:warning]= "Error: Could not create job"
            render 'new'
        end
    end

    def show
        @job = Job.find(params[:id])
    end

    private
        def job_params
            params.require(:job).permit(:title, :description, :price)
        end

end
