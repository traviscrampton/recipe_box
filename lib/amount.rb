class Amount < ActiveRecord::Base
  belongs_to(:ingredient)
end
