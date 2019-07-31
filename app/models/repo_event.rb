class RepoEvent < ApplicationRecord
  belongs_to :event
  belongs_to :repo
end
