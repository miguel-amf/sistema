class SessionsController < ApplicationController

  def create
      user = Aluno.find_by nome: params[:nome]
      # If the user exists AND the password entered is correct.
      if user && user.authenticate(params[:senha])
        # Save the user id inside the browser cookie. This is how we keep the user 
        # logged in when they navigate around our website.
        session[:user_id] = user.id
        #binding.pry
        redirect_to aluno_path(user.id)
      else
      # If user's login doesn't work, send them back to the login form.
        redirect_to '/login'
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
