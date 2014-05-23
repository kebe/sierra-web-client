class RoleCategoryName < ActiveRecord::Base
  self.table_name = "iii_role_category_name"
  self.primary_key = "iii_role_category_id"
  belongs_to :role_category, class_name: "RoleCategory", foreign_key: "iii_role_category_id"
end