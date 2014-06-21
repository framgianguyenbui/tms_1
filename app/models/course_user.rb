class CourseUser < ActiveRecord::Base
	has_many :user
	has_many :course
	
end
