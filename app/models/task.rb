class Task < ApplicationRecord
        belongs_to :user
        belongs_to :category
        validates :task_title, presence: true
        validates :notes, length: {maximum: 150}
    
end
