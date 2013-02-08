class ThingsController < ApplicationController
  # GET /things
  # GET /things.json
  def index
    lat = params[:latitude]
    long = params[:longitude]
    location = params[:location]
    search   = params[:what]

    if request.xhr?
      rel = Thing.where("title LIKE ?", "%#{search}%").order("created_at DESC")

      if lat && long
        results = Geocoder.search([lat,long])
        if geo = results.first
          @location = "#{geo.city}, #{geo.state}"
        end
        @things = rel.near([lat,long])
      elsif location.present?
        @location = location
        @things = rel.near(location)
      else
        @things = rel 
      end

      return render "_things", :layout => false
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @things }
    end
  end

  # GET /things/1
  # GET /things/1.json
  def show
    @thing = Thing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thing }
    end
  end

  # GET /things/new
  # GET /things/new.json
  def new
    @thing = Thing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thing }
    end
  end

  # POST /things/1/gone
  def gone
    @thing = Thing.find(params[:thing_id])

    @thing.reported_gone_at = Time.now

    if @thing.save
      redirect_to things_url
    else
      render action: "show"
    end
  end

  # GET /things/1/edit
  def edit
    @thing = Thing.find(params[:id])
  end

  # POST /things
  # POST /things.json
  def create
    @thing = Thing.new(params[:thing])

    respond_to do |format|
      if @thing.save
        format.html { redirect_to @thing, notice: 'Thing was successfully created.' }
        format.json { render json: @thing, status: :created, location: @thing }
      else
        format.html { render action: "new" }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /things/1
  # PUT /things/1.json
  def update
    @thing = Thing.find(params[:id])

    respond_to do |format|
      if @thing.update_attributes(params[:thing])
        format.html { redirect_to @thing, notice: 'Thing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /things/1
  # DELETE /things/1.json
  def destroy
    @thing = Thing.find(params[:id])
    @thing.destroy

    respond_to do |format|
      format.html { redirect_to things_url }
      format.json { head :no_content }
    end
  end
end
