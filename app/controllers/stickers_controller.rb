require 'csv'

class StickersController < ApplicationController
  before_action :set_sticker, only: %i[ show edit update destroy ]

  # GET /stickers or /stickers.json
  def index
    @stickers = Sticker.all
  end

  # GET /stickers/1 or /stickers/1.json
  def show
  end

  # GET /stickers/new
  def new
    @sticker = Sticker.new
  end

  # GET /stickers/1/edit
  def edit
  end

  # POST /stickers or /stickers.json
  def create
    @sticker = Sticker.new(sticker_params)

    respond_to do |format|
      if @sticker.save
        format.html { redirect_to sticker_url(@sticker), notice: "Sticker was successfully created." }
        format.json { render :show, status: :created, location: @sticker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stickers/1 or /stickers/1.json
  def update
    respond_to do |format|
      if @sticker.update(sticker_params)
        format.html { redirect_to sticker_url(@sticker), notice: "Sticker was successfully updated." }
        format.json { render :show, status: :ok, location: @sticker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sticker.errors, status: :unprocessable_entity }
      end
    end
  end

  def email
  end

  def get_email
    if params[:email]
      @member = Member.find_by_email(params[:email].strip.downcase)

      if @member.nil?
        flash[:error] = %Q[Email not registered, If you have already registered, Click Refresh members button and try again]
        return redirect_to(request.referer)
      end

      @id = @member.id

      if !first_time_sticker?
        session[:additional_sticker] = true
        session[:member_number] = @member.stickers.first.sticker_number
        @sticker = Sticker.find_by(member_id: @id)
        session[:sticker_created] = @sticker.created_at.strftime("%B %d, %Y")
      end
      
      session[:email] = @member.email
      redirect_to(number_path) && return
    end
  end

  def number
  end

  def get_number
    if params[:number].to_i.is_a?(Integer)
       if params[:number].to_i > 1000
        flash[:error] = "Enter a number below 1000."
        redirect_to(request.referer) && return
       end
    else
      flash[:error] = "Enter a number."
      redirect_to(request.referer) && return
    end

    session[:number] = params[:number].to_i
    @member = Member.find_by_email(session[:email])

    if !sticker_belongs_to_current_member?
      flash[:error] = "Number already taken"
      redirect_to(request.referer) && return
    end

    redirect_to(choose_path)
  end

  def choose
  end

  def confirm
    @member = Member.find_by_email(session[:email])

    sticker = Sticker.where(sticker_number: sticker_number, discarded_at: nil).first

    if sticker && !sticker_belongs_to_current_member?
      flash[:error] = "Sorry, that number just got taken. Try again"
      redirect_to(number_path) && return
    end

    if sticker
      sticker.discard
      sticker.reload
    end
      
    Sticker.create!(member: @member, sticker_number: session[:number], sticker_variation: params[:color], payment_code: params[:code])
    flash[:success] = "Sticker ordered!"
    reset_session
    redirect_to root_path && return 
  rescue => e
    flash[:error] = "Something went wrong. Contact admins"
  end

  def reset_session_and_redirect
    flash[:success] = "Sticker ordered!"
    reset_session
    redirect_to root_path
  end
  

  def sticker_number
    session[:number]
  end

  def sticker_belongs_to_current_member?
    sticker_belongs_to_member = @member.stickers.pluck(:sticker_number).include?(sticker_number) ? true : false
    sticker = Sticker.find_by_sticker_number(sticker_number)

    if first_time_sticker? && sticker.nil? # First time sticker and sticker is not taken
      return true
    elsif first_time_sticker? && !sticker.nil? # First time sticker and sticker is taken 
      return false
    elsif !first_time_sticker? && sticker_belongs_to_member # Additional sticker and it belongs to member
      return true
    elseif !first_time_sticker? && !sticker_belongs_to_member # Additional sticker and it does not belongs to member
      return false
    end
  end

  def first_time_sticker?
    @member.stickers.empty?
  end

  def refresh
    # Authenticate a session with your Service Account
    session = GoogleDrive::Session.from_service_account_key("members-382210-0921346f10c1.json")

    # Get the spreadsheet by its title
    spreadsheet = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/1WwcPRunJk4WKGsiAlVnaU5shLDjemjDKdWvhEui6D-k/edit?usp=share_link")

    # Get the first worksheet
    worksheet = spreadsheet.worksheets.first
    # Print out the first 6 columns of each row
    # worksheet.rows.each { |row| puts row.first(6).join(" | ") }
    worksheet.rows.each do |record|
      if !Member.find_by_email(record[8]).nil? || record[8] == "Email Address"
        next
      end

      Member.create(create_user_data(record))
    end

    flash[:success] = "List has been updated!."
    redirect_to(request.referer)
  end

  def create_user_data(row)
    {
      registered_time: row[0],
      name: row[1],
      car_registration: row[2],
      make: row[3],
      model: row[4],
      dob: row[5],
      phone_number: row[6],
      payment_code: row[7],
      email: row[8],
      emergency_contact: row[9],
      amount_paid: row[10],
    }
  end

  def export 
    CSV.open("stickers.csv", "wb") do |csv|
      csv << Sticker.attribute_names
      Sticker.find_each do |sticker|
        csv << sticker.attributes.values
      end
    end
  end

  def view
  end


  # DELETE /stickers/1 or /stickers/1.json
  def destroy
    @sticker.destroy

    respond_to do |format|
      format.html { redirect_to stickers_url, notice: "Sticker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sticker
    @sticker = Sticker.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sticker_params
    params.require(:sticker).permit(:member_id, :sticker_number, :sticker_variation)
  end
end
