class AnswersController < ActionController::Base
  protect_from_forgery except: :new
  
  def create
    permitted_params = params.permit(:question_id, :text, :format)
    Answer.create!(text: permitted_params[:text],
                   user_id: current_user.id,
                   question: permitted_params[:question_id])
    redirect_to "/questions/#{params[:question_id]}"
  end

  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    Answer.find(params[:id]).destroy!
    redirect_to "/questions/#{params[:question_id]}"
    respond_to do |format|
      format.html
      format.js
    end    
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end
  
end
