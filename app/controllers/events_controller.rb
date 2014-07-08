class EventsController < ApplicationController
  # GET /events
  # GET /events.xml
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        #format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.html { redirect_to(organizer_index_path, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(organizer_index_path, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      #format.html { redirect_to(events_url) }
      format.html { redirect_to(organizer_index_path) }
      format.xml  { head :ok }
    end
  end

  def copy
    @event = Event.find(params[:id])
    @copy_event = Event.new
    @copy_event.title = "#{@event.title}_copy"
    @copy_event.save
    @event.users.each do |user|
      @copy_user = User.new
      @copy_user = @copy_event.users.create(@copy_user.id)
      @copy_user.name = user.name
      @copy_user.yomi = user.yomi
      #@copy_user.att = -1
      @copy_user.save
    end
    @copy_event.save
    redirect_to organizer_index_path
  end

  def fix
    @event = Event.find(params[:id])
    @event.isfix = true;
    @event.save
    redirect_to organizer_index_path
  end

  def unfix
    @event = Event.find(params[:id])
    @event.isfix = false;
    @event.save
    redirect_to organizer_index_path
  end

  def organizer_index
    @events = Event.all

    respond_to do |format|
      format.html # organizer_index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  def organizer
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # organizer.html.erb
      format.xml  { render :xml => @event }
    end
  end

end
