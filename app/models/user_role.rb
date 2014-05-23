class UserRole < ActiveRecord::Base
  self.table_name = "iii_user_iii_role"
  belongs_to :user, foreign_key: "iii_user_id"
  belongs_to :role, foreign_key: "iii_role_id"
end
