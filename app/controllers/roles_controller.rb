class RolesController < ApplicationController
  def index
  	@roles = Role.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], per_page: params[:per_page])
  end

  def show
    @role = Role.find(params[:id])
  end

  def export_users_in_role
    @role = Role.find(params[:id])
    @users = @role.users #where(:transported => true)
    respond_to do |format|
          format.csv { send_data @users.to_csv('tes.csv')}
    end
  end

  private
    def sort_column
        Role.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

end
