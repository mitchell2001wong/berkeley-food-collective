class UsrEmailsController < ApplicationController
  before_action :set_usr_email, only: %i[ show edit update destroy ]

  # GET /usr_emails or /usr_emails.json
  def index
    @usr_emails = UsrEmail.all
  end

  # GET /usr_emails/1 or /usr_emails/1.json
  def show
  end

  # GET /usr_emails/new
  def new
    @usr_email = UsrEmail.new
  end

  # GET /usr_emails/1/edit
  def edit
  end

  # GET /usr_emails/verify
  def verifyshow
  end

  # POST /usr_emails/verify
  def verify
    input_email = params[:email]
    #@user_emails = UsrEmail.all
    found = UsrEmail.find_by email: input_email
    if found != nil#input_email == "jack@example.com"
      redirect_to "/usr_emails#index", notice: "User found.", allow_other_host: true
    else
      redirect_to "/usr_emails#index", notice: "User not found", allow_other_host: true
    end
  end

  # POST /usr_emails or /usr_emails.json
  def create
    @usr_email = UsrEmail.new(usr_email_params)

    respond_to do |format|
      if @usr_email.save
        format.html { redirect_to usr_email_url(@usr_email), notice: "Usr email was successfully created." }
        format.json { render :show, status: :created, location: @usr_email }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usr_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usr_emails/1 or /usr_emails/1.json
  def update
    respond_to do |format|
      if @usr_email.update(usr_email_params)
        format.html { redirect_to usr_email_url(@usr_email), notice: "Usr email was successfully updated." }
        format.json { render :show, status: :ok, location: @usr_email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usr_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usr_emails/1 or /usr_emails/1.json
  def destroy
    @usr_email.destroy

    respond_to do |format|
      format.html { redirect_to usr_emails_url, notice: "Usr email was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usr_email
      @usr_email = UsrEmail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usr_email_params
      params.require(:usr_email).permit(:name, :email)
    end
end
