class Role < ActiveRecord::Base
  self.table_name = "iii_role"
  self.primary_key = "id"
  has_many :user_roles, class_name: "UserRole", foreign_key: "iii_role_id"
  has_many :users , through: :user_roles
  belongs_to :role_category, class_name: "RoleCategory", foreign_key: "iii_role_category_id"
  has_one :role_name, class_name: "RoleName", foreign_key: "iii_role_id"

  def self.search(search= nil)
    if search
    	search = search.strip.downcase
      where('lower(code) LIKE ? or lower(iii_role.id::text) LIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

end
