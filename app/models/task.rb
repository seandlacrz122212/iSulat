class Task < ApplicationRecord
        belongs_to :user
        validates :category, presence: true
        validates :task_title, presence: true
        validates :notes, length: {maximum: 150}


        config.authentication_keys = [ :email ]
        config.case_insensitive_keys = [ :email ]
        config.strip_whitespace_keys = [ :email ]


        devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
      
    
end
