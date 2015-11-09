class Student < ActiveRecord::Base
  has_many :perf_types
  has_many :questions, :through => :perf_types
end
