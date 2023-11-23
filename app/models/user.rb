class User < ApplicationRecord
    has_many :projects_member
    has_many :projects_board
end
