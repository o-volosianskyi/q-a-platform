class QuestionsController < ApplicationController
  def index
    lookups = [{
      '$lookup': {
        'from': 'answers',
        'localField': '_id',
        'foreignField': 'question_id',
        'as': 'answers'
      }
    }, {
      '$lookup': {
        'from': 'users',
        'localField': 'user_id',
        'foreignField': '_id',
        'as': 'user'
      }
    }]
    @questions = Question.collection.aggregate(lookups)
  end

  def create
  end
end
