class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @search_param = params[:search]
  	@users = User.search(@search_param).order(sort_column + " " + sort_direction).paginate(:page => params[:page], per_page: params[:per_page])
  end


  def show
    @user = User.find(params[:id])
    @other_users_array = User.all.map { |user| [user.full_name + ' (' + user.name + ')', user.id] } 
  end

  def compare #compare_permissions
    @user = User.find(params[:id])
    @other_user = User.find(params[:other_user_id])
    @roles = @user.roles.to_a.concat(@other_user.roles.to_a).uniq
  end

  def export_users_search_list
    @users = User.search(params[:search_param]).order(sort_column + " " + sort_direction)
    respond_to do |format|
          format.csv { send_data @users.to_csv()}
    end
  end

  private
    def sort_column
        User.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

end
