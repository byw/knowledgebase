class Answer
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :answer_user, class_name: 'User'
  embedded_in :question
  #recursively_embeds_many

  field :text, type: String
  field :upvotes, type: Array
  field :downvotes, type: Array

  attr_accessible :text
end
