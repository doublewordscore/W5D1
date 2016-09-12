class ActivitiesController < ApplicationController

  def show
    @activity = Activity.find_by(params[:id])
    render :show
  end

  def new
    @activity = Activity.new
    render :new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to user_url(params[:user_id])
    else
      flash.now[:errors] = ["Could not create goal!"]
      render :new
    end
  end

  def edit
    @activity = Activity.find_by(params[:id])
    render :edit
  end

  def update
    @activity = Activity.find_by(params[:id])
    if @activity.update_attributes
      redirect_to user_url(params[:user_id])
    else
      flash.now[:errors] = ["Could not update goal!"]
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :visibility, :status)
  end

end
