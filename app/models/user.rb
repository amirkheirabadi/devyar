class User < ApplicationRecord
	tabel_name = "users"
	primary_key = "id"

	has_and_belongs_to_many :companies
end
