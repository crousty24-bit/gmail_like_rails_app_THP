class EmailsController < ApplicationController
  before_action :set_email, only: %i[ show edit update destroy ]

  # GET /emails or /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1 or /emails/1.json
  def show
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
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to @email, notice: "Email was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1 or /emails/1.json
  def destroy
    @email.destroy!

    respond_to do |format|
      format.html { redirect_to emails_path, notice: "Email was successfully destroyed.", status: :see_other }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params.expect(:id))
    end
end
