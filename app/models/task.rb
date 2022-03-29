class Task < ApplicationRecord

    belongs_to :user

    validates_presence_of :name
    validates_presence_of :category
    validates_presence_of :priority
    validates_presence_of :user
    
end
