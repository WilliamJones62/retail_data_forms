class User < ApplicationRecord
  self.table_name = "retail_data_forms_users"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable
end
