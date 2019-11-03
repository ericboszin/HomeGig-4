class JobsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @jobs = Job.all
    end

    def show
        @job = Job.find(params[:id])
    end

    def new
        @job = current_user.jobs.build 
    end

    def edit
        @job = Job.find(params[:id])
    end

    def create
        @job = current_user.jobs.build(job_params)

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
        user = User.find(@job.user_id)
        if current_user == user
          @job.destroy
        else
          flash[:warning]= "Error: user not authorized to delete"
        end
        redirect_to jobs_path
    end

    private
        def job_params
            params.require(:job).permit(:title, :description, :price)
        end

end
