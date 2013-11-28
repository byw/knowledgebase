require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'create stuff' do
    assert User.count == 0
    assert Question.count == 0
    assert Answer.count == 0

    user = User.new
    user.email = 'joe.smith@patientordersets.com'
    assert user.save

    q = user.questions.build
    q.title = 'Stuff'
    q.text = 'More stuff!'
    assert q.save

    answer = q.answers.build
    answer.text = 'stuff'
    assert answer.save

    assert User.count == 1
    assert Question.count == 1
    assert Question.first.answers.count == 1
  end
end
