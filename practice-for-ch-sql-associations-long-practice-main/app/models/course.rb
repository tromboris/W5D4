# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  prereq_id     :bigint
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord

    if !self.name.include?('101')
        belongs_to :prerequisite,
            primary_key: :id,
            foreign_key: :prereq_id,
            class_name: :Course
    else
        has_many :courses,
            primary_key: :id,
            foreign_key: :course_id,
            class_name: :Course
    end

    
    belongs_to :student,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :User
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :enrollment_id,
        class_name: :Enrollment
end
