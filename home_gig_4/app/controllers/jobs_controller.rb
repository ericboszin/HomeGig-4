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
        @job.status = "available"

        if @job.save
            redirect_to @job
        else
            flash[:warning]= "Error: Could not create job"
            render 'new'
        end
    end

    def status
        @job = Job.find(params[:status])

        if @job.status(job_params)
            redirect_to @job
        else
            flash[:warning]= "Error: Could not find job with status #{:status}"
            render 'show'
        end
    end

    def update
        @job = Job.find(params[:id])
        puts "HELLLOOO"
        puts params
        puts "END"

        # @job.accept_bids
        # if @job.update(job_params)
        #   redirect_to @job
        # else
        #   render 'edit'
        # end
    end

    def destroy
        @job = Job.find(params[:id])
        user = User.find(@job.user_id)
        if current_user == user
            @job.status = "cancelled"
            @job.destroy
        else
          flash[:warning]= "Error: user not authorized to delete job"
        end
        redirect_to jobs_path
    end

    def accept_bids
        @job = Job.find(params[:id])
        user = User.find(@job.user_id)
        if current_user == user
            @job.status = 'started'
            @job.bids.each do |_bid|
                puts _bid.selected
            end
        else
            flash[:warning]= "Error: user not authorized to accept bid"
        end
        redirect_to jobs_path
    end

    def explore
        @jobs = Job.all
    end

    private
        def job_params
            params.require(:job).permit(:title, :description, :price, :status)
        end

end
