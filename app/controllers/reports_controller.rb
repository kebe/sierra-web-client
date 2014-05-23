class ReportsController < ApplicationController

  # get last time passwords were changed
  def password_change_audit
    @start = params[:start].to_i
    @end = params[:end].to_i

    @start_day = @start.days.ago
    @end_day = @end == 0 ? 100.years.ago : @end.to_i.days.ago

    if !params[:start].blank?  
      @users = User.where('iii_user.last_password_change_gmt < ? and iii_user.last_password_change_gmt > ?', @start_day, @end_day)
.order(sort_column + " " + sort_direction).paginate(:page => params[:page], per_page: params[:per_page])
    else 
      #check for password that have never been changed
      @users = User.where('iii_user.last_password_change_gmt is ?', nil)
.order(sort_column + " " + sort_direction).paginate(:page => params[:page], per_page: params[:per_page])
    end

    @allusers = User.all
  end


  private

    def sort_column
        Role.column_names.include?(params[:sort]) ? params[:sort] : "last_password_change_gmt"
    end

    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

end
