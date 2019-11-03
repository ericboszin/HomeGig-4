class JobsController < ApplicationController
    def index
        @jobs = Job.all
    end

    def show
        @job = Job.find(params[:id])
    end

    def new
        @job = current_user.job.build
    end

    def edit
        @job = Job.find(params[:id])
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

    def update
        @job = Job.find(params[:id])
       
        if @job.update(job_params)
          redirect_to @job
        else
          render 'edit'
        end
    end

    def destroy
        @job = Job.find(params[:id])
        @job.destroy
       
        redirect_to jobs_path
    end

    private
        def job_params
            params.require(:job).permit(:title, :description, :price)
        end

end
