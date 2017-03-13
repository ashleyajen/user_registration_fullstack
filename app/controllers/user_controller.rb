class UserController < ApplicationController
  def registration
  end

  def confirmation
    if ( params.has_key?(:username) && !params[:username].strip.empty? ) &&
          ( params.has_key?(:password) && !params[:password].strip.empty? )

       @user = User.new(name: params[:name], surname: params[:surname], address: params[:address], city: params[:city], state: params[:state], postalcode: params[:postalcode], country: params[:country], email: params[:email], username: params[:username], password: params[:password])
       @user.save
       session[:name] = @user.name
       session[:id] = @user.id
       render 'confirmation'
    #  when you redirect, you want the full path. when you render no path(slash)
    else
      render 'registration'
    end
  end

  def reginfo
    @user = User.find(session[:id])#find the user by the id stored in the session
  end

  def password_match
    @user = User.all
    @user = User.where(username: params[:username]).first
    if
      ( params.has_key?(:username) && !params[:username].strip.empty? && params[:username] == @user.username) &&
      ( params.has_key?(:password) && !params[:password].strip.empty? && params[:password] == @user.password)
      session[:id] = @user.id
      redirect_to '/reginfo'
    else
      flash.now[:alert] = "Password does not match, try again."
      render 'confirmation'
      #remember: when you user flash, you must put flash.now to make sure it only appears on the current page and keeps it from lingering
    end
  end

  def addphonenum
    if ( params.has_key?(:phonenumber) && !params[:phonenumber].strip.empty? )
       @phone = Phone.new(phonenumber: params[:phonenumber])
      #  tell your controller method what user id the phone belongs to
      #we need to find username and password - we need to take the username AND the id
       @phone.user_id = session[:id]
       @phone.save
       redirect_to '/reginfo'
       flash.now[:alert] = "Your number is saved!"
    else
      render 'reginfo'
    end
  end
end#closes main class
