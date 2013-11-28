class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search

  field :title, type: String
  field :text, type: String
  field :tags, type: Array

  field :upvotes, type: Array
  field :downvotes, type: Array

  belongs_to :user
  embeds_many :answers

  scope :recent, order_by(:created_by => :desc)
  scope :unanswered, any_of({:answers.with_size => 0}, {:answers => nil}).order_by(:created_by => :asc)

  attr_accessible :title, :text, :tags_string

  attr_accessor :tags_string

  before_save :parse_tags

  search_in :title, :text, :tags # :filters => {
  #    :tags => lambda {|question| question.tags}
  #}

  protected

  def parse_tags
    if tags_string
      self.tags = tags_string.split(' ')
    end
  end
end
