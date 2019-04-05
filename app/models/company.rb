class Company < ApplicationRecord
	self.table_name = "companies"
	self.primary_key = "id"

	has_and_belongs_to_many :users
end
