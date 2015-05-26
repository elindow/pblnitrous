class Topic < ActiveRecord::Base
  
  has_and_belongs_to_many :questions
  
  alias_attribute :topicname, :topicName
end
