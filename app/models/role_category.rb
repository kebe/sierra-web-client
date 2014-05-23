class RoleCategory < ActiveRecord::Base
  self.table_name = "iii_role_category"
  self.primary_key = "id"
  has_many :roles, class_name: "Role", foreign_key: "iii_role_category_id"
  has_one :role_category_name, class_name: "RoleCategoryName", foreign_key: "iii_role_category_id" 
end
