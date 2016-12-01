class LogsController < ApplicationController
  
  def statistic
    @link = Link.find_by(shortened: params[:id])
  end
end
