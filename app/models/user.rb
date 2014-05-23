class User < ActiveRecord::Base
  self.table_name = "iii_user"
  self.primary_key = "id"

  has_many :user_roles, class_name: "UserRole", foreign_key: "iii_user_id"
  has_many :roles , through: :user_roles


  def self.search(search= nil)
    if search
    	search = search.strip.downcase
      where('lower(name) LIKE ? or lower(full_name) LIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

  def self.to_csv(options = {})
  require 'csv'
    columns = ["id", "name", "full_name"]
    CSV.generate(options) do |csv|
      csv << columns
      all.each do |u|
       
        user_info = [u.id, u.name, u.full_name]
        csv << user_info
      end
    end
  end

  
end
