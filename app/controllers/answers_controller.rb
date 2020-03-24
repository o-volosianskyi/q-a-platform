class AnswersController < ActionController::Base
  protect_from_forgery except: :new
  
  def create
    permitted_params = params.permit(:question_id, :text, :format)
    Answer.create!(text: permitted_params[:text],
                   user_id: current_user.id,
                   question: permitted_params[:question_id])
    redirect_to "/questions/#{params[:question_id]}"
  end

  def delete_answer
    respond_to do |format|
      format.html
      format.js
    end
    @answer_id = params[:answer_id]
    render '../views/answers/delete'
  end

  def destroy
    answer = Answer.find(params[:id]).
    return render json: { description: 'User is not authorized to perform this action' }, status: 401 unless current_user.present? && 
                                                                                                             (current_user.super_admin? || (answer['user'] == current_user) 
    
    answer.destroy!
    render json: answer
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end
  
end
