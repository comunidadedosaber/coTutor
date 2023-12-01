class Project < ApplicationRecord
    has_many :projects_member
    has_many :projects_board
    has_many :projects_keyword
    has_many :projects_archive
    has_many :projects_suggestion
    has_many :projects_proposal
    has_many :projects_draft
    has_many :projects_monograph
end
