class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    #@users = User.all
    #@event = Event.find(params[:event_id])
    #@users = @event.users
    redirect_to event_path(params[:event_id])

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.xml  { render :xml => @users }
    #end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    #@event = Event.find(params[:event_id])
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @event = Event.find(params[:event_id])
    @user = @event.users.create(params[:user])
    #@user.att = -1
    @user.save
    redirect_to organizer_event_path(@event.id)
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        #format.html { redirect_to(event_user_path(params[:event_id],params[:id]), :notice => 'User was successfully updated.') }
        format.html { redirect_to(organizer_event_path(params[:event_id]), :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to organizer_event_path(params[:event_id])
  end

  def attendance
    @user = User.find(params[:id])
    #@user.update_attributes(params[:user])
    #@user.save
    #redirect_to event_user_path(@user.event_id, @user.id)

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(event_user_path(@user.event_id, @user.id), :notice => 'Attendance was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "show" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def attendance_organizer
    @user = User.find(params[:id])
    #@user.update_attributes(params[:user])
    #@user.save
    #redirect_to event_user_path(@user.event_id, @user.id)

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to("/events/#{@user.event_id}/users/#{@user.id}/organizer", :notice => 'Attendance was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "show" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def organizer
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # organizer.html.erb
      format.xml  { render :xml => @user }
    end
  end

end
