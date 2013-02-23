class ParksController < ApplicationController
  # GET /parks
  # GET /parks.json
  def index

    @parks = Park.scoped
    @parks = @parks.where("pavilions >= ?", params[:pavilions]) if params[:pavilions].present?
    @parks = @parks.where("playgrounds >= ?", params[:playgrounds]) if params[:playgrounds].present?
    @parks = @parks.where("picnic_shelters >= ?", params[:picnic_tables]) if params[:picnic_tables].present?
    @parks = @parks.where("grills >= ?", params[:grills]) if params[:grills].present?
    @parks = @parks.where("restrooms >= ?", params[:restrooms]) if params[:restrooms].present?
    @parks = @parks.where("parking_spaces >= ?", params[:parking_spaces]) if params[:parking_spaces].present?
    @parks = @parks.where("ball_fields >= ?", params[:ball_fields]) if params[:ball_fields].present?
    @parks = @parks.where("soccer_fields >= ?", params[:soccer_fields]) if params[:soccer_fields].present?
    @parks = @parks.where("tennis_courts >= ?", params[:tennis_courts]) if params[:tennis_courts].present?
    @parks = @parks.where("basketball_courts >= ?", params[:basketball_courts]) if params[:basketball_courts].present?
    @parks = @parks.where("volleyball_courts >= ?", params[:volleyball_courts]) if params[:basketball_courts].present?
    @parks = @parks.where(pool: true) if params[:pool].present?
    # conditions << [ "classification = ?", params[:classification] ] if params[:classification].present?
    # conditions << [ "pavilions > ?", params[:pavilions].to_i ] if params[:pavilions].present?
    # @parks = Park.all(:conditions => conditions)


    # t.string :name
    #   t.string :classification
    #   t.string :address
    #   t.decimal :gis_ac
    #   t.integer :zip_code
    #   t.integer :tennis_courts
    #   t.integer :basketball_courts
    #   t.integer :volleyball_courts
    #   t.boolean :pool
    #   t.boolean :gym
    #   t.boolean :recreation_center
    #   t.boolean :covbb
    #   t.boolean :dog_park
    #   t.boolean :track
    #   t.boolean :nat
    #   t.boolean :golf
    #   t.decimal :area

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parks }
    end
  end

  # GET /parks/1
  # GET /parks/1.json
  def show
    @park = Park.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @park }
    end
  end

  # GET /parks/new
  # GET /parks/new.json
  def new
    @park = Park.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @park }
    end
  end

  # GET /parks/1/edit
  def edit
    @park = Park.find(params[:id])
  end

  # POST /parks
  # POST /parks.json
  def create
    @park = Park.new(params[:park])

    respond_to do |format|
      if @park.save
        format.html { redirect_to @park, notice: 'Park was successfully created.' }
        format.json { render json: @park, status: :created, location: @park }
      else
        format.html { render action: "new" }
        format.json { render json: @park.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /parks/1
  # PUT /parks/1.json
  def update
    @park = Park.find(params[:id])

    respond_to do |format|
      if @park.update_attributes(params[:park])
        format.html { redirect_to @park, notice: 'Park was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @park.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parks/1
  # DELETE /parks/1.json
  def destroy
    @park = Park.find(params[:id])
    @park.destroy

    respond_to do |format|
      format.html { redirect_to parks_url }
      format.json { head :no_content }
    end
  end
end
