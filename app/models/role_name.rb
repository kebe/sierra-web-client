class RoleName < ActiveRecord::Base
  self.table_name = "iii_role_name"
  self.primary_key = "iii_role_id"
  belongs_to :role, class_name: "Role", foreign_key: "iii_role_id"
end
