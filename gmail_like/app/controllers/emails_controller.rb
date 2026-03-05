class EmailsController < ApplicationController
  before_action :set_email, only: %i[ show edit update destroy ]

  # GET /emails or /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1 or /emails/1.json
  def show
    @email.update(read: true) #when mail is open = read
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # create new email when click on btn & redirect to index
  def create
    @email = Email.create!(
      object: Faker::Lorem.sentence(word_count: 4),
      body: Faker::Lorem.paragraph(sentence_count: 5)
    )
    redirect_to emails_path
  end

  # PATCH/PUT /emails/1 or /emails/1.json
  def update
    @email.update(read: params[:email][:read])
    respond_to do |format|
      format.html { redirect_to emails_path, status: :see_other }
      format.turbo_stream
      #format.json { render :show, status: :ok, location: @email }
    end
  end

  # DELETE /emails/1 or /emails/1.json
  def destroy
    @email.destroy!

    respond_to do |format|
      format.html { redirect_to emails_path, status: :see_other }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params.expect(:id))
    end
end
