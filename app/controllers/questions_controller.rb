class QuestionsController < ApplicationController

  def index
    lookups_answers_users = [{
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
    @questions = Question.collection.aggregate(lookups_answers_users)
  end

  def new
    respond_to do |format|
      format.html
      format.js
    end
    @categories = Category.all
  end

  def create
    return render json: { description: 'User is not logged in' }, status: 401 if current_user.blank?

    permitted_params = params.permit(:category_id, :text, :title, :user_id)
    permitted_params[:user_id] = current_user['id'] # change when implement sign_in/sessions
    question = Question.create!(permitted_params)
    render json: question
  end

  def show
    question_lookup_answers_users = [{
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
    @question = Question.collection.aggregate(question_lookup_answers_users).select { |q| q['_id'].to_s == params[:id].to_s }.first
    @question['answers'].each do |answer|
      answer['user'] = User.find(answer['user_id'])
    end
  end
end
