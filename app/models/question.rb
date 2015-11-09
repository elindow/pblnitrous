class Question < ActiveRecord::Base
  has_and_belongs_to_many :topics
  has_many :perf_types
  has_many :students, :through => :perf_types
  
  mount_uploader :qimage, QimageUploader
  mount_uploader :aimage, AimageUploader
end
