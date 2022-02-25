class Task < ApplicationRecord
        belongs_to :user
        validates :task_title, presence: true
        validates :notes, length: {maximum: 150}
    
end
