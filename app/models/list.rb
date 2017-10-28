class List < ApplicationRecord
	validates_presence_of :list_name,:description,:due_date
end
