class ReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @reports = current_user.reports
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = current_user.reports.build 
  end

  def edit
    @report = Report.find(params[:id])
  end
    
  def create
    @report = current_user.reports.build(report_params)
    @report.status = "unresolved"
    if @report.save
      redirect_to reports_path
    else
      flash[:warning]= "Error: Could not create report"
      render 'new'
    end
  end

  def update
    @report = Report.find(params[:id])
    user = User.find(@report.user_id)
    if current_user == user
      if @report.update(report_params)
        redirect_to @report
      else
        flash[:warning] = "Error: Could update report"
        render 'edit'
      end
    else
      flash[:warning] = "Error: user not authorized to edit report"
      render 'edit'
    end
  end

  def destroy
    @report = Report.find(params[:id])
    user = User.find(@report.user_id)
    if current_user == user
      @report.destroy
    else
      flash[:warning]= "Error: user not authorized to delete report"
    end
    redirect_to @report
  end

  def resolve
    @report = Report.find(params[:report_id])
    @report.status = "resolved"
    if @report.save
      redirect_to @report
    else
      flash[:warning]= "Error: Could not resolve report"
    end
  end

  def unresolve
    @report = Report.find(params[:report_id])
    @report.status = "unresolved"
    if @report.save
      redirect_to @report
    else
      flash[:warning]= "Error: Could not unresolve report"
    end
  end

  private
    def report_params
      params.require(:report).permit(:title, :description)
    end
end

