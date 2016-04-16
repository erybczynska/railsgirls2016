class RunsController < ApplicationController

  def index
    @runs = Run.all
  end

  def show
    @run = Run.find(params["id"])
  end

  def create
    run_params = params["run"].permit("name", "date", "city", "distance")
    run = Run.create(run_params)
    redirect_to(run_path(run))
  end

  def edit
    @run = Run.find(params["id"])
  end

  def update
    run_params = params["run"].permit("name", "date", "city", "distance")
    run = Run.find(params["id"])
    run.update(run_params)
    redirect_to(run_path(run))
  end

  def destroy
    run = Run.find(params['id'])
    run.destroy
    redirect_to runs_path
  end

end
