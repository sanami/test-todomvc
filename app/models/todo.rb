class Todo < ActiveRecord::Base
  acts_as_paranoid

  attr_accessible :completed, :title
end
